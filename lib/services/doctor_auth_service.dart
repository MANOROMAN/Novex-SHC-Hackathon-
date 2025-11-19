import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'email_service.dart';

/// Handles doctor login via email OTP (non-Firebase email provider).
/// Firestore collections used:
/// - doctors (docs keyed by UID or generated id, fields: email, name, active)
/// - doctor_logins (temporary OTP codes, expiresAt, email)
class DoctorAuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final EmailService _emailService = EmailService();
  static const String _functionsBase =
      'https://us-central1-smile-hair-clinic-app.cloudfunctions.net';

  /// Deterministic doc id for OTP without requiring reads
  String _otpDocId(String email, String code) {
    final normalized = email.trim().toLowerCase();
    return 'login_${normalized.replaceAll('@', '_at_').replaceAll('.', '_')}_$code';
  }

  /// Generates 6-digit OTP, stores it in doctor_logins (deterministic id),
  /// and tries to send email. Returns true if OTP created (email may be false).
  Future<bool> sendLoginCode(String email) async {
    final normalized = email.trim().toLowerCase();

    // GÜVENLİK: Önce email'in doktor olup olmadığını kontrol et
    debugPrint('🔍 DoctorAuth: Email doktor kontrolü yapılıyor: $normalized');
    try {
      final doctorQuery = await _firestore
          .collection('doctors')
          .where('email', isEqualTo: normalized)
          .where('active', isEqualTo: true)
          .limit(1)
          .get();

      if (doctorQuery.docs.isEmpty) {
        debugPrint('❌ DoctorAuth: Email doktor değil veya aktif değil: $normalized');
        throw Exception('Bu e-posta adresi doktor olarak kayıtlı değil veya aktif değil.');
      }

      debugPrint('✅ DoctorAuth: Email doktor olarak doğrulandı: $normalized');
    } catch (e) {
      debugPrint('❌ DoctorAuth: Doktor kontrolü hatası: $e');
      rethrow;
    }

    final code = _generateCode();
    final now = DateTime.now();
    final expiresAt = now.add(const Duration(minutes: 10));
    final expiresAtLocal = expiresAt.toLocal();
    final hh = expiresAtLocal.hour.toString().padLeft(2, '0');
    final mm = expiresAtLocal.minute.toString().padLeft(2, '0');
    final timeString = '$hh:$mm';

    final docId = _otpDocId(normalized, code);
    await _firestore.collection('doctor_logins').doc(docId).set({
      'email': normalized,
      'code': code,
      'createdAt': FieldValue.serverTimestamp(),
      'expiresAt': Timestamp.fromDate(expiresAt),
      'used': false,
    });

    // EmailJS yapılandırması kontrolü
    if (!_emailService.isConfigured) {
      debugPrint('❌ DoctorAuth: EmailJS yapılandırması eksik');
      _emailService.printConfig();
      throw Exception('EmailJS yapılandırması eksik. Lütfen EMAILJS_SERVICE_ID, EMAILJS_TEMPLATE_ID ve EMAILJS_PUBLIC_KEY değerlerini kontrol edin.');
    }

    // Yapılandırmayı konsola yazdır
    _emailService.printConfig();
    debugPrint('📧 DoctorAuth: Doğrulama kodu gönderiliyor');
    debugPrint('   Email: $normalized');
    debugPrint('   Kod: $code');
    debugPrint('   Süre: $timeString');

    try {
      // EmailJS ile doğrulama kodu gönder
      final emailSent = await _emailService.sendEmail(
        toEmail: normalized,
        subject: 'Giriş Kodu (Doktor) - $code',
        message:
            'Merhaba,\n\nGiriş için tek kullanımlık doğrulama kodunuz: $code\nBu kod 10 dakika boyunca geçerlidir.\n\nİyi çalışmalar.',
        extraParams: {
          'code': code,         // bizim standart placeholder
          'passcode': code,     // şablonunuzdaki {{passcode}} ile uyum
          'time': timeString,   // şablonunuzdaki {{time}} ile uyum
        },
      );

      // Email gönderimi başarısız olursa hata fırlat
      if (!emailSent) {
        debugPrint('❌ DoctorAuth: E-posta gönderilemedi - EmailJS false döndü');
        throw Exception('E-posta gönderilemedi. Lütfen EmailJS yapılandırmasını ve konsol loglarını kontrol edin. (Detaylı loglar için Flutter konsolunu kontrol edin)');
      }

      debugPrint('✅ DoctorAuth: Doğrulama kodu başarıyla gönderildi');
    } catch (e, stackTrace) {
      debugPrint('❌ DoctorAuth: sendEmail çağrısında exception oluştu');
      debugPrint('   Hata: $e');
      debugPrint('   StackTrace: $stackTrace');
      rethrow;
    }

    // cache last email to ease UX in verification screen
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('doctor_last_email', normalized);
      await prefs.setString('doctor_last_code', code); // for local testing
    } catch (_) {}

    // Return true if OTP created and email sent successfully
    return true;
  }

  /// Verifies the code by constructing deterministic doc id and updating it.
  /// On success, signs in with a custom Firebase token returned by Cloud Function.
  Future<bool> verifyCode(String email, String code) async {
    final normalized = email.trim().toLowerCase();
    final trimmedCode = code.trim();
    
    debugPrint('🔐 DoctorAuth: Kod doğrulanıyor');
    debugPrint('   Email: $normalized');
    debugPrint('   Kod: $trimmedCode');
    debugPrint('   DocId: ${_otpDocId(normalized, trimmedCode)}');
    
    try {
      final response = await http.post(
        Uri.parse('$_functionsBase/verifyDoctorLogin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': normalized, 'code': trimmedCode}),
      );

      debugPrint('🔐 DoctorAuth: Response Status: ${response.statusCode}');
      debugPrint('🔐 DoctorAuth: Response Body: ${response.body}');

      if (response.statusCode < 200 || response.statusCode >= 300) {
        try {
          final errorData = jsonDecode(response.body) as Map<String, dynamic>;
          final error = errorData['error'] as String?;
          debugPrint('❌ DoctorAuth: Doğrulama hatası - $error');
          
          // Hata mesajını daha açıklayıcı hale getir
          if (error == 'invalid_code') {
            debugPrint('❌ DoctorAuth: Kod bulunamadı - DocId: ${_otpDocId(normalized, trimmedCode)}');
          } else if (error == 'code_used') {
            debugPrint('❌ DoctorAuth: Kod daha önce kullanılmış');
          } else if (error == 'code_expired') {
            debugPrint('❌ DoctorAuth: Kod süresi dolmuş');
          } else if (error == 'doctor_not_found') {
            debugPrint('❌ DoctorAuth: Doktor bulunamadı - Email: $normalized');
          }
        } catch (_) {
          debugPrint('❌ DoctorAuth: Hata yanıtı parse edilemedi');
        }
        return false;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final token = data['token'] as String?;
      final doctorId = data['doctorId'] as String?;
      final doctorName = (data['doctorName'] as String?) ?? 'Doktor';
      final requiresManualAuth = data['requiresManualAuth'] as bool? ?? false;
      final uid = data['uid'] as String?;
      
      if (doctorId == null) {
        debugPrint('❌ DoctorAuth: doctorId eksik');
        return false;
      }

      // If custom token creation failed, we still mark as authenticated
      // but skip Firebase Auth sign-in
      if (requiresManualAuth && uid != null) {
        debugPrint('⚠️ DoctorAuth: Custom token oluşturulamadı, manuel auth kullanılıyor');
        // We'll skip Firebase Auth and rely on local session
      } else if (token != null) {
        await FirebaseAuth.instance.signInWithCustomToken(token);
      } else {
        debugPrint('❌ DoctorAuth: Token eksik');
        return false;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_doctor_authenticated', true);
      await prefs.setString('doctor_email', normalized);
      await prefs.setString('doctor_id', doctorId);
      await prefs.setString('doctor_name', doctorName);

      debugPrint('✅ DoctorAuth: Kod başarıyla doğrulandı');
      debugPrint('   Doctor ID kaydedildi: $doctorId');
      debugPrint('   Doctor Email: $normalized');
      debugPrint('   Doctor Name: $doctorName');
      return true;
    } catch (e, stackTrace) {
      debugPrint('❌ DoctorAuth: verifyCode exception');
      debugPrint('   Hata: $e');
      debugPrint('   StackTrace: $stackTrace');
      return false;
    }
  }

  /// Clears the local doctor session flag (does not affect Firebase auth).
  Future<void> signOutDoctor() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('is_doctor_authenticated');
    await prefs.remove('doctor_email');
    await prefs.remove('doctor_id');
    await prefs.remove('doctor_name');
    // GÜVENLİK: Önceki giriş email'ini de temizle
    await prefs.remove('doctor_last_email');
    await prefs.remove('doctor_last_code');
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.uid.startsWith('doctor_')) {
      await FirebaseAuth.instance.signOut();
    }
    debugPrint('🔓 DoctorAuth: Doktor çıkış yaptı, email cache temizlendi');
  }

  Future<bool> get isDoctorAuthenticated async {
    final prefs = await SharedPreferences.getInstance();
    final flag = prefs.getBool('is_doctor_authenticated') ?? false;
    final doctorEmail = prefs.getString('doctor_email');
    final doctorId = prefs.getString('doctor_id');
    
    // Eğer SharedPreferences'da doktor bilgileri varsa, authenticated sayılır
    // (requiresManualAuth durumunda Firebase Auth kullanılmıyor)
    if (flag && doctorEmail != null && doctorEmail.isNotEmpty && doctorId != null && doctorId.isNotEmpty) {
      return true;
    }
    
    // Fallback: Firebase Auth kontrolü (normal auth durumu için)
    final currentUser = FirebaseAuth.instance.currentUser;
    final isDoctorUser = currentUser != null && currentUser.uid.startsWith('doctor_');
    return flag && isDoctorUser;
  }

  Future<String?> getStoredDoctorId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('doctor_id');
  }

  /// DEV/Setup: Adds a doctor record if missing. Use once to seed doctors.
  Future<void> addDoctor(String email, {String? name}) async {
    final normalized = email.trim().toLowerCase();
    if (normalized.isEmpty) {
      throw Exception('Doktor e-postası boş olamaz');
    }
    // Deterministic doctor doc id to avoid reads
    final docId =
        normalized.replaceAll('@', '_at_').replaceAll('.', '_');
    final ref = _firestore.collection('doctors').doc(docId);
    await ref.set({
      'email': normalized,
      'active': true,
      if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  String _generateCode() {
    final rng = Random.secure();
    final n = rng.nextInt(900000) + 100000; // 100000 - 999999
    return n.toString();
    }
}


