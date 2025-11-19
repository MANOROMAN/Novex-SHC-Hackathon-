import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import '../services/ai_analysis_service.dart';
import '../services/firestore_service.dart';
import '../models/captured_photo.dart';
import '../models/capture_stage.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class FaceDetectionAutoCapture extends StatefulWidget {
  const FaceDetectionAutoCapture({super.key});

  @override
  State<FaceDetectionAutoCapture> createState() => _FaceDetectionAutoCaptureState();
}

class _FaceDetectionAutoCaptureState extends State<FaceDetectionAutoCapture> {
  CameraController? _cameraController;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      enableTracking: true,
      performanceMode: FaceDetectorMode.fast,
    ),
  );
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();
  final AiAnalysisService _aiAnalysisService = AiAnalysisService();
  final FirestoreService _firestoreService = FirestoreService();

  bool _isCameraInitialized = false;
  bool _isFaceDetected = false;
  bool _isCountdownActive = false;
  int _countdown = 3;
  bool _isProcessing = false;
  String _statusMessage = '';
  File? _capturedImage;
  
  bool _isAnalyzing = false;
  double _analysisProgress = 0.0;
  String _analysisStatus = '';

  @override
  void initState() {
    super.initState();
    _statusMessage = AppLocalizations.of(context)!.showFaceToCamera;
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() {
          _statusMessage = AppLocalizations.of(context)!.cameraNotFound;
        });
        return;
      }

      // Front camera'yı bul
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _cameraController!.initialize();

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
        _startFaceDetection();
      }
    } catch (e) {
      debugPrint('Kamera başlatma hatası: $e');
      if (mounted) {
        setState(() {
          _statusMessage = AppLocalizations.of(context)!.cameraCouldNotStart(e.toString());
        });
      }
    }
  }

  void _startFaceDetection() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    // Her 500ms'de bir yüz tespiti yap
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted || _isCountdownActive || _isProcessing || _capturedImage != null) {
        timer.cancel();
        return;
      }
      _detectFace();
    });
  }

  Future<void> _detectFace() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized || _isProcessing) {
      return;
    }

    try {
      final image = await _cameraController!.takePicture();
      final inputImage = InputImage.fromFilePath(image.path);
      final faces = await _faceDetector.processImage(inputImage);

      // Geçici dosyayı sil
      await File(image.path).delete();

      if (faces.isNotEmpty && !_isFaceDetected) {
        // Yüz algılandı
        setState(() {
          _isFaceDetected = true;
          _statusMessage = AppLocalizations.of(context)!.faceDetected;
        });
        _startCountdown();
      } else if (faces.isEmpty && _isFaceDetected) {
        setState(() {
          _isFaceDetected = false;
          _statusMessage = AppLocalizations.of(context)!.showFaceToCamera;
        });
      }
    } catch (e) {
      debugPrint('Yüz algılama hatası: $e');
    }
  }

  Future<void> _startCountdown() async {
    setState(() {
      _isCountdownActive = true;
      _countdown = 3;
    });

    // 3, 2, 1 sesli sayım
    for (int i = 3; i > 0; i--) {
      if (!mounted || !_isCountdownActive) break;

      setState(() {
        _countdown = i;
        _statusMessage = '$i...';
      });

      // Sesli sayım (beep sesi)
      await _playBeep();
      await Future.delayed(const Duration(seconds: 1));
    }

    if (mounted && _isCountdownActive) {
      // Fotoğraf çek
      await _capturePhoto();
    }
  }

  Future<void> _playBeep() async {
    // Beep sesi kaldırıldı
    // Sadece haptic feedback kullanılıyor
    try {
      HapticFeedback.lightImpact();
    } catch (e) {
      debugPrint('Haptic feedback hatası: $e');
    }
  }

  Future<void> _capturePhoto() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      setState(() {
        _isProcessing = true;
        _statusMessage = AppLocalizations.of(context)!.photoCapturing;
      });

      final image = await _cameraController!.takePicture();
      final appDir = await getTemporaryDirectory();
      final fileName = 'face_capture_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedImage = await File(image.path).copy(path.join(appDir.path, fileName));

      setState(() {
        _capturedImage = savedImage;
        _statusMessage = AppLocalizations.of(context)!.photoCaptured;
        _isCountdownActive = false;
      });

      // Başarı sesi çal
      await _playSuccessSound();
    } catch (e) {
      debugPrint('Fotoğraf çekme hatası: $e');
      if (mounted) {
        setState(() {
          _statusMessage = AppLocalizations.of(context)!.photoCouldNotCapture(e.toString());
          _isProcessing = false;
          _isCountdownActive = false;
        });
      }
    }
  }

  Future<void> _playSuccessSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/success.mp3'));
      HapticFeedback.mediumImpact();
    } catch (e) {
      debugPrint('Başarı sesi çalma hatası: $e');
    }
  }

  Future<void> _retake() async {
    setState(() {
      _capturedImage = null;
      _isProcessing = false;
      _isFaceDetected = false;
      _isCountdownActive = false;
        _statusMessage = AppLocalizations.of(context)!.showFaceToCamera;
    });
    _startFaceDetection();
  }

  Future<void> _analyzePhoto() async {
    if (_capturedImage == null) return;

    if (!_authService.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)?.needLoginForAnalysis ?? 'Analiz için giriş yapmanız gerekiyor'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _analysisProgress = 0.0;
      _analysisStatus = AppLocalizations.of(context)!.photoPreparing;
    });

    try {
      final userId = _authService.currentUser!.uid;
      final analysisId = DateTime.now().millisecondsSinceEpoch.toString();

      // Create CapturedPhoto object
      final photo = CapturedPhoto(
        file: _capturedImage!,
        stage: CaptureStage.front,
        capturedAt: DateTime.now(),
      );

      // Upload to Firebase Storage
      setState(() {
        _analysisProgress = 0.3;
        _analysisStatus = AppLocalizations.of(context)!.photoUploading;
      });

      final photosMap = <String, File>{
        'front': photo.file,
      };

      final downloadUrls = await _storageService.uploadAnalysisPhotos(
        userId,
        analysisId,
        photosMap,
      );

      setState(() {
        _analysisProgress = 0.5;
      });

      // Send to AI Analysis
      setState(() {
        _analysisProgress = 0.6;
        _analysisStatus = AppLocalizations.of(context)!.aiAnalysisInProgressStatus;
      });

      final result = await _aiAnalysisService.analyzePhotos([photo]);
      
      setState(() {
        _analysisProgress = 0.9;
        _analysisStatus = AppLocalizations.of(context)!.resultsSaving;
      });

      // Firebase'e kaydet
      await _firestoreService.addAnalysis(userId, {
        'photoUrls': downloadUrls,
        'imageUrl': downloadUrls['front'] ?? (downloadUrls.values.isNotEmpty ? downloadUrls.values.first : ''),
        'description': result.message ?? AppLocalizations.of(context)!.analysisCompleted,
        'message': result.message ?? AppLocalizations.of(context)!.analysisCompleted,
        'analysisData': result.analysisData,
        'visualAnalysis': result.visualAnalysis,
        'detectedAngles': result.detectedAngles,
        'samePerson': result.samePerson,
        'status': result.isValid ? 'completed' : 'needs_review',
        'isValid': result.isValid,
        'approvalStatus': 'pending_doctor_review',
        'createdAt': DateTime.now().toIso8601String(),
        'originalCreatedAt': DateTime.now().toIso8601String(),
        'photoCount': 1,
      });

      setState(() {
        _analysisProgress = 1.0;
        _analysisStatus = 'Tamamlandı!';
        _isAnalyzing = false;
      });

      // Başarı sesi çal
      _playSuccessSound();

      if (mounted) {
        // Sonuçları göster
        _showAnalysisResults(result);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
          _analysisProgress = 0.0;
          _analysisStatus = '';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorDuringAnalysisShort(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _faceDetector.close();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.faceDetectionCapture),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: _capturedImage != null
            ? _buildPreviewMode()
            : _buildCaptureMode(),
      ),
    );
  }

  Widget _buildCaptureMode() {
    return Stack(
      children: [
        // Camera Preview
        if (_isCameraInitialized && _cameraController != null)
          SizedBox.expand(
            child: CameraPreview(_cameraController!),
          )
        else
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),

        // Face Detection Overlay
        if (_isFaceDetected && !_isCountdownActive)
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(125),
              ),
            ),
          ),

        // Countdown Overlay
        if (_isCountdownActive)
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(75),
              ),
              child: Center(
                child: Text(
                  '$_countdown',
                  style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        // Status Message
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        // Manual Capture Button (optional)
        if (!_isCountdownActive && !_isProcessing)
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_isFaceDetected) {
                    _startCountdown();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(AppLocalizations.of(context)!.showYourFaceToCamera),
                        backgroundColor: Colors.orange,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: _isFaceDetected ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPreviewMode() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Image.file(
              _capturedImage!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isAnalyzing) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _analysisProgress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[800],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppTheme.getBrandPrimaryColor(context),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _analysisStatus,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${(_analysisProgress * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _isAnalyzing ? null : _retake,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Colors.white),
                        foregroundColor: Colors.white,
                      ),
                      child: Text(AppLocalizations.of(context)!.retake),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isAnalyzing ? null : _analyzePhoto,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppTheme.getBrandPrimaryColor(context),
                        foregroundColor: Colors.white,
                      ),
                      child: _isAnalyzing
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text(
                              AppLocalizations.of(context)!.analyzeButton,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAnalysisResults(AiAnalysisResult result) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              result.isValid ? Icons.check_circle : Icons.warning,
              color: result.isValid ? Colors.green : Colors.orange,
              size: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                result.isValid ? AppLocalizations.of(context)!.analysisSuccessful : AppLocalizations.of(context)!.analysisCompletedShort,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(result.message ?? AppLocalizations.of(context)!.analysisCompleted),
              if (result.invalidStages.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.anglesThatNeedRetake,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                ...result.invalidStages.map((stage) => Text('• ${stage.name}')),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(true);
            },
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }
}
