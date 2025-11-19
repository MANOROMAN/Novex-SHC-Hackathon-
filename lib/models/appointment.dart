import 'package:cloud_firestore/cloud_firestore.dart';

/// Randevu durumu
enum AppointmentStatus {
  pending,    // Beklemede (onay bekliyor)
  confirmed,  // Onaylandı
  completed,  // Tamamlandı
  cancelled,  // İptal edildi
}

/// Randevu tipi
enum AppointmentType {
  consultation,  // Konsültasyon
  checkup,       // Kontrol
  surgery,       // Ameliyat
  followUp,      // Takip
}

/// Randevu modeli
class Appointment {
  final String id;
  final String patientId;
  final String patientName;
  final String doctorId;
  final String doctorName;
  final DateTime dateTime;
  final AppointmentStatus status;
  final AppointmentType type;
  final String notes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? cancelReason;
  final int durationMinutes; // Randevu süresi (dakika)

  Appointment({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.doctorId,
    required this.doctorName,
    required this.dateTime,
    required this.status,
    required this.type,
    this.notes = '',
    required this.createdAt,
    this.updatedAt,
    this.cancelReason,
    this.durationMinutes = 30, // Varsayılan 30 dakika
  });

  /// Firestore'dan oluştur
  factory Appointment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Appointment(
      id: doc.id,
      patientId: data['patientId'] ?? '',
      patientName: data['patientName'] ?? 'Bilinmeyen',
      doctorId: data['doctorId'] ?? '',
      doctorName: data['doctorName'] ?? 'Doktor',
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      status: _parseStatus(data['status']),
      type: _parseType(data['type']),
      notes: data['notes'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
      cancelReason: data['cancelReason'],
      durationMinutes: data['durationMinutes'] ?? 30,
    );
  }

  /// Firestore'a map olarak dönüştür
  Map<String, dynamic> toMap() {
    return {
      'patientId': patientId,
      'patientName': patientName,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'dateTime': Timestamp.fromDate(dateTime),
      'status': status.name,
      'type': type.name,
      'notes': notes,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'cancelReason': cancelReason,
      'durationMinutes': durationMinutes,
    };
  }

  /// String'den AppointmentStatus parse et
  static AppointmentStatus _parseStatus(String? status) {
    switch (status) {
      case 'pending':
        return AppointmentStatus.pending;
      case 'confirmed':
        return AppointmentStatus.confirmed;
      case 'completed':
        return AppointmentStatus.completed;
      case 'cancelled':
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.pending;
    }
  }

  /// String'den AppointmentType parse et
  static AppointmentType _parseType(String? type) {
    switch (type) {
      case 'consultation':
        return AppointmentType.consultation;
      case 'checkup':
        return AppointmentType.checkup;
      case 'surgery':
        return AppointmentType.surgery;
      case 'followUp':
        return AppointmentType.followUp;
      default:
        return AppointmentType.checkup;
    }
  }

  /// Randevu durumu türkçe text
  String get statusText {
    switch (status) {
      case AppointmentStatus.pending:
        return 'Onay Bekliyor';
      case AppointmentStatus.confirmed:
        return 'Onaylandı';
      case AppointmentStatus.completed:
        return 'Tamamlandı';
      case AppointmentStatus.cancelled:
        return 'İptal Edildi';
    }
  }

  /// Randevu tipi türkçe text
  String get typeText {
    switch (type) {
      case AppointmentType.consultation:
        return 'Konsültasyon';
      case AppointmentType.checkup:
        return 'Kontrol';
      case AppointmentType.surgery:
        return 'Ameliyat';
      case AppointmentType.followUp:
        return 'Takip';
    }
  }

  /// Copy with metodu
  Appointment copyWith({
    String? id,
    String? patientId,
    String? patientName,
    String? doctorId,
    String? doctorName,
    DateTime? dateTime,
    AppointmentStatus? status,
    AppointmentType? type,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? cancelReason,
    int? durationMinutes,
  }) {
    return Appointment(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      type: type ?? this.type,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cancelReason: cancelReason ?? this.cancelReason,
      durationMinutes: durationMinutes ?? this.durationMinutes,
    );
  }
}
