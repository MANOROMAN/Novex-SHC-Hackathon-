import 'package:flutter/material.dart';
import '../models/notification_model.dart';
import 'auth_service.dart';
import 'firestore_service.dart';

/// Email Provider Enum
/// Ücretsiz email API'leri için provider seçenekleri
enum EmailProvider {
    emailjs,      // EmailJS - Ücretsiz (100 email/gün)
  sendgrid,     // SendGrid - Ücretsiz tier (100 email/gün)
  mailgun,      // Mailgun - Ücretsiz tier (100 email/gün)
  resend,       // Resend - Ücretsiz tier
}

/// Bildirim Yönetim Servisi
/// Firebase Firestore ile gerçek veritabanı entegrasyonu
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  // Email API ayarları (gelecekte kullanılacak)
  // ignore: unused_field
  String? _emailApiKey;
  // ignore: unused_field
  String? _emailApiUrl;
  // ignore: unused_field
  EmailProvider _emailProvider = EmailProvider.emailjs;

  // Bildirim ayarları
  bool _emailNotificationsEnabled = true;
  // ignore: unused_field
  bool _pushNotificationsEnabled = true;

  /// Email API yapılandırması
  void configureEmailAPI({
    required EmailProvider provider,
    String? apiKey,
    String? apiUrl,
  }) {
    _emailProvider = provider;
    _emailApiKey = apiKey;
    _emailApiUrl = apiUrl;
  }

  /// Email bildirimleri aktif/pasif
  void setEmailNotifications(bool enabled) {
    _emailNotificationsEnabled = enabled;
  }

  /// Push bildirimleri aktif/pasif
  void setPushNotifications(bool enabled) {
    _pushNotificationsEnabled = enabled;
  }

  /// Günlük email görevi planla
  Future<void> scheduleDailyEmail({
    required String title,
    required String message,
    required String recipientEmail,
    required String recipientName,
    required TimeOfDay time,
    required List<int> daysOfWeek, // 1-7 (Pazartesi-Pazar)
    Map<String, dynamic>? templateData,
  }) async {
    if (!_authService.isAuthenticated) return;

    final taskData = {
      'title': title,
      'message': message,
      'recipientEmail': recipientEmail,
      'recipientName': recipientName,
      'scheduledTime': {
        'hour': time.hour,
        'minute': time.minute,
      },
      'daysOfWeek': daysOfWeek,
      'templateData': templateData ?? {},
      'isActive': true,
    };

    await _firestoreService.addScheduledEmail(_authService.currentUser!.uid, taskData);
  }

  /// Planlanmış email görevlerini al
  Future<List<ScheduledEmailTask>> getScheduledTasks() async {
    if (!_authService.isAuthenticated) return [];

    final tasksData = await _firestoreService.getScheduledEmails(_authService.currentUser!.uid);

    return tasksData.map((data) {
      final timeData = data['scheduledTime'] as Map<String, dynamic>;
      return ScheduledEmailTask(
        id: data['id'],
        title: data['title'],
        message: data['message'],
        recipientEmail: data['recipientEmail'],
        recipientName: data['recipientName'],
        scheduledTime: TimeOfDay(
          hour: timeData['hour'],
          minute: timeData['minute'],
        ),
        daysOfWeek: List<int>.from(data['daysOfWeek']),
        templateData: data['templateData'],
        isActive: data['isActive'],
        createdAt: (data['createdAt'] as dynamic)?.toDate(),
      );
    }).toList();
  }

  /// Email görevi aktif/pasif yap
  Future<void> toggleScheduledTask(String taskId, bool isActive) async {
    if (!_authService.isAuthenticated) return;

    await _firestoreService.updateScheduledEmail(
      _authService.currentUser!.uid,
      taskId,
      {'isActive': isActive},
    );
  }

  /// Email görevi sil
  Future<void> removeScheduledTask(String taskId) async {
    if (!_authService.isAuthenticated) return;

    await _firestoreService.deleteScheduledEmail(_authService.currentUser!.uid, taskId);
  }

  /// Email gönder (gelecekte API ile entegre edilecek)
  Future<bool> sendEmail({
    required String to,
    required String subject,
    required String body,
    String? recipientName,
    Map<String, dynamic>? templateData,
  }) async {
    if (!_emailNotificationsEnabled) {
      print('Email notifications are disabled');
      return false;
    }

    try {
      // TODO: Gerçek email API entegrasyonu yapılacak
      // Şimdilik mock implementation
      print('Sending email to $to');
      print('Subject: $subject');
      print('Body: $body');
      
      // Simüle edilmiş email gönderimi
      await Future.delayed(const Duration(seconds: 1));
      
      // Bildirim oluştur
      addNotification(
        title: 'E-posta Gönderildi',
        message: '$subject başlıklı e-posta $to adresine gönderildi',
        type: NotificationType.email,
      );
      
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  /// Bildirim ekle
  Future<void> addNotification({
    required String title,
    required String message,
    required NotificationType type,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_authService.isAuthenticated) return;

    final notification = NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      message: message,
      type: type,
      createdAt: DateTime.now(),
      isRead: false,
      metadata: metadata,
    );

    await _firestoreService.addNotification(_authService.currentUser!.uid, notification);
  }

  /// Başka bir kullanıcıya bildirim ekle (ör. hastaya doktor notu)
  Future<void> addNotificationForUser({
    required String userId,
    required String title,
    required String message,
    required NotificationType type,
    Map<String, dynamic>? metadata,
  }) async {
    final notification = NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      message: message,
      type: type,
      createdAt: DateTime.now(),
      isRead: false,
      metadata: metadata,
    );

    await _firestoreService.addNotification(userId, notification);
  }

  /// Tüm bildirimleri al
  Future<List<NotificationModel>> getAllNotifications() async {
    if (!_authService.isAuthenticated) return [];

    return await _firestoreService.getUserNotifications(_authService.currentUser!.uid);
  }

  /// Okunmamış bildirimleri al
  Future<List<NotificationModel>> getUnreadNotifications() async {
    final allNotifications = await getAllNotifications();
    return allNotifications.where((n) => !n.isRead).toList();
  }

  /// Okunmamış bildirim sayısı
  Future<int> getUnreadCount() async {
    final unreadNotifications = await getUnreadNotifications();
    return unreadNotifications.length;
  }

  /// Bildirimi okundu olarak işaretle
  Future<void> markAsRead(String notificationId) async {
    if (!_authService.isAuthenticated) return;

    await _firestoreService.markNotificationAsRead(_authService.currentUser!.uid, notificationId);
  }

  /// Tümünü okundu olarak işaretle
  Future<void> markAllAsRead() async {
    if (!_authService.isAuthenticated) return;

    await _firestoreService.markAllNotificationsAsRead(_authService.currentUser!.uid);
  }

  /// Bildirimi sil
  Future<void> deleteNotification(String notificationId) async {
    if (!_authService.isAuthenticated) return;

    await _firestoreService.deleteNotification(_authService.currentUser!.uid, notificationId);
  }

  /// Tüm bildirimleri temizle
  Future<void> clearAllNotifications() async {
    if (!_authService.isAuthenticated) return;

    await _firestoreService.clearAllNotifications(_authService.currentUser!.uid);
  }

  /// Gelecekte: Günlük email görevlerini kontrol et ve çalıştır
  /// Bu fonksiyon bir background service veya cron job ile çalıştırılabilir
  Future<void> processScheduledEmails({
    required String userEmail,
    required String userName,
  }) async {
    if (!_authService.isAuthenticated) return;

    final now = DateTime.now();
    final currentDay = now.weekday; // 1-7
    final currentTime = TimeOfDay.fromDateTime(now);

    final tasks = await getScheduledTasks();

    for (var task in tasks) {
      if (!task.isActive) continue;
      if (!task.daysOfWeek.contains(currentDay)) continue;

      // Basit zaman kontrolü (tam eşleşme gerektirir)
      if (task.scheduledTime.hour == currentTime.hour &&
          task.scheduledTime.minute == currentTime.minute) {
        
        // Email gönder
        await sendEmail(
          to: task.recipientEmail,
          subject: task.title,
          body: task.message,
          recipientName: task.recipientName,
          templateData: task.templateData,
        );
      }
    }
  }
}

