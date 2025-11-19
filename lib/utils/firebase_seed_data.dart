import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';
import '../services/auth_service.dart';

/// Firebase'e örnek veri eklemek için yardımcı sınıf
class FirebaseSeedData {
  final FirestoreService _firestoreService = FirestoreService();
  final AuthService _authService = AuthService();

  /// Örnek bir doktor kaydı ekle (auth gerektirmez - rules izin veriyor)
  ///
  /// Firestore rules gereği yalnızca şu alanlar yazılabilir:
  /// - email (string, zorunlu)
  /// - active (bool, true olmak zorunda)
  /// - name (string, opsiyonel)
  /// - createdAt (timestamp)
  ///
  /// Dönüş: oluşturulan doküman id'si
  Future<String> addSampleDoctor({
    String email = 'doctor@example.com',
    String? name = 'Dr. John Doe',
  }) async {
    final docRef = await FirebaseFirestore.instance.collection('doctors').add({
      'email': email,
      'active': true,
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }

  /// Örnek hasta verisi ekle (patients_public koleksiyonu için)
  Future<void> addSamplePatients() async {
    try {
      final patientsData = [
        {
          'id': 'patient_1',
          'email': 'hasta1@example.com',
          'displayName': 'Ahmet Yılmaz',
          'avatarUrl': '',
          'lastAnalysisAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 5))),
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'patient_2', 
          'email': 'hasta2@example.com',
          'displayName': 'Mehmet Kaya',
          'avatarUrl': '',
          'lastAnalysisAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 12))),
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'patient_3',
          'email': 'hasta3@example.com', 
          'displayName': 'Ali Demir',
          'avatarUrl': '',
          'lastAnalysisAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 3))),
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'patient_4',
          'email': 'hasta4@example.com',
          'displayName': 'Fatma Şahin',
          'avatarUrl': '',
          'lastAnalysisAt': null, // Hiç analiz yapmamış
          'createdAt': FieldValue.serverTimestamp(),
        },
      ];

      for (final patientData in patientsData) {
        final patientId = patientData['id'] as String;
        await FirebaseFirestore.instance
            .collection('patients_public')
            .doc(patientId)
            .set(patientData);
        print('✅ Hasta eklendi: ${patientData['displayName']}');
      }
      
      print('✅ Tüm örnek hastalar eklendi!');
    } catch (e) {
      print('❌ Hasta ekleme hatası: $e');
    }
  }

  /// Belirli bir ID ile doktor oluştur (yoksa)
  Future<void> createDoctorByIdIfMissing({
    required String docId,
    required String email,
    String? name,
  }) async {
    final docRef = FirebaseFirestore.instance.collection('doctors').doc(docId);
    final doc = await docRef.get();
    
    if (!doc.exists) {
      await docRef.set({
        'email': email,
        'active': true,
        'name': name,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('✅ Doktor oluşturuldu: $email');
    } else {
      print('ℹ️ Doktor zaten mevcut: $email');
    }
  }

  /// Uygulamadaki "Doktorlarımız" bölümündeki 5 doktoru bir kerelik ekle
  Future<void> addClinicDoctorsIfMissing() async {
    final doctors = <Map<String, String?>>[
      {
        'email': 'gokay.bilgin@smilehairclinic.com',
        'name': 'Dr. Gökay Bilgin',
      },
      {
        'email': 'mehmet.erdogan@smilehairclinic.com',
        'name': 'Dr. Mehmet Erdoğan',
      },
      {
        'email': 'firdavs.ahmedov@smilehairclinic.com',
        'name': 'Dr. Firdavs Ahmedov',
      },
      {
        'email': 'ali.osman.soluk@smilehairclinic.com',
        'name': 'Dr. Ali Osman Soluk',
      },
      {
        'email': 'resat.arpaci@smilehairclinic.com',
        'name': 'Dr. M. Reşat Arpacı',
      },
    ];
    for (final d in doctors) {
      final email = d['email']!;
      final name = d['name'];
      // Deterministic doc id from email
      final docId = email.replaceAll('@', '_at_').replaceAll('.', '_');
      await createDoctorByIdIfMissing(docId: docId, email: email, name: name);
    }
  }

  /// Tüm örnek verileri ekle
  Future<void> seedAllData() async {
    if (!_authService.isAuthenticated) {
      throw Exception('Kullanıcı giriş yapmamış');
    }

    final userId = _authService.currentUser!.uid;

    print('🌱 Örnek veriler ekleniyor...');

    await seedRecoveryProgress(userId);
    await seedCareRoutine(userId);
    await seedAppointments(userId);
    await seedAnalyses(userId);
    await seedNotifications(userId);
    await seedMedications(userId);

    print('✅ Tüm örnek veriler başarıyla eklendi!');
  }

  /// İyileşme ilerlemesi ekle
  Future<void> seedRecoveryProgress(String userId) async {
    print('📊 İyileşme ilerlemesi ekleniyor...');
    
    await _firestoreService.updateRecoveryProgress(userId, {
      'currentDay': 15,
      'totalDays': 365,
      'phase': 'Healing Phase',
      'phaseDescription': 'Week 2: Initial healing process',
      'startDate': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 15))),
      'targetDate': Timestamp.fromDate(DateTime.now().add(const Duration(days: 350))),
    });
  }

  /// Bakım rutini ekle
  Future<void> seedCareRoutine(String userId) async {
    print('💊 Bakım rutini ekleniyor...');
    
    await _firestoreService.updateCareRoutine(userId, {
      'morningMedication': true,
      'topicalSolution': false,
      'eveningMedication': false,
      'lastUpdated': FieldValue.serverTimestamp(),
    });
  }

  /// Randevular ekle
  Future<void> seedAppointments(String userId) async {
    print('📅 Randevular ekleniyor...');
    
    // Gelecek randevu - Dr. Gökay Bilgin
    await _firestoreService.addAppointment(userId, {
      'dateTime': Timestamp.fromDate(DateTime.now().add(const Duration(days: 7))),
      'doctorName': 'Dr. Gökay Bilgin',
      'type': 'Kontrol Muayenesi',
      'description': 'Saç ekimi sonrası kontrol.',
      'location': 'Smile Hair Clinic - İstanbul',
      'status': 'scheduled',
      'notes': 'Önceki fotoğraflarınızı getirin',
    });

    // Yakın zamanda geçmiş randevu - Dr. Mehmet Erdoğan
    await _firestoreService.addAppointment(userId, {
      'dateTime': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 7))),
      'doctorName': 'Dr. Mehmet Erdoğan',
      'type': 'Kontrol',
      'description': 'Operasyon sonrası kontrol muayenesi',
      'location': 'Smile Hair Clinic - İstanbul',
      'status': 'completed',
    });

    // Gelecekteki 2. randevu - Dr. Firdavs Ahmedov
    await _firestoreService.addAppointment(userId, {
      'dateTime': Timestamp.fromDate(DateTime.now().add(const Duration(days: 30))),
      'doctorName': 'Dr. Firdavs Ahmedov',
      'type': 'İlerleme Değerlendirmesi',
      'description': 'Aylık ilerleme değerlendirmesi',
      'location': 'Smile Hair Clinic - İstanbul',
      'status': 'scheduled',
    });
  }

  /// Analizler ekle
  Future<void> seedAnalyses(String userId) async {
    print('🔬 Analizler ekleniyor...');
    
    // İlk analiz (en eski)
    await _firestoreService.addAnalysis(userId, {
      'title': 'İlk Analiz',
      'description': 'İlk saç ekimi öncesi analiz',
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 20))),
      'imageUrl': '',
      'stage': 'pre-operation',
      'notes': 'Başlangıç durumu kaydedildi',
      'graftsCount': 0,
    });

    // Operasyon sonrası analiz
    await _firestoreService.addAnalysis(userId, {
      'title': '1. Hafta Analizi',
      'description': 'Operasyon sonrası 1. hafta kontrolü',
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 8))),
      'imageUrl': '',
      'stage': 'week-1',
      'notes': 'İyileşme süreci normal seyrediyor',
      'graftsCount': 3500,
    });

    // Son analiz
    await _firestoreService.addAnalysis(userId, {
      'title': '2. Hafta Analizi',
      'description': 'Operasyon sonrası 2. hafta kontrolü',
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 1))),
      'imageUrl': '',
      'stage': 'week-2',
      'notes': 'Kızarıklık azalmaya başladı',
      'graftsCount': 3500,
    });
  }

  /// Bildirimler ekle
  Future<void> seedNotifications(String userId) async {
    print('🔔 Bildirimler ekleniyor...');
    
    // Randevu hatırlatıcı (okunmamış)
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add({
      'title': 'Appointment Reminder',
      'message': 'You have an appointment tomorrow at 10:30 AM',
      'type': 'appointment',
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(hours: 2))),
      'isRead': false,
      'metadata': {
        'appointmentId': 'apt_123',
      },
    });

    // İlaç hatırlatıcı (okunmuş)
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add({
      'title': 'Medication Reminder',
      'message': 'Time to take your morning medication',
      'type': 'medication',
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(hours: 5))),
      'isRead': true,
      'readAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(hours: 4))),
    });

    // Fotoğraf hatırlatıcı (okunmamış)
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add({
      'title': 'Photo Reminder',
      'message': 'Please take your weekly progress photos',
      'type': 'photo',
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 1))),
      'isRead': false,
    });

    // Sistem bildirimi
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add({
      'title': 'Welcome!',
      'message': 'Welcome to Smile Hair Clinic app. We\'re here to support your journey!',
      'type': 'system',
      'createdAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 20))),
      'isRead': true,
      'readAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 19))),
    });
  }

  /// İlaçlar ekle
  Future<void> seedMedications(String userId) async {
    print('💊 İlaçlar ekleniyor...');
    
    // Sabah ilacı
    await _firestoreService.addMedication(userId, {
      'name': 'Antibiotic Capsule',
      'dosage': '500mg',
      'frequency': 'twice daily',
      'times': ['08:00', '20:00'],
      'duration': '7 days',
      'startDate': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 3))),
      'endDate': Timestamp.fromDate(DateTime.now().add(const Duration(days: 4))),
      'instructions': 'Take with food',
      'isActive': true,
    });

    // Ağrı kesici
    await _firestoreService.addMedication(userId, {
      'name': 'Pain Reliever',
      'dosage': '400mg',
      'frequency': 'as needed',
      'times': [],
      'duration': 'as needed',
      'startDate': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 3))),
      'endDate': null,
      'instructions': 'Take with water. Maximum 3 times per day',
      'isActive': true,
    });

    // Topikal çözelti
    await _firestoreService.addMedication(userId, {
      'name': 'Topical Solution',
      'dosage': 'Apply thin layer',
      'frequency': 'twice daily',
      'times': ['09:00', '21:00'],
      'duration': '14 days',
      'startDate': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 3))),
      'endDate': Timestamp.fromDate(DateTime.now().add(const Duration(days: 11))),
      'instructions': 'Apply to affected area gently',
      'isActive': true,
    });
  }

  /// Dokümanlar ekle
  Future<void> seedDocuments(String userId) async {
    print('📄 Dokümanlar ekleniyor...');

    await _firestoreService.addDocument(userId, {
      'title': 'Operasyon Raporu',
      'type': 'report',
      'description': 'Operasyon sırasında gerçekleştirilen işlemleri içeren ayrıntılı rapor.',
      'date': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 5))),
      'downloadUrl': 'https://www.smilehairclinic.com/sample-report.pdf',
    });

    await _firestoreService.addDocument(userId, {
      'title': 'İlaç Reçetesi',
      'type': 'prescription',
      'description': 'Operasyon sonrası kullanılacak ilaçların listesi.',
      'date': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 2))),
      'downloadUrl': 'https://www.smilehairclinic.com/sample-prescription.pdf',
    });
  }

  /// Faturalar ekle
  Future<void> seedInvoices(String userId) async {
    print('💳 Faturalar ekleniyor...');

    await _firestoreService.addInvoice(userId, {
      'invoiceNumber': 'INV-2025-001',
      'service': 'Safir FUE Saç Ekimi',
      'amount': 3500,
      'currency': 'EUR',
      'status': 'paid',
      'issuedAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 15))),
      'dueDate': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 10))),
      'notes': 'Peşin ödeme indirimi uygulandı.',
      'pdfUrl': 'https://www.smilehairclinic.com/sample-invoice.pdf',
    });

    await _firestoreService.addInvoice(userId, {
      'invoiceNumber': 'INV-2025-014',
      'service': 'Kontrol Muayenesi',
      'amount': 250,
      'currency': 'EUR',
      'status': 'pending',
      'issuedAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 3))),
      'dueDate': Timestamp.fromDate(DateTime.now().add(const Duration(days: 4))),
      'paymentUrl': 'https://www.smilehairclinic.com/pay',
      'pdfUrl': 'https://www.smilehairclinic.com/sample-invoice.pdf',
    });
  }

  /// Günlük log ekle
  Future<void> seedDailyLogs(String userId) async {
    print('📝 Günlük loglar ekleniyor...');
    
    for (int i = 0; i < 15; i++) {
      await _firestoreService.addDailyLog(userId, {
        'date': Timestamp.fromDate(DateTime.now().subtract(Duration(days: i))),
        'pain': 5 - (i ~/ 3), // Ağrı zamanla azalır (1-5 arası)
        'swelling': 6 - (i ~/ 2), // Şişlik zamanla azalır
        'notes': i == 0 
            ? 'Bugün çok daha iyi hissediyorum' 
            : 'İyileşme devam ediyor',
        'medicationTaken': true,
        'photosTaken': i % 3 == 0, // Her 3 günde bir fotoğraf
      });
    }
  }

  /// Mesajlar ekle
  Future<void> seedMessages(String userId) async {
    print('💬 Mesajlar ekleniyor...');
    
    // Doktordan mesaj
    await _firestoreService.sendMessage(userId, {
      'sender': 'doctor_123',
      'senderName': 'Dr. Sarah Johnson',
      'message': 'Hello! How are you feeling today? Any concerns?',
      'type': 'text',
      'isFromDoctor': true,
    });

    // Kullanıcıdan cevap
    await _firestoreService.sendMessage(userId, {
      'sender': userId,
      'senderName': 'Me',
      'message': 'Feeling much better, thank you!',
      'type': 'text',
      'isFromDoctor': false,
    });

    // Sistem mesajı
    await _firestoreService.sendMessage(userId, {
      'sender': 'system',
      'senderName': 'System',
      'message': 'Your next appointment is scheduled for next week',
      'type': 'system',
      'isFromDoctor': false,
    });
  }

  /// Tüm verileri temizle (test amaçlı)
  Future<void> clearAllData(String userId) async {
    print('🗑️ Tüm veriler siliniyor...');
    
    final batch = FirebaseFirestore.instance.batch();
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    // Tüm koleksiyonları sil
    final collections = [
      'analyses',
      'notifications',
      'appointments',
      'medications',
      'daily_logs',
      'messages',
      'care_routine',
      'progress',
      'documents',
      'invoices',
    ];

    for (final collection in collections) {
      final snapshot = await userRef.collection(collection).get();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
    }

    await batch.commit();
    print('✅ Tüm veriler silindi!');
  }
}



