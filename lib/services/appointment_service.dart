import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/appointment.dart';

/// Randevu yönetim servisi
class AppointmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Yeni randevu oluştur
  Future<String> createAppointment({
    required String patientId,
    required String patientName,
    required String doctorId,
    required String doctorName,
    required DateTime dateTime,
    required AppointmentType type,
    String notes = '',
    int durationMinutes = 30,
  }) async {
    try {
      // Müsaitlik kontrolü
      final isAvailable = await checkAvailability(
        doctorId: doctorId,
        dateTime: dateTime,
        durationMinutes: durationMinutes,
      );

      if (!isAvailable) {
        throw Exception('Bu saat dilimi dolu. Lütfen başka bir saat seçin.');
      }

      final appointment = Appointment(
        id: '',
        patientId: patientId,
        patientName: patientName,
        doctorId: doctorId,
        doctorName: doctorName,
        dateTime: dateTime,
        status: AppointmentStatus.pending,
        type: type,
        notes: notes,
        createdAt: DateTime.now(),
        durationMinutes: durationMinutes,
      );

      final appointmentMap = appointment.toMap();
      debugPrint('📝 Randevu oluşturuluyor:');
      debugPrint('   doctorId: $doctorId');
      debugPrint('   doctorName: $doctorName');
      debugPrint('   patientId: $patientId');
      debugPrint('   patientName: $patientName');
      debugPrint('   dateTime: ${dateTime.toString()}');
      debugPrint('   appointmentMap: $appointmentMap');
      
      final docRef = await _firestore.collection('appointments').add(appointmentMap);
      
      debugPrint('✅ Randevu oluşturuldu: ${docRef.id}');
      debugPrint('   Hasta: $patientName');
      debugPrint('   Doktor: $doctorName (ID: $doctorId)');
      debugPrint('   Tarih: ${dateTime.toString()}');
      
      return docRef.id;
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu oluşturma):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Stack trace: $stackTrace');
      
      String errorMessage = 'Randevu oluşturulurken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = 'Randevu oluşturma izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
      } else if (e.code == 'unavailable') {
        errorMessage = 'Firebase servisi şu anda kullanılamıyor. Lütfen internet bağlantınızı kontrol edin.';
      } else if (e.code == 'deadline-exceeded') {
        errorMessage = 'İşlem zaman aşımına uğradı. Lütfen tekrar deneyin.';
      }
      
      throw Exception('$errorMessage (${e.code})');
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu oluşturma hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Müsaitlik kontrolü
  Future<bool> checkAvailability({
    required String doctorId,
    required DateTime dateTime,
    int durationMinutes = 30,
    String? excludeAppointmentId,
  }) async {
    try {
      // 1. Çalışma saatleri kontrolü
      if (!_isWorkingHours(dateTime)) {
        debugPrint('⚠️ Çalışma saatleri dışında: ${dateTime.toString()}');
        return false;
      }

      // 2. Geçmiş tarih kontrolü
      if (dateTime.isBefore(DateTime.now())) {
        debugPrint('⚠️ Geçmiş tarih: ${dateTime.toString()}');
        return false;
      }

      // 3. Çakışan randevu kontrolü
      final startTime = dateTime;
      final endTime = dateTime.add(Duration(minutes: durationMinutes));

      var query = _firestore
          .collection('appointments')
          .where('doctorId', isEqualTo: doctorId)
          .where('status', whereIn: ['pending', 'confirmed']);

      final snapshot = await query.get();

      for (final doc in snapshot.docs) {
        // Güncelleme işleminde mevcut randevuyu atla
        if (excludeAppointmentId != null && doc.id == excludeAppointmentId) {
          continue;
        }

        final appointment = Appointment.fromFirestore(doc);
        final appointmentStart = appointment.dateTime;
        final appointmentEnd = appointment.dateTime.add(Duration(minutes: appointment.durationMinutes));

        // Zaman çakışması kontrolü
        if ((startTime.isBefore(appointmentEnd) && endTime.isAfter(appointmentStart)) ||
            (startTime.isAtSameMomentAs(appointmentStart))) {
          debugPrint('⚠️ Çakışan randevu bulundu: ${appointment.id}');
          return false;
        }
      }

      return true;
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (müsaitlik kontrolü):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Stack trace: $stackTrace');
      return false;
    } catch (e, stackTrace) {
      debugPrint('❌ Müsaitlik kontrol hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      return false;
    }
  }

  /// Çalışma saatleri kontrolü (09:00 - 18:00, Pazartesi-Cumartesi)
  bool _isWorkingHours(DateTime dateTime) {
    // Pazar günü çalışma yok
    if (dateTime.weekday == DateTime.sunday) {
      return false;
    }

    final hour = dateTime.hour;

    // 09:00 - 18:00 arası
    if (hour < 9 || hour >= 18) {
      return false;
    }

    // Öğle arası 12:00 - 13:00
    if (hour == 12) {
      return false;
    }

    return true;
  }

  /// Randevu güncelle
  Future<void> updateAppointment({
    required String appointmentId,
    DateTime? newDateTime,
    AppointmentStatus? newStatus,
    String? notes,
  }) async {
    try {
      final appointment = await getAppointment(appointmentId);
      if (appointment == null) {
        throw Exception('Randevu bulunamadı');
      }

      final updates = <String, dynamic>{
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      // Tarih güncellemesi varsa müsaitlik kontrolü
      if (newDateTime != null && newDateTime != appointment.dateTime) {
        final isAvailable = await checkAvailability(
          doctorId: appointment.doctorId,
          dateTime: newDateTime,
          durationMinutes: appointment.durationMinutes,
          excludeAppointmentId: appointmentId,
        );

        if (!isAvailable) {
          throw Exception('Yeni tarih müsait değil');
        }

        updates['dateTime'] = Timestamp.fromDate(newDateTime);
      }

      if (newStatus != null) {
        updates['status'] = newStatus.name;
      }

      if (notes != null) {
        updates['notes'] = notes;
      }

      await _firestore.collection('appointments').doc(appointmentId).update(updates);
      
      debugPrint('✅ Randevu güncellendi: $appointmentId');
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu güncelleme):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      
      String errorMessage = 'Randevu güncellenirken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = 'Randevu güncelleme izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
      } else if (e.code == 'not-found') {
        errorMessage = 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
      } else if (e.code == 'unavailable') {
        errorMessage = 'Firebase servisi şu anda kullanılamıyor. Lütfen internet bağlantınızı kontrol edin.';
      }
      
      throw Exception('$errorMessage (${e.code})');
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu güncelleme hatası: $e');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Randevu iptal et
  Future<void> cancelAppointment({
    required String appointmentId,
    String? cancelReason,
  }) async {
    try {
      await _firestore.collection('appointments').doc(appointmentId).update({
        'status': AppointmentStatus.cancelled.name,
        'cancelReason': cancelReason ?? 'İptal edildi',
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
      
      debugPrint('✅ Randevu iptal edildi: $appointmentId');
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu iptal):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      
      String errorMessage = 'Randevu iptal edilirken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = 'Randevu iptal izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
      } else if (e.code == 'not-found') {
        errorMessage = 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
      }
      
      throw Exception('$errorMessage (${e.code})');
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu iptal hatası: $e');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Randevuyu tamamen sil (doktor yetkisiyle)
  Future<void> deleteAppointment(String appointmentId) async {
    try {
      await _firestore.collection('appointments').doc(appointmentId).delete();
      debugPrint('✅ Randevu silindi: $appointmentId');
    } catch (e) {
      debugPrint('❌ Randevu silme hatası: $e');
      rethrow;
    }
  }

  /// Tek randevu getir
  Future<Appointment?> getAppointment(String appointmentId) async {
    try {
      final doc = await _firestore.collection('appointments').doc(appointmentId).get();
      if (!doc.exists) return null;
      return Appointment.fromFirestore(doc);
    } catch (e) {
      debugPrint('❌ Randevu getirme hatası: $e');
      return null;
    }
  }

  /// Hasta profil bilgilerini getir
  Future<Map<String, String>> getPatientInfo(String patientId) async {
    try {
      final doc = await _firestore.collection('patients_public').doc(patientId).get();
      if (doc.exists) {
        final data = doc.data() ?? {};
        return {
          'displayName': data['displayName'] ?? 'Hasta',
          'avatarUrl': data['avatarUrl'] ?? '',
        };
      }
      return {
        'displayName': 'Hasta',
        'avatarUrl': '',
      };
    } catch (e) {
      debugPrint('❌ Hasta bilgisi getirme hatası: $e');
      return {
        'displayName': 'Hasta',
        'avatarUrl': '',
      };
    }
  }

  /// Hastanın randevularını getir
  Stream<List<Appointment>> getPatientAppointments(String patientId) {
    return _firestore
        .collection('appointments')
        .where('patientId', isEqualTo: patientId)
        .orderBy('dateTime', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Appointment.fromFirestore(doc))
            .toList());
  }

  /// Doktorun randevularını getir
  /// Hem yeni ID formatını (saricitarik_at_gmail_com) hem de eski ID formatını (dr_tarik_sarici) kontrol eder
  Stream<List<Appointment>> getDoctorAppointments(String doctorId) {
    debugPrint('🔍 getDoctorAppointments: doctorId = $doctorId');
    
    try {
      // Eski ID formatını oluştur (dr_tarik_sarici gibi)
      String? legacyDoctorId;
      if (doctorId.contains('_at_')) {
        // Yeni format: saricitarik_at_gmail_com -> dr_tarik_sarici
        // Email'den eski ID formatını oluşturmayı dene
        try {
          final email = doctorId.replaceAll('_at_', '@').replaceAll('_', '.');
          final parts = email.split('@');
          if (parts.isNotEmpty) {
            final namePart = parts[0];
            // İsimden eski ID formatını oluştur (örnek: saricitarik -> tarik_sarici -> dr_tarik_sarici)
            // Bu basit bir yaklaşım, gerçekte doktor veritabanından alınmalı
            legacyDoctorId = 'dr_${namePart}';
          }
        } catch (e) {
          debugPrint('⚠️ Legacy ID oluşturulamadı: $e');
        }
      }
      
      debugPrint('   Legacy Doctor ID: $legacyDoctorId');
      
      // İki stream'i birleştir: yeni ID ve eski ID (eğer varsa)
      if (legacyDoctorId != null && legacyDoctorId != doctorId) {
        debugPrint('🔄 İki ID formatı ile randevu aranıyor: $doctorId ve $legacyDoctorId');
        
        // İki stream'i birleştir
        return Stream<List<Appointment>>.multi((controller) {
          StreamSubscription? newIdSub;
          StreamSubscription? legacyIdSub;
          List<Appointment> newIdAppointments = [];
          List<Appointment> legacyIdAppointments = [];
          final seenIds = <String>{};
          
          void emitMerged() {
            try {
              final merged = <Appointment>[];
              seenIds.clear(); // Her seferinde temizle
              
              // Yeni ID formatı ile bulunan randevular
              for (final apt in newIdAppointments) {
                if (!seenIds.contains(apt.id)) {
                  seenIds.add(apt.id);
                  merged.add(apt);
                  debugPrint('   ✅ Yeni ID randevu eklendi: ${apt.id}, status=${apt.status.name}');
                }
              }
              
              // Eski ID formatı ile bulunan randevular
              for (final apt in legacyIdAppointments) {
                if (!seenIds.contains(apt.id)) {
                  seenIds.add(apt.id);
                  merged.add(apt);
                  debugPrint('   ✅ Eski ID randevu eklendi: ${apt.id}, status=${apt.status.name}');
                }
              }
              
              // Client-side sorting
              merged.sort((a, b) => a.dateTime.compareTo(b.dateTime));
              
              debugPrint('✅ Birleştirilmiş randevular: ${merged.length} (Yeni ID: ${newIdAppointments.length}, Eski ID: ${legacyIdAppointments.length})');
              debugPrint('   Status dağılımı:');
              final statusCounts = <String, int>{};
              for (final apt in merged) {
                statusCounts[apt.status.name] = (statusCounts[apt.status.name] ?? 0) + 1;
              }
              statusCounts.forEach((status, count) {
                debugPrint('     - $status: $count');
              });
              
              controller.add(merged);
            } catch (e, stackTrace) {
              debugPrint('❌ Stream birleştirme hatası: $e');
              debugPrint('   Stack trace: $stackTrace');
              controller.add(<Appointment>[]);
            }
          }
          
          // Yeni ID formatı ile sorgu
          newIdSub = _firestore
              .collection('appointments')
              .where('doctorId', isEqualTo: doctorId)
              .snapshots()
              .listen(
                (snapshot) {
                  try {
                    newIdAppointments = snapshot.docs
                        .map((doc) {
                          try {
                            return Appointment.fromFirestore(doc);
                          } catch (e) {
                            debugPrint('❌ Randevu parse hatası (${doc.id}): $e');
                            return null;
                          }
                        })
                        .whereType<Appointment>()
                        .toList();
                    debugPrint('📊 Yeni ID formatı ile ${newIdAppointments.length} randevu bulundu');
                    emitMerged();
                  } catch (e, stackTrace) {
                    debugPrint('❌ Yeni ID stream hatası: $e');
                    debugPrint('   Stack trace: $stackTrace');
                    controller.add(<Appointment>[]);
                  }
                },
                onError: (error, stackTrace) {
                  debugPrint('❌ Yeni ID stream hatası: $error');
                  debugPrint('   Stack trace: $stackTrace');
                  controller.add(<Appointment>[]);
                },
              );
          
          // Eski ID formatı ile sorgu
          legacyIdSub = _firestore
              .collection('appointments')
              .where('doctorId', isEqualTo: legacyDoctorId)
              .snapshots()
              .listen(
                (snapshot) {
                  try {
                    legacyIdAppointments = snapshot.docs
                        .map((doc) {
                          try {
                            return Appointment.fromFirestore(doc);
                          } catch (e) {
                            debugPrint('❌ Randevu parse hatası (${doc.id}): $e');
                            return null;
                          }
                        })
                        .whereType<Appointment>()
                        .toList();
                    debugPrint('📊 Eski ID formatı ile ${legacyIdAppointments.length} randevu bulundu');
                    emitMerged();
                  } catch (e, stackTrace) {
                    debugPrint('❌ Eski ID stream hatası: $e');
                    debugPrint('   Stack trace: $stackTrace');
                    controller.add(<Appointment>[]);
                  }
                },
                onError: (error, stackTrace) {
                  debugPrint('❌ Eski ID stream hatası: $error');
                  debugPrint('   Stack trace: $stackTrace');
                  controller.add(<Appointment>[]);
                },
              );
          
          controller.onCancel = () {
            newIdSub?.cancel();
            legacyIdSub?.cancel();
          };
        });
      } else {
        // Sadece yeni ID formatı ile sorgu
        return _firestore
            .collection('appointments')
            .where('doctorId', isEqualTo: doctorId)
            .snapshots()
            .map((snapshot) {
              try {
                debugPrint('📊 getDoctorAppointments: ${snapshot.docs.length} randevu bulundu');
                
                final appointments = snapshot.docs
                    .map((doc) {
                      try {
                        return Appointment.fromFirestore(doc);
                      } catch (e, stackTrace) {
                        debugPrint('❌ Randevu parse hatası (${doc.id}): $e');
                        debugPrint('   Data: ${doc.data()}');
                        debugPrint('   Stack trace: $stackTrace');
                        return null;
                      }
                    })
                    .whereType<Appointment>()
                    .toList();
                
                // Client-side sorting
                appointments.sort((a, b) => a.dateTime.compareTo(b.dateTime));
                
                debugPrint('✅ getDoctorAppointments: ${appointments.length} geçerli randevu döndürülüyor');
                return appointments;
              } catch (e, stackTrace) {
                debugPrint('❌ getDoctorAppointments map hatası: $e');
                debugPrint('   Stack trace: $stackTrace');
                return <Appointment>[];
              }
            })
            .handleError((error, stackTrace) {
              debugPrint('❌ getDoctorAppointments stream hatası:');
              debugPrint('   Error: $error');
              debugPrint('   Stack trace: $stackTrace');
              
              if (error is FirebaseException) {
                debugPrint('   Firebase Code: ${error.code}');
                debugPrint('   Firebase Message: ${error.message}');
                debugPrint('   Firebase Plugin: ${error.plugin}');
              }
              
              return <Appointment>[];
            });
      }
    } catch (e, stackTrace) {
      debugPrint('❌ getDoctorAppointments başlatma hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      return Stream.value(<Appointment>[]);
    }
  }

  /// Belirli bir gün için müsait saatleri getir
  Future<List<DateTime>> getAvailableSlots({
    required String doctorId,
    required DateTime date,
    int slotDurationMinutes = 30,
  }) async {
    try {
      final availableSlots = <DateTime>[];
      
      // Çalışma saatleri: 09:00 - 12:00, 13:00 - 18:00
      final morningSlots = _generateTimeSlots(
        DateTime(date.year, date.month, date.day, 9, 0),
        DateTime(date.year, date.month, date.day, 12, 0),
        slotDurationMinutes,
      );
      
      final afternoonSlots = _generateTimeSlots(
        DateTime(date.year, date.month, date.day, 13, 0),
        DateTime(date.year, date.month, date.day, 18, 0),
        slotDurationMinutes,
      );
      
      final allSlots = [...morningSlots, ...afternoonSlots];
      
      // Her slot için müsaitlik kontrolü
      for (final slot in allSlots) {
        final isAvailable = await checkAvailability(
          doctorId: doctorId,
          dateTime: slot,
          durationMinutes: slotDurationMinutes,
        );
        
        if (isAvailable) {
          availableSlots.add(slot);
        }
      }
      
      return availableSlots;
    } catch (e) {
      debugPrint('❌ Müsait saat getirme hatası: $e');
      return [];
    }
  }

  /// Zaman dilimlerini oluştur
  List<DateTime> _generateTimeSlots(DateTime start, DateTime end, int intervalMinutes) {
    final slots = <DateTime>[];
    var current = start;
    
    while (current.isBefore(end)) {
      slots.add(current);
      current = current.add(Duration(minutes: intervalMinutes));
    }
    
    return slots;
  }

  /// Randevu onaylama (doktor için)
  Future<void> confirmAppointment(String appointmentId) async {
    try {
      debugPrint('✅ Randevu onaylanıyor: $appointmentId');
      await updateAppointment(
        appointmentId: appointmentId,
        newStatus: AppointmentStatus.confirmed,
      );
      debugPrint('✅ Randevu onaylandı: $appointmentId');
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu onaylama):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu onaylama hatası: $e');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Randevu reddetme (doktor için)
  Future<void> rejectAppointment(String appointmentId, {String? reason}) async {
    try {
      debugPrint('❌ Randevu reddediliyor: $appointmentId');
      debugPrint('   Reason: ${reason ?? 'Doktor tarafından reddedildi'}');
      
      final updates = <String, dynamic>{
        'status': AppointmentStatus.cancelled.name,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
        'cancelReason': reason ?? 'Doktor tarafından reddedildi',
      };
      
      await _firestore.collection('appointments').doc(appointmentId).update(updates);
      debugPrint('✅ Randevu reddedildi: $appointmentId');
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu reddetme):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      
      String errorMessage = 'Randevu reddedilirken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = 'Randevu reddetme izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
      } else if (e.code == 'not-found') {
        errorMessage = 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
      }
      
      throw Exception('$errorMessage (${e.code})');
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu reddetme hatası: $e');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Randevu tamamlama (doktor için)
  Future<void> completeAppointment(String appointmentId) async {
    try {
      debugPrint('✅ Randevu tamamlanıyor: $appointmentId');
      await updateAppointment(
        appointmentId: appointmentId,
        newStatus: AppointmentStatus.completed,
      );
      debugPrint('✅ Randevu tamamlandı: $appointmentId');
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu tamamlama):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu tamamlama hatası: $e');
      debugPrint('   Appointment ID: $appointmentId');
      debugPrint('   Stack trace: $stackTrace');
      rethrow;
    }
  }
}
