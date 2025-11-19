import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

/// Firestore veritabanı servisi
class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ========== ANALYSES (Analizler) ==========
  
  /// Analiz geçmişini getir (Future - tek seferlik)
  Future<List<Map<String, dynamic>>> getUserAnalyses(String userId) async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .orderBy('createdAt', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => {
      'id': doc.id,
      ...doc.data(),
    }).toList();
  }

  /// Analiz geçmişini stream olarak getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getUserAnalysesStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList());
  }

  /// Yeni analiz ekle
  Future<String> addAnalysis(String userId, Map<String, dynamic> analysisData) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .add({
          ...analysisData,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
    return docRef.id;
  }

  /// Analiz güncelle
  Future<void> updateAnalysis(String userId, String analysisId, Map<String, dynamic> updates) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .doc(analysisId)
        .update({
          ...updates,
          'updatedAt': FieldValue.serverTimestamp(),
        });
  }

  /// Analiz sil
  Future<void> deleteAnalysis(String userId, String analysisId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .doc(analysisId)
        .delete();
  }

  /// Tek analiz getir (CANLI VERİ)
  Stream<Map<String, dynamic>?> getAnalysisStream(String userId, String analysisId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .doc(analysisId)
        .snapshots()
        .map((doc) => doc.exists ? {'id': doc.id, ...doc.data()!} : null);
  }

  // ========== NOTIFICATIONS (Bildirimler) ==========

  /// Bildirimleri getir
  Future<List<NotificationModel>> getUserNotifications(String userId) async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .orderBy('createdAt', descending: true)
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return NotificationModel(
        id: doc.id,
        title: data['title'] ?? '',
        message: data['message'] ?? '',
        type: _parseNotificationType(data['type']),
        createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        isRead: data['isRead'] ?? false,
        metadata: data['metadata'],
      );
    }).toList();
  }

  /// Bildirimleri stream olarak getir (CANLI VERİ)
  Stream<List<NotificationModel>> getUserNotificationsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
          final data = doc.data();
          return NotificationModel(
            id: doc.id,
            title: data['title'] ?? '',
            message: data['message'] ?? '',
            type: _parseNotificationType(data['type']),
            createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
            isRead: data['isRead'] ?? false,
            metadata: data['metadata'],
          );
        }).toList());
  }

  /// Okunmamış bildirim sayısını stream olarak getir (CANLI VERİ)
  Stream<int> getUnreadNotificationCountStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .where('isRead', isEqualTo: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  /// Bildirim ekle
  Future<String> addNotification(String userId, NotificationModel notification) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add({
          'title': notification.title,
          'message': notification.message,
          'type': notification.type.toString().split('.').last,
          'createdAt': FieldValue.serverTimestamp(),
          'isRead': notification.isRead,
          'metadata': notification.metadata,
        });
    return docRef.id;
  }

  /// Bildirimi okundu olarak işaretle
  Future<void> markNotificationAsRead(String userId, String notificationId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .doc(notificationId)
        .update({
          'isRead': true,
          'readAt': FieldValue.serverTimestamp(),
        });
  }

  /// Tüm bildirimleri okundu olarak işaretle
  Future<void> markAllNotificationsAsRead(String userId) async {
    final batch = _firestore.batch();

    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .where('isRead', isEqualTo: false)
        .get();

    for (var doc in querySnapshot.docs) {
      batch.update(doc.reference, {
        'isRead': true,
        'readAt': FieldValue.serverTimestamp(),
      });
    }

    await batch.commit();
  }

  /// Bildirim sil
  Future<void> deleteNotification(String userId, String notificationId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .doc(notificationId)
        .delete();
  }

  /// Tüm bildirimleri sil
  Future<void> clearAllNotifications(String userId) async {
    final batch = _firestore.batch();

    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .get();

    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

  // ========== APPOINTMENTS (Randevular) ==========

  /// Randevuları getir
  Future<List<Map<String, dynamic>>> getUserAppointments(String userId) async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .orderBy('dateTime', descending: false)
        .get();

    return querySnapshot.docs.map((doc) => {
      'id': doc.id,
      ...doc.data(),
    }).toList();
  }

  /// Randevuları stream olarak getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getUserAppointmentsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .orderBy('dateTime', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList());
  }

  /// Gelecek randevuları stream olarak getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getUpcomingAppointmentsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .where('dateTime', isGreaterThan: Timestamp.now())
        .orderBy('dateTime', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList());
  }

  /// Bir sonraki randevuyu stream olarak getir (CANLI VERİ)
  Stream<Map<String, dynamic>?> getNextAppointmentStream(String userId) {
    // Randevular artık top-level 'appointments' koleksiyonunda tutuluyor
    return _firestore
        .collection('appointments')
        .where('patientId', isEqualTo: userId)
        .where('dateTime', isGreaterThan: Timestamp.now())
        .orderBy('dateTime', descending: false)
        .snapshots()
        .map((snapshot) {
          if (snapshot.docs.isEmpty) return null;
          
          // Sadece pending veya confirmed randevuları filtrele
          final validAppointments = snapshot.docs.where((doc) {
            final data = doc.data();
            final status = data['status'] as String?;
            return status == 'pending' || status == 'confirmed';
          }).toList();
          
          if (validAppointments.isEmpty) return null;
          
          final doc = validAppointments.first;
          return {'id': doc.id, ...doc.data()};
        });
  }

  /// Randevu ekle
  Future<String> addAppointment(String userId, Map<String, dynamic> appointmentData) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .add({
          ...appointmentData,
          'createdAt': FieldValue.serverTimestamp(),
          'status': appointmentData['status'] ?? 'scheduled',
        });
    return docRef.id;
  }

  /// Randevu güncelle
  Future<void> updateAppointment(String userId, String appointmentId, Map<String, dynamic> updates) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .doc(appointmentId)
        .update({
          ...updates,
          'updatedAt': FieldValue.serverTimestamp(),
        });
  }

  /// Randevu sil (İptal et)
  Future<void> cancelAppointment(String userId, String appointmentId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .doc(appointmentId)
        .update({
          'status': 'cancelled',
          'cancelledAt': FieldValue.serverTimestamp(),
        });
  }

  /// Randevuyu tamamen sil
  Future<void> deleteAppointment(String userId, String appointmentId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .doc(appointmentId)
        .delete();
  }

  // ========== DOCUMENTS (Dokümanlar) ==========

  Stream<List<Map<String, dynamic>>> getUserDocumentsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('documents')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => {
                  'id': doc.id,
                  ...doc.data(),
                },
              )
              .toList(),
        );
  }

  Future<void> addDocument(String userId, Map<String, dynamic> documentData) async {
    await _firestore.collection('users').doc(userId).collection('documents').add({
      ...documentData,
      'date': documentData['date'] ?? FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteDocument(String userId, String documentId) async {
    await _firestore.collection('users').doc(userId).collection('documents').doc(documentId).delete();
  }

  // ========== INVOICES (Faturalar) ==========

  Stream<List<Map<String, dynamic>>> getUserInvoicesStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('invoices')
        .orderBy('issuedAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => {
                  'id': doc.id,
                  ...doc.data(),
                },
              )
              .toList(),
        );
  }

  Future<void> addInvoice(String userId, Map<String, dynamic> invoiceData) async {
    await _firestore.collection('users').doc(userId).collection('invoices').add({
      ...invoiceData,
      'issuedAt': invoiceData['issuedAt'] ?? FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateInvoice(String userId, String invoiceId, Map<String, dynamic> updates) async {
    await _firestore.collection('users').doc(userId).collection('invoices').doc(invoiceId).update({
      ...updates,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteInvoice(String userId, String invoiceId) async {
    await _firestore.collection('users').doc(userId).collection('invoices').doc(invoiceId).delete();
  }

  // ========== CARE ROUTINE (Bakım Rutini) ==========

  /// Günlük bakım rutinini getir (CANLI VERİ)
  Stream<Map<String, dynamic>?> getCareRoutineStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('care_routine')
        .doc('daily')
        .snapshots()
        .map((doc) => doc.exists ? doc.data() : null);
  }

  /// Bakım rutini oluştur/güncelle
  Future<void> updateCareRoutine(String userId, Map<String, dynamic> routine) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('care_routine')
        .doc('daily')
        .set({
          ...routine,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
  }

  /// Bakım görevini tamamlandı olarak işaretle
  Future<void> completeCareTask(String userId, String taskKey, bool completed) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('care_routine')
        .doc('daily')
        .update({
          taskKey: completed,
          'lastUpdated': FieldValue.serverTimestamp(),
        });
  }

  // ========== RECOVERY PROGRESS (İyileşme İlerlemesi) ==========

  /// İyileşme ilerlemesini getir (CANLI VERİ)
  Stream<Map<String, dynamic>?> getRecoveryProgressStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('progress')
        .doc('recovery')
        .snapshots()
        .map((doc) => doc.exists ? doc.data() : null);
  }


  /// İlerleme takibi verilerini getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getProgressTrackingStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('progress_tracking')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList());
  }

  /// İyileşme ilerlemesini güncelle
  Future<void> updateRecoveryProgress(String userId, Map<String, dynamic> progress) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('progress')
        .doc('recovery')
        .set({
          ...progress,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
  }

  /// Günlük kayıt ekle
  Future<void> addDailyLog(String userId, Map<String, dynamic> logData) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('daily_logs')
        .add({
          ...logData,
          'createdAt': FieldValue.serverTimestamp(),
        });
  }

  /// Günlük kayıtları getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getDailyLogsStream(String userId, {int? limitDays}) {
    Query query = _firestore
        .collection('users')
        .doc(userId)
        .collection('daily_logs')
        .orderBy('createdAt', descending: true);

    if (limitDays != null) {
      final startDate = Timestamp.fromDate(DateTime.now().subtract(Duration(days: limitDays)));
      query = query.where('createdAt', isGreaterThan: startDate);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        }).toList());
  }

  // ========== SCHEDULED EMAILS (Planlanmış E-postalar) ==========

  /// Planlanmış email görevlerini getir
  Future<List<Map<String, dynamic>>> getScheduledEmails(String userId) async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('scheduled_emails')
        .where('isActive', isEqualTo: true)
        .get();

    return querySnapshot.docs.map((doc) => {
      'id': doc.id,
      ...doc.data(),
    }).toList();
  }

  /// Planlanmış email görevlerini stream olarak getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getScheduledEmailsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('scheduled_emails')
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList());
  }

  /// Planlanmış email görevi ekle
  Future<String> addScheduledEmail(String userId, Map<String, dynamic> emailData) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('scheduled_emails')
        .add({
          ...emailData,
          'createdAt': FieldValue.serverTimestamp(),
        });
    return docRef.id;
  }

  /// Planlanmış email görevi güncelle
  Future<void> updateScheduledEmail(String userId, String emailId, Map<String, dynamic> updates) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('scheduled_emails')
        .doc(emailId)
        .update({
          ...updates,
          'updatedAt': FieldValue.serverTimestamp(),
        });
  }

  /// Planlanmış email görevi sil
  Future<void> deleteScheduledEmail(String userId, String emailId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('scheduled_emails')
        .doc(emailId)
        .delete();
  }

  // ========== USER STATS (Kullanıcı İstatistikleri) ==========

  /// Kullanıcı istatistiklerini getir
  Future<Map<String, dynamic>> getUserStats(String userId) async {
    final analysesCount = await _firestore
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .count()
        .get()
        .then((value) => value.count ?? 0);

    final unreadNotificationsCount = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .where('isRead', isEqualTo: false)
        .count()
        .get()
        .then((value) => value.count ?? 0);

    final upcomingAppointmentsCount = await _firestore
        .collection('users')
        .doc(userId)
        .collection('appointments')
        .where('dateTime', isGreaterThan: Timestamp.now())
        .count()
        .get()
        .then((value) => value.count ?? 0);

    return {
      'totalAnalyses': analysesCount,
      'unreadNotifications': unreadNotificationsCount,
      'upcomingAppointments': upcomingAppointmentsCount,
    };
  }

  /// Kullanıcı istatistiklerini stream olarak getir (CANLI VERİ)
  Stream<Map<String, dynamic>> getUserStatsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .asyncMap((userDoc) async {
          final analysesCount = await _firestore
              .collection('users')
              .doc(userId)
              .collection('analyses')
              .count()
              .get()
              .then((value) => value.count ?? 0);

          final unreadNotificationsCount = await _firestore
              .collection('users')
              .doc(userId)
              .collection('notifications')
              .where('isRead', isEqualTo: false)
              .count()
              .get()
              .then((value) => value.count ?? 0);

          final upcomingAppointmentsCount = await _firestore
              .collection('users')
              .doc(userId)
              .collection('appointments')
              .where('dateTime', isGreaterThan: Timestamp.now())
              .count()
              .get()
              .then((value) => value.count ?? 0);

          return {
            'totalAnalyses': analysesCount,
            'unreadNotifications': unreadNotificationsCount,
            'upcomingAppointments': upcomingAppointmentsCount,
          };
        });
  }

  // ========== MESSAGES / CHAT (Mesajlar) ==========

  /// Mesajları getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getMessagesStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList());
  }

  /// Mesaj gönder
  Future<String> sendMessage(String userId, Map<String, dynamic> messageData) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('messages')
        .add({
          ...messageData,
          'createdAt': FieldValue.serverTimestamp(),
          'isRead': false,
        });
    return docRef.id;
  }

  /// Mesajı okundu olarak işaretle
  Future<void> markMessageAsRead(String userId, String messageId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('messages')
        .doc(messageId)
        .update({
          'isRead': true,
          'readAt': FieldValue.serverTimestamp(),
        });
  }

  /// Okunmamış mesaj sayısını getir (CANLI VERİ)
  Stream<int> getUnreadMessageCountStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('messages')
        .where('isRead', isEqualTo: false)
        .where('sender', isNotEqualTo: userId) // Kendi mesajları sayma
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  // ========== MEDICATIONS (İlaçlar) ==========

  /// İlaçları getir (CANLI VERİ)
  Stream<List<Map<String, dynamic>>> getMedicationsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList());
  }

  /// İlaç ekle
  Future<String> addMedication(String userId, Map<String, dynamic> medicationData) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .add({
          ...medicationData,
          'createdAt': FieldValue.serverTimestamp(),
          'isActive': true,
        });
    return docRef.id;
  }

  /// İlaç güncelle
  Future<void> updateMedication(String userId, String medicationId, Map<String, dynamic> updates) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .doc(medicationId)
        .update({
          ...updates,
          'updatedAt': FieldValue.serverTimestamp(),
        });
  }

  /// İlacı pasif yap
  Future<void> deactivateMedication(String userId, String medicationId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('medications')
        .doc(medicationId)
        .update({
          'isActive': false,
          'deactivatedAt': FieldValue.serverTimestamp(),
        });
  }

  // ========== HELPER METHODS ==========

  /// NotificationType parse helper
  NotificationType _parseNotificationType(String? typeString) {
    switch (typeString) {
      case 'appointment':
        return NotificationType.appointment;
      case 'medication':
        return NotificationType.medication;
      case 'photo':
        return NotificationType.photo;
      case 'email':
        return NotificationType.email;
      case 'system':
        return NotificationType.system;
      case 'general':
        return NotificationType.general;
      default:
        return NotificationType.general;
    }
  }

  /// Batch operations için
  WriteBatch batch() => _firestore.batch();

  /// Transaction operations için
  Future<T> runTransaction<T>(
    TransactionHandler<T> transactionHandler, {
    Duration timeout = const Duration(seconds: 30),
  }) {
    return _firestore.runTransaction(transactionHandler, timeout: timeout);
  }
}


