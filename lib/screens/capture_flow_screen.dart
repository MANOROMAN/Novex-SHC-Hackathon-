import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:self_capture/l10n/app_localizations.dart';

import '../models/capture_stage.dart';
import '../models/captured_photo.dart';
import '../services/orientation_monitor.dart';
import '../theme/app_theme.dart';
import 'photo_analysis_chat_screen.dart';

class CaptureFlowScreen extends StatefulWidget {
  const CaptureFlowScreen({
    super.key,
    this.initialStage = CaptureStage.front,
    this.singleStage = false,
    this.initialBaselineFaceYaw,
    this.initialBaselineYaw,
  });

  final CaptureStage initialStage;
  final bool singleStage;
  final double? initialBaselineFaceYaw;
  final double? initialBaselineYaw;

  @override
  State<CaptureFlowScreen> createState() => _CaptureFlowScreenState();
}

class _CaptureFlowScreenState extends State<CaptureFlowScreen> with SingleTickerProviderStateMixin {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  CaptureStage _currentStage = CaptureStage.front;
  OrientationMonitor? _orientationMonitor;
  StreamSubscription<OrientationReading>? _orientationSubscription;
  OrientationReading? _lastReading;
  AudioPlayer? _shutterPlayer;
  Uint8List? _shutterTone;
  bool _audioReady = false;

  DateTime? _alignmentStart;
  DateTime? _lastReminder;
  bool _initializingCamera = false;
  bool _cameraControllerBusy = false;

  final List<CapturedPhoto> _captures = [];
  double? _baselineYaw;
  double? _baselineFaceYaw;

  bool _panoramaMode = false;
  bool _panoramaFaceLocked = false;
  double? _panoramaBaseYaw;
  bool _panoramaVertexCaptured = false;
  bool _panoramaDonorCaptured = false;
  DateTime? _panoramaVertexCapturedAt;
  DateTime? _lastPanoramaLog;

  bool _isProcessingPicture = false;
  bool _capturePending = false;
  String? _error;

  FaceDetector? _faceDetector;
  Face? _latestFace;
  DateTime? _lastFaceTimestamp;
  bool _processingImageFrame = false;
  int _lastFrameProcessedMs = 0;
  Face? _alignedFaceSnapshot;
  OrientationReading? _alignedReadingSnapshot;

  // Proximity beep (ses kaldırıldı, sadece haptic feedback kullanılıyor)
  DateTime? _lastBeepAt;

  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  // Voice guidance (TTS)
  FlutterTts? _tts;
  DateTime? _lastTtsAt;
  String? _lastSpoken;
  String _voiceLangCode = 'tr-TR'; // persisted TTS language
  bool _isTtsSpeaking = false; // TTS'in şu anda konuşup konuşmadığını takip et
  String? _pendingTtsText; // Bekleyen TTS metni (konuşma bitince konuşulacak)
  
  // Example photos carousel
  final PageController _examplePhotoController = PageController();
  int _currentExampleIndex = 0;
  bool _showExamplePhotoFullScreen = false; // Tam ekran örnek fotoğraf gösterimi
  
  // İlk fotoğraf review overlay
  bool _showFirstPhotoReview = false;
  DateTime? _nextStageDelayStart; // Sonraki stage'e geçerken bekleme başlangıcı

