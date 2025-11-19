import 'dart:async';
import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';

class OrientationReading {
  OrientationReading({
    required this.yaw,
    required this.pitch,
    required this.roll,
    required this.gravityZ, // Z ekseni - telefon düz yataysa büyük olur
  });

  final double yaw;
  final double pitch;
  final double roll;
  final double gravityZ;
}

class OrientationMonitor {
  OrientationMonitor() {
    _accSubscription = accelerometerEventStream().listen(_onAccelerometer);
    _gyroSubscription = gyroscopeEventStream().listen(_onGyroscope);
  }

  final _controller = StreamController<OrientationReading>.broadcast();
  Stream<OrientationReading> get readings => _controller.stream;

  late final StreamSubscription<AccelerometerEvent> _accSubscription;
  late final StreamSubscription<GyroscopeEvent> _gyroSubscription;

  List<double>? _gravity;

  // Gyroscope integration for more accurate orientation
  double _gyroPitch = 0;
  double _gyroRoll = 0;
  double _gyroYaw = 0;
  DateTime? _lastGyroTime;

  void _onAccelerometer(AccelerometerEvent event) {
    const alpha = 0.8;
    if (_gravity == null) {
      _gravity = [event.x.toDouble(), event.y.toDouble(), event.z.toDouble()];
    } else {
      _gravity = [
        alpha * _gravity![0] + (1 - alpha) * event.x,
        alpha * _gravity![1] + (1 - alpha) * event.y,
        alpha * _gravity![2] + (1 - alpha) * event.z,
      ];
    }
    _compute();
  }

  void _onGyroscope(GyroscopeEvent event) {
    final now = DateTime.now();
    if (_lastGyroTime != null) {
      final dt = now.difference(_lastGyroTime!).inMicroseconds / 1000000.0;
      if (dt > 0 && dt < 1.0) {
        _gyroPitch += event.x * dt * 180 / pi;
        _gyroRoll += event.y * dt * 180 / pi;
        _gyroYaw += event.z * dt * 180 / pi;
      }
    }
    _lastGyroTime = now;
  }

  void _compute() {
    if (_gravity == null) {
      return;
    }

    // Basit accelerometer bazlı pitch ve roll hesaplama
    final gx = _gravity![0];
    final gy = _gravity![1];
    final gz = _gravity![2];

    final normGravity = sqrt(gx * gx + gy * gy + gz * gz);
    if (normGravity < 0.5) {
      return;
    }

    // Normalize gravity
    final normalizedGz = gz / normGravity;

    // Portrait mode için pitch ve roll
    // Telefon dik tutulduğunda: gx=yan, gy=yukarı/aşağı, gz=ön/arka
    final pitch = atan2(-gy, sqrt(gx * gx + gz * gz)) * 180 / pi;
    final roll = atan2(gx, sqrt(gy * gy + gz * gz)) * 180 / pi;

    // Yaw için gyroscope kullan (magnetometer problemli olabilir)
    final yaw = _gyroYaw;

    final reading = OrientationReading(
      yaw: yaw,
      pitch: pitch,
      roll: roll,
      gravityZ: normalizedGz, // Telefon yataysa (ekran yukarı/aşağı) bu ~±1 olur
    );
    _controller.add(reading);
  }

  void dispose() {
    _accSubscription.cancel();
    _gyroSubscription.cancel();
    _controller.close();
  }
}



