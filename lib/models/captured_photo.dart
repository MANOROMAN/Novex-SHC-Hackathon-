import 'dart:io';
import 'capture_stage.dart';
import '../services/orientation_monitor.dart';

class CapturedPhoto {
  CapturedPhoto({
    required this.stage,
    required this.file,
    this.faceYaw,
    this.facePitch,
    this.faceRoll,
    this.orientation,
    DateTime? capturedAt,
  }) : capturedAt = capturedAt ?? DateTime.now();

  final CaptureStage stage;
  final File file;
  final double? faceYaw;
  final double? facePitch;
  final double? faceRoll;
  final OrientationReading? orientation;
  final DateTime capturedAt;

  CapturedPhoto copyWith({
    File? file,
    double? faceYaw,
    double? facePitch,
    double? faceRoll,
    OrientationReading? orientation,
    DateTime? capturedAt,
  }) {
    return CapturedPhoto(
      stage: stage,
      file: file ?? this.file,
      faceYaw: faceYaw ?? this.faceYaw,
      facePitch: facePitch ?? this.facePitch,
      faceRoll: faceRoll ?? this.faceRoll,
      orientation: orientation ?? this.orientation,
      capturedAt: capturedAt ?? this.capturedAt,
    );
  }
}



