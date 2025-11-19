import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/storage_service.dart';
import '../services/ai_analysis_service.dart';
import '../services/notification_service.dart';
import '../models/notification_model.dart';
import '../services/push_service.dart';
import '../models/captured_photo.dart';
import '../models/capture_stage.dart';
import '../utils/clinic_disclaimer.dart';
import 'capture_flow_screen.dart';
import 'my_photos_screen.dart';
import 'temporary_review_screen.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  final StorageService _storageService = StorageService();
  final AiAnalysisService _aiAnalysisService = AiAnalysisService();
  
  // Care routine checkboxes state
  bool? _morningMedication;
  bool? _topicalSolution;
  bool? _eveningMedication;
  
  // Care routine
  bool _hasCareRoutineData = false;

  // Analysis state
  bool _isAnalyzing = false;
  double _analysisProgress = 0.0;
  String _analysisStatus = '';

  @override
  void initState() {
    super.initState();
    _loadCareRoutine();
    // Push izinleri ve token kaydı (sessiz)
    PushService().initialize();
  }

  /// Bakım rutinini Firebase'den yükle
  Future<void> _loadCareRoutine() async {

    if (!_authService.isAuthenticated) {
      setState(() {
        _hasCareRoutineData = false;
      });
      return;
    }
    
    final userId = _authService.currentUser!.uid;
    _firestoreService.getCareRoutineStream(userId).listen((routine) {
      if (mounted) {
        setState(() {
          if (routine != null) {
            _hasCareRoutineData = true;
            _morningMedication = routine['morningMedication'] ?? false;
            _topicalSolution = routine['topicalSolution'] ?? false;
            _eveningMedication = routine['eveningMedication'] ?? false;
          } else {
            _hasCareRoutineData = false;
            _morningMedication = null;
            _topicalSolution = null;
            _eveningMedication = null;
          }
        });
      }
    });
  }


  /// Bakım rutini görevini güncelle
  Future<void> _updateCareTask(String taskKey, bool value) async {
    if (!_authService.isAuthenticated) return;
    
    final userId = _authService.currentUser!.uid;
    await _firestoreService.completeCareTask(userId, taskKey, value);
  }

  /// Çekim ve analiz sürecini başlat
  Future<void> _startCaptureAndAnalysis() async {
    if (!_authService.isAuthenticated || !mounted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.needLoginForAnalysis ?? 'Analiz için giriş yapmanız gerekiyor'),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

    if (!mounted) return;

    // İlk çekim - tüm açılar
    // CaptureFlowScreen artık TemporaryReviewScreen'e yönlendiriyor
    // TemporaryReviewScreen otomatik olarak AI analizi yapıyor
    // Eğer analiz başarılıysa fotoğraflar zaten Firestore'a kaydedilmiş oluyor
    List<CapturedPhoto>? photos;
    try {
      photos = await Navigator.of(context).push<List<CapturedPhoto>>(
        MaterialPageRoute(
          builder: (_) => const CaptureFlowScreen(),
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Capture flow açılırken hata: $e');
      debugPrint('Stack trace: $stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.openCaptureFlowError(e.toString()) ?? 'Çekim ekranı açılırken hata oluştu: ${e.toString().length > 50 ? "${e.toString().substring(0, 50)}..." : e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    if (!mounted) return;

    if (photos == null || photos.isEmpty) {
      return; // Kullanıcı iptal etti
    }

    // Authentication kontrolü - eğer kullanıcı çıkış yaptıysa
    if (!_authService.isAuthenticated || _authService.currentUser == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.sessionExpired ?? 'Oturum süreniz doldu. Lütfen tekrar giriş yapın.'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    // Fotoğrafları inceleme ve otomatik analiz ekranına yönlendir
    bool? reviewResult;
    try {
      reviewResult = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (_) => TemporaryReviewScreen(photos: photos!),
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('TemporaryReviewScreen açılamadı: $e');
      debugPrint('Stack trace: $stackTrace');
    }

    if (mounted && reviewResult == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)?.photosAnalyzedAndSaved ?? 'Fotoğraflar başarıyla analiz edildi ve kaydedildi!'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  /// Fotoğrafları analiz et, yükle ve gerekirse tekrar çekim iste
  Future<void> _processPhotosWithAnalysis(List<CapturedPhoto> photos, {bool isRetake = false}) async {
    // Eğer zaten analiz yapılıyorsa ve retake değilse, yeni bir analiz başlatma
    if (_isAnalyzing && !isRetake) {
      debugPrint('Analiz zaten devam ediyor, yeni analiz başlatılmıyor');
      return;
    }

    // Retake durumunda, önceki analizi durdur
    if (isRetake && _isAnalyzing) {
      debugPrint('Retake başlatılıyor, önceki analiz durduruluyor');
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
          _analysisProgress = 0.0;
          _analysisStatus = '';
        });
      }
      // Kısa bir bekleme ekle
      await Future.delayed(const Duration(milliseconds: 300));
    }

    if (!_authService.isAuthenticated) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.needLoginForAnalysis ?? 'Analiz için giriş yapmanız gerekiyor'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    if (!mounted) return;

    if (photos.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.photoNotFoundForAnalysis ?? 'Analiz için fotoğraf bulunamadı'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    // Fotoğraf dosyalarının varlığını kontrol et
    final validPhotos = <CapturedPhoto>[];
    for (final photo in photos) {
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.noValidPhotosFound ?? 'Geçerli fotoğraf bulunamadı'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    if (!mounted) return;

    setState(() {
      _isAnalyzing = true;
      _analysisProgress = 0.0;
      _analysisStatus = isRetake ? (AppLocalizations.of(context)?.analysisPreparing ?? 'Yeniden analiz yapılıyor...') : (AppLocalizations.of(context)?.analysisPreparing ?? 'Fotoğraflar hazırlanıyor...');
    });

    try {
      final currentUser = _authService.currentUser;
      if (currentUser == null || !mounted) {
        setState(() {
          _isAnalyzing = false;
          _analysisProgress = 0.0;
          _analysisStatus = '';
        });
        return;
      }

      final userId = currentUser.uid;

      // 1. Fotoğrafları Firebase'e yükle
      if (mounted) {
        setState(() {
          _analysisProgress = 0.1;
          _analysisStatus = AppLocalizations.of(context)?.photosUploading ?? 'Fotoğraflar yükleniyor...';
        });
      }

      final analysisId = DateTime.now().millisecondsSinceEpoch.toString();
      final Map<String, File> photoMap = {};
      for (final photo in validPhotos) {
        try {
          if (photo.file.existsSync()) {
            photoMap[photo.stage.name] = photo.file;
          } else {
            debugPrint('Fotoğraf dosyası bulunamadı: ${photo.file.path}');
          }
        } catch (e) {
          debugPrint('Fotoğraf ekleme hatası: $e');
        }
      }

      if (photoMap.isEmpty) {
        throw Exception(AppLocalizations.of(context)?.noValidPhotosToUpload ?? 'Yüklenecek geçerli fotoğraf bulunamadı');
      }

      final downloadUrls = await _storageService.uploadAnalysisPhotos(
        userId,
        analysisId,
        photoMap,
      );

      if (downloadUrls.isEmpty) {
        throw Exception(AppLocalizations.of(context)?.errorUploadingPhotos ?? 'Fotoğraflar yüklenirken hata oluştu');
      }

      if (mounted) {
        setState(() {
          _analysisProgress = 0.3;
          _analysisStatus = AppLocalizations.of(context)?.geminiChecking ?? 'Gemini API bağlantısı kontrol ediliyor...';
        });
      }

      // API bağlantısını test et
      final isConnected = await _aiAnalysisService.testConnection();
      if (!isConnected) {
        throw Exception(AppLocalizations.of(context)?.geminiFailed ?? 'Gemini API bağlantısı başarısız. Lütfen internet bağlantınızı kontrol edin.');
      }

      if (mounted) {
        setState(() {
          _analysisProgress = 0.4;
          _analysisStatus = AppLocalizations.of(context)?.aiAnalyzing ?? 'Yapay zeka analizi yapılıyor...';
        });
      }

      // 2. AI analizi yap
      final analysisResult = await _aiAnalysisService.analyzePhotos(validPhotos);

      if (!mounted) return;

      // Authentication kontrolü - eğer kullanıcı çıkış yaptıysa
      if (!_authService.isAuthenticated || _authService.currentUser == null) {
        if (mounted) {
          setState(() {
            _isAnalyzing = false;
            _analysisProgress = 0.0;
            _analysisStatus = '';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)?.sessionExpired ?? 'Oturum süreniz doldu. Lütfen tekrar giriş yapın.'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 3),
            ),
          );
          // Login sayfasına yönlendirme yapma - sadece kullanıcıyı bilgilendir
        }
        return;
      }

      setState(() {
        _analysisProgress = 0.7;
        _analysisStatus = analysisResult.isValid
            ? (AppLocalizations.of(context)?.analysisCompletedShort ?? 'Analiz tamamlandı!')
            : (AppLocalizations.of(context)?.someAnglesNeedRetake ?? 'Bazı açılar tekrar çekilmesi gerekiyor...');
      });

      // 3. Eğer tüm açılar geçerliyse, Firestore'a kaydet
      if (analysisResult.isValid) {
        await _firestoreService.addAnalysis(
          userId,
          {
            'description': analysisResult.message ?? (AppLocalizations.of(context)?.analysisCompletedShort ?? 'Analiz tamamlandı'),
            'imageUrl': downloadUrls['front'] ?? '',
            'photoUrls': downloadUrls,
            'analysisData': analysisResult.analysisData,
            'status': 'completed',
            'isValid': true,
          },
        );

        setState(() {
          _analysisProgress = 1.0;
          _analysisStatus = AppLocalizations.of(context)?.analysisSaved ?? 'Analiz başarıyla kaydedildi!';
        });

        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          setState(() {
            _isAnalyzing = false;
            _analysisProgress = 0.0;
            _analysisStatus = '';
          });

          // Başarılı analiz sonuçlarını da göster
          await _showDetailedAnalysisResults(analysisResult, validPhotos);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)?.analysisCompletedSuccessfully ?? 'Analiz başarıyla tamamlandı!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        // 4. Hatalı açılar varsa, önce detaylı analiz sonuçlarını göster
        setState(() {
          _analysisProgress = 0.8;
          _analysisStatus = AppLocalizations.of(context)?.invalidAnglesCountNeedRetake(analysisResult.invalidStages.length.toString()) ?? '${analysisResult.invalidStages.length} açı tekrar çekilmesi gerekiyor...';
        });

        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          setState(() {
            _isAnalyzing = false;
            _analysisProgress = 0.0;
          });

          // Önce detaylı analiz sonuçlarını göster
          await _showDetailedAnalysisResults(analysisResult, validPhotos);

          // Sonra hatalı açıları göster ve tekrar çekim iste
          await _requestRetakeForInvalidStages(
            analysisResult.invalidStages,
            analysisResult.message ?? (AppLocalizations.of(context)?.someAnglesNotCapturedCorrectly ?? 'Bazı açılar doğru çekilmemiş'),
            validPhotos,
          );
        }
      }
    } catch (e, stackTrace) {
      debugPrint('Analiz sırasında hata: $e');
      debugPrint('Stack trace: $stackTrace');
      
      // Authentication hatası kontrolü
      if (!_authService.isAuthenticated || _authService.currentUser == null) {
        if (mounted) {
          setState(() {
            _isAnalyzing = false;
            _analysisProgress = 0.0;
            _analysisStatus = '';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)?.sessionExpired ?? 'Oturum süreniz doldu. Lütfen tekrar giriş yapın.'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 3),
            ),
          );
        }
        return;
      }
      
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
          _analysisProgress = 0.0;
          _analysisStatus = '';
        });

        String errorMessage = AppLocalizations.of(context)?.errorDuringAnalysis ?? 'Analiz sırasında hata oluştu';
        if (e.toString().contains('Gemini API')) {
          errorMessage = AppLocalizations.of(context)?.geminiApiError ?? 'Gemini API bağlantı hatası. Lütfen internet bağlantınızı kontrol edin.';
        } else if (e.toString().contains('Firebase')) {
          errorMessage = AppLocalizations.of(context)?.firebaseError ?? 'Firebase bağlantı hatası. Lütfen tekrar deneyin.';
        } else if (e.toString().contains('fotoğraf')) {
          errorMessage = AppLocalizations.of(context)?.photoProcessingError ?? 'Fotoğraf işleme hatası. Lütfen tekrar deneyin.';
        } else if (e.toString().contains('permission') || e.toString().contains('unauthorized')) {
          errorMessage = AppLocalizations.of(context)?.authErrorLoginAgain ?? 'Yetki hatası. Lütfen tekrar giriş yapın.';
        } else {
          errorMessage = '${AppLocalizations.of(context)?.errorOccurred(e.toString()) ?? "Hata: $e"}';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  /// Detaylı AI analiz sonuçlarını göster
  Future<void> _showDetailedAnalysisResults(
    AiAnalysisResult analysisResult,
    List<CapturedPhoto> photos,
  ) async {
    if (!mounted) return;

    try {
      await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: Row(
            children: [
              Icon(
                analysisResult.isValid ? Icons.check_circle : Icons.warning,
                color: analysisResult.isValid
                    ? Colors.green
                    : Colors.orange,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  analysisResult.isValid
                      ? (AppLocalizations.of(context)?.analysisSuccessfulTitle ?? 'Analiz Başarılı')
                      : (AppLocalizations.of(context)?.analysisResultsTitle ?? 'Analiz Sonuçları'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.getTextPrimaryColor(context),
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Genel mesaj
                if (analysisResult.message != null) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: analysisResult.isValid
                          ? Colors.green.withOpacity(0.1)
                          : Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: analysisResult.isValid
                            ? Colors.green.withOpacity(0.3)
                            : Colors.orange.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      analysisResult.message!,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.getTextPrimaryColor(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Detaylı analiz verileri
                if (analysisResult.analysisData != null &&
                    analysisResult.analysisData!.isNotEmpty) ...[
                  Text(
                    AppLocalizations.of(context)?.detailedAnalysisHeader ?? 'Detaylı Analiz:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...analysisResult.analysisData!.entries.map((entry) {
                    final stageName = entry.key;
                    final stageData = entry.value as Map<String, dynamic>?;
                    final isValid = stageData?['valid'] as bool? ?? true;
                    final issue = stageData?['issue'] as String? ?? '';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isValid
                            ? Colors.green.withOpacity(0.05)
                            : Colors.orange.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isValid
                              ? Colors.green.withOpacity(0.2)
                              : Colors.orange.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            isValid ? Icons.check_circle : Icons.error,
                            color: isValid ? Colors.green : Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getStageDisplayName(stageName),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.getTextPrimaryColor(context),
                                  ),
                                ),
                                if (issue.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    issue,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppTheme.getTextSecondaryColor(context),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                ],

                // Geçersiz açılar listesi
                if (analysisResult.invalidStages.isNotEmpty) ...[
                  Text(
                    AppLocalizations.of(context)?.retakeRequiredAnglesHeader ?? 'Tekrar Çekilmesi Gereken Açılar:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...analysisResult.invalidStages.map((stage) {
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
                            _getStageDisplayName(stage.name),
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

                const SizedBox(height: 16),
                Container(
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
                        color: AppTheme.getTextSecondaryColor(context),
                        size: 20,
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
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                AppLocalizations.of(context)?.ok ?? 'Tamam',
                style: TextStyle(
                  color: AppTheme.getBrandPrimaryColor(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Detaylı analiz dialog gösterilirken hata: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  String _getStageDisplayName(String stageName) {
    switch (stageName.toLowerCase()) {
      case 'front':
        return AppLocalizations.of(context)?.frontAngle ?? 'Ön (Front)';
      case 'right45':
        return AppLocalizations.of(context)?.right45Angle ?? '45° Sağ (Right45)';
      case 'left45':
        return AppLocalizations.of(context)?.left45Angle ?? '45° Sol (Left45)';
      case 'vertex':
        return AppLocalizations.of(context)?.vertexAngle ?? 'Tepe (Vertex)';
      case 'donor':
        return AppLocalizations.of(context)?.donorAngle ?? 'Arka (Donor)';
      default:
        return stageName;
    }
  }

  /// Hatalı açılar için tekrar çekim iste
  Future<void> _requestRetakeForInvalidStages(
    List<CaptureStage> invalidStages,
    String message,
    List<CapturedPhoto> existingPhotos,
  ) async {
    // Güvenlik kontrolleri
    if (invalidStages.isEmpty) {
      debugPrint('Invalid stages boş, retake iptal ediliyor');
      return;
    }
    
    if (!mounted) {
      debugPrint('Widget unmounted, retake iptal ediliyor');
      return;
    }

    if (existingPhotos.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.noExistingPhotosFound ?? 'Mevcut fotoğraflar bulunamadı'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    // Kullanıcıya hatalı açıları göster
    final stageNames = invalidStages.map((stage) {
      switch (stage) {
        case CaptureStage.front:
          return AppLocalizations.of(context)?.frontAngle ?? 'Ön (Front)';
        case CaptureStage.right45:
          return AppLocalizations.of(context)?.right45Angle ?? '45° Sağ (Right45)';
        case CaptureStage.left45:
          return AppLocalizations.of(context)?.left45Angle ?? '45° Sol (Left45)';
        case CaptureStage.vertex:
          return AppLocalizations.of(context)?.vertexAngle ?? 'Tepe (Vertex)';
        case CaptureStage.donor:
          return AppLocalizations.of(context)?.donorAngle ?? 'Arka (Donor)';
      }
    }).join(', ');

    if (!mounted) return;

    bool? shouldRetake;
    try {
      shouldRetake = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)?.retakeDialogTitle ?? 'Tekrar Çekim Gerekli'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)?.retakeDialogBody ?? 'Yapay zeka analizi sonucunda aşağıdaki açıların tekrar çekilmesi gerekiyor:',
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
              AppLocalizations.of(context)?.retakeFirstInvalidQuestionShort ?? 'İlk hatalı açıyı tekrar çekmek ister misiniz?',
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
              AppLocalizations.of(context)?.cancel ?? 'İptal',
              style: TextStyle(color: AppTheme.getTextSecondaryColor(context)),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
            ),
            child: Text(AppLocalizations.of(context)?.retake ?? 'Tekrar Çek'),
          ),
        ],
      ),
      );
    } catch (e, stackTrace) {
      debugPrint('Dialog gösterilirken hata: $e');
      debugPrint('Stack trace: $stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.dialogError(e.toString()) ?? 'Dialog açılırken hata oluştu: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
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
        // Front fotoğraf yoksa, ilk fotoğrafı kullan
        if (existingPhotos.isNotEmpty) {
          frontPhoto = existingPhotos.first;
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)?.baselinePhotoNotFound ?? 'Baseline fotoğraf bulunamadı'),
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
              content: Text(AppLocalizations.of(context)?.openCaptureFlowError(e.toString()) ?? 'Çekim ekranı açılırken hata oluştu: $e'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 4),
            ),
          );
        }
        return;
      }

      if (!mounted) return;

      if (retakePhotos != null && retakePhotos.isNotEmpty) {
        try {
          // Yeni çekilen fotoğrafı mevcut listeye ekle/güncelle
          final updatedPhotos = List<CapturedPhoto>.from(existingPhotos);
          for (final retakePhoto in retakePhotos) {
            try {
              // Fotoğraf dosyasının varlığını kontrol et
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)?.noPhotosToUpdate ?? 'Güncellenecek fotoğraf bulunamadı'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            return;
          }

          // Tekrar analiz et
          if (mounted) {
            await _processPhotosWithAnalysis(updatedPhotos, isRetake: true);
          }
        } catch (e, stackTrace) {
          debugPrint('Fotoğraf güncelleme ve analiz hatası: $e');
          debugPrint('Stack trace: $stackTrace');
          
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)?.analysisErrorDuringRetake(e.toString()) ?? 'Analiz devam ederken hata oluştu: $e'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 5),
              ),
            );
          }
        }
      } else {
        // Kullanıcı çekimi iptal etti veya boş döndü
        if (mounted) {
          debugPrint('Retake iptal edildi veya boş sonuç döndü');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('Retake sırasında hata: $e');
      debugPrint('Stack trace: $stackTrace');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.retakeError(e.toString()) ?? 'Tekrar çekim sırasında hata oluştu: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return SafeArea(
      bottom: true,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom + 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 8),
          // Capture and Analyze Button - moved to top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppTheme.buildBrandGradient(context),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.35),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                      onTap: _isAnalyzing ? null : _startCaptureAndAnalysis,
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                            if (_isAnalyzing)
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            else
                        Icon(
                          Icons.photo_camera_rounded, 
                          size: 24, 
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                                _isAnalyzing ? _analysisStatus : l10n.analysisCaptureAndAnalyze,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
                // Progress Bar
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
                      const SizedBox(height: 10),
                      _buildStepChips(context),
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
              ],
            ),
          ),
          const SizedBox(height: 12),
          
          // Yükle ve Analiz Et Butonu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _isAnalyzing ? null : () {
                  Navigator.of(context).pushNamed('/upload-and-analyze');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(
                    color: AppTheme.getBrandPrimaryColor(context),
                    width: 2,
                  ),
                  foregroundColor: AppTheme.getBrandPrimaryColor(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.upload_file, size: 24),
                label: Text(
                  l10n.uploadAndAnalyze,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          // Yüz Tanıma ile Çekim Butonu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _isAnalyzing ? null : () {
                  Navigator.of(context).pushNamed('/face-detection-capture');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(
                    color: AppTheme.getBrandPrimaryColor(context),
                    width: 2,
                  ),
                  foregroundColor: AppTheme.getBrandPrimaryColor(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.face_retouching_natural, size: 24),
                label: Text(
                  l10n.captureWithFaceDetection,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
            const SizedBox(height: 16),
          // Today's Care Routine - Sadece veri varsa göster
          if (_hasCareRoutineData && (_morningMedication != null || _topicalSolution != null || _eveningMedication != null))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.todaysCareRoutine,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                      letterSpacing: -0.015,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildCareRoutineCard(),
                  const SizedBox(height: 12),
                  _buildMedicationTimePicker(),
                ],
              ),
            ),
          if (_hasCareRoutineData && (_morningMedication != null || _topicalSolution != null || _eveningMedication != null))
            const SizedBox(height: 16),
          const SizedBox(height: 16),
          // Upcoming Appointment Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildAppointmentCard(l10n),
          ),
          const SizedBox(height: 16),
          // Quick Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.quickActions,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.getTextPrimaryColor(context),
                    letterSpacing: -0.015,
                  ),
                ),
                const SizedBox(height: 12),
                _buildQuickActionsGrid(l10n),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Quick Access Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                  l10n.quickAccess,
                              style: TextStyle(
                                fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.getTextPrimaryColor(context),
                    letterSpacing: -0.015,
                              ),
                            ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final items = <Widget>[
                      _buildQuickAccessCard(
                        Icons.chat_bubble_outline,
                        l10n.aiSupport,
                        () => Navigator.pushNamed(context, '/chat-support'),
                      ),
                      _buildQuickAccessCard(
                        Icons.photo_library_rounded,
                        l10n.myPhotos,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyPhotosScreen(),
                          ),
                        ),
                      ),
                      _buildQuickAccessCard(
                        Icons.camera_alt,
                        l10n.photoAnalysisChatbot,
                        () => Navigator.pushNamed(context, '/photo-analysis-chat'),
                      ),
                      _buildQuickAccessCard(
                        Icons.alarm_add,
                        l10n.enableDailyMedicationReminder,
                        () async {
                          int hour = 9;
                          int minute = 0;
                          try {
                            final userId = _authService.currentUser?.uid;
                            if (userId != null) {
                              final doc = await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userId)
                                  .collection('care_routine')
                                  .doc('daily')
                                  .get();
                              final data = doc.data();
                              final t = (data?['medicationTime'] as Map<String, dynamic>?);
                              if (t != null) {
                                hour = (t['hour'] as num?)?.toInt() ?? hour;
                                minute = (t['minute'] as num?)?.toInt() ?? minute;
                              }
                            }
                          } catch (_) {}
                          await PushService().enableDailyMedicationReminder(hour: hour, minute: minute, label: l10n.dailyMedication);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.dailyMedicationReminderSet('${hour.toString().padLeft(2,'0')}:${minute.toString().padLeft(2,'0')}')),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                      ),
                      _buildQuickAccessCard(
                        Icons.alarm_off,
                        l10n.disableMedicationReminder,
                        () async {
                          await PushService().disableDailyMedicationReminder();
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.medicationReminderDisabled),
                                backgroundColor: Colors.orange,
                              ),
                            );
                          }
                        },
                      ),
                      _buildQuickAccessCard(
                        Icons.notifications_none,
                        l10n.notifications,
                        () => Navigator.pushNamed(context, '/notifications'),
                      ),
                    ];
                    // Dinamik oran: 2 sütunda butonlar taşmadan görünsün
                    final crossAxisCount = 2;
                    const crossAxisSpacing = 12.0;
                    const mainAxisSpacing = 12.0;
                    final totalSpacing = crossAxisSpacing * (crossAxisCount - 1);
                    final tileWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;
                    final desiredTileHeight = 110.0; // başlık + ikon için yeterli (overflow önlemek için artırıldı)
                    final childAspectRatio = tileWidth / desiredTileHeight;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: childAspectRatio.clamp(1.4, 2.4),
                      ),
                      itemBuilder: (context, index) => items[index],
                    );
                  },
                ),
              ],
              ),
            ),
          const SizedBox(height: 120),
        ],
        ),
      ),
    );
  }

  Widget _buildStepChips(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Basit aşama göstergesi: Hazırlık (>=0), Yükleme (>=0.1), AI (>=0.4), Kaydetme (>=0.7), Tamamlandı (==1.0)
    final steps = [
      (l10n.preparation, 0.0),
      (l10n.uploading, 0.1),
      (l10n.aiAnalysis, 0.4),
      (l10n.saving, 0.7),
      (l10n.done, 1.0),
    ];
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: steps.map((step) {
        final label = step.$1;
        final threshold = step.$2;
        final isReached = _analysisProgress + 1e-6 >= threshold;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isReached
                ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.12)
                : AppTheme.getMutedSurfaceColor(context),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isReached
                  ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.35)
                  : AppTheme.getBorderColor(context),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isReached ? Icons.check_circle : Icons.radio_button_unchecked,
                size: 14,
                color: isReached
                    ? AppTheme.getBrandPrimaryColor(context)
                    : AppTheme.getTextSecondaryColor(context),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isReached
                      ? AppTheme.getBrandPrimaryColor(context)
                      : AppTheme.getTextSecondaryColor(context),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Care Routine Card
  Widget _buildCareRoutineCard() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(

        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getShadowColor(context),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            if (_morningMedication != null)
              _buildCheckboxItem(
                l10n.takeMedicationMorning,
                _morningMedication!,
                'morningMedication',
                showBorder: _topicalSolution != null || _eveningMedication != null,
              ),
            if (_topicalSolution != null)
              _buildCheckboxItem(
                l10n.applyTopicalSolution,
                _topicalSolution!,
                'topicalSolution',
                showBorder: _eveningMedication != null,
              ),
            if (_eveningMedication != null)
              _buildCheckboxItem(
                l10n.takeMedicationEvening,
                _eveningMedication!,
                'eveningMedication',
                showBorder: false,
              ),
          ],
        ),
    );
  }

  Widget _buildMedicationTimePicker() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(Icons.access_time, color: AppTheme.getBrandPrimaryColor(context)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.medicationTime,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.getTextPrimaryColor(context),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.selectMedicationReminderTime,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.getTextSecondaryColor(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton(
            onPressed: () async {
              final now = TimeOfDay.now();
              final picked = await showTimePicker(
                context: context,
                initialTime: now,
                confirmText: l10n.save,
                cancelText: l10n.cancel,
                helpText: l10n.selectMedicationTime,
              );
              if (picked != null && _authService.currentUser != null) {
                try {
                  await FirestoreService().updateCareRoutine(_authService.currentUser!.uid, {
                    'medicationTime': {'hour': picked.hour, 'minute': picked.minute},
                  });
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.medicationReminderSetAt(picked.format(context))),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.errorSavingMedicationTime(e.toString())),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              }
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.getBrandPrimaryColor(context),
              side: BorderSide(color: AppTheme.getBrandPrimaryColor(context)),
            ),
            child: Text(l10n.selectTime),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxItem(
    String title, 
    bool value, 
    String taskKey, 
    {bool showBorder = true}
  ) {
    return Container(
      decoration: BoxDecoration(

        border: showBorder
            ? Border(
                bottom: BorderSide(color: AppTheme.getBorderColor(context)),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: value,
              onChanged: (newValue) async {
                if (newValue != null) {
                  // Önce UI'ı güncelle
                  setState(() {
                    if (taskKey == 'morningMedication') {
                      _morningMedication = newValue;
                    } else if (taskKey == 'topicalSolution') {
                      _topicalSolution = newValue;
                    } else if (taskKey == 'eveningMedication') {
                      _eveningMedication = newValue;
                    }

                    _hasCareRoutineData = true;
                  });
                  // Sonra Firebase'e kaydet
                  await _updateCareTask(taskKey, newValue);
                }
              },

              activeColor: AppTheme.getBrandPrimaryColor(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,

                color: AppTheme.getTextPrimaryColor(context),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Appointment Card - CANLI VERİ
  Widget _buildAppointmentCard(AppLocalizations l10n) {
    if (!_authService.isAuthenticated) {
      return const SizedBox.shrink();
    }

    return StreamBuilder<Map<String, dynamic>?>(
      stream: _firestoreService.getNextAppointmentStream(_authService.currentUser!.uid),
      builder: (context, snapshot) {
        // Veri yüklenirken
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 200,
            decoration: BoxDecoration(

              color: AppTheme.getElevatedSurfaceColor(context),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.getBorderColor(context)),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: AppTheme.getBrandPrimaryColor(context),
              ),
            ),
          );
        }

        // Veri yoksa veya hata varsa
        if (!snapshot.hasData || snapshot.data == null) {
          return Container(
            decoration: BoxDecoration(

              color: AppTheme.getElevatedSurfaceColor(context),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.getBorderColor(context)),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.getShadowColor(context),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 48,

                  color: AppTheme.getTextSecondaryColor(context).withOpacity(0.5),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.noUpcomingAppointments,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,

                    color: AppTheme.getTextSecondaryColor(context),
                  ),
                ),
              ],
            ),
          );
        }

        final appointment = snapshot.data!;
        final dateTime = (appointment['dateTime'] as Timestamp?)?.toDate();
        final formattedDate = dateTime != null 
            ? DateFormat('EEE, MMM d, HH:mm', Localizations.localeOf(context).toString()).format(dateTime)
            : l10n.dateNotAvailable;

        return Container(
          decoration: BoxDecoration(

            color: AppTheme.getElevatedSurfaceColor(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.getBorderColor(context)),
            boxShadow: [
              BoxShadow(
                color: AppTheme.getShadowColor(context),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Header
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(

                    gradient: AppTheme.buildBrandGradient(
                      context,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.medical_services_rounded,
                      size: 64,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.upcomingAppointment,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,

                        color: AppTheme.getTextPrimaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      appointment['description'] ?? l10n.nextFollowUpConsultation,
                      style: TextStyle(
                        fontSize: 14,

                        color: AppTheme.getTextSecondaryColor(context),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,

                        color: AppTheme.getTextPrimaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showAppointmentDetails(appointment);
                        },
                        style: ElevatedButton.styleFrom(

                          backgroundColor: AppTheme.getBrandPrimaryColor(context),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          l10n.viewDetails,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _scheduleAppointmentReminder(appointment),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.getBrandPrimaryColor(context),
                          side: BorderSide(color: AppTheme.getBrandPrimaryColor(context)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.notifications_active_outlined),
                        label: Text(
                          l10n.setReminder,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Quick Actions Grid
  Widget _buildQuickActionsGrid(AppLocalizations l10n) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionCard(
                    Icons.chat_bubble_outline,
                    l10n.onlineConsultation,
                    () => Navigator.pushNamed(context, '/online-consultation'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildQuickActionCard(
                    Icons.medical_services,
                    l10n.ourDoctors,
                    () => Navigator.pushNamed(context, '/doctors'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionCard(
                    Icons.contact_phone,
                    l10n.contact,
                    () => Navigator.pushNamed(context, '/contact'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildQuickActionCard(
                    Icons.history,
                    l10n.history,
                    () => Navigator.pushNamed(context, '/past-analyses'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // Quick Access Card (AI Desteği ve Fotoğraflarım için)
  Widget _buildQuickAccessCard(IconData icon, String title, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getShadowColor(context),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: AppTheme.getBrandPrimaryColor(context),
                  size: 28,
                ),
                const SizedBox(height: 6),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(IconData icon, String title, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(

        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getShadowColor(context),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,

                  color: AppTheme.getBrandPrimaryColor(context),
                  size: 36,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,

                    color: AppTheme.getTextPrimaryColor(context),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAppointmentDetails(Map<String, dynamic> appointment) {
    final l10n = AppLocalizations.of(context)!;
    final dateTime = (appointment['dateTime'] as Timestamp?)?.toDate();
    final formattedDate = dateTime != null
        ? DateFormat('EEE, MMM d, yyyy', Localizations.localeOf(context).toString()).format(dateTime)
        : l10n.dateNotAvailable;
    final formattedTime = dateTime != null
        ? DateFormat('HH:mm', Localizations.localeOf(context).toString()).format(dateTime)
        : l10n.timeNotAvailable;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.appointmentDetails,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,

                          color: AppTheme.getTextPrimaryColor(context),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildDetailRow(Icons.calendar_today, l10n.date, formattedDate),
                  const SizedBox(height: 16),
                  _buildDetailRow(Icons.access_time, l10n.time, formattedTime),
                  const SizedBox(height: 16),
                  _buildDetailRow(Icons.person, l10n.doctor, appointment['doctorName'] ?? l10n.doctorNamePlaceholder),
                  const SizedBox(height: 16),
                  _buildDetailRow(Icons.medical_services, l10n.type, appointment['type'] ?? l10n.consultationTypePlaceholder),
                  if (appointment['location'] != null) ...[
                    const SizedBox(height: 16),
                    _buildDetailRow(Icons.location_on, l10n.location, appointment['location']),
                  ],
                  if (appointment['notes'] != null) ...[
                    const SizedBox(height: 16),
                    _buildDetailRow(Icons.notes, l10n.notes, appointment['notes']),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [

        Icon(icon, color: AppTheme.getBrandPrimaryColor(context), size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,

                  color: AppTheme.getTextSecondaryColor(context),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,

                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _scheduleAppointmentReminder(Map<String, dynamic> appointment) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final dateTime = (appointment['dateTime'] as Timestamp?)?.toDate();
      final doctorName = appointment['doctorName'] ?? l10n.yourDoctor;
      final type = appointment['type'] ?? l10n.appointment;
      final when = dateTime != null 
          ? DateFormat('EEE d MMM HH:mm', Localizations.localeOf(context).toString()).format(dateTime)
          : l10n.soon;
      
      await NotificationService().addNotification(
        title: l10n.appointmentReminder,
        message: '$when - ${l10n.appointmentWith(doctorName, type)}',
        type: NotificationType.appointment,
        metadata: {
          'appointmentId': appointment['id'],
          'dateTime': dateTime?.toIso8601String(),
        },
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.reminderAdded),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.reminderAddError(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}