/// Planlanmış Email Görevi Modeli
class ScheduledEmailTask {
  final String id;
  final String title;
  final String message;
  final String recipientEmail;
  final String recipientName;
  final TimeOfDay scheduledTime;
  final List<int> daysOfWeek; // 1-7 (Pazartesi-Pazar)
  final Map<String, dynamic> templateData;
  final bool isActive;
  final DateTime createdAt;

  ScheduledEmailTask({
    required this.id,
    required this.title,
    required this.message,
    required this.recipientEmail,
    required this.recipientName,
    required this.scheduledTime,
    required this.daysOfWeek,
    required this.templateData,
    required this.isActive,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  ScheduledEmailTask copyWith({
    String? id,
    String? title,
    String? message,
    String? recipientEmail,
    String? recipientName,
    TimeOfDay? scheduledTime,
    List<int>? daysOfWeek,
    Map<String, dynamic>? templateData,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return ScheduledEmailTask(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      recipientEmail: recipientEmail ?? this.recipientEmail,
      recipientName: recipientName ?? this.recipientName,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      templateData: templateData ?? this.templateData,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  String get daysDisplay {
    if (daysOfWeek.length == 7) return 'Her gün';
    if (daysOfWeek.contains(6) && daysOfWeek.contains(7)) {
      return 'Hafta sonları';
    }
    if (daysOfWeek.every((day) => [1, 2, 3, 4, 5].contains(day))) {
      return 'Hafta içi';
    }
    
    final dayNames = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
    return daysOfWeek.map((day) => dayNames[day - 1]).join(', ');
  }
}