  @override
  void initState() {
    super.initState();
    _currentStage = widget.initialStage;
    _baselineYaw = widget.initialBaselineYaw;
    _baselineFaceYaw = widget.initialBaselineFaceYaw;
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );
    unawaited(_prepareAudio());
    _setup();
  }

  bool get _singleStageMode => widget.singleStage;

  Future<void> _setup() async {
    try {
      final sensorStatus = await Permission.sensors.request();
      if (sensorStatus.isGranted) {
        _orientationMonitor = OrientationMonitor();
        _orientationSubscription = _orientationMonitor!.readings.listen((reading) {
          _lastReading = reading;
          _evaluateAlignment();
        });
      }
      _faceDetector = FaceDetector(
        options: FaceDetectorOptions(
          performanceMode: FaceDetectorMode.fast,
          enableTracking: true,
        ),
      );
      _cameras = await availableCameras();
      await _prepareStage(_currentStage);
      // Initialize TTS lazily
      await _loadVoiceLang();
      _initTts();
    } catch (error) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        setState(() {
          _error = l10n?.cameraInitError(error.toString()) ?? 'Error initializing camera: $error';
        });
      }
    }
  }

  Future<void> _loadVoiceLang() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString('voice_language') ?? 'tr-TR';
      _voiceLangCode = code;
    } catch (_) {}
  }

  Future<void> _initTts() async {
    try {
      final tts = FlutterTts();
      // set selected language
      await tts.setLanguage(_voiceLangCode);
      await tts.setPitch(1.0);
      await tts.setSpeechRate(0.45);
      
      // TTS konuşma durumunu takip et
      tts.setStartHandler(() {
        _isTtsSpeaking = true;
        debugPrint('TTS started speaking');
      });
      
      tts.setCompletionHandler(() {
        _isTtsSpeaking = false;
        _lastTtsAt = DateTime.now();
        debugPrint('TTS finished speaking');
        
        // Eğer bekleyen bir metin varsa, onu konuş
        if (_pendingTtsText != null && mounted) {
          final pending = _pendingTtsText;
          _pendingTtsText = null;
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted && !_isTtsSpeaking) {
              _speakTtsText(pending!);
            }
          });
        }
      });
      
      tts.setErrorHandler((msg) {
        _isTtsSpeaking = false;
        debugPrint('TTS error: $msg');
      });
      
      _tts = tts;
    } catch (e) {
      debugPrint('TTS init error: $e');
    }
  }

  Future<void> _changeVoiceLang(String code) async {
    if (_voiceLangCode == code) return;
    setState(() {
      _voiceLangCode = code;
    });
    try {
      await _tts?.setLanguage(code);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('voice_language', code);
    } catch (e) {
      debugPrint('TTS change language error: $e');
    }
  }

  Future<void> _prepareAudio() async {
    try {
      final tone = _generateShutterTone();
      final player = AudioPlayer(playerId: 'self_capture_shutter');
      await player.setReleaseMode(ReleaseMode.stop);
      await player.setVolume(1.0);
      _shutterTone = tone;
      _shutterPlayer = player;
      _audioReady = true;
    } catch (error) {
      debugPrint('Shutter sesi hazırlanamadı: $error');
    }
  }

  Uint8List _generateShutterTone({
    int sampleRate = 44100,
    double frequency = 950,
    double durationMs = 160,
  }) {
    final totalSamples = (sampleRate * durationMs / 1000).round();
    final totalDataLen = totalSamples * 2;
    final headerSize = 44;
    final buffer = ByteData(headerSize + totalDataLen);
    int offset = 0;

    void writeString(String value) {
      for (var codeUnit in value.codeUnits) {
        buffer.setUint8(offset++, codeUnit);
      }
    }

    void writeUint32(int value) {
      buffer.setUint32(offset, value, Endian.little);
      offset += 4;
    }

    void writeUint16(int value) {
      buffer.setUint16(offset, value, Endian.little);
      offset += 2;
    }

    writeString('RIFF');
    writeUint32(36 + totalDataLen);
    writeString('WAVE');
    writeString('fmt ');
    writeUint32(16);
    writeUint16(1);
    writeUint16(1);
    writeUint32(sampleRate);
    writeUint32(sampleRate * 2);
    writeUint16(2);
    writeUint16(16);
    writeString('data');
    writeUint32(totalDataLen);

    const amplitude = 0.6;
    for (var i = 0; i < totalSamples; i++) {
      final t = i / sampleRate;
      final damping = 1 - (i / totalSamples);
      final sample =
          (sin(2 * pi * frequency * t) * amplitude * damping * 0x7fff).round().clamp(-0x7fff, 0x7fff);
      buffer.setInt16(offset, sample, Endian.little);
      offset += 2;
    }

    return buffer.buffer.asUint8List();
  }

  Future<void> _playShutterSound() async {
    try {
      // Önce sistem sesini çal (daha güvenilir)
      try {
        SystemSound.play(SystemSoundType.click);
      } catch (e) {
        debugPrint('Sistem sesi çalınamadı: $e');
      }
      
      // Asset'ten success sesini çal
      try {
        final player = _shutterPlayer;
        if (player != null) {
          await player.stop();
          await player.play(AssetSource('sounds/success.mp3'));
        }
      } catch (error) {
        debugPrint('Success sesi çalınamadı: $error');
        // Fallback: Özel ton sesini çal
        if (_audioReady) {
          final tone = _shutterTone;
          final player = _shutterPlayer;
          if (tone != null && player != null) {
            unawaited(
              () async {
                try {
                  await player.stop();
                } catch (e) {
                  // Stop hatası önemli değil - sessizce geç
                }
                
                try {
                  await player.play(BytesSource(tone));
                } catch (error) {
                  debugPrint('Shutter sesi çalınamadı: $error');
                }
              }().catchError((error, stackTrace) {
                debugPrint('Shutter sesi unawaited exception: $error');
                debugPrint('Stack trace: $stackTrace');
              }),
            );
          }
        }
      }
    } catch (error, stackTrace) {
      // Tüm exception'ları yakala ve logla - fırlatma
      debugPrint('Shutter sesi genel hatası: $error');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  /// Geri sayım yap (3-2-1) ve her sayı için bip sesi çal
  Future<void> _countdownBeforeCapture() async {
    for (int i = 3; i >= 1; i--) {
      if (!mounted) return;
      
      // Beep sesi kaldırıldı - sadece haptic feedback kullanılıyor
      try {
        HapticFeedback.lightImpact();
      } catch (e) {
        debugPrint('Haptic feedback hatası: $e');
      }
      
      // 1 saniye bekle (son sayı hariç)
      if (i > 1) {
        await Future.delayed(const Duration(milliseconds: 800));
      } else {
        // Son sayıda biraz daha kısa bekle
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
  }

  Future<void> _waitForCameraAvailability() async {
    while (_cameraControllerBusy) {
      await Future.delayed(const Duration(milliseconds: 60));
    }
  }

  Future<void> _setActiveCamera(CameraLensDirection direction) async {
    await _waitForCameraAvailability();

    _cameraControllerBusy = true;

    final current = _controller;
    if (current != null &&
        current.value.isInitialized &&
        current.description.lensDirection == direction) {
      try {
      await _updateImageStreamForStage();
      } finally {
        _cameraControllerBusy = false;
      }
      return;
    }

    final selected = _cameras.where((element) => element.lensDirection == direction).toList();
    if (selected.isEmpty) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          _error = l10n.cameraNotFoundWithType(direction == CameraLensDirection.front ? l10n.frontCamera : l10n.backCamera);
        });
      }
      _cameraControllerBusy = false;
      return;
    }

    setState(() {
      _initializingCamera = true;
    });

    final oldController = _controller;
    CameraController? newController;

    try {
      newController = CameraController(
      selected.first,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

      await newController.initialize();
      await newController.lockCaptureOrientation(DeviceOrientation.portraitUp);
    if (oldController != null) {
      if (oldController.value.isInitialized && oldController.value.isStreamingImages) {
        await oldController.stopImageStream();
      }
      await oldController.dispose();
    }
    if (!mounted) {
        await newController.dispose();
        newController = null;
      return;
    }

    setState(() {
        _controller = newController;
      _initializingCamera = false;
    });
    
    await _updateImageStreamForStage();
      newController = null;
    } catch (error) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          _error = l10n.cameraRefreshError(error.toString());
        });
      }
    } finally {
      _cameraControllerBusy = false;
      if (newController != null) {
        await newController.dispose();
      }
      if (mounted && _initializingCamera) {
        setState(() {
          _initializingCamera = false;
        });
      }
    }
  }

  Future<void> _prepareStage(
    CaptureStage stage, {
    bool showWarmup = true,
  }) async {
    setState(() {
      _currentStage = stage;
      _alignmentStart = null;
      _lastReminder = null;
      _latestFace = null;
      _lastFaceTimestamp = null;
      _capturePending = false;
      _alignedFaceSnapshot = null;
      _alignedReadingSnapshot = null;
      _panoramaMode = stage == CaptureStage.vertex;
      _panoramaFaceLocked = false;
      _panoramaBaseYaw = null;
      _panoramaVertexCaptured = false;
      _panoramaDonorCaptured = false;
      _panoramaVertexCapturedAt = null;
      // Update example photo carousel to show current stage
      _currentExampleIndex = stage.index;
    });
    
    // Animate carousel to current stage
    if (_examplePhotoController.hasClients) {
      _examplePhotoController.animateToPage(
        stage.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    await _setActiveCamera(_lensForStage(stage));

    if (!mounted) return;

    // Önce örnek fotoğrafı tam ekran göster
    if (showWarmup) {
      setState(() {
        _showExamplePhotoFullScreen = true;
      });
      // Kullanıcı "İleri" butonuna basana kadar bekle
      return;
    }
  }

  Future<void> _startImageStream() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized || controller.value.isStreamingImages) {
      return;
    }
    try {
      await controller.startImageStream(_processCameraImage);
    } catch (error) {
      debugPrint('Image stream başlatılamadı: $error');
    }
  }

  Future<void> _stopImageStream() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized || !controller.value.isStreamingImages) {
      return;
    }
    try {
      await controller.stopImageStream();
    } catch (error) {
      debugPrint('Image stream durdurulamadı: $error');
    }
  }

  Future<void> _updateImageStreamForStage() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    
    // Örnek fotoğraf gösteriliyorsa image stream'i başlatma
    if (_showExamplePhotoFullScreen) {
      return;
    }
    
    final needsStream = _stageUsesFaceDetection(_currentStage);
    if (needsStream) {
      await _startImageStream();
    } else {
      await _stopImageStream();
      if (_latestFace != null) {
        setState(() {
          _latestFace = null;
        });
      }
    }
  }

  Future<void> _processCameraImage(CameraImage image) async {
    final controller = _controller;
    final detector = _faceDetector;
    if (controller == null || detector == null || !mounted) {
      return;
    }

    if (!_stageUsesFaceDetection(_currentStage)) {
      if (_latestFace != null) {
        setState(() {
          _latestFace = null;
        });
      }
      return;
    }

    if (_processingImageFrame) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastFrameProcessedMs < 250) {
      return;
    }
    _processingImageFrame = true;
    _lastFrameProcessedMs = now;

    try {
      final inputImage = _buildInputImage(image, controller.description);
      if (inputImage == null) {
        return;
      }
      final faces = await detector.processImage(inputImage);
      if (faces.isEmpty) {
        if (_latestFace != null) {
          setState(() {
            _latestFace = null;
          });
        }
        _evaluateAlignment();
        return;
      }
      final primaryFace = faces.first;
      setState(() {
        _latestFace = primaryFace;
        _lastFaceTimestamp = DateTime.now();
      });
      _evaluateAlignment(face: primaryFace);
    } catch (error) {
      debugPrint('Yüz algılama hatası: $error');
    } finally {
      _processingImageFrame = false;
    }
  }

  InputImage? _buildInputImage(CameraImage image, CameraDescription description) {
    final rotation = InputImageRotationValue.fromRawValue(description.sensorOrientation);
    if (rotation == null) {
      return null;
    }
    final bytes = _convertYUV420ToNV21(image);
    if (bytes == null) {
      return null;
    }

    final metadata = InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: rotation,
      format: InputImageFormat.nv21,
      bytesPerRow: image.width,
    );
    return InputImage.fromBytes(bytes: bytes, metadata: metadata);
  }

  Uint8List? _convertYUV420ToNV21(CameraImage image) {
    if (image.planes.length < 3) {
      return null;
    }

    final int width = image.width;
    final int height = image.height;
    final int yRowStride = image.planes[0].bytesPerRow;
    final int uvRowStride = image.planes[1].bytesPerRow;
    final int uvPixelStride = image.planes[1].bytesPerPixel ?? 1;

    final Uint8List yBytes = image.planes[0].bytes;
    final Uint8List uBytes = image.planes[1].bytes;
    final Uint8List vBytes = image.planes[2].bytes;

    final int ySize = width * height;
    final int uvSize = width * height ~/ 2;
    final Uint8List nv21 = Uint8List(ySize + uvSize);

    int index = 0;
    for (int row = 0; row < height; row++) {
      final int rowStart = row * yRowStride;
      nv21.setRange(index, index + width, yBytes, rowStart);
      index += width;
    }

    final int chromaHeight = height ~/ 2;
    final int chromaWidth = width ~/ 2;
    for (int row = 0; row < chromaHeight; row++) {
      for (int col = 0; col < chromaWidth; col++) {
        final int uvIndex = row * uvRowStride + col * uvPixelStride;
        final int vValue = vBytes[uvIndex];
        final int uValue = uBytes[uvIndex];
        nv21[index++] = vValue;
        nv21[index++] = uValue;
      }
    }

    return nv21;
  }

  bool _stageUsesFaceDetection(CaptureStage stage) {
    // Artık hepsi ön kamera, ancak tepe ve arka açılar sensör bazlı
    return stage == CaptureStage.front ||
        stage == CaptureStage.right45 ||
        stage == CaptureStage.left45 ||
        stage == CaptureStage.vertex;
  }

  CameraLensDirection _lensForStage(CaptureStage stage) {
    // Tüm aşamalar için ön kamera
    return CameraLensDirection.front;
  }

  void _logPanorama(String message) {
    if (!kDebugMode) return;
    final now = DateTime.now();
    if (_lastPanoramaLog != null &&
        now.difference(_lastPanoramaLog!) < const Duration(milliseconds: 300)) {
      return;
    }
    _lastPanoramaLog = now;
    debugPrint('[Panorama] $message');
  }

  void _evaluateAlignment({Face? face}) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (controller.value.previewSize == null) {
      return;
    }
    
    if (_initializingCamera) {
      return;
    }
    
    // Örnek fotoğraf gösteriliyorsa alignment kontrolünü yapma
    if (_showExamplePhotoFullScreen) {
      return;
    }

    final bool isPanoramaTurning = _panoramaMode && _panoramaFaceLocked;
    final usesFace =
        _stageUsesFaceDetection(_currentStage) && !isPanoramaTurning;

    Face? activeFace = face ?? _latestFace;
    if (activeFace != null && _lastFaceTimestamp != null) {
      if (DateTime.now().difference(_lastFaceTimestamp!) > const Duration(milliseconds: 600)) {
        activeFace = null;
      }
    }
    final reading = _lastReading;

    if (_panoramaMode) {
      _evaluatePanoramaAlignment(face: activeFace, reading: reading);
      setState(() {});
      return;
    }

    if (usesFace && activeFace == null) {
      _alignmentStart = null;
      _progressController.reset();
      _maybeBeep(proximity: 0, within: false);
      setState(() {});
      return;
    }

    // 5. açı için reading null olsa bile tolerance kontrolü yapılmalı
    if (!usesFace && reading == null && _currentStage != CaptureStage.donor) {
      _alignmentStart = null;
      _progressController.reset();
      _maybeBeep(proximity: 0, within: false);
      return;
    }

    final within = _withinTolerance(
      _currentStage,
      face: activeFace,
      reading: reading,
    );

    final proximity = _proximityToTarget(
      _currentStage,
      face: activeFace,
      reading: reading,
    );
    _maybeBeep(proximity: proximity, within: within);

    if (_capturePending || _isProcessingPicture) {
      return;
    }
    
    // İlk fotoğraf review ekranı kaldırıldı - bu kontrol artık gerekli değil
    // if (_showFirstPhotoReview) {
    //   return;
    // }
    
    // Eğer yeni stage'e geçildiyse ve bekleme süresi dolmadıysa, alignment kontrolünü atla
    if (_nextStageDelayStart != null) {
      final delayElapsed = DateTime.now().difference(_nextStageDelayStart!);
      if (delayElapsed < const Duration(seconds: 1)) {
        return;
      }
    }

    if (within) {
      _alignmentStart ??= DateTime.now();
      final held = DateTime.now().difference(_alignmentStart!);
      final progress = held.inMilliseconds / 600.0;
      _progressController.animateTo(progress.clamp(0.0, 1.0));
      
      // 4. ve 5. açı için daha hızlı çekim (400ms), diğerleri için 600ms
      final requiredDuration = _holdDurationForStage(_currentStage);
      
      if (held >= requiredDuration) {
        _alignedFaceSnapshot = activeFace;
        _alignedReadingSnapshot = reading;
        _capturePending = true;
        SystemSound.play(SystemSoundType.click);
        HapticFeedback.mediumImpact();
        // Alignment ile otomatik çekim yaparken geri sayımı atla
        unawaited(_capturePhoto(skipCountdown: true));
      }
    } else {
      _alignmentStart = null;
      _alignedFaceSnapshot = null;
      _alignedReadingSnapshot = null;
      _progressController.reset();
      // kısa bir yardımcı ipucu tetikle
      if (_lastReminder == null ||
          DateTime.now().difference(_lastReminder!) > const Duration(seconds: 3)) {
        setState(() {
          _lastReminder = DateTime.now();
        });
        return;
      }
    }
    setState(() {});
  }

  // 0 (uzak) .. 1 (tam hedef) arası yakınlık
  double _proximityToTarget(
    CaptureStage stage, {
    Face? face,
    OrientationReading? reading,
  }) {
    switch (stage) {
      case CaptureStage.front:
        if (face == null) return 0;
        final yaw = (face.headEulerAngleY ?? 999).abs();
        final pitch = (face.headEulerAngleX ?? 999).abs();
        final roll = (face.headEulerAngleZ ?? 999).abs();
        final maxErr = max(yaw, max(pitch, roll));
        // 0 at 30°, 1 at 0°
        return (1.0 - (maxErr / 30.0)).clamp(0.0, 1.0);
      case CaptureStage.right45:
      case CaptureStage.left45:
        if (face == null) return 0;
        final baseline = _baselineFaceYaw ?? (face.headEulerAngleY ?? 0);
        final yaw = face.headEulerAngleY ?? baseline;
        final diff = _signedAngleDiff(yaw, baseline);
        // hedef: ±50° civarı, kabul: 20..80°
        final target = stage == CaptureStage.right45 ? -50.0 : 50.0;
        final err = (diff - target).abs();
        // 0 at 60°, 1 at 0°
        return (1.0 - (err / 60.0)).clamp(0.0, 1.0);
      case CaptureStage.vertex:
        if (reading == null) return 0;
        final flat = (reading.gravityZ.abs() - 1.0).abs(); // 0 en iyi
        final pitch = reading.pitch.abs();
        final roll = reading.roll.abs();
        final err = max(flat * 90, max(pitch, roll));
        return (1.0 - (err / 45.0)).clamp(0.0, 1.0);
      case CaptureStage.donor:
        if (reading == null) return 0;
        final pitch = reading.pitch.abs();
        final roll = reading.roll.abs();
        double yawErr = 0;
        if (_baselineYaw != null) {
          yawErr = _diffAngle(reading.yaw, _baselineYaw! + 180);
        }
        final err = max(max(pitch, roll), yawErr);
        return (1.0 - (err / 60.0)).clamp(0.0, 1.0);
    }
  }

  void _maybeBeep({required double proximity, required bool within}) {
    // Yakınlaştıkça daha sık haptic feedback; tam olduğunda kes
    // Beep sesi kaldırıldı - sadece haptic feedback kullanılıyor
    if (within) {
      _lastBeepAt = DateTime.now();
      return;
    }

    // Interval: uzak 800ms, yakın 120ms
    final minMs = 120;
    final maxMs = 800;
    final intervalMs = (maxMs - (proximity * (maxMs - minMs))).clamp(minMs, maxMs);
    final now = DateTime.now();
    if (_lastBeepAt == null ||
        now.difference(_lastBeepAt!) > Duration(milliseconds: intervalMs.round())) {
      _lastBeepAt = now;
      // Sadece haptic feedback kullanılıyor
      try {
        HapticFeedback.lightImpact();
      } catch (e) {
        debugPrint('Haptic feedback hatası: $e');
      }
    }
  }

  Duration _holdDurationForStage(CaptureStage stage) {
    switch (stage) {
      case CaptureStage.vertex:
      case CaptureStage.donor:
        return const Duration(milliseconds: 250);
      default:
        return const Duration(milliseconds: 350);
    }
  }

  static const double _panoramaVertexYawTolerance = 60;
  static const double _panoramaDonorRotationTrigger = 120;
  static const double _panoramaForceRotationTrigger = 200;
  static const Duration _panoramaForceTimeout = Duration(seconds: 4);
  static const double _panoramaDonorAbsoluteTolerance = 60;

  void _evaluatePanoramaAlignment({
    Face? face,
    OrientationReading? reading,
  }) {
    if (!_panoramaMode) {
      return;
    }

    if (!_panoramaFaceLocked) {
      if (face == null) {
        _alignmentStart = null;
        _logPanorama('Face lost before lock');
        return;
      }

      final yaw = face.headEulerAngleY;
      final pitch = face.headEulerAngleX;
      final roll = face.headEulerAngleZ;

      if (yaw == null || pitch == null || roll == null) {
        _alignmentStart = null;
        _logPanorama('Face angles null');
        return;
      }

      final withinFront = yaw.abs() < 12 && pitch.abs() < 12 && roll.abs() < 12;

      if (withinFront) {
        _alignmentStart ??= DateTime.now();
        final held = DateTime.now().difference(_alignmentStart!);
        if (held >= const Duration(milliseconds: 600)) {
          _panoramaFaceLocked = true;
          _panoramaBaseYaw = reading?.yaw ?? _lastReading?.yaw ?? 0;
          _panoramaVertexCaptured = false;
          _panoramaDonorCaptured = false;
          _alignmentStart = null;
          _logPanorama('Face lock acquired baseYaw=${_panoramaBaseYaw?.toStringAsFixed(1)}');
        }
      } else {
        _alignmentStart = null;
      }
      return;
    }

    final activeReading = reading ?? _lastReading;
    if (activeReading == null) {
      return;
    }

    _panoramaBaseYaw ??= activeReading.yaw;
    final baseYaw = _panoramaBaseYaw!;
    final rotationFromStart = _diffAngle(activeReading.yaw, baseYaw);

    _logPanorama(
      'rot=${rotationFromStart.toStringAsFixed(1)} yaw=${activeReading.yaw.toStringAsFixed(1)} pitch=${activeReading.pitch.toStringAsFixed(1)} roll=${activeReading.roll.toStringAsFixed(1)} vertex=$_panoramaVertexCaptured donor=$_panoramaDonorCaptured',
    );

    if (!_panoramaVertexCaptured) {
      final isFlat = activeReading.gravityZ.abs() > 0.78;
      final pitchOk = activeReading.pitch.abs() < 24;
      final rollOk = activeReading.roll.abs() < 24;

      if (isFlat &&
          pitchOk &&
          rollOk &&
          rotationFromStart <= _panoramaVertexYawTolerance &&
          !_capturePending &&
          !_isProcessingPicture) {
        _panoramaVertexCaptured = true;
        _panoramaVertexCapturedAt = DateTime.now();
        if (mounted) {
          setState(() {
            _currentStage = CaptureStage.donor;
          });
        }
        _capturePending = true;
        _logPanorama('Trigger vertex capture rot=${rotationFromStart.toStringAsFixed(1)} pitch=${activeReading.pitch.toStringAsFixed(1)} roll=${activeReading.roll.toStringAsFixed(1)}');
        unawaited(() async {
          await _capturePhoto(
            stageOverride: CaptureStage.vertex,
            readingSnapshotOverride: activeReading,
            faceSnapshotOverride: face,
            resumeImageStream: true,
            autoAdvanceStage: false,
            skipCountdown: true,
          );
          if (!mounted) return;
          setState(() {});
        }());
      }
      return;
    }

    if (_panoramaDonorCaptured || _capturePending || _isProcessingPicture) {
      return;
    }

    final pitchOk = activeReading.pitch.abs() < 25;
    final rollOk = activeReading.roll.abs() < 25;
    final baselineYaw = _baselineYaw;
    final bool matchesAbsolute = baselineYaw != null &&
        _diffAngle(activeReading.yaw, baselineYaw + 180) <=
            _panoramaDonorAbsoluteTolerance;
    final bool matchesRotation =
        rotationFromStart >= _panoramaDonorRotationTrigger;
    final bool forcedRotation =
        rotationFromStart >= _panoramaForceRotationTrigger;
    final bool timedOut = _panoramaVertexCapturedAt != null &&
        DateTime.now().difference(_panoramaVertexCapturedAt!) >=
            _panoramaForceTimeout;

    if ((matchesRotation || matchesAbsolute || forcedRotation || timedOut) &&
        pitchOk &&
        rollOk) {
      _panoramaDonorCaptured = true;
      _capturePending = true;
      _logPanorama(
        'Trigger donor capture rot=${rotationFromStart.toStringAsFixed(1)} matchesRot=$matchesRotation matchesAbs=$matchesAbsolute forced=$forcedRotation timeout=$timedOut pitch=${activeReading.pitch.toStringAsFixed(1)} roll=${activeReading.roll.toStringAsFixed(1)} baseline=${_baselineYaw?.toStringAsFixed(1)}',
      );
      unawaited(() async {
        await _capturePhoto(
          stageOverride: CaptureStage.donor,
          readingSnapshotOverride: activeReading,
          resumeImageStream: true,
          autoAdvanceStage: false,
          skipCountdown: true,
        );
        if (!mounted) return;
        await _completePanoramaSequence();
      }());
    }
  }

  Future<void> _completePanoramaSequence() async {
    if (!mounted) return;
    // SingleStage mode'da sadece 4. açı çekildi, geri dön
    if (_singleStageMode) {
      if (!mounted) return;
      Navigator.of(context).pop(List<CapturedPhoto>.from(_captures));
      return;
    }

    setState(() {
      _panoramaMode = false;
      _panoramaBaseYaw = null;
      _currentStage = CaptureStage.donor;
    });

    await _moveToNextStage();
  }

  bool _withinTolerance(
    CaptureStage stage, {
    Face? face,
    OrientationReading? reading,
  }) {
    switch (stage) {
      case CaptureStage.front:
        if (face == null) return false;
        final yaw = face.headEulerAngleY;
        final pitch = face.headEulerAngleX;
        final roll = face.headEulerAngleZ;
        if (yaw == null || pitch == null || roll == null) return false;
        return yaw.abs() < 12 && pitch.abs() < 12 && roll.abs() < 12;
      case CaptureStage.right45:
        if (face == null) return false;
        final yaw = face.headEulerAngleY;
        final pitch = face.headEulerAngleX;
        final roll = face.headEulerAngleZ;
        if (yaw == null || pitch == null || roll == null) return false;
        final baseline = _baselineFaceYaw ?? 0;
        final diff = _signedAngleDiff(yaw, baseline);
        return diff < -20 && diff > -80 && pitch.abs() < 18 && roll.abs() < 18;
      case CaptureStage.left45:
        if (face == null) return false;
        final yaw = face.headEulerAngleY;
        final pitch = face.headEulerAngleX;
        final roll = face.headEulerAngleZ;
        if (yaw == null || pitch == null || roll == null) return false;
        final baseline = _baselineFaceYaw ?? 0;
        final diff = _signedAngleDiff(yaw, baseline);
        return diff > 20 && diff < 80 && pitch.abs() < 18 && roll.abs() < 18;
      case CaptureStage.vertex:
        if (reading == null) return false;
        final isFlat = reading.gravityZ.abs() > 0.85;
        final pitchOk = reading.pitch.abs() < 15;
        final rollOk = reading.roll.abs() < 15;
        return isFlat && pitchOk && rollOk;
      case CaptureStage.donor:
        // 5. açı için reading null olsa bile çekim yapılabilir
        if (reading == null) {
          // Reading null ise, çekim yapılabilir (manuel çekim için)
          return true;
        }
        final baseline = _baselineYaw;
        // Eğer baseline yoksa, 1. açıdan almış olmalıyız - yoksa herhangi bir yaw kabul et
        if (baseline == null) {
          // Telefon arkaya uzanmış, pitch düz, roll düz (toleransları artırdık)
          return reading.pitch.abs() < 30 && reading.roll.abs() < 30;
        }
        // Baseline varsa, tam ters yönde olmalı (toleransları artırdık)
        return reading.pitch.abs() < 30 &&
            reading.roll.abs() < 30 &&
            _diffAngle(reading.yaw, baseline + 180) < 45;
    }
  }

  double _diffAngle(double value, double target) {
    double diff = value - target;
    while (diff > 180) {
      diff -= 360;
    }
    while (diff < -180) {
      diff += 360;
    }
    return diff.abs();
  }

  double _signedAngleDiff(double value, double target) {
    double diff = value - target;
    while (diff > 180) {
      diff -= 360;
    }
    while (diff < -180) {
      diff += 360;
    }
    return diff;
  }

  Future<void> _capturePhoto({
    XFile? providedCapture,
    OrientationReading? readingSnapshotOverride,
    Face? faceSnapshotOverride,
    bool resumeImageStream = false,
    CaptureStage? stageOverride,
    bool autoAdvanceStage = true,
    bool skipCountdown = false,
  }) async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      _capturePending = false;
      return;
    }

    _alignmentStart = null;
    // İlk fotoğraf review kontrolü kaldırıldı
    // bool isFirstPhotoReview = false;

    // Geri sayım yap (eğer skip edilmediyse ve otomatik çekim değilse)
    if (!skipCountdown && providedCapture == null) {
      await _countdownBeforeCapture();
      if (!mounted) {
        _capturePending = false;
        return;
      }
    }

    setState(() {
      _isProcessingPicture = true;
    });

    final stage = stageOverride ?? _currentStage;
    final faceSnapshot = faceSnapshotOverride ?? _alignedFaceSnapshot;
    final readingSnapshot =
        readingSnapshotOverride ?? _alignedReadingSnapshot ?? _lastReading;

    final bool shouldStopStream =
        providedCapture == null && controller.value.isStreamingImages;

    if (shouldStopStream) {
      try {
        await controller.stopImageStream();
      } catch (error) {
        debugPrint('Image stream durdurulamadı: $error');
      }
    }

    try {
      final xFile = providedCapture ?? await controller.takePicture();
      final directory = await getApplicationDocumentsDirectory();
      final fileName =
          'capture_${stage.name}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedPath = p.join(directory.path, fileName);

      // 5. açı (donor) fotoğrafını 180 derece çevir
      if (stage == CaptureStage.donor) {
        final imageBytes = await xFile.readAsBytes();
        final image = img.decodeImage(imageBytes);
        if (image != null) {
          final rotated = img.copyRotate(image, angle: 180);
          final rotatedBytes = img.encodeJpg(rotated);
          await File(savedPath).writeAsBytes(rotatedBytes);
        } else {
      await xFile.saveTo(savedPath);
        }
      } else {
        await xFile.saveTo(savedPath);
      }

      if (stage == CaptureStage.front) {
        final faceYaw = faceSnapshot?.headEulerAngleY;
        _baselineFaceYaw = faceYaw ?? 0;
        // Sensör okumalarını da kaydet (5. açı için baseline gerekli)
        final currentReading = readingSnapshot ?? _lastReading;
        if (currentReading != null) {
          _baselineYaw = currentReading.yaw;
        } else {
          _baselineYaw = 0; // Fallback
        }
      }

      // Fotoğraf çekildi - ses ve haptic feedback
      try {
        await _playShutterSound();
      } catch (e) {
        debugPrint('Shutter sesi exception: $e');
      }
      try {
      HapticFeedback.heavyImpact();
      } catch (e) {
        debugPrint('Haptic feedback hatası: $e');
      }

      setState(() {
        final capture = CapturedPhoto(
          stage: stage,
            file: File(savedPath),
          faceYaw: faceSnapshot?.headEulerAngleY,
          facePitch: faceSnapshot?.headEulerAngleX,
          faceRoll: faceSnapshot?.headEulerAngleZ,
          orientation: readingSnapshot,
        );

        final existingIndex = _captures.indexWhere(
          (item) => item.stage == stage,
        );

        if (existingIndex == -1) {
          _captures.add(capture);
        } else {
          _captures[existingIndex] = capture;
        }

        _captures.sort((a, b) => a.stage.index.compareTo(b.stage.index));
      });

      // İlk fotoğraf review ekranı kaldırıldı - direkt 2. fotoğrafa geçiliyor
      // if (stage == CaptureStage.front && !_singleStageMode) {
      //   setState(() {
      //     _showFirstPhotoReview = true;
      //     _capturePending = false;
      //     _alignmentStart = null;
      //   });
      //   isFirstPhotoReview = true;
      // }

      if (autoAdvanceStage && stage == _currentStage) {
      await _moveToNextStage();
      }

      if (_panoramaMode &&
          stage == CaptureStage.vertex &&
          mounted &&
          !_singleStageMode) {
        setState(() {
          _currentStage = CaptureStage.donor;
        });
      }
    } on CameraException catch (error) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          _error = l10n.photoCaptureError(error.description ?? error.code);
        });
      }
    } finally {
      // Her durumda _capturePending'i false yap
      _capturePending = false;
      
      if (mounted) {
        setState(() {
          _isProcessingPicture = false;
        });
      }

      // İlk fotoğraf review ekranı kaldırıldı - image stream her zaman başlatılıyor
      final needsResumeStream =
          shouldStopStream || (providedCapture != null && resumeImageStream);

      if (needsResumeStream &&
          identical(controller, _controller) &&
          controller.value.isInitialized) {
        await _updateImageStreamForStage();
      }
    }
  }

  Future<void> _moveToNextStage() async {
      // TTS'i durdur - bir sonraki fotoğrafa geçerken sesli anlatımı kes
      try {
        await _tts?.stop();
        _lastSpoken = null;
        _lastTtsAt = null;
        _isTtsSpeaking = false;
        _pendingTtsText = null;
      } catch (e) {
        debugPrint('TTS stop error: $e');
        _isTtsSpeaking = false;
        _pendingTtsText = null;
      }
    
    setState(() {
      _alignmentStart = null;
      _lastReminder = null;
      _latestFace = null;
      _lastFaceTimestamp = null;
      _capturePending = false;
      _alignedFaceSnapshot = null;
      _alignedReadingSnapshot = null;
    });

    _progressController.reset();

    if (_singleStageMode) {
      if (!mounted) return;
      Navigator.of(context).pop(List<CapturedPhoto>.from(_captures));
      return;
    }

    if (_currentStage == CaptureStage.donor) {
      if (!mounted) {
        return;
      }
      // Fotoğraf analizi chatbot sayfasına yönlendir (otomatik AI analizi yapacak)
      final result = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (_) => PhotoAnalysisChatScreen(initialPhotos: List.of(_captures)),
        ),
      );

      if (!mounted) return;

      // Eğer analiz başarılıysa fotoğrafları geri döndür
      if (result == true) {
        Navigator.of(context).pop(List<CapturedPhoto>.from(_captures));
      } else {
        // Kullanıcı geri döndüyse veya iptal ettiyse
        await _prepareStage(CaptureStage.donor, showWarmup: false);
      }
      return;
    }

    final nextStage = CaptureStage.values[_currentStage.index + 1];
    
    // Sonraki stage'e geçerken en az 1 saniye bekle (alignment kontrolünü geçici olarak devre dışı bırak)
    setState(() {
      _nextStageDelayStart = DateTime.now();
      _initializingCamera = true;
    });
    
    // En az 1 saniye bekle
    await Future.delayed(const Duration(seconds: 1));
    
    if (!mounted) return;
    
    // Her stage'de örnek fotoğraf göster
    await _prepareStage(nextStage, showWarmup: true);
    
    // Bekleme süresini sıfırla
    if (mounted) {
      setState(() {
        _nextStageDelayStart = null;
      });
    }
  }

  Color _statusColor(bool ok) => ok ? const Color(0xFF2ECC71) : const Color(0xFFFF6B6B);

  Widget _buildStatusCard(AppLocalizations l10n) {
    final bool isPanoramaTurning =
        _currentStage == CaptureStage.vertex && _panoramaFaceLocked;
    final usesFace =
        _stageUsesFaceDetection(_currentStage) && !isPanoramaTurning;

    Face? faceForDisplay = _latestFace;
    if (usesFace && _lastFaceTimestamp != null && faceForDisplay != null) {
      if (DateTime.now().difference(_lastFaceTimestamp!) > const Duration(milliseconds: 600)) {
        faceForDisplay = null;
      }
    }

    final reading = _lastReading;

    double pitchValue = 0;
    double rollValue = 0;
    double yawValue = 0;
    double gravityZValue = 0;
    bool hasValidData = false;

    bool pitchOk = false;
    bool rollOk = false;
    bool yawOk = false;

    if (usesFace) {
      final facePitch = faceForDisplay?.headEulerAngleX;
      final faceRoll = faceForDisplay?.headEulerAngleZ;
      final faceYaw = faceForDisplay?.headEulerAngleY;
      hasValidData = facePitch != null && faceRoll != null && faceYaw != null;
      pitchValue = facePitch ?? 0;
      rollValue = faceRoll ?? 0;
      yawValue = faceYaw ?? 0;
      if (hasValidData) {
        switch (_currentStage) {
          case CaptureStage.front:
            pitchOk = facePitch.abs() < 12;
            rollOk = faceRoll.abs() < 12;
            yawOk = faceYaw.abs() < 12;
            break;
          case CaptureStage.right45:
            pitchOk = facePitch.abs() < 18;
            rollOk = faceRoll.abs() < 18;
            final baseline = _baselineFaceYaw ?? faceYaw;
            final diff = _signedAngleDiff(faceYaw, baseline);
            yawValue = diff;
            yawOk = diff < -20 && diff > -80;
            break;
          case CaptureStage.left45:
            pitchOk = facePitch.abs() < 18;
            rollOk = faceRoll.abs() < 18;
            final baseline = _baselineFaceYaw ?? faceYaw;
            final diff = _signedAngleDiff(faceYaw, baseline);
            yawValue = diff;
            yawOk = diff > 20 && diff < 80;
            break;
          case CaptureStage.vertex:
          case CaptureStage.donor:
            break;
        }
      }
    } else {
      pitchValue = reading?.pitch ?? 0;
      rollValue = reading?.roll ?? 0;
      yawValue = reading?.yaw ?? 0;
      gravityZValue = reading?.gravityZ ?? 0;
      hasValidData = reading != null;
      if (hasValidData) {
        switch (_currentStage) {
          case CaptureStage.vertex:
            final isFlat = gravityZValue.abs() > 0.85;
            pitchOk = pitchValue.abs() < 15;
            rollOk = rollValue.abs() < 15;
            yawOk = isFlat;
            break;
          case CaptureStage.donor:
            pitchOk = pitchValue.abs() < 25;
            rollOk = rollValue.abs() < 25;
            if (_baselineYaw != null) {
              yawOk = _diffAngle(yawValue, _baselineYaw! + 180) < 35;
            } else {
              yawOk = true;
            }
            break;
          case CaptureStage.front:
          case CaptureStage.right45:
          case CaptureStage.left45:
            break;
        }
      }
    }

    final within = _withinTolerance(
      _currentStage,
      face: usesFace ? faceForDisplay : null,
      reading: reading,
    );
    final timeHeld =
        _alignmentStart == null ? 0 : DateTime.now().difference(_alignmentStart!).inMilliseconds / 1000;
    final holdTargetSeconds =
        _holdDurationForStage(_currentStage).inMilliseconds / 1000.0;

    String helper;
    if (isPanoramaTurning) {
      final baseYaw = _panoramaBaseYaw;
      if (_panoramaDonorCaptured) {
        helper = l10n.panoramaComplete;
      } else if (!_panoramaVertexCaptured) {
        helper = l10n.panoramaVertexInstruction;
      } else if (reading == null || baseYaw == null) {
        helper = l10n.sensorDataWaiting;
      } else {
        final rotation =
            min<double>(180, _diffAngle(reading.yaw, baseYaw));
        final remaining = max(0.0, 180 - rotation);
        helper = rotation < _panoramaDonorRotationTrigger
            ? l10n.panoramaContinueToDonor(remaining.toStringAsFixed(0))
            : l10n.panoramaHoldSteady;
      }
    } else if (!hasValidData) {
      helper = usesFace
          ? l10n.captureFlowFaceDetection
          : _currentStage.baseInstruction(l10n);
    } else if (within) {
      helper = l10n.captureFlowPositionCorrect(
        max(0.0, (holdTargetSeconds - timeHeld)).toStringAsFixed(1),
      );
    } else if (_lastReminder != null &&
        DateTime.now().difference(_lastReminder!) < const Duration(milliseconds: 500)) {
      helper = _currentStage.reminder(l10n);
    } else {
      if (usesFace && faceForDisplay != null) {
        final faceYaw = faceForDisplay.headEulerAngleY ?? 0;
        final baseline = _baselineFaceYaw ?? faceYaw;
        final diff = _signedAngleDiff(faceYaw, baseline);
        if (_currentStage == CaptureStage.right45) {
          helper = diff > -10
              ? l10n.turnHeadRightInstruction
              : diff < -80
                  ? l10n.turnHeadLeftCorrection
                  : l10n.holdSteadyNearTarget;
        } else if (_currentStage == CaptureStage.left45) {
          helper = diff < 10
              ? l10n.turnHeadLeftInstruction
              : diff > 80
                  ? l10n.turnHeadRightCorrection
                  : l10n.holdSteadyNearTarget;
        } else {
          helper = _currentStage.baseInstruction(l10n);
        }
      } else if (!usesFace && reading != null) {
        // Sensör bazlı açılar için detaylı feedback
        if (_currentStage == CaptureStage.vertex) {
          final isFlat = gravityZValue.abs() > 0.85;
          if (!isFlat) {
            if (gravityZValue.abs() < 0.7) {
              helper = l10n.holdPhoneFlatInstruction;
            } else {
              helper = l10n.holdPhoneFlatter;
            }
          } else if (pitchValue.abs() > 15) {
            if (pitchValue > 15) {
              helper = l10n.dontTiltForward;
            } else {
              helper = l10n.dontTiltBackward;
            }
          } else if (rollValue.abs() > 15) {
            if (rollValue > 15) {
              helper = l10n.dontTiltRight;
            } else {
              helper = l10n.dontTiltLeft;
            }
          } else {
            helper = l10n.perfectHoldStill(max(0.0, (holdTargetSeconds - timeHeld)).toStringAsFixed(1));
          }
        } else if (_currentStage == CaptureStage.donor) {
          if (!hasValidData) {
            helper = l10n.donorInstruction;
          } else if (pitchValue.abs() > 30) {
            helper = l10n.dontTiltUpOrDown;
          } else if (rollValue.abs() > 30) {
            helper = l10n.dontTiltSideToSide;
          } else if (_baselineYaw != null && !yawOk) {
            helper = l10n.movePhoneBack;
          } else {
            helper = l10n.positionCorrectHoldStill(max(0.0, (holdTargetSeconds - timeHeld)).toStringAsFixed(1));
          }
        } else {
          helper = _currentStage.baseInstruction(l10n);
        }
      } else {
        helper = _currentStage.baseInstruction(l10n);
      }
    }

    // Speak short guidance when helper changes and not within
    _maybeSpeakHelper(helper: helper, within: within);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1C2A39).withOpacity(0.9),
                const Color(0xFF2C3E50).withOpacity(0.85),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: within ? const Color(0xFF2ECC71) : Colors.white.withOpacity(0.2),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: (within ? const Color(0xFF2ECC71) : Colors.black).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2ECC71).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getStageIcon(_currentStage),
                      color: const Color(0xFF2ECC71),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _currentStage.title(l10n),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${_currentStage.index + 1}/5 • ${_captures.length} ${l10n.captureFlowCaptured}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Progress bar
              if (within)
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _progressAnimation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
                            ),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2ECC71).withOpacity(0.5),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              
              const SizedBox(height: 16),
              
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      within ? Icons.check_circle : Icons.info_outline,
                      color: within ? const Color(0xFF2ECC71) : Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        helper,
                        style: TextStyle(
                          color: within ? const Color(0xFF2ECC71) : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Minimal 3-dot indicator (no labels)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _dotIndicator(hasValidData && pitchOk),
                  const SizedBox(width: 8),
                  _dotIndicator(hasValidData && rollOk),
                  const SizedBox(width: 8),
                  _dotIndicator(hasValidData && yawOk),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getStageIcon(CaptureStage stage) {
    switch (stage) {
      case CaptureStage.front:
        return Icons.face;
      case CaptureStage.right45:
        return Icons.arrow_forward;
      case CaptureStage.left45:
        return Icons.arrow_back;
      case CaptureStage.vertex:
        return Icons.arrow_upward;
      case CaptureStage.donor:
        return Icons.flip;
    }
  }

  Widget _statusChip(String label, double value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$label: ${value.toStringAsFixed(1)}°',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dotIndicator(bool ok) {
    final color = ok ? const Color(0xFF2ECC71) : Colors.white30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: ok
            ? [
                BoxShadow(
                  color: const Color(0xFF2ECC71).withOpacity(0.5),
                  blurRadius: 8,
                ),
              ]
            : [],
      ),
    );
  }

  void _maybeSpeakHelper({required String helper, required bool within}) {
    // Only speak when not within
    if (_tts == null || within) return;
    
    // Eğer tüm açılar tamamlandıysa (5 açı da çekildiyse), TTS'i durdur ve konuşma
    final allStagesCompleted = _captures.length >= 5;
    if (allStagesCompleted) {
      // TTS'i durdur
      _tts?.stop();
      _isTtsSpeaking = false;
      _pendingTtsText = null;
      _lastSpoken = null;
      return;
    }
    
    // build spoken text based on selected language
    final spoken = _buildSpokenHelper(helper: helper, within: within);
    // Keep text concise: strip timers in parentheses
    final cleaned = spoken.replaceAll(RegExp(r"\([^\)]*\)"), '').trim();
    
    // Eğer aynı metin tekrar ediliyorsa, konuşma
    if (_lastSpoken == helper) {
      return;
    }
    
    // Eğer TTS şu anda konuşuyorsa, yeni metni bekleyen metin olarak kaydet
    if (_isTtsSpeaking) {
      _pendingTtsText = cleaned;
      _lastSpoken = helper;
      debugPrint('TTS is speaking, queuing new text: $cleaned');
      return;
    }
    
    // Eğer son konuşma çok kısa bir süre önce başladıysa, bekle
    if (_lastTtsAt != null) {
      final now = DateTime.now();
      final timeSinceLastTts = now.difference(_lastTtsAt!);
      if (timeSinceLastTts < const Duration(milliseconds: 500)) {
        _pendingTtsText = cleaned;
        _lastSpoken = helper;
        debugPrint('TTS just finished, queuing new text: $cleaned');
        return;
      }
    }
    
    // Konuşmayı başlat
    _lastSpoken = helper;
    _speakTtsText(cleaned);
  }
  
  Future<void> _speakTtsText(String text) async {
    if (_tts == null || text.isEmpty) return;
    
    try {
      // Eğer hala konuşuyorsa, durdur
      if (_isTtsSpeaking) {
        await _tts?.stop();
        await Future.delayed(const Duration(milliseconds: 150));
      }
      
      // Yeni konuşmayı başlat
      await _tts?.speak(text);
      _lastTtsAt = DateTime.now();
      debugPrint('TTS speaking: $text');
    } catch (e) {
      debugPrint('TTS speak error: $e');
      _isTtsSpeaking = false;
    }
  }

  String _buildSpokenHelper({required String helper, required bool within}) {
    final l10n = AppLocalizations.of(context)!;
    if (_voiceLangCode == 'en-US') {
      // Provide brief English guidance irrespective of UI text
      if (within) return l10n.holdStill;
      switch (_currentStage) {
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
    // Turkish: reuse helper
    return helper;
  }

  Widget _buildPreview(AppLocalizations l10n) {
    final controller = _controller;
    if (_error != null) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B6B).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFFF6B6B)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Color(0xFFFF6B6B), size: 48),
              const SizedBox(height: 16),
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    if (_initializingCamera || controller == null || !controller.value.isInitialized) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2ECC71).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator(
                color: Color(0xFF2ECC71),
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.captureFlowInitializingCamera,
              style: TextStyle(color: AppTheme.getTextSecondaryColor(context), fontSize: 16),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        final previewSize = controller.value.previewSize;
        if (previewSize == null || previewSize.width == 0 || previewSize.height == 0) {
          return ColoredBox(color: Theme.of(context).colorScheme.shadow);
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: previewSize.height,
                height: previewSize.width,
                child: CameraPreview(controller),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildThumbnails(AppLocalizations l10n) {
    // Thumbnails kaldırıldı - kullanıcı isteği
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.shadow,
      body: SafeArea(
        child: Stack(
          children: [
            // Camera Preview
            Positioned.fill(
              child: _buildPreview(l10n),
            ),
            
            // Top Status Card
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: _buildStatusCard(l10n),
            ),
            // Language Selector (top-right corner)
            Positioned(
              top: 24,
              right: 28,
              child: _LanguageSelector(
                currentCode: _voiceLangCode,
                onChanged: _changeVoiceLang,
              ),
            ),
            
            // Example Photos Carousel (bottom-right) - sadece çekim sırasında göster
            if (!_showExamplePhotoFullScreen) _buildExamplePhotosCarousel(l10n),
            
            // Tam ekran örnek fotoğraf overlay
            if (_showExamplePhotoFullScreen) _buildFullScreenExamplePhoto(l10n),
            
            // İlk fotoğraf review overlay kaldırıldı
            // if (_showFirstPhotoReview) _buildFirstPhotoReview(l10n),
            
            // Bottom Controls - Thumbnails daha yukarı taşındı, butonlar için yer açıldı
            Positioned(
              bottom: 140,
              left: 20,
              right: 20,
              child: _buildThumbnails(l10n),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullScreenExamplePhoto(AppLocalizations l10n) {
    return Positioned.fill(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            // Örnek fotoğraf
            Positioned.fill(
              child: _buildFullScreenExamplePhotoCard(_currentStage, l10n),
            ),
            // Sağ altta navigasyon butonu
            Positioned(
              bottom: 40,
              right: 20,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _showExamplePhotoFullScreen = false;
                  });
                  // Çekime devam et
                  Future.delayed(const Duration(milliseconds: 300), () {
                    if (mounted) {
                      _continueAfterExamplePhoto();
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2ECC71),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                ),
                icon: const Icon(Icons.arrow_forward, size: 24),
                label: Text(
                  l10n.captureFlowStartCapture,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Sol üstte geri butonu (opsiyonel)
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> _continueAfterExamplePhoto() async {
    setState(() {
      _initializingCamera = true;
    });
    await Future.delayed(const Duration(milliseconds: 800));
    
    if (!mounted) return;
    
    setState(() {
      _initializingCamera = false;
    });
    
    // Image stream'i başlat (alignment kontrolü için)
    await _updateImageStreamForStage();
  }
  
  Widget _buildFullScreenExamplePhotoCard(CaptureStage stage, AppLocalizations l10n) {
    // Get title and instructions for this stage
    String title;
    String instructions;
    
    switch (stage) {
      case CaptureStage.front:
        title = l10n.examplePhotoFrontTitle;
        instructions = l10n.examplePhotoFrontInstructions;
        break;
      case CaptureStage.right45:
        title = l10n.examplePhotoRight45Title;
        instructions = l10n.examplePhotoRight45Instructions;
        break;
      case CaptureStage.left45:
        title = l10n.examplePhotoLeft45Title;
        instructions = l10n.examplePhotoLeft45Instructions;
        break;
      case CaptureStage.vertex:
        title = l10n.examplePhotoVertexTitle;
        instructions = l10n.examplePhotoVertexInstructions;
        break;
      case CaptureStage.donor:
        title = l10n.examplePhotoDonorTitle;
        instructions = l10n.examplePhotoDonorInstructions;
        break;
    }
    
    // Asset path for example photo
    String assetPath;
    switch (stage) {
      case CaptureStage.front:
        assetPath = 'assets/images/front.jpg';
        break;
      case CaptureStage.right45:
        assetPath = 'assets/images/right.jpg';
        break;
      case CaptureStage.left45:
        assetPath = 'assets/images/left.jpg';
        break;
      case CaptureStage.vertex:
        assetPath = 'assets/images/vertex.jpg';
        break;
      case CaptureStage.donor:
        assetPath = 'assets/images/back.jpg';
        break;
    }
    
    return Stack(
      children: [
        // Örnek fotoğraf - tam ekran
        Positioned.fill(
          child: Image.asset(
            assetPath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade900,
                child: Center(
                  child: Icon(
                    Icons.photo,
                    color: Colors.grey.shade400,
                    size: 80,
                  ),
                ),
              );
            },
          ),
        ),
        // Gradient overlay for text readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.7),
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),
        ),
        // Title and instructions - alt kısımda
        Positioned(
          bottom: 120,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF2ECC71).withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    instructions,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontSize: 16,
                      height: 1.6,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Açı göstergesi - üst kısımda
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF2ECC71),
                  width: 2,
                ),
              ),
              child: Text(
                '${stage.index + 1}/5 • ${stage.title(l10n)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFirstPhotoReview(AppLocalizations l10n) {
    // İlk fotoğrafı bul
    if (_captures.isEmpty) {
      return const SizedBox.shrink();
    }
    
    final firstPhoto = _captures.firstWhere(
      (photo) => photo.stage == CaptureStage.front,
      orElse: () => _captures.first,
    );
    
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.7),
        child: Stack(
          children: [
            // Fotoğraf önizlemesi - ortada
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF2ECC71),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2ECC71).withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.file(
                      firstPhoto.file,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade900,
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: 60,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            // Alt kısım - butonlar
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  // Sol: Oturumu Sonlandır
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.shadow.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Oturumu sonlandır - fotoğrafları geri döndür
                                Navigator.of(context).pop(List<CapturedPhoto>.from(_captures));
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.close,
                                      color: AppTheme.getTextSecondaryColor(context),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      l10n.captureFlowEndSession,
                                      style: TextStyle(
                                        color: AppTheme.getTextSecondaryColor(context),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Sağ: Devam Et
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2ECC71).withOpacity(0.5),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                // Devam et - review overlay'i kapat ve sonraki stage'e geç
                                setState(() {
                                  _showFirstPhotoReview = false;
                                });
                                // Sonraki stage'e geç
                                await _moveToNextStage();
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      l10n.continueButton,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Üst kısım - başlık
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.shadow.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF2ECC71).withOpacity(0.5),
                        ),
                      ),
                      child: Text(
                        l10n.firstPhotoCaptured,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamplePhotosCarousel(AppLocalizations l10n) {
    // Initialize carousel to current stage on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_examplePhotoController.hasClients && _currentExampleIndex != _currentStage.index) {
        _examplePhotoController.jumpToPage(_currentStage.index);
        _currentExampleIndex = _currentStage.index;
      }
    });
    
    return Positioned(
      bottom: 100,
      right: 20,
      child: GestureDetector(
        onTap: () {
          // Toggle visibility or show full screen
        },
        child: Container(
          width: 200,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: PageView.builder(
              controller: _examplePhotoController,
              itemCount: 5,
              onPageChanged: (index) {
                setState(() {
                  _currentExampleIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final stage = CaptureStage.values[index];
                return _buildExamplePhotoCard(stage, l10n);
              },
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildExamplePhotoCard(CaptureStage stage, AppLocalizations l10n) {
    // Get title and instructions for this stage
    String title;
    String instructions;
    
    switch (stage) {
      case CaptureStage.front:
        title = l10n.examplePhotoFrontTitle;
        instructions = l10n.examplePhotoFrontInstructions;
        break;
      case CaptureStage.right45:
        title = l10n.examplePhotoRight45Title;
        instructions = l10n.examplePhotoRight45Instructions;
        break;
      case CaptureStage.left45:
        title = l10n.examplePhotoLeft45Title;
        instructions = l10n.examplePhotoLeft45Instructions;
        break;
      case CaptureStage.vertex:
        title = l10n.examplePhotoVertexTitle;
        instructions = l10n.examplePhotoVertexInstructions;
        break;
      case CaptureStage.donor:
        title = l10n.examplePhotoDonorTitle;
        instructions = l10n.examplePhotoDonorInstructions;
        break;
    }
    
    // Asset path for example photo
    String assetPath;
    switch (stage) {
      case CaptureStage.front:
        assetPath = 'assets/images/front.jpg';
        break;
      case CaptureStage.right45:
        assetPath = 'assets/images/right.jpg';
        break;
      case CaptureStage.left45:
        assetPath = 'assets/images/left.jpg';
        break;
      case CaptureStage.vertex:
        assetPath = 'assets/images/vertex.jpg';
        break;
      case CaptureStage.donor:
        assetPath = 'assets/images/back.jpg';
        break;
    }
    
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.shadow.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _currentStage == stage 
              ? const Color(0xFF2ECC71) 
              : Colors.white.withOpacity(0.3),
          width: _currentStage == stage ? 3 : 1,
        ),
      ),
      child: Stack(
        children: [
          // Example photo background
          Positioned.fill(
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Placeholder if image not found
                return Container(
                  color: Colors.grey.shade800,
                  child: Center(
                    child: Icon(
                      Icons.photo,
                      color: Colors.grey.shade400,
                      size: 60,
                    ),
                  ),
                );
              },
            ),
          ),
          // Gradient overlay for text readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
            ),
          ),
          // Title and instructions
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    instructions,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Page indicator
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_currentExampleIndex + 1}/5',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _progressController.dispose();
    _examplePhotoController.dispose();
    final controller = _controller;
    if (controller != null) {
      if (controller.value.isInitialized && controller.value.isStreamingImages) {
        controller.stopImageStream().catchError((_) {});
      }
      controller.dispose();
    }
    _orientationSubscription?.cancel();
    _orientationMonitor?.dispose();
    _shutterPlayer?.dispose();
    _faceDetector?.close();
    super.dispose();
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({
    required this.currentCode,
    required this.onChanged,
  });

  final String currentCode;
  final Future<void> Function(String code) onChanged;

  String get _label => currentCode == 'en-US' ? 'EN' : 'TR';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Material(
      color: Colors.transparent,
      child: PopupMenuButton<String>(
        onSelected: onChanged,
        tooltip: l10n.voiceLanguage,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'tr-TR',
            child: Text(l10n.turkishTR),
          ),
          PopupMenuItem(
            value: 'en-US',
            child: Text(l10n.englishEN),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.record_voice_over, color: Colors.white70, size: 16),
              const SizedBox(width: 6),
              Text(
                _label,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_drop_down, color: Colors.white70, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}


