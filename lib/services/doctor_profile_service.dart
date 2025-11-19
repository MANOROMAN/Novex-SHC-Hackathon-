import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorProfileService {
  DoctorProfileService._();
  static final DoctorProfileService _instance = DoctorProfileService._();
  factory DoctorProfileService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _normalizeEmail(String email) => email.trim().toLowerCase();

  /// Returns the Firestore doctor document id for the given email if the doctor is active.
  Future<String?> getDoctorIdByEmail(String? email) async {
    if (email == null || email.trim().isEmpty) return null;
    final normalized = _normalizeEmail(email);
    final query = await _firestore
        .collection('doctors')
        .where('email', isEqualTo: normalized)
        .where('active', isEqualTo: true)
        .limit(1)
        .get();
    if (query.docs.isEmpty) return null;
    return query.docs.first.id;
  }

  /// Returns true if a doctor document exists for the given doctorId.
  Future<bool> doctorExists(String doctorId) async {
    if (doctorId.isEmpty) return false;
    final doc = await _firestore.collection('doctors').doc(doctorId).get();
    return doc.exists;
  }
}

