import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:self_capture/l10n/app_localizations.dart';

import '../models/captured_photo.dart';
import '../models/capture_stage.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import 'photo_analysis_chat_screen.dart';

class FaceDetectionMultiAngleCapture extends StatefulWidget {
  const FaceDetectionMultiAngleCapture({super.key});

  @override
  State<FaceDetectionMultiAngleCapture> createState() => _FaceDetectionMultiAngleCaptureState();
}

class _FaceDetectionMultiAngleCaptureState extends State<FaceDetectionMultiAngleCapture> {
  CameraController? _cameraController;
  Timer? _faceDetectionTimer;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      enableTracking: true,
      performanceMode: FaceDetectorMode.fast,
    ),
  );
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AuthService _authService = AuthService();

  bool _isCameraInitialized = false;
  bool _isFaceDetected = false;
  bool _isCountdownActive = false;
  int _countdown = 3;
  bool _isProcessing = false;
  String _statusMessage = '';

  CaptureStage _currentStage = CaptureStage.front;
  final List<CapturedPhoto> _capturedPhotos = [];
  static const List<CaptureStage> _stageOrder = [
    CaptureStage.front,
    CaptureStage.right45,
    CaptureStage.left45,
    CaptureStage.vertex,
    CaptureStage.donor,
  ];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _faceDetectionTimer?.cancel();
    _cameraController?.dispose();
    _faceDetector.close();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (!mounted) return;
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          _statusMessage = l10n.showFaceToCamera ?? 'Kamera bulunamadı';
        });
        return;
      }

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

      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      setState(() {
        _isCameraInitialized = true;
        _statusMessage = _buildStatusMessage();
      });
      _startFaceDetection();
    } catch (e) {
      debugPrint('Kamera başlatma hatası: $e');
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          _statusMessage = 'Kamera bulunamadı: $e';
        });
      }
    }
  }

  String _buildStatusMessage({CaptureStage? stageOverride, int? capturedCountOverride}) {
    final l10n = AppLocalizations.of(context)!;
    final stage = stageOverride ?? _currentStage;
    final capturedCount = capturedCountOverride ?? _capturedPhotos.length;
    final instruction = _instructionForStage(stage);
    final index = (capturedCount + 1).clamp(1, _stageOrder.length).toInt();
    if (!_isCameraInitialized) {
      return l10n.showFaceToCamera ?? 'Yüzünüzü kameraya gösterin...';
    }
    return '$index/${_stageOrder.length}: $instruction';
  }

  String _instructionForStage(CaptureStage stage) {
    final l10n = AppLocalizations.of(context)!;
    switch (stage) {
      case CaptureStage.front:
        return l10n.lookStraight;
      case CaptureStage.right45:
        return l10n.turnHeadRight;
      case CaptureStage.left45:
        return l10n.turnHeadLeft;
      case CaptureStage.vertex:
        return l10n.holdPhoneFlat;
      case CaptureStage.donor:
        return l10n.movePhoneBehind;
    }
  }

  void _startFaceDetection() {
    _faceDetectionTimer?.cancel();
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    _faceDetectionTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted || _isCountdownActive || _isProcessing) {
        timer.cancel();
        _faceDetectionTimer = null;
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
      await File(image.path).delete();

      if (faces.isNotEmpty && !_isFaceDetected) {
        if (!mounted) return;
        setState(() {
          _isFaceDetected = true;
        });
        _startCountdown();
      } else if (faces.isEmpty && _isFaceDetected) {
        if (!mounted) return;
        setState(() {
          _isFaceDetected = false;
        });
      }
    } catch (e) {
      debugPrint('Yüz algılama hatası: $e');
    }
  }

  Future<void> _startCountdown() async {
    if (!mounted) return;
    setState(() {
      _isCountdownActive = true;
      _countdown = 3;
    });

    for (int i = 3; i > 0; i--) {
      if (!mounted || !_isCountdownActive) break;
      setState(() {
        _countdown = i;
      });
      await _playBeep();
      await Future.delayed(const Duration(seconds: 1));
    }

    if (mounted && _isCountdownActive) {
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
      });

      final image = await _cameraController!.takePicture();
      final appDir = await getTemporaryDirectory();
      final fileName = 'face_${_currentStage.name}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedImage = await File(image.path).copy(path.join(appDir.path, fileName));

      final capturedPhoto = CapturedPhoto(
        file: savedImage,
        stage: _currentStage,
        capturedAt: DateTime.now(),
      );

      if (!mounted) return;
      setState(() {
        _capturedPhotos.add(capturedPhoto);
        _isCountdownActive = false;
        _isFaceDetected = false;
      });

      await _playSuccessSound();

      if (_capturedPhotos.length < _stageOrder.length) {
        if (!mounted) return;
        setState(() {
          _currentStage = _stageOrder[_capturedPhotos.length];
          _isProcessing = false;
          _statusMessage = _buildStatusMessage();
        });
        _startFaceDetection();
      } else {
        if (!mounted) return;
        setState(() {
          _isProcessing = false;
        });
        await _openChatbotWithPhotos();
      }
    } catch (e) {
      debugPrint('Fotoğraf çekme hatası: $e');
      if (mounted) {
        setState(() {
          _statusMessage = 'Fotoğraf çekilemedi: $e';
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

  Future<void> _openChatbotWithPhotos() async {
    final l10n = AppLocalizations.of(context);
    if (!_authService.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(l10n?.needLoginForAnalysis ?? 'Analiz için giriş yapmanız gerekiyor'),
          backgroundColor: Colors.orange,
        ),
      );
      await _resetCaptureFlow();
      return;
    }

    _faceDetectionTimer?.cancel();
    final photos = List<CapturedPhoto>.from(_capturedPhotos);

    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => PhotoAnalysisChatScreen(initialPhotos: photos),
      ),
    );

    if (!mounted) return;

    if (result == true) {
      // Başarılı olduysa analiz sayfasına yönlendir
      Navigator.of(context).pop(); // Face detection ekranını kapat
      Navigator.of(context).pushReplacementNamed('/past-analyses'); // Analiz sayfasına git
      return;
    } else if (result == false) {
      // Kullanıcı geri döndüyse analiz sayfasına yönlendir
      Navigator.of(context).pop(); // Face detection ekranını kapat
      Navigator.of(context).pushReplacementNamed('/past-analyses'); // Analiz sayfasına git
      return;
    }

    await _resetCaptureFlow();
  }

  Future<void> _resetCaptureFlow() async {
    _faceDetectionTimer?.cancel();
    for (final photo in _capturedPhotos) {
      if (photo.file.existsSync()) {
        try {
          await photo.file.delete();
        } catch (_) {}
      }
    }

    if (!mounted) return;
    setState(() {
      _capturedPhotos.clear();
      _currentStage = CaptureStage.front;
      _isProcessing = false;
      _isCountdownActive = false;
      _isFaceDetected = false;
      _statusMessage = _buildStatusMessage(
        stageOverride: CaptureStage.front,
        capturedCountOverride: 0,
      );
    });
    _startFaceDetection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Yüz Tanıma ile Çekim'),
        backgroundColor: AppTheme.getBrandPrimaryColor(context),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: _buildCaptureMode(),
      ),
    );
  }

  Widget _buildCaptureMode() {
    return Stack(
      children: [
        if (_isCameraInitialized && _cameraController != null)
          SizedBox.expand(
            child: CameraPreview(_cameraController!),
          )
        else
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppTheme.getBrandPrimaryColor(context),
              ),
            ),
          ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: List.generate(_stageOrder.length, (index) {
                final isCompleted = index < _capturedPhotos.length;
                final isCurrent = index == _capturedPhotos.length;
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    decoration: BoxDecoration(
                      color: isCompleted
                          ? Colors.green
                          : isCurrent
                              ? AppTheme.getBrandPrimaryColor(context)
                              : Colors.white30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
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
      ],
    );
  }
}
