import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../models/captured_photo.dart';
import '../models/capture_stage.dart';
import '../services/ai_analysis_service.dart';
import '../services/ai_chat_service.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import '../utils/clinic_disclaimer.dart';
import 'capture_flow_screen.dart';

/// Fotoğraf Analizi Chatbot Sayfası
/// Kullanıcı fotoğraf yükleyip AI ile konuşarak analiz yapabilir
class PhotoAnalysisChatScreen extends StatefulWidget {
  const PhotoAnalysisChatScreen({
    super.key,
    this.initialPhotos,
  });

  /// Başlangıç fotoğrafları (otomatik analiz için)
  final List<CapturedPhoto>? initialPhotos;

  @override
  State<PhotoAnalysisChatScreen> createState() => _PhotoAnalysisChatScreenState();
}

class _PhotoAnalysisChatScreenState extends State<PhotoAnalysisChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final AiAnalysisService _aiService = AiAnalysisService();
  final SmileAiChatService _chatService = SmileAiChatService();
  final ImagePicker _imagePicker = ImagePicker();
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  final StorageService _storageService = StorageService();

  final List<_ChatMessage> _messages = [];
  final List<File> _uploadedPhotos = [];
  List<CapturedPhoto> _currentCapturedPhotos = [];
  final Map<CaptureStage, _AngleStatus> _angleStatuses = {
    for (final stage in CaptureStage.values) stage: _AngleStatus.empty,
  };
  final List<_ChatSession> _sessions = [];
  
  bool _isSending = false;
  bool _isAnalyzing = false;
  bool _autoAnalysisStarted = false;
  bool _autoAnalyzeOnUpload = true; // Otomatik analiz toggle
  String? _activeSessionId;
  String? _lastSavedAnalysisId; // Son kaydedilen analiz ID'si

  bool _hasInitialized = false;
  Locale? _lastLocale;

  @override
  void initState() {
    super.initState();
    _loadSessions();
    _startNewSession();
    
    // Eğer başlangıç fotoğrafları varsa, bunları yükle ve otomatik analiz başlat
    if (widget.initialPhotos != null && widget.initialPhotos!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _loadInitialPhotos();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    
    // Welcome mesajını didChangeDependencies içinde ekle
    // Bu şekilde AppLocalizations.of(context) hatası önlenir
    if (!_hasInitialized) {
      _hasInitialized = true;
      _lastLocale = locale;
      _addWelcomeMessage();
    } else if (_lastLocale != locale) {
      // Dil değiştiyse, welcome mesajını güncelle
      _lastLocale = locale;
      // Eğer mesajlar listesi boşsa veya sadece welcome mesajı varsa, yeniden ekle
      if (_messages.isEmpty || (_messages.length == 1 && !_messages.first.isUser)) {
        _messages.clear();
      _addWelcomeMessage();
      }
    }
  }

  void _startNewSession() {
    setState(() {
      _activeSessionId = DateTime.now().millisecondsSinceEpoch.toString();
      _messages.clear();
      _uploadedPhotos.clear();
      _currentCapturedPhotos.clear();
      _autoAnalysisStarted = false;
    });
  }

  Future<void> _loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('photo_analysis_chat_sessions');
    if (jsonString == null) return;

    final decoded = jsonDecode(jsonString) as List<dynamic>;
    final loaded = decoded
        .map((e) => _ChatSession.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _sessions
        ..clear()
        ..addAll(loaded);
    });
  }

  Future<void> _saveActiveSession() async {
    if (_activeSessionId == null) return;
    final hasUserMessage = _messages.any((msg) => msg.isUser);
    if (!hasUserMessage) return;

    final existingIndex =
        _sessions.indexWhere((session) => session.id == _activeSessionId);

    final firstUserMessage = _messages.firstWhere(
      (m) => m.isUser,
      orElse: () => _messages.first,
    );
    final titleText = firstUserMessage.text.trim();
    final title = titleText.length > 40 ? '${titleText.substring(0, 40)}...' : titleText;
    
    final updated = _ChatSession(
      id: _activeSessionId!,
      title: title,
      updatedAt: DateTime.now(),
      messages: List<_ChatMessage>.from(_messages),
    );

    setState(() {
      if (existingIndex >= 0) {
        _sessions[existingIndex] = updated;
      } else {
        _sessions.insert(0, updated);
      }
    });

    await _persistSessions();
  }

  Future<void> _persistSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(_sessions.map((session) => session.toJson()).toList());
    await prefs.setString('photo_analysis_chat_sessions', jsonString);
  }

  void _loadInitialPhotos() {
    if (_autoAnalysisStarted) return;
    _autoAnalysisStarted = true;

    setState(() {
      _currentCapturedPhotos = List<CapturedPhoto>.from(widget.initialPhotos!);
      _refreshUploadedPhotosFromCurrent();
     
      // Fotoğrafları mesaj olarak ekle
      for (final photo in widget.initialPhotos!) {
        if (photo.file.existsSync()) {
          _angleStatuses[photo.stage] = _AngleStatus.captured;
          _messages.add(_ChatMessage(
            id: '${DateTime.now().microsecondsSinceEpoch}_${photo.stage.name}',
            text: _formatStageActionMessage(photo.stage, captured: true),
            isUser: true,
            timestamp: DateTime.now(),
            imageFile: photo.file,
          ));
        }
      }
      
      // Otomatik analiz mesajı ekle
      _messages.add(_ChatMessage(
        id: 'auto_analysis',
            text: AppLocalizations.of(context)?.autoAnalysisStarting ?? '5 photos uploaded. Starting automatic analysis...',
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });

    _scrollToBottom();
    
    // Kısa bir gecikme sonrası otomatik analiz başlat
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        _analyzePhotos();
      }
    });
  }

  void _refreshUploadedPhotosFromCurrent() {
    _uploadedPhotos
      ..clear()
      ..addAll(
        _currentCapturedPhotos.where((p) => p.file.existsSync()).map((p) => p.file),
      );
  }

  void _resetAngleStatuses() {
    for (final stage in CaptureStage.values) {
      _angleStatuses[stage] = _AngleStatus.empty;
    }
  }

  void _markStagesPendingAnalysis() {
    for (final stage in CaptureStage.values) {
      final hasPhoto = _currentCapturedPhotos.any((p) => p.stage == stage);
      if (hasPhoto) {
        _angleStatuses[stage] = _AngleStatus.pendingAnalysis;
      }
    }
  }

  void _applyAnalysisStatuses(AiAnalysisResult analysisResult) {
    for (final stage in CaptureStage.values) {
      final hasPhoto = _currentCapturedPhotos.any((p) => p.stage == stage);
      if (!hasPhoto) {
        _angleStatuses[stage] = _AngleStatus.empty;
        continue;
      }

      if (!analysisResult.samePerson) {
        _angleStatuses[stage] = _AngleStatus.needsRetake;
        continue;
      }

      final stageInvalid = analysisResult.invalidStages.contains(stage);
      final detected = analysisResult.detectedAngles?[stage.name]?.toLowerCase();
      final expected = stage.name.toLowerCase();
      final noDetection = detected == null || detected.isEmpty || detected == 'not_provided';
      final wrongAngle = !noDetection && detected != expected;

      if (stageInvalid || wrongAngle || noDetection) {
        _angleStatuses[stage] = _AngleStatus.needsRetake;
      } else {
        _angleStatuses[stage] = _AngleStatus.approved;
      }
    }
  }

  void _revertPendingToCaptured() {
    for (final stage in CaptureStage.values) {
      if (_angleStatuses[stage] == _AngleStatus.pendingAnalysis) {
        _angleStatuses[stage] = _AngleStatus.captured;
      }
    }
  }

  void _upsertCapturedPhoto(CapturedPhoto newPhoto) {
    final existingIndex = _currentCapturedPhotos.indexWhere((p) => p.stage == newPhoto.stage);
    if (existingIndex != -1) {
      _currentCapturedPhotos[existingIndex] = newPhoto;
    } else {
      _currentCapturedPhotos.add(newPhoto);
    }
  }

  void _addWelcomeMessage() {
    setState(() {
      _messages.add(_ChatMessage.welcome(context));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image != null) {
        final file = File(image.path);
        final detectedStage = await _aiService.detectPhotoAngle(file) ?? CaptureStage.front;
        final capturedPhoto = CapturedPhoto(stage: detectedStage, file: file);

        if (!mounted) return;

        setState(() {
          _upsertCapturedPhoto(capturedPhoto);
          _angleStatuses[detectedStage] = _AngleStatus.captured;
          _refreshUploadedPhotosFromCurrent();
          _messages.add(_ChatMessage(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            text: _formatStageActionMessage(detectedStage, captured: false),
            isUser: true,
            timestamp: DateTime.now(),
            imageFile: file,
          ));
        });
        _scrollToBottom();
        await _saveActiveSession();

        if (_autoAnalyzeOnUpload) {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              _analyzePhotos();
            }
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.errorLoadingPhoto('$e') ?? 'An error occurred while loading the photo: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickMultipleImages() async {
    try {
      final List<XFile> images = await _imagePicker.pickMultiImage(
        imageQuality: 85,
      );

      if (images.isEmpty) return;

      // Kullanıcıdan hangi açıya ait olduğunu seçmesini iste
      final List<CapturedPhoto> stagedPhotos = [];
      final availableStages = CaptureStage.values.toList();
      
      for (int i = 0; i < images.length && i < 5; i++) {
        final image = images[i];
        final file = File(image.path);
        
        // Kullanıcıdan açı seçmesini iste - fotoğraf önizlemesi ile
        final selectedStage = await showDialog<CaptureStage>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.photoSelectAngle('${i + 1}', '${images.length > 5 ? 5 : images.length}')),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Fotoğraf önizlemesi
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.getBorderColor(context)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        file,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Açı seçenekleri
                  ...availableStages.map((stage) {
                    final alreadyUsed = stagedPhotos.any((p) => p.stage == stage);
                    return ListTile(
                      leading: Icon(
                        alreadyUsed ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: alreadyUsed ? Colors.green : AppTheme.getBrandPrimaryColor(context),
                      ),
                      title: Text(_getStageName(stage)),
                      subtitle: alreadyUsed ? Text(AppLocalizations.of(context)!.alreadySelected, style: const TextStyle(color: Colors.orange)) : null,
                      enabled: !alreadyUsed,
                      onTap: alreadyUsed ? null : () => Navigator.of(context).pop(stage),
                    );
                  }),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(AppLocalizations.of(context)?.cancel ?? 'İptal'),
              ),
            ],
          ),
        );
        
        if (selectedStage != null) {
        stagedPhotos.add(
          CapturedPhoto(
              stage: selectedStage,
            file: file,
              capturedAt: DateTime.now(),
          ),
        );
        }
      }

      if (!mounted) return;

      setState(() {
        for (final photo in stagedPhotos) {
          _upsertCapturedPhoto(photo);
          _angleStatuses[photo.stage] = _AngleStatus.captured;
          _messages.add(_ChatMessage(
            id: '${DateTime.now().microsecondsSinceEpoch}_multi_${photo.stage.name}',
            text: _formatStageActionMessage(photo.stage, captured: false),
            isUser: true,
            timestamp: DateTime.now(),
            imageFile: photo.file,
          ));
        }
        _refreshUploadedPhotosFromCurrent();
      });
      _scrollToBottom();
      await _saveActiveSession();

      if (_autoAnalyzeOnUpload) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _analyzePhotos();
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.errorLoadingMultiplePhotos('$e') ?? 'An error occurred while loading multiple photos: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image != null) {
        final file = File(image.path);
        final detectedStage = await _aiService.detectPhotoAngle(file) ?? CaptureStage.front;
        final capturedPhoto = CapturedPhoto(stage: detectedStage, file: file);

        if (!mounted) return;

        setState(() {
          _upsertCapturedPhoto(capturedPhoto);
          _angleStatuses[detectedStage] = _AngleStatus.captured;
          _refreshUploadedPhotosFromCurrent();
          _messages.add(_ChatMessage(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            text: _formatStageActionMessage(detectedStage, captured: true),
            isUser: true,
            timestamp: DateTime.now(),
            imageFile: file,
          ));
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.errorCapturingPhoto('$e') ?? 'An error occurred while capturing the photo: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _showImageSourceDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)?.imageSourceTitle ?? 'Photo Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(AppLocalizations.of(context)?.imageSourceCamera ?? 'Camera'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(AppLocalizations.of(context)?.imageSourceGallery ?? 'Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.collections),
              title: Text(AppLocalizations.of(context)?.imageSourceMultiGallery ?? 'Select Multiple from Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _pickMultipleImages();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendMessage([String? preset]) async {
    final text = preset ?? _messageController.text.trim();
    if (text.isEmpty || _isSending) return;

    // Eğer fotoğraf yoksa ve analiz isteniyorsa uyar
    if (_uploadedPhotos.isEmpty && 
        (text.toLowerCase().contains('analiz') || 
         text.toLowerCase().contains('analiz et') ||
         text.toLowerCase().contains('değerlendir'))) {
      setState(() {
        _messages.add(_ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: AppLocalizations.of(context)?.promptNoPhotosForAnalysis ?? 'Please upload a photo first. Tap the 📷 button to upload.',
          isUser: false,
          timestamp: DateTime.now(),
        ));
      });
      _scrollToBottom();
      return;
    }

    setState(() {
      _messages.add(_ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
      _isSending = true;
    });

    _messageController.clear();
    _scrollToBottom();

    // Eğer analiz isteniyorsa ve fotoğraf varsa
    if ((text.toLowerCase().contains('analiz') || 
         text.toLowerCase().contains('analiz et') ||
         text.toLowerCase().contains('değerlendir') ||
         text.toLowerCase().contains('kontrol')) &&
        _uploadedPhotos.isNotEmpty) {
      await _analyzePhotos();
    } else {
      // Normal chatbot yanıtı
      await _getChatResponse(text);
    }
  }

  Future<void> _analyzePhotos() async {
    // Eğer CapturedPhoto listesi varsa onu kullan, yoksa File listesinden oluştur
    List<CapturedPhoto> capturedPhotos;
    
    if (_currentCapturedPhotos.isNotEmpty) {
      // Mevcut CapturedPhoto listesini kullan
      capturedPhotos = _currentCapturedPhotos;
    } else if (_uploadedPhotos.isNotEmpty) {
      // File listesinden CapturedPhoto oluştur - AI ile açı tespiti yap
      capturedPhotos = [];
      for (final file in _uploadedPhotos) {
        // AI ile açı tespiti yap
        final detectedAngle = await _aiService.detectPhotoAngle(file);
        capturedPhotos.add(
          CapturedPhoto(
            stage: detectedAngle ?? CaptureStage.front, // Tespit edilemezse front
            file: file,
          ),
        );
      }
    } else {
      return; // Fotoğraf yok
    }

    setState(() {
      _isAnalyzing = true;
      _messages.add(_ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: AppLocalizations.of(context)?.analyzingPhotos ?? 'Your photos are being analyzed...',
        isUser: false,
        timestamp: DateTime.now(),
        isTyping: true,
      ));
      _markStagesPendingAnalysis();
    });
    _scrollToBottom();

    try {
      final analysisResult = await _aiService.analyzePhotos(capturedPhotos);

      if (!mounted) return;

      // Typing mesajını kaldır
      setState(() {
        _messages.removeWhere((m) => m.isTyping);
      });

      // Analiz sonucunu göster - Görsel analiz dahil
      String resultMessage = '';
      
      // Görsel analiz (ne görüldüğü)
      if (analysisResult.visualAnalysis != null && analysisResult.visualAnalysis!.isNotEmpty) {
        resultMessage += '📸 Görsel Analiz - Ne Görüyorum:\n\n';
        analysisResult.visualAnalysis!.forEach((stageName, visualDesc) {
          resultMessage += '${_getLocalizedStageFromKey(stageName)}:\n';
          resultMessage += '$visualDesc\n\n';
        });
      }
      
      // Aynı kişi kontrolü
      final l10n = AppLocalizations.of(context);
      if (!analysisResult.samePerson) {
        resultMessage += '${l10n?.importantWarning ?? '⚠️ ÖNEMLİ UYARI:'}\n\n';
        resultMessage += '${l10n?.differentPersonsDetected ?? 'Fotoğraflarda farklı kişiler tespit edildi! Tüm fotoğraflar aynı kişiye ait olmalıdır.'}\n\n';
        resultMessage += l10n?.pleaseCaptureSamePerson ?? 'Lütfen aynı kişinin 5 farklı açıdan fotoğraflarını çekin.';
      }
      
      // Tespit edilen açılar varsa göster
      if (analysisResult.detectedAngles != null && analysisResult.detectedAngles!.isNotEmpty) {
        resultMessage += '\n${l10n?.detectedAnglesLabel ?? '📐 Tespit Edilen Açılar:'}\n';
        analysisResult.detectedAngles!.forEach((key, value) {
          resultMessage += '• ${_getLocalizedStageFromKey(key)}: ${_getLocalizedStageFromKey(value)}\n';
        });
        resultMessage += '\n';
      }
      
      if (analysisResult.isValid) {
        resultMessage += '${l10n?.analysisCompletedSuccess ?? '✅ Analiz Tamamlandı!'}\n\n';
        resultMessage += analysisResult.message ?? (l10n?.allPhotosLookGood ?? 'Tüm fotoğraflar uygun görünüyor.');
        
        // Firebase'e kaydet - tespit edilen açılara göre
        try {
          final saveStartTime = DateTime.now();
          setState(() {
            _isAnalyzing = true;
          });
          
          final savedInfo = await _saveToFirebaseWithDetectedAngles(capturedPhotos, analysisResult);
          
          // Minimum loading süresi (kullanıcıya feedback vermek için)
          final saveDuration = DateTime.now().difference(saveStartTime);
          if (saveDuration.inMilliseconds < 1500) {
            await Future.delayed(Duration(milliseconds: 1500 - saveDuration.inMilliseconds));
          }
        
        resultMessage += '\n\n✅ Fotoğraflar Firebase\'e kaydedildi!';
        if (_lastSavedAnalysisId != null) {
          resultMessage += '\n📁 Analiz ID: $_lastSavedAnalysisId';
          resultMessage += '\n💾 Kayıt Yeri: Firebase Storage & Firestore';
        }
          
          // Dosya yolları mesaj içinde gösterilmiyor - kullanıcı için gereksiz
          // if (savedInfo != null && savedInfo.isNotEmpty) {
          //   resultMessage += '\n\n📸 Yüklenen Fotoğraflar:';
          //   savedInfo.forEach((stage, path) {
          //     resultMessage += '\n  • ${_getStageName(CaptureStage.values.firstWhere((s) => s.name == stage))}: $path';
          //   });
          // }
          
          // Başarı mesajını ekle
          if (mounted) {
            setState(() {
              _messages.add(_ChatMessage(
                id: DateTime.now().microsecondsSinceEpoch.toString(),
                text: resultMessage,
                isUser: false,
                timestamp: DateTime.now(),
              ));
              _isAnalyzing = false;
              _isSending = false;
            });
            _scrollToBottom();
            
            // Başarı dialog'unu göster
            await _showSuccessDialog(savedInfo);
        
        // Dialog kapatıldıktan sonra analiz sayfasını otomatik kapatma
        // Kullanıcı analizi okuyabilsin ve manuel olarak kapatabilsin
        // Future.delayed(const Duration(seconds: 1), () {
        //   if (mounted) {
        //     Navigator.of(context).pop(true);
        //   }
        // });
          }
        } catch (e) {
          debugPrint('❌ Kaydetme hatası: $e');
          resultMessage += '\n\n❌ Kaydetme sırasında hata oluştu: ${e.toString()}';
          // Hata durumunda false döndür
          if (mounted) {
            setState(() {
              _messages.add(_ChatMessage(
                id: DateTime.now().microsecondsSinceEpoch.toString(),
                text: resultMessage,
                isUser: false,
                timestamp: DateTime.now(),
              ));
              _isSending = false;
              _isAnalyzing = false;
            });
            _scrollToBottom();
          }
        }
      } else {
        resultMessage += '${l10n?.analysisResultHeader ?? '⚠️ Analiz Sonucu'}\n\n';
        resultMessage += analysisResult.message ?? '${l10n?.somePhotosNeedRetake ?? 'Bazı fotoğraflar tekrar çekilmesi gerekiyor.'}\n\n';
        
        if (analysisResult.invalidStages.isNotEmpty) {
          resultMessage += '${l10n?.anglesThatNeedRetake ?? 'Tekrar çekilmesi gereken açılar:'}\n';
          for (final stage in analysisResult.invalidStages) {
            resultMessage += '• ${_getStageName(stage)}\n';
          }
          resultMessage += '\nHata Detayları:\n';
          
          // Hata detaylarını göster
          if (analysisResult.analysisData != null) {
            for (final stage in analysisResult.invalidStages) {
              final stageData = analysisResult.analysisData![stage.name];
              if (stageData is Map) {
                final issue = stageData['issue'] as String? ?? '';
                if (issue.isNotEmpty) {
                  resultMessage += '• ${_getStageName(stage)}: $issue\n';
                }
              }
            }
          }
          
          resultMessage += '\nBu açıları tekrar çekmek ister misiniz?';
        }
      }

      // Detaylı analiz verileri varsa ekle
      if (analysisResult.analysisData != null) {
        resultMessage += '\n\n📊 Detaylı Analiz:\n';
        analysisResult.analysisData!.forEach((key, value) {
          if (value is Map) {
            final isValid = value['valid'] as bool? ?? true;
            final issue = value['issue'] as String? ?? '';
            resultMessage += '• ${_getLocalizedStageFromKey(key)}: ${isValid ? "✅" : "❌"} $issue\n';
          }
        });
      }

      resultMessage += '\n\nℹ️ Bilgilendirme:\n$kSmileHairAnalysisDisclaimer';

      setState(() {
        _messages.removeWhere((m) => m.isTyping);
        _messages.add(_ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: resultMessage,
          isUser: false,
          timestamp: DateTime.now(),
          analysisResult: analysisResult,
        ));
        _isSending = false;
        _isAnalyzing = false;
        _applyAnalysisStatuses(analysisResult);
      });

      _scrollToBottom();
      await _saveActiveSession();

      // Eğer geçersiz fotoğraflar varsa, tekrar çekim seçeneği sun
      if (!analysisResult.isValid && analysisResult.invalidStages.isNotEmpty) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _showRetakeDialog(analysisResult, capturedPhotos);
          }
        });
      }
    } catch (e) {
      if (!mounted) return;
      
      setState(() {
        _messages.removeWhere((m) => m.isTyping);
        _messages.add(_ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: '❌ Analiz sırasında hata oluştu: $e',
          isUser: false,
          timestamp: DateTime.now(),
        ));
        _isSending = false;
        _isAnalyzing = false;
        _revertPendingToCaptured();
      });
      _scrollToBottom();
    }
  }

  Future<void> _getChatResponse(String text) async {
    // Typing indicator ekle
    setState(() {
      _messages.add(_ChatMessage(
        id: 'typing_${DateTime.now().microsecondsSinceEpoch}',
        text: '',
        isUser: false,
        timestamp: DateTime.now(),
        isTyping: true,
      ));
    });
    _scrollToBottom();

    try {
      // Chat geçmişini hazırla (son 10 mesaj, sadece text mesajları)
      final chatHistory = <Map<String, String>>[];
      final textMessages = _messages
          .where((m) => !m.isTyping && m.imageFile == null)
          .toList();
      
      // Son 10 mesajı al ve user-bot çiftlerini bul
      final recentMessages = textMessages.length > 10 
          ? textMessages.sublist(textMessages.length - 10)
          : textMessages;
      
      for (int i = 0; i < recentMessages.length - 1; i++) {
        final currentMsg = recentMessages[i];
        final nextMsg = recentMessages[i + 1];
        
        if (currentMsg.isUser && !nextMsg.isUser) {
          chatHistory.add({
            'role': 'user',
            'text': currentMsg.text,
          });
          chatHistory.add({
            'role': 'model',
            'text': nextMsg.text,
          });
        }
      }

      // AI'ya özel prompt hazırla
      final enhancedPrompt = '''Sen bir saç ekimi fotoğraf analizi chatbotusun. Kullanıcılar saç ekimi fotoğraflarını analiz etmek, açıları kontrol etmek ve fotoğraf kalitesini değerlendirmek için seninle konuşuyor.
Kaliteyi artırmak için, gerektiğinde kullanıcıdan ŞU POZLARI NET şekilde istemelisin:
- Front: Tam karşı bakış; çene düz, baş dik
- Sağ 45°: Baş belirgin şekilde SAĞA (~70–90°)
- Sol 45°: Baş belirgin şekilde SOLA (~70–90°)
- Tepe: Telefon yatay ve düz; ekran yukarı
- Arka: Telefon ense arkasında; ense derisi merkezde

Kullanıcının sorusu: $text

${_currentCapturedPhotos.isNotEmpty 
  ? (AppLocalizations.of(context)?.userHasPhotosNote('${_currentCapturedPhotos.length}') ?? 'Not: Kullanıcının ${_currentCapturedPhotos.length} fotoğrafı yüklü. Fotoğraf analizi hakkında sorular sorabilir.') 
  : (AppLocalizations.of(context)?.userNoPhotosNote ?? 'Not: Kullanıcının henüz fotoğrafı yok. Fotoğraf yükleme konusunda yardımcı olabilirsin.')}

Eğer soru saç ekimi, fotoğraf analizi, saç transplantasyonu ile ilgili değilse, kullanıcıyı WhatsApp danışmanına yönlendir.
Eğer soru fotoğraf analizi ile ilgiliyse, detaylı ve yardımcı bir yanıt ver. Gerekirse kullanıcıya hangi pozu nasıl vermesi gerektiğini net ve kısa cümlelerle anlat.''';

      // AI servisine gönder
      final response = await _chatService.sendMessage(
        prompt: enhancedPrompt,
        history: chatHistory,
      );

      if (!mounted) return;

      // Typing mesajını kaldır
      setState(() {
        _messages.removeWhere((m) => m.isTyping);
      });

      // AI yanıtını kontrol et - eğer WhatsApp yönlendirmesi gerekiyorsa
      final lowerResponse = response.toLowerCase();
      if (lowerResponse.contains('whatsapp') || 
          lowerResponse.contains('danışman') ||
          !_isHairTransplantRelated(text)) {
        // WhatsApp'a yönlendir
        setState(() {
          _messages.add(_ChatMessage(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            text: response.isNotEmpty 
                ? response 
                : '''Bu sorunuz saç ekimi fotoğraf analizi ile ilgili değil gibi görünüyor. 

Daha detaylı bilgi için WhatsApp danışmanımızla iletişime geçebilirsiniz. WhatsApp'a yönlendiriliyorsunuz...''',
            isUser: false,
            timestamp: DateTime.now(),
          ));
          _isSending = false;
        });
        _scrollToBottom();
        
        // WhatsApp'a yönlendir
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _openWhatsApp();
          }
        });
        return;
      }

      // Normal AI yanıtı
      setState(() {
        _messages.add(_ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: response,
          isUser: false,
          timestamp: DateTime.now(),
        ));
        _isSending = false;
      });

      _scrollToBottom();
      await _saveActiveSession();
    } catch (e) {
      if (!mounted) return;
      
      setState(() {
        _messages.removeWhere((m) => m.isTyping);
        _messages.add(_ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: AppLocalizations.of(context)?.genericErrorTryAgain(e.toString()) ?? 'An error occurred. Please try again.\nError: ${e.toString()}',
          isUser: false,
          timestamp: DateTime.now(),
        ));
        _isSending = false;
      });
      _scrollToBottom();
    }
  }

  bool _isHairTransplantRelated(String text) {
    final lowerText = text.toLowerCase();
    
    // Analiz komutları
    if (lowerText.contains('analiz') || 
        lowerText.contains('değerlendir') || 
        lowerText.contains('kontrol') ||
        lowerText.contains('fotoğraf')) {
      return true;
    }
    
    // Saç ekimi ile ilgili kelimeler
    final hairTransplantKeywords = [
      'saç', 'hair', 'ekim', 'transplant', 'fue', 'dhi',
      'kafa', 'scalp', 'donor', 'vertex', 'front', 'açı',
      'fotoğraf', 'photo', 'çekim', 'capture', 'analiz',
      'değerlendirme', 'kontrol', 'check', 'review'
    ];
    
    return hairTransplantKeywords.any((keyword) => lowerText.contains(keyword));
  }

  Future<void> _openWhatsApp() async {
    try {
      final Uri whatsappUri = Uri.parse(
        'https://api.whatsapp.com/send/?phone=905491492400&text&type=phone_number&app_absent=0',
      );
      
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context)?.whatsappCannotOpen ?? 'WhatsApp could not be opened. Please make sure the WhatsApp app is installed.'),
            backgroundColor: Colors.red,
          ));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.whatsappOpenError('$e') ?? 'An error occurred while opening WhatsApp: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _getStageName(CaptureStage stage) {
    final l10n = AppLocalizations.of(context);
    switch (stage) {
      case CaptureStage.front:
        return l10n?.photoCaptureFront ?? 'Front';
      case CaptureStage.right45:
        return l10n?.captureStageRight45Title ?? 'Right 45°';
      case CaptureStage.left45:
        return l10n?.captureStageLeft45Title ?? 'Left 45°';
      case CaptureStage.vertex:
        return l10n?.photoCaptureTop ?? 'Top';
      case CaptureStage.donor:
        return l10n?.captureStageDonorTitle ?? 'Donor Area';
    }
  }

  String _getLocalizedStageFromKey(String stageKey) {
    final l10n = AppLocalizations.of(context);
    switch (stageKey.toLowerCase()) {
      case 'front':
        return l10n?.photoCaptureFront ?? 'Front';
      case 'right45':
        return l10n?.captureStageRight45Title ?? 'Right 45°';
      case 'left45':
        return l10n?.captureStageLeft45Title ?? 'Left 45°';
      case 'vertex':
        return l10n?.photoCaptureTop ?? 'Top';
      case 'donor':
        return l10n?.captureStageDonorTitle ?? 'Donor Area';
      default:
        return stageKey;
    }
  }

  String _formatStageActionMessage(CaptureStage stage, {required bool captured}) {
    final stageName = _getStageName(stage);
    final l10n = AppLocalizations.of(context);
    if (captured) {
      return l10n?.stageCaptured(stageName) ?? '$stageName angle captured';
    } else {
      return l10n?.stageUploaded(stageName) ?? '$stageName angle uploaded';
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  _StatusColors _statusColors(_AngleStatus status, bool isDark) {
    switch (status) {
      case _AngleStatus.approved:
        return _StatusColors(
          background: isDark ? const Color(0xFF1E2B22) : const Color(0xFFE6F6EC),
          border: const Color(0xFF22C55E),
          text: const Color(0xFF16A34A),
        );
      case _AngleStatus.needsRetake:
        return _StatusColors(
          background: isDark ? const Color(0xFF2B1E1E) : const Color(0xFFFEE2E2),
          border: const Color(0xFFDC2626),
          text: const Color(0xFFB91C1C),
        );
      case _AngleStatus.pendingAnalysis:
        return _StatusColors(
          background: isDark ? const Color(0xFF2B2418) : const Color(0xFFFFF7E6),
          border: const Color(0xFFF59E0B),
          text: const Color(0xFFD97706),
        );
      case _AngleStatus.captured:
        return _StatusColors(
          background: isDark ? const Color(0xFF1B2530) : const Color(0xFFE0ECFF),
          border: const Color(0xFF2563EB),
          text: const Color(0xFF1D4ED8),
        );
      case _AngleStatus.empty:
        return _StatusColors(
          background: isDark ? const Color(0xFF161C24) : const Color(0xFFF5F5F5),
          border: isDark ? const Color(0xFF2A3642) : const Color(0xFFE5E7EB),
          text: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
        );
    }
  }

  String _getStageShortLabel(CaptureStage stage) {
    final l10n = AppLocalizations.of(context);
    switch (stage) {
      case CaptureStage.front:
        return l10n?.frontShort ?? 'Ön';
      case CaptureStage.right45:
        return l10n?.right45Short ?? 'Sağ 45°';
      case CaptureStage.left45:
        return l10n?.left45Short ?? 'Sol 45°';
      case CaptureStage.vertex:
        return l10n?.vertexShort ?? 'Tepe';
      case CaptureStage.donor:
        return l10n?.donorShort ?? 'Arka';
    }
  }

  void _clearPhotos() {
    setState(() {
      _uploadedPhotos.clear();
      _currentCapturedPhotos.clear();
      _messages.removeWhere((m) => m.imageFile != null);
      _resetAngleStatuses();
    });
  }

  Future<Map<String, String>?> _saveToFirebaseWithDetectedAngles(
    List<CapturedPhoto> photos,
    AiAnalysisResult analysisResult,
  ) async {
    if (!_authService.isAuthenticated || _authService.currentUser == null) {
      // Kullanıcıya bilgilendirme yap
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            text: '🔒 Buluta kaydetmek için giriş yapmanız gerekiyor. Lütfen giriş yaptıktan sonra tekrar deneyin.',
            isUser: false,
            timestamp: DateTime.now(),
          ));
        });
        _scrollToBottom();
      }
      return null;
    }

    try {
      final userId = _authService.currentUser!.uid;
      final analysisId = DateTime.now().millisecondsSinceEpoch.toString();
      _lastSavedAnalysisId = analysisId;

      // Fotoğrafları Firebase Storage'a yükle - sağlam etiketleme ile
      final Map<String, File> photoMap = {};
      const List<String> orderedStages = ['front', 'right45', 'left45', 'vertex', 'donor'];
      int fallbackIndex = 0;
      
      // Yardımcı: sıradaki boş etiketi bul
      String nextAvailableStage() {
        while (fallbackIndex < orderedStages.length && photoMap.containsKey(orderedStages[fallbackIndex])) {
          fallbackIndex++;
        }
        return fallbackIndex < orderedStages.length ? orderedStages[fallbackIndex] : orderedStages.last;
      }
      
      final hasDetectedAngles = analysisResult.detectedAngles != null && analysisResult.detectedAngles!.isNotEmpty;
      
      debugPrint('📸 ${photos.length} fotoğraf işleniyor...');
      debugPrint('   detectedAngles var mı: $hasDetectedAngles');
      
      for (final photo in photos) {
        if (!photo.file.existsSync()) {
          debugPrint('⚠️ Fotoğraf dosyası bulunamadı: ${photo.file.path}');
          continue;
        }
        
        String? targetKey;
        
        // 1) AI detectedAngles öncelikli
        if (hasDetectedAngles) {
          final detected = analysisResult.detectedAngles![photo.stage.name];
          if (detected != null && orderedStages.contains(detected)) {
            targetKey = detected;
            debugPrint('   ✅ AI tespit etti: ${photo.stage.name} -> $detected');
          }
        }
        
        // 2) Fotoğrafın stage'i
        targetKey ??= photo.stage.name;
        
        // 3) Aynı anahtar zaten doluysa sıradaki boş etikete yerleştir
        if (photoMap.containsKey(targetKey)) {
          final oldKey = targetKey;
          targetKey = nextAvailableStage();
          debugPrint('   ⚠️ $oldKey zaten dolu, $targetKey kullanılıyor');
        }
        
        photoMap[targetKey] = photo.file;
        debugPrint('   📷 $targetKey: ${photo.file.path}');
      }

      if (photoMap.isEmpty) {
        debugPrint('⚠️ photoMap boş, kayıt yapılamıyor');
        if (mounted) {
          setState(() {
            _messages.add(_ChatMessage(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              text: '❌ Yüklenecek geçerli fotoğraf bulunamadı',
              isUser: false,
              timestamp: DateTime.now(),
            ));
          });
          _scrollToBottom();
        }
        return null;
      }

      debugPrint('📤 ${photoMap.length} fotoğraf Firebase Storage\'a yükleniyor...');
      final downloadUrls = await _storageService.uploadAnalysisPhotos(
        userId,
        analysisId,
        photoMap,
      );

      if (downloadUrls.isEmpty) {
        debugPrint('⚠️ downloadUrls boş, Firestore kaydı yapılamıyor');
        if (mounted) {
          setState(() {
            _messages.add(_ChatMessage(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              text: '❌ Fotoğraflar yüklenirken hata oluştu',
              isUser: false,
              timestamp: DateTime.now(),
            ));
          });
          _scrollToBottom();
        }
        return null;
      }
      
      debugPrint('✅ ${downloadUrls.length} fotoğraf başarıyla yüklendi');

      // Firestore'a kaydet
      try {
        final savedAnalysisId = await _firestoreService.addAnalysis(
          userId,
          {
            'description': analysisResult.message ?? (AppLocalizations.of(context)?.analysisCompleted ?? 'Analiz tamamlandı'),
            'message': analysisResult.message ?? (AppLocalizations.of(context)?.analysisCompleted ?? 'Analiz tamamlandı'),
            'imageUrl': downloadUrls['front'] ?? (downloadUrls.values.isNotEmpty ? downloadUrls.values.first : ''),
            'photoUrls': downloadUrls,
            'analysisData': analysisResult.analysisData,
            'visualAnalysis': analysisResult.visualAnalysis,
            'detectedAngles': analysisResult.detectedAngles,
            'samePerson': analysisResult.samePerson,
            'status': analysisResult.isValid ? 'completed' : 'needs_review',
            'isValid': analysisResult.isValid,
            'approvalStatus': 'pending_doctor_review', // Doktor onayı bekliyor
            'createdAt': DateTime.now().toIso8601String(),
            'originalCreatedAt': DateTime.now().toIso8601String(),
          },
        );
        
        // Gerçek Firestore ID'sini kullan
        _lastSavedAnalysisId = savedAnalysisId;
        debugPrint('✅ Firebase kayıt başarılı: Analysis ID = $_lastSavedAnalysisId');
        
        // Firebase Storage yollarını oluştur
        final Map<String, String> savedPaths = {};
        downloadUrls.forEach((stage, url) {
          savedPaths[stage] = 'users/$userId/analyses/$analysisId/${stage}_photo.jpg';
        });
        
        return savedPaths;
      } catch (e, stackTrace) {
        debugPrint('❌ Firebase kayıt hatası: $e');
        debugPrint('Stack trace: $stackTrace');
        
        // Kullanıcıya hata mesajı göster
        if (mounted) {
          setState(() {
            _messages.add(_ChatMessage(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              text: '❌ Firebase\'e kaydedilirken hata oluştu: ${e.toString()}',
              isUser: false,
              timestamp: DateTime.now(),
            ));
          });
          _scrollToBottom();
        }
        rethrow; // Hatayı yukarı fırlat
      }
    } catch (e, stackTrace) {
      debugPrint('❌ _saveToFirebaseWithDetectedAngles genel hata: $e');
      debugPrint('Stack trace: $stackTrace');
      
      // Kullanıcıya hata mesajı göster
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            text: '❌ Analiz kaydedilirken hata oluştu: ${e.toString()}',
            isUser: false,
            timestamp: DateTime.now(),
          ));
          _isSending = false;
          _isAnalyzing = false;
        });
        _scrollToBottom();
      }
      // Hata durumunda exception fırlat ki üst seviyede handle edilebilsin
      rethrow;
    }
  }

  /// Başarılı analiz sonucu dialog'unu göster
  Future<void> _showSuccessDialog(Map<String, String>? savedPaths) async {
    if (!mounted) return;
    
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                AppLocalizations.of(context)?.analysisCompletedSuccessfully ?? 'Analiz Başarıyla Tamamlandı!',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)?.photosSavedSuccessfully ?? 'Fotoğraflar başarıyla Firebase\'e kaydedildi!',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              if (_lastSavedAnalysisId != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '📁 Analiz ID:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.getTextPrimaryColor(context),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SelectableText(
                        _lastSavedAnalysisId!,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: AppTheme.getTextSecondaryColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
              // Dosya yolları gösterimi kaldırıldı - kullanıcı için gereksiz
              // if (savedPaths != null && savedPaths.isNotEmpty) ...[
              //   Text(
              //     '📸 Firebase Storage Yolları:',
              //     style: TextStyle(
              //       fontWeight: FontWeight.w600,
              //       color: AppTheme.getTextPrimaryColor(context),
              //     ),
              //   ),
              //   const SizedBox(height: 8),
              //   ...savedPaths.entries.map((entry) {
              //     final stage = entry.key;
              //     final path = entry.value;
              //     return Padding(
              //       padding: const EdgeInsets.only(bottom: 8),
              //       child: Container(
              //         padding: const EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //           color: AppTheme.getElevatedSurfaceColor(context),
              //           borderRadius: BorderRadius.circular(8),
              //           border: Border.all(color: AppTheme.getBorderColor(context)),
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               '${_getStageName(CaptureStage.values.firstWhere((s) => s.name == stage))}:',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w600,
              //                 color: AppTheme.getTextPrimaryColor(context),
              //                 fontSize: 14,
              //               ),
              //             ),
              //             const SizedBox(height: 4),
              //             SelectableText(
              //               path,
              //               style: TextStyle(
              //                 fontFamily: 'monospace',
              //                 fontSize: 11,
              //                 color: AppTheme.getTextSecondaryColor(context),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   }),
              // ],
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)?.analysisWaitingDoctorApproval ?? 'Analiz doktor onayı için bekliyor.',
                        style: const TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.check_circle, size: 20),
            label: Text(
              AppLocalizations.of(context)!.okUnderstood,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showHistorySheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.getElevatedSurfaceColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, modalSetState) {
            return _HistorySheet(
              sessions: _sessions,
              onDelete: (id) async {
                setState(() {
                  _sessions.removeWhere((session) => session.id == id);
                });
                await _persistSessions();
                modalSetState(() {});
              },
              onSelect: (session) {
                setState(() {
                  _activeSessionId = session.id;
                  _messages
                    ..clear()
                    ..addAll(session.messages);
                  // Fotoğrafları geri yükle
                  _uploadedPhotos.clear();
                  _currentCapturedPhotos.clear();
                  for (final msg in session.messages) {
                    if (msg.imageFile != null && msg.imageFile!.existsSync()) {
                      _uploadedPhotos.add(msg.imageFile!);
                    }
                  }
                });
                Navigator.of(context).pop();
                _scrollToBottom();
              },
            );
          },
        );
      },
    );
  }

  Future<void> _showRetakeDialog(
    AiAnalysisResult analysisResult,
    List<CapturedPhoto> capturedPhotos,
  ) async {
    if (!mounted) return;

    final shouldRetake = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)?.retakeRequired ?? 'Tekrar Çekim Gerekli'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(analysisResult.message ?? (AppLocalizations.of(context)?.somePhotosNeedRetake ?? 'Bazı fotoğraflar tekrar çekilmesi gerekiyor.')),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)?.anglesThatNeedRetake ?? 'Aşağıdaki açıların tekrar çekilmesi gerekiyor:',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: analysisResult.invalidStages.map((stage) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '• ${_getStageName(stage)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getBrandPrimaryColor(context),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)?.retakeFirstInvalidQuestion ?? 'İlk hatalı açıyı tekrar çekmek ister misiniz?',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: TextStyle(color: AppTheme.getTextSecondaryColor(context)),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
            ),
            child: Text(AppLocalizations.of(context)?.retakeButton ?? 'Tekrar Çek'),
          ),
        ],
      ),
    );

    if (shouldRetake == true && mounted) {
      await _retakeInvalidStages(analysisResult.invalidStages, capturedPhotos);
    }
  }

  Future<void> _retakeInvalidStages(
    List<CaptureStage> invalidStages,
    List<CapturedPhoto> existingPhotos,
  ) async {
    if (invalidStages.isEmpty || !mounted) return;

    // İlk hatalı açı için tekrar çekim yap
    final stageToRetake = invalidStages.first;

    // Mevcut fotoğraflardan baseline bilgilerini al
    CapturedPhoto? frontPhoto;
    try {
      frontPhoto = existingPhotos.firstWhere(
        (p) => p.stage == CaptureStage.front,
      );
    } catch (e) {
      if (existingPhotos.isNotEmpty) {
        frontPhoto = existingPhotos.first;
      }
    }

    final baselineFaceYaw = frontPhoto?.faceYaw;
    final baselineYaw = frontPhoto?.orientation?.yaw;

    List<CapturedPhoto>? retakePhotos;
    try {
      retakePhotos = await Navigator.of(context).push<List<CapturedPhoto>>(
        MaterialPageRoute(
          builder: (_) => CaptureFlowScreen(
            initialStage: stageToRetake,
            singleStage: true,
            initialBaselineFaceYaw: baselineFaceYaw,
            initialBaselineYaw: baselineYaw,
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.openCaptureScreenError('$e') ?? 'An error occurred while opening the capture screen: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    if (!mounted) return;

    if (retakePhotos != null && retakePhotos.isNotEmpty) {
      // Yeni çekilen fotoğrafı mevcut listeye ekle/güncelle
      final updatedPhotos = List<CapturedPhoto>.from(_currentCapturedPhotos);
      final validRetakePhotos = retakePhotos;
      
      for (final retakePhoto in validRetakePhotos) {
        if (!retakePhoto.file.existsSync()) continue;
        
        final index = updatedPhotos.indexWhere((p) => p.stage == retakePhoto.stage);
        if (index != -1) {
          updatedPhotos[index] = retakePhoto;
        } else {
          updatedPhotos.add(retakePhoto);
        }
      }

      setState(() {
        _currentCapturedPhotos = updatedPhotos;
        _uploadedPhotos.clear();
        _uploadedPhotos.addAll(updatedPhotos.map((p) => p.file));
        
        // Yeni fotoğrafı mesaj olarak ekle
        for (final photo in validRetakePhotos) {
          _messages.add(_ChatMessage(
            id: '${DateTime.now().microsecondsSinceEpoch}_retake_${photo.stage.name}',
            text: _formatStageActionMessage(photo.stage, captured: true),
            isUser: true,
            timestamp: DateTime.now(),
            imageFile: photo.file,
          ));
          _angleStatuses[photo.stage] = _AngleStatus.captured;
        }
        
        _messages.add(_ChatMessage(
          id: 'retake_analysis',
          text: AppLocalizations.of(context)?.retakeAnalyzing ?? 'The retaken photo is being analyzed...',
          isUser: false,
          timestamp: DateTime.now(),
        ));
      });

      _scrollToBottom();

      // Kısa bir gecikme sonrası tekrar analiz et
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          _analyzePhotos();
        }
      });
    }
  }

  Future<List<CapturedPhoto>?> _openCaptureFlowForStage(CaptureStage stage) async {
    CapturedPhoto? frontPhoto;
    try {
      frontPhoto = _currentCapturedPhotos.firstWhere((p) => p.stage == CaptureStage.front);
    } catch (_) {
      if (_currentCapturedPhotos.isNotEmpty) {
        frontPhoto = _currentCapturedPhotos.first;
      }
    }

    final baselineFaceYaw = frontPhoto?.faceYaw;
    final baselineYaw = frontPhoto?.orientation?.yaw;

    return Navigator.of(context).push<List<CapturedPhoto>>(
      MaterialPageRoute(
        builder: (_) => CaptureFlowScreen(
          initialStage: stage,
          singleStage: true,
          initialBaselineFaceYaw: baselineFaceYaw,
          initialBaselineYaw: baselineYaw,
        ),
      ),
    );
  }

  Future<void> _captureSpecificStage(CaptureStage stage) async {
    if (_isAnalyzing) return;

    List<CapturedPhoto>? photos;
    try {
      photos = await _openCaptureFlowForStage(stage);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)?.openCaptureScreenError('$e') ?? 'An error occurred while opening the capture screen: $e'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!mounted || photos == null || photos.isEmpty) return;

    setState(() {
      for (final photo in photos!) {
        _upsertCapturedPhoto(photo);
        _angleStatuses[photo.stage] = _AngleStatus.captured;
        _messages.add(_ChatMessage(
          id: '${DateTime.now().microsecondsSinceEpoch}_direct_${photo.stage.name}',
          text: '${_getStageName(photo.stage)} açısı çekildi',
          isUser: true,
          timestamp: DateTime.now(),
          imageFile: photo.file,
        ));
      }
      _refreshUploadedPhotosFromCurrent();
    });
    _scrollToBottom();
    await _saveActiveSession();
  }

  /// Long press ile galeriden fotoğraf seçip belirli bir stage'e ekle
  Future<void> _addPhotoForStage(CaptureStage stage) async {
    if (_isAnalyzing) return;

    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image == null) return;

      final file = File(image.path);
      final capturedPhoto = CapturedPhoto(
        stage: stage,
        file: file,
        capturedAt: DateTime.now(),
      );

      if (!mounted) return;

      setState(() {
        _upsertCapturedPhoto(capturedPhoto);
        _angleStatuses[stage] = _AngleStatus.captured;
        _refreshUploadedPhotosFromCurrent();
        _messages.add(_ChatMessage(
          id: '${DateTime.now().microsecondsSinceEpoch}_longpress_${stage.name}',
          text: '${_getStageName(stage)} açısı galeriden eklendi',
          isUser: true,
          timestamp: DateTime.now(),
          imageFile: file,
        ));
      });
      _scrollToBottom();
      await _saveActiveSession();

      if (_autoAnalyzeOnUpload) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _analyzePhotos();
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.errorLoadingPhoto('$e') ?? 'An error occurred while loading the photo: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF101922) : Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.getBrandPrimaryColor(context)),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)?.photoAnalysisTitle ?? 'Photo Analysis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
            if (_uploadedPhotos.isNotEmpty)
              Text(
                AppLocalizations.of(context)?.photosUploadedCount('${_uploadedPhotos.length}') ?? '${_uploadedPhotos.length} photos uploaded',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.getTextSecondaryColor(context),
                ),
              ),
          ],
        ),
        actions: [
          // Otomatik analiz toggle
          PopupMenuButton<String>(
            icon: Icon(
              _autoAnalyzeOnUpload ? Icons.auto_awesome : Icons.auto_awesome_outlined,
              color: AppTheme.getBrandPrimaryColor(context),
            ),
            onSelected: (value) {
              if (value == 'toggle_auto') {
                setState(() {
                  _autoAnalyzeOnUpload = !_autoAnalyzeOnUpload;
                });
              } else if (value == 'new_chat') {
                _saveActiveSession();
                _startNewSession();
                _addWelcomeMessage();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'toggle_auto',
                child: Row(
                  children: [
                    Icon(
                      _autoAnalyzeOnUpload ? Icons.toggle_on : Icons.toggle_off,
                      color: _autoAnalyzeOnUpload 
                          ? AppTheme.getBrandPrimaryColor(context)
                          : AppTheme.getTextSecondaryColor(context),
                    ),
                    const SizedBox(width: 8),
                    Text(_autoAnalyzeOnUpload 
                        ? (AppLocalizations.of(context)?.autoAnalysisOn ?? 'Auto Analysis: On')
                        : (AppLocalizations.of(context)?.autoAnalysisOff ?? 'Auto Analysis: Off')),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'new_chat',
                child: Row(
                  children: [
                    const Icon(Icons.add_circle_outline),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)?.newChat ?? 'New Chat'),
                  ],
                ),
              ),
            ],
          ),
          // Geçmiş butonu
          if (_sessions.isNotEmpty)
            IconButton(
              icon: Icon(Icons.history, color: AppTheme.getBrandPrimaryColor(context)),
              onPressed: _showHistorySheet,
              tooltip: AppLocalizations.of(context)?.historyTooltip ?? 'History',
            ),
          if (_uploadedPhotos.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red),
              onPressed: _clearPhotos,
              tooltip: AppLocalizations.of(context)?.clearPhotosTooltip ?? 'Clear photos',
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildAngleStatusBar(isDark),
            // Mesajlar listesi
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _MessageBubble(
                    message: _messages[index],
                    isDark: isDark,
                  );
                },
              ),
            ),

            // Yazıyor göstergesi
            if (_isSending || _isAnalyzing)
              Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: _TypingIndicator(isDark: isDark),
              ),

            // Input alanı
            _buildInputArea(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildAngleStatusBar(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101922) : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isDark ? const Color(0xFF192633) : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: CaptureStage.values.map((stage) {
            final status = _angleStatuses[stage] ?? _AngleStatus.empty;
            final colors = _statusColors(status, isDark);
            final label = _getStageShortLabel(stage);
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: _isAnalyzing ? null : () => _captureSpecificStage(stage),
                onLongPress: _isAnalyzing ? null : () => _addPhotoForStage(stage),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                    color: colors.background,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colors.border, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: colors.text,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: colors.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildInputArea(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101922) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark 
                ? const Color(0xFF192633).withOpacity(0.5) 
                : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Fotoğraf yükleme butonu
            GestureDetector(
              onTap: _isSending || _isAnalyzing ? null : _showImageSourceDialog,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: AppTheme.getBrandPrimaryColor(context),
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _isSending || _isAnalyzing ? null : _pickMultipleImages,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.collections,
                  color: AppTheme.getBrandPrimaryColor(context),
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF192633) : const Color(0xFFF6F7F8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)?.messageHintAnalyze ?? 'Type your message or write "Analyze"...',
                    hintStyle: TextStyle(
                      color: isDark 
                          ? const Color(0xFF92ADC9) 
                          : const Color(0xFF6B7280),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                  maxLines: 5,
                  minLines: 1,
                  enabled: !_isSending && !_isAnalyzing,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _isSending || _isAnalyzing ? null : () => _sendMessage(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.getBrandPrimaryColor(context),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: _isSending || _isAnalyzing
                    ? Icon(
                        Icons.hourglass_bottom,
                  color: Colors.white,
                        size: 18,
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            AppLocalizations.of(context)?.send ?? 'Gönder',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper classes
class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    required this.isDark,
  });

  final _ChatMessage message;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
              child: Icon(
                Icons.psychology,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: message.isUser 
                  ? CrossAxisAlignment.end 
                  : CrossAxisAlignment.start,
              children: [
                if (!message.isUser)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      AppLocalizations.of(context)?.aiAssistantName ?? 'AI Analysis Assistant',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark 
                            ? const Color(0xFF92ADC9) 
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message.isUser 
                        ? AppTheme.getBrandPrimaryColor(context)
                        : (isDark ? const Color(0xFF192633) : Colors.white),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(message.isUser ? 12 : 0),
                      topRight: Radius.circular(message.isUser ? 0 : 12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.imageFile != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            message.imageFile!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      Text(
                        message.text,
                        style: TextStyle(
                          color: message.isUser 
                              ? Colors.white 
                              : (isDark ? Colors.white : Colors.black87),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
              child: const Icon(Icons.person, size: 16, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppTheme.getBrandPrimaryColor(context),
          child: Icon(
            Icons.psychology,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF192633) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)?.analyzingPhotos ?? 'Your photos are being analyzed...',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme.getBrandPrimaryColor(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatMessage {
  _ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.imageFile,
    this.isTyping = false,
    this.analysisResult,
  });

  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final File? imageFile;
  final bool isTyping;
  final AiAnalysisResult? analysisResult;

  static _ChatMessage welcome(BuildContext? context) {
    final orWriteAnalyze = context != null 
        ? (AppLocalizations.of(context)?.orWriteAnalyze ?? 'Veya "Analiz et" yazarak manuel analiz başlatın')
        : 'Veya "Analiz et" yazarak manuel analiz başlatın';
    return _ChatMessage(
      id: 'welcome',
      text: '''👋 **Merhaba! Fotoğraf Analizi Asistanına Hoş Geldiniz**

Ben AI destekli fotoğraf analiz asistanıyım. Saç ekimi fotoğraflarınızı analiz edip değerlendirebilirim.

**Nasıl Kullanılır?**
1. 📷 butonuna tıklayarak fotoğraf yükleyin
2. Fotoğraf yüklendiğinde otomatik analiz başlar (üst menüden açıp/kapatabilirsiniz)
3. $orWriteAnalyze
4. AI fotoğraflarınızı kontrol edip detaylı sonuçları gösterecek

**Özellikler:**
• 📸 Görsel analiz: Her fotoğrafta ne görüldüğü
• 📊 Detaylı hata analizi: Nerede hata yapıldığı
• 💾 Otomatik Firebase kaydı: Başarılı analizler otomatik kaydedilir
• 📜 Geçmiş: Önceki analizleri görüntüleyebilirsiniz

**Daha Kaliteli Fotoğraf İçin İpuçları:**
• Front: Yüze tam karşı bakın; çene düz, baş dik
• Sağ 45°: Başınızı belirgin şekilde SAĞA çevirin (~70–90°)
• Sol 45°: Başınızı belirgin şekilde SOLA çevirin (~70–90°)
• Tepe: Telefonu yatay ve düz tutun; ekran yukarı baksın
• Arka (Donor): Telefonu ensenin arkasına götürün; ense derisi merkezde olsun
• Aydınlatmayı artırın, kamerayı sabit tutun, kadrajı kafa/kafa derisi merkezinde tutun

Hazırsanız fotoğraf yüklemeye başlayabilirsiniz! 📸''',
      isUser: false,
      timestamp: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'isUser': isUser,
        'timestamp': timestamp.toIso8601String(),
        'imageFile': imageFile?.path,
      };

  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _ChatMessage(
        id: json['id'] as String,
        text: json['text'] as String,
        isUser: json['isUser'] as bool,
        timestamp: DateTime.parse(json['timestamp'] as String),
        imageFile: json['imageFile'] != null ? File(json['imageFile'] as String) : null,
      );
}

class _ChatSession {
  _ChatSession({
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.messages,
  });

  final String id;
  final String title;
  final DateTime updatedAt;
  final List<_ChatMessage> messages;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'updatedAt': updatedAt.toIso8601String(),
        'messages': messages.map((msg) => msg.toJson()).toList(),
      };

  factory _ChatSession.fromJson(Map<String, dynamic> json) => _ChatSession(
        id: json['id'] as String,
        title: json['title'] as String,
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        messages: (json['messages'] as List<dynamic>)
            .map((e) => _ChatMessage.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  String get formattedDate =>
      '${updatedAt.day.toString().padLeft(2, '0')}.${updatedAt.month.toString().padLeft(2, '0')}.${updatedAt.year}';
}

class _HistorySheet extends StatelessWidget {
  const _HistorySheet({
    required this.sessions,
    required this.onDelete,
    required this.onSelect,
  });

  final List<_ChatSession> sessions;
  final ValueChanged<String> onDelete;
  final ValueChanged<_ChatSession> onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.history,
                color: AppTheme.getBrandPrimaryColor(context),
              ),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context)?.pastAnalyses ?? 'Geçmiş Analizler',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: sessions.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)?.noSavedAnalyses ?? 'Henüz kaydedilmiş analiz yok.',
                      style: TextStyle(
                        color: AppTheme.getTextSecondaryColor(context),
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: sessions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final session = sessions[index];
                      return ListTile(
                        tileColor: AppTheme.getMutedSurfaceColor(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text(
                          session.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.getTextPrimaryColor(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          session.formattedDate,
                          style: TextStyle(
                            color: AppTheme.getTextSecondaryColor(context),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => onDelete(session.id),
                        ),
                        onTap: () => onSelect(session),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

enum _AngleStatus { empty, captured, pendingAnalysis, needsRetake, approved }

class _StatusColors {
  const _StatusColors({
    required this.background,
    required this.border,
    required this.text,
  });

  final Color background;
  final Color border;
  final Color text;
}



