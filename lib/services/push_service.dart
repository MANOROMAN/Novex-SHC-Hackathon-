import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:self_capture/services/auth_service.dart';
import 'package:self_capture/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PushService {
  static final PushService _instance = PushService._internal();
  factory PushService() => _instance;
  PushService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final AuthService _auth = AuthService();
  final FirestoreService _firestore = FirestoreService();

  Future<void> initialize() async {
    // iOS izinleri
    await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Token al ve kaydet
    final token = await _messaging.getToken();
    if (kDebugMode) {
      debugPrint('FCM Token: $token');
    }
    if (token != null && _auth.isAuthenticated) {
      await _saveFcmToken(token);
    }

    // Token yenilenince kaydet
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      if (_auth.isAuthenticated) {
        await _saveFcmToken(newToken);
      }
    });

    // Foreground mesajları dinle
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        debugPrint('Foreground mesaj alındı: ${message.notification?.title}');
        debugPrint('Body: ${message.notification?.body}');
        debugPrint('Data: ${message.data}');
      }
    });

    // Background mesajlar için handler
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        debugPrint('Notification açıldı: ${message.notification?.title}');
      }
      // TODO: Mesaj ekranına yönlendir
    });
  }

  Future<void> _saveFcmToken(String token) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'fcmToken': token,
      'fcmUpdatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  /// İlaç hatırlatma planla (günlük, belirli saat)
  Future<void> enableDailyMedicationReminder({required int hour, required int minute, String label = 'İlaç'}) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;
    // İlk nextSendAt: bugünün belirtilen saati; geçmişse yarın
    final now = DateTime.now();
    var first = DateTime(now.year, now.month, now.day, hour, minute);
    if (first.isBefore(now)) {
      first = first.add(const Duration(days: 1));
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('medication_reminders')
        .doc('daily')
        .set({
      'label': label,
      'hour': hour,
      'minute': minute,
      'active': true,
      'nextSendAt': Timestamp.fromDate(first.toUtc()),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> disableDailyMedicationReminder() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('medication_reminders')
        .doc('daily')
        .set({
      'active': false,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}


