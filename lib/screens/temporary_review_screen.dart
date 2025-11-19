import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/captured_photo.dart';
import '../models/capture_stage.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/storage_service.dart';
import '../services/ai_analysis_service.dart';
import '../theme/app_theme.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import 'capture_flow_screen.dart';
import '../utils/clinic_disclaimer.dart';
import 'photo_analysis_chat_screen.dart';

class TemporaryReviewScreen extends StatefulWidget {
  const TemporaryReviewScreen({
    super.key,
    required this.photos,
  });

  final List<CapturedPhoto> photos;

  @override
  State<TemporaryReviewScreen> createState() => _TemporaryReviewScreenState();
}

class _TemporaryReviewScreenState extends State<TemporaryReviewScreen> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  final StorageService _storageService = StorageService();
  final AiAnalysisService _aiAnalysisService = AiAnalysisService();

  late List<CapturedPhoto> _currentPhotos;
  bool _isAnalyzing = false;
  double _analysisProgress = 0.0;
  String _analysisStatus = '';
  bool _analysisComplete = false;
  bool _isValid = false;
  String? _analysisMessage;
  List<CaptureStage> _invalidStages = [];

  @override
  void initState() {
    super.initState();
    _currentPhotos = List<CapturedPhoto>.from(widget.photos);
    // Otomatik olarak AI analizini başlat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutomaticAnalysis();
    });
  }

  /// Otomatik AI analizini başlat
  Future<void> _startAutomaticAnalysis() async {
    if (!mounted || _currentPhotos.isEmpty) return;

    // Authentication kontrolü
    if (!_authService.isAuthenticated || _authService.currentUser == null) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.needLoginForAnalysis ?? 'Analiz için giriş yapmanız gerekiyor'),
            backgroundColor: Colors.orange,
          ),
        );
        Navigator.of(context).pop();
      }
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _analysisProgress = 0.0;
      final l10n = AppLocalizations.of(context);
      _analysisStatus = l10n?.analysisPreparing ?? 'Fotoğraflar hazırlanıyor...';
    });

    try {
      final currentUser = _authService.currentUser;
      if (currentUser == null || !mounted) {
        setState(() {
          _isAnalyzing = false;
        });
        return;
      }

      final userId = currentUser.uid;

      // Fotoğraf dosyalarının varlığını kontrol et
      final validPhotos = <CapturedPhoto>[];
      for (final photo in _currentPhotos) {
        try {
          if (photo.file.existsSync()) {
            validPhotos.add(photo);
          } else {
            debugPrint('Fotoğraf dosyası bulunamadı: ${photo.file.path}');
          }
        } catch (e) {
          debugPrint('Fotoğraf kontrolü hatası: $e');
        }
      }

      if (validPhotos.isEmpty) {
        final l10n = AppLocalizations.of(context);
        throw Exception(l10n?.noValidPhotosFound ?? 'Geçerli fotoğraf bulunamadı');
      }

      if (!mounted) return;

      // 1. Fotoğrafları Firebase'e geçici olarak yükle
      setState(() {
        _analysisProgress = 0.1;
        final l10n = AppLocalizations.of(context);
        _analysisStatus = l10n?.photosUploading ?? 'Fotoğraflar yükleniyor...';
      });

      final analysisId = DateTime.now().millisecondsSinceEpoch.toString();
      final Map<String, File> photoMap = {};
      for (final photo in validPhotos) {
        try {
          if (photo.file.existsSync()) {
            photoMap[photo.stage.name] = photo.file;
          }
        } catch (e) {
          debugPrint('Fotoğraf ekleme hatası: $e');
        }
      }

      if (photoMap.isEmpty) {
        final l10n = AppLocalizations.of(context);
        throw Exception(l10n?.noValidPhotosToUpload ?? 'Yüklenecek geçerli fotoğraf bulunamadı');
      }

      final downloadUrls = await _storageService.uploadAnalysisPhotos(
        userId,
        analysisId,
        photoMap,
      );

      if (downloadUrls.isEmpty) {
        final l10n = AppLocalizations.of(context);
        throw Exception(l10n?.errorUploadingPhotos ?? 'Fotoğraflar yüklenirken hata oluştu');
      }

      if (!mounted) return;

      // 2. Fotoğraf analizi chatbot sayfasına yönlendir
      if (!mounted) return;
      
      final result = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (_) => PhotoAnalysisChatScreen(initialPhotos: validPhotos),
        ),
      );

      if (!mounted) return;

      if (result == true) {
        final l10n = AppLocalizations.of(context);
        setState(() {
          _analysisProgress = 1.0;
          _analysisStatus = l10n?.analysisSavedSuccessfully ?? 'Analiz başarıyla kaydedildi!';
          _analysisComplete = true;
          _isValid = true;
          _analysisMessage = l10n?.allPhotosAnalyzedAndSaved ?? 'Tüm fotoğraflar başarıyla analiz edildi ve kaydedildi.';
        });

        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          final l10n = AppLocalizations.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n?.photosSavedSuccessfully ?? 'Fotoğraflar başarıyla kaydedildi!'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
          
          // Başarılı olduğunu parent'a bildir
          Navigator.of(context).pop(true);
        }
      } else {
        // Kullanıcı geri döndüyse veya iptal ettiyse
        if (mounted) {
          Navigator.of(context).pop(false);
        }
      }
    } catch (e, stackTrace) {
      debugPrint('Analiz sırasında hata: $e');
      debugPrint('Stack trace: $stackTrace');

      if (mounted) {
        setState(() {
          _isAnalyzing = false;
          _analysisProgress = 0.0;
          _analysisStatus = '';
        });

        final l10n = AppLocalizations.of(context);
        String errorMessage = l10n?.errorDuringAnalysisShort(e.toString()) ?? 'Analiz sırasında hata oluştu';
        if (e.toString().contains('Gemini API')) {
          errorMessage = l10n?.geminiApiError ?? 'Gemini API bağlantı hatası. Lütfen internet bağlantınızı kontrol edin.';
        } else if (e.toString().contains('Firebase')) {
          errorMessage = l10n?.firebaseError ?? 'Firebase bağlantı hatası. Lütfen tekrar deneyin.';
        } else if (e.toString().contains('fotoğraf')) {
          errorMessage = l10n?.photoProcessingError ?? 'Fotoğraf işleme hatası. Lütfen tekrar deneyin.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
        });
      }
    }
  }

  /// Hatalı açılar için tekrar çekim iste
  Future<void> _requestRetakeForInvalidStages(
    List<CaptureStage> invalidStages,
    String message,
    List<CapturedPhoto> existingPhotos,
  ) async {
    if (invalidStages.isEmpty || !mounted) return;

    if (existingPhotos.isEmpty) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.noExistingPhotosFound ?? 'Mevcut fotoğraflar bulunamadı'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    // Kullanıcıya hatalı açıları göster
    final l10n = AppLocalizations.of(context);
    final stageNames = invalidStages.map((stage) {
      switch (stage) {
        case CaptureStage.front:
          return l10n?.frontAngle ?? 'Ön (Front)';
        case CaptureStage.right45:
          return l10n?.right45Angle ?? '45° Sağ (Right45)';
        case CaptureStage.left45:
          return l10n?.left45Angle ?? '45° Sol (Left45)';
        case CaptureStage.vertex:
          return l10n?.vertexAngle ?? 'Tepe (Vertex)';
        case CaptureStage.donor:
          return l10n?.donorAngle ?? 'Arka (Donor)';
      }
    }).join(', ');

    if (!mounted) return;

    bool? shouldRetake;
    try {
      final l10n = AppLocalizations.of(context);
      shouldRetake = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(l10n?.retakeDialogTitle ?? 'Tekrar Çekim Gerekli'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message),
              const SizedBox(height: 12),
              Text(
                l10n?.retakeDialogBody ?? 'Yapay zeka analizi sonucunda aşağıdaki açıların tekrar çekilmesi gerekiyor:',
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
                child: Text(
                  stageNames,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.getBrandPrimaryColor(context),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n?.retakeFirstInvalidQuestionShort ?? 'İlk hatalı açıyı tekrar çekmek ister misiniz?',
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
                l10n?.cancel ?? 'İptal',
                style: TextStyle(color: AppTheme.getTextSecondaryColor(context)),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.getBrandPrimaryColor(context),
              ),
              child: Text(l10n?.retake ?? 'Tekrar Çek'),
            ),
          ],
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Dialog gösterilirken hata: $e');
      debugPrint('Stack trace: $stackTrace');
      return;
    }

    if (shouldRetake != true || !mounted) return;

    try {
      // İlk hatalı açı için tekrar çekim yap
      if (invalidStages.isEmpty) return;
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
        } else {
          if (mounted) {
            final l10n = AppLocalizations.of(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n?.baselinePhotoNotFound ?? 'Baseline fotoğraf bulunamadı'),
                backgroundColor: Colors.red,
              ),
            );
          }
          return;
        }
      }

      final baselineFaceYaw = frontPhoto.faceYaw;
      final baselineYaw = frontPhoto.orientation?.yaw;

      // Tekrar çekim için capture flow'u aç
      if (!mounted) return;

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
        debugPrint('Navigator.push hatası: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)?.errorOpeningCaptureScreen(e.toString()) ?? 'Çekim ekranı açılırken hata oluştu: $e'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 4),
            ),
          );
        }
        return;
      }

      if (!mounted) return;

      if (retakePhotos != null && retakePhotos.isNotEmpty) {
        // Yeni çekilen fotoğrafı mevcut listeye ekle/güncelle
        final updatedPhotos = List<CapturedPhoto>.from(existingPhotos);
        for (final retakePhoto in retakePhotos) {
          try {
            if (!retakePhoto.file.existsSync()) {
              debugPrint('Retake fotoğrafı bulunamadı: ${retakePhoto.file.path}');
              continue;
            }

            final index = updatedPhotos.indexWhere((p) => p.stage == retakePhoto.stage);
            if (index != -1) {
              updatedPhotos[index] = retakePhoto;
            } else {
              updatedPhotos.add(retakePhoto);
            }
          } catch (e) {
            debugPrint('Fotoğraf güncelleme hatası: $e');
          }
        }

        if (updatedPhotos.isEmpty) {
          if (mounted) {
            final l10n = AppLocalizations.of(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n?.noPhotosToUpdate ?? 'Güncellenecek fotoğraf bulunamadı'),
                backgroundColor: Colors.red,
              ),
            );
          }
          return;
        }

        // Fotoğrafları güncelle ve tekrar analiz et
        if (mounted) {
          setState(() {
            _currentPhotos = updatedPhotos;
            _isAnalyzing = true;
            _analysisProgress = 0.0;
            _analysisStatus = l10n?.reanalyzing ?? 'Yeniden analiz yapılıyor...';
            _analysisComplete = false;
            _isValid = false;
            _invalidStages = [];
            _analysisMessage = null;
          });

          // Tekrar analiz başlat
          await _processRetakePhotos(updatedPhotos);
        }
      }
    } catch (e, stackTrace) {
      debugPrint('Retake sırasında hata: $e');
      debugPrint('Stack trace: $stackTrace');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.errorDuringRetake(e.toString()) ?? 'Tekrar çekim sırasında hata oluştu: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  /// Retake fotoğraflarını işle
  Future<void> _processRetakePhotos(List<CapturedPhoto> photos) async {
    if (!mounted || photos.isEmpty) return;

    try {
      final currentUser = _authService.currentUser;
      if (currentUser == null || !mounted) {
        setState(() {
          _isAnalyzing = false;
        });
        return;
      }

      final userId = currentUser.uid;
      final l10n = AppLocalizations.of(context);

      // Fotoğrafları Firebase'e yükle
      setState(() {
        _analysisProgress = 0.1;
        _analysisStatus = l10n?.photosUploadingStatus ?? 'Fotoğraflar yükleniyor...';
      });

      final analysisId = DateTime.now().millisecondsSinceEpoch.toString();
      final Map<String, File> photoMap = {};
      for (final photo in photos) {
        try {
          if (photo.file.existsSync()) {
            photoMap[photo.stage.name] = photo.file;
          }
        } catch (e) {
          debugPrint('Fotoğraf ekleme hatası: $e');
        }
      }

      if (photoMap.isEmpty) {
        throw Exception(l10n?.noValidPhotosToUpload ?? 'Yüklenecek geçerli fotoğraf bulunamadı');
      }

      final downloadUrls = await _storageService.uploadAnalysisPhotos(
        userId,
        analysisId,
        photoMap,
      );

      if (downloadUrls.isEmpty) {
        throw Exception(l10n?.errorUploadingPhotos ?? 'Fotoğraflar yüklenirken hata oluştu');
      }

      if (!mounted) return;

      // AI analizi yap
      setState(() {
        _analysisProgress = 0.4;
        _analysisStatus = l10n?.aiAnalysisInProgress ?? 'Yapay zeka analizi yapılıyor...';
      });

      final analysisResult = await _aiAnalysisService.analyzePhotos(photos);

      if (!mounted) return;

      setState(() {
        _analysisProgress = 0.7;
      });

      if (analysisResult.isValid) {
        // Geçerliyse kalıcı belleğe kaydet
        await _firestoreService.addAnalysis(
          userId,
          {
            'description': analysisResult.message ?? (l10n?.analysisCompleted ?? 'Analiz tamamlandı'),
            'imageUrl': downloadUrls['front'] ?? '',
            'photoUrls': downloadUrls,
            'analysisData': analysisResult.analysisData,
            'status': 'completed',
            'isValid': true,
            'createdAt': DateTime.now().toIso8601String(),
          },
        );

        setState(() {
          _analysisProgress = 1.0;
          _analysisStatus = l10n?.analysisSavedSuccessfully ?? 'Analiz başarıyla kaydedildi!';
          _analysisComplete = true;
          _isValid = true;
          _analysisMessage = analysisResult.message ?? (l10n?.allPhotosAnalyzedAndSaved ?? 'Tüm fotoğraflar başarıyla analiz edildi ve kaydedildi.');
        });

        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n?.photosSavedSuccessfully ?? 'Fotoğraflar başarıyla kaydedildi!'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else {
        // Hala geçersizse tekrar çekim iste
        setState(() {
          _analysisProgress = 0.8;
          _analysisComplete = true;
          _isValid = false;
          _invalidStages = analysisResult.invalidStages;
          _analysisMessage = analysisResult.message ?? (l10n?.someAnglesNotCapturedCorrectly ?? 'Bazı açılar doğru çekilmemiş');
        });

        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          await _requestRetakeForInvalidStages(
            analysisResult.invalidStages,
            analysisResult.message ?? (l10n?.someAnglesNotCapturedCorrectly ?? 'Bazı açılar doğru çekilmemiş'),
            photos,
          );
        }
      }
    } catch (e, stackTrace) {
      debugPrint('Retake analiz hatası: $e');
      debugPrint('Stack trace: $stackTrace');

      if (mounted) {
        setState(() {
          _isAnalyzing = false;
          _analysisProgress = 0.0;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.errorDuringAnalysisShort(e.toString().length > 50 ? "${e.toString().substring(0, 50)}..." : e.toString()) ?? 'Analiz sırasında hata oluştu: ${e.toString().length > 50 ? "${e.toString().substring(0, 50)}..." : e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppTheme.getBackgroundColor(context),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.getTextPrimaryColor(context),
          ),
          onPressed: () {
            if (!_isAnalyzing) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text(
          l10n?.temporaryRecordAndAnalysis ?? 'Geçici Kayıt ve Analiz',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.getTextPrimaryColor(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fotoğraf önizlemeleri
              Text(
                l10n?.capturedPhotos ?? 'Çekilen Fotoğraflar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _currentPhotos.length,
                  itemBuilder: (context, index) {
                    final photo = _currentPhotos[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _isAnalyzing
                              ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.6)
                              : AppTheme.getBorderColor(context),
                          width: _isAnalyzing ? 2 : 1,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              photo.file,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppTheme.getMutedSurfaceColor(context),
                                  child: Icon(
                                    Icons.broken_image,
                                    color: AppTheme.getTextSecondaryColor(context),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Çoklu seçim benzeri yükleme durumu rozeti
                          if (_isAnalyzing) Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.35),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white70, width: 1),
                              ),
                              child: _analysisProgress < 0.3
                                  ? Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    )
                                  : const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          // Altta açı adı etiketi
                          Positioned(
                            left: 6,
                            bottom: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                _getStageDisplayName(photo.stage.name, context),
                                style: const TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Analiz durumu
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.getElevatedSurfaceColor(context),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.getBorderColor(context),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _isAnalyzing
                              ? Icons.hourglass_empty
                              : _isValid
                                  ? Icons.check_circle
                                  : Icons.warning,
                          color: _isAnalyzing
                              ? AppTheme.getBrandPrimaryColor(context)
                              : _isValid
                                  ? Colors.green
                                  : Colors.orange,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _analysisStatus,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.getTextPrimaryColor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_isAnalyzing) ...[
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: _analysisProgress,
                          minHeight: 6,
                          backgroundColor: AppTheme.getMutedSurfaceColor(context),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.getBrandPrimaryColor(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(_analysisProgress * 100).toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.getTextSecondaryColor(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    if (_analysisComplete && _analysisMessage != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _isValid
                              ? Colors.green.withOpacity(0.1)
                              : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _isValid
                                ? Colors.green.withOpacity(0.3)
                                : Colors.orange.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          _analysisMessage!,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.getTextPrimaryColor(context),
                          ),
                        ),
                      ),
                    ],
                    if (_analysisComplete) ...[
                      const SizedBox(height: 12),
                      _buildDisclaimerNote(),
                    ],
                    if (_analysisComplete && !_isValid && _invalidStages.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        l10n?.anglesThatNeedRetakeHeader ?? 'Tekrar Çekilmesi Gereken Açılar:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ..._invalidStages.map((stage) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 16,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _getStageDisplayName(stage.name, context),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange.shade700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Sonuç butonları
              if (_analysisComplete && _isValid)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      l10n?.ok ?? 'Tamam',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisclaimerNote() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.getMutedSurfaceColor(context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            size: 18,
            color: AppTheme.getTextSecondaryColor(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              kSmileHairAnalysisDisclaimer,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.getTextSecondaryColor(context),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getStageDisplayName(String stageName, BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (stageName.toLowerCase()) {
      case 'front':
        return l10n?.frontAngle ?? 'Ön (Front)';
      case 'right45':
        return l10n?.right45Angle ?? '45° Sağ (Right45)';
      case 'left45':
        return l10n?.left45Angle ?? '45° Sol (Left45)';
      case 'vertex':
        return l10n?.vertexAngle ?? 'Tepe (Vertex)';
      case 'donor':
        return l10n?.donorAngle ?? 'Arka (Donor)';
      default:
        return stageName;
    }
  }
}

