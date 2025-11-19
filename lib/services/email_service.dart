import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../config/emailjs_config.dart';

/// Lightweight email sending via EmailJS REST API (no Firebase).
/// Requires three compile-time defines:
/// - EMAILJS_SERVICE_ID
/// - EMAILJS_TEMPLATE_ID
/// - EMAILJS_PUBLIC_KEY
///
/// Add to your run config (example):
/// flutter run --dart-define=EMAILJS_SERVICE_ID=svc_xxx --dart-define=EMAILJS_TEMPLATE_ID=tpl_xxx --dart-define=EMAILJS_PUBLIC_KEY=pub_xxx
class EmailService {
  // Use --dart-define if provided; otherwise fall back to embedded config
  static final String _serviceId = const String.fromEnvironment(
    'EMAILJS_SERVICE_ID',
    defaultValue: EmailJsConfig.serviceId,
  );
  static final String _templateId = const String.fromEnvironment(
    'EMAILJS_TEMPLATE_ID',
    defaultValue: EmailJsConfig.templateId,
  );
  static final String _publicKey = const String.fromEnvironment(
    'EMAILJS_PUBLIC_KEY',
    defaultValue: EmailJsConfig.publicKey,
  );

  bool get isConfigured =>
      _serviceId.isNotEmpty && _templateId.isNotEmpty && _publicKey.isNotEmpty;

  /// Yapılandırma bilgilerini konsola yazdır (debug için)
  void printConfig() {
    debugPrint('📋 EmailJS Yapılandırması:');
    debugPrint('   Service ID: $_serviceId');
    debugPrint('   Template ID: $_templateId');
    debugPrint('   Public Key: ${_publicKey.isNotEmpty ? "${_publicKey.substring(0, 4)}..." : "BOŞ"}');
    debugPrint('   Yapılandırılmış: ${isConfigured ? "✅" : "❌"}');
  }

  /// Sends a simple email with subject and message body to [toEmail].
  /// Uses Firebase Cloud Function to bypass EmailJS browser-only restriction.
  /// Returns true if email was sent successfully.
  Future<bool> sendEmail({
    required String toEmail,
    required String subject,
    required String message,
    Map<String, String>? extraParams,
  }) async {
    // Use Firebase Cloud Function instead of direct EmailJS API
    // This bypasses the "API calls are disabled for non-browser applications" restriction
    return await _sendEmailViaCloudFunction(
      toEmail: toEmail,
      subject: subject,
      message: message,
      extraParams: extraParams,
    );
  }

  /// Sends email via Firebase Cloud Function (bypasses EmailJS browser restriction)
  Future<bool> _sendEmailViaCloudFunction({
    required String toEmail,
    required String subject,
    required String message,
    Map<String, String>? extraParams,
  }) async {
    const functionsBase = 'https://us-central1-smile-hair-clinic-app.cloudfunctions.net';
    
    try {
      // ÖNEMLİ: Tüm loglar Flutter konsolunda görünecek (VS Code/Android Studio terminal)
      debugPrint('═══════════════════════════════════════════════════════');
      debugPrint('📧 EmailService: Firebase Function üzerinden e-posta gönderiliyor');
      debugPrint('   To: $toEmail');
      debugPrint('   Subject: $subject');
      debugPrint('   Code: ${extraParams?['code'] ?? extraParams?['passcode'] ?? 'YOK'}');
      debugPrint('   Function URL: $functionsBase/sendDoctorLoginCode');
      debugPrint('═══════════════════════════════════════════════════════');

      final stopwatch = Stopwatch()..start();
      debugPrint('📧 EmailService: Firebase Function çağrısı başlatıldı - ${DateTime.now()}');
      
      final requestBody = {
        'email': toEmail,
        'subject': subject,
        'message': message,
        'code': extraParams?['code'] ?? extraParams?['passcode'] ?? '',
        'passcode': extraParams?['passcode'] ?? extraParams?['code'] ?? '',
        'timeString': extraParams?['time'] ?? '',
      };
      
      debugPrint('📧 EmailService: Request Body: ${jsonEncode(requestBody)}');
      
      final response = await http.post(
        Uri.parse('$functionsBase/sendDoctorLoginCode'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      ).timeout(
        const Duration(seconds: 15), // Timeout 15 saniyeye düşürüldü
        onTimeout: () {
          stopwatch.stop();
          debugPrint('❌ EmailService: Firebase Function isteği zaman aşımına uğradı (${stopwatch.elapsedMilliseconds}ms)');
          throw Exception('E-posta gönderimi zaman aşımına uğradı. Lütfen tekrar deneyin.');
        },
      );
      
      stopwatch.stop();
      debugPrint('═══════════════════════════════════════════════════════');
      debugPrint('📧 EmailService: Firebase Function yanıtı alındı');
      debugPrint('   Süre: ${stopwatch.elapsedMilliseconds}ms');
      debugPrint('   Zaman: ${DateTime.now()}');
      debugPrint('   Response Status: ${response.statusCode}');
      debugPrint('   Response Body: ${response.body}');
      debugPrint('═══════════════════════════════════════════════════════');
      
      // Backend'den gelen hata mesajlarını kontrol et
      if (response.statusCode == 403) {
        try {
          final errorData = jsonDecode(response.body) as Map<String, dynamic>;
          final errorMessage = errorData['message'] as String? ?? 'Bu e-posta adresi doktor olarak kayıtlı değil.';
          debugPrint('❌ EmailService: Doktor değil - $errorMessage');
          throw Exception(errorMessage);
        } catch (e) {
          if (e is Exception) rethrow;
          throw Exception('Bu e-posta adresi doktor olarak kayıtlı değil.');
        }
      }

      if (response.statusCode == 200) {
        try {
          final responseData = jsonDecode(response.body);
          if (responseData is Map && responseData['ok'] == true) {
            debugPrint('✅ EmailService: E-posta başarıyla gönderildi');
            return true;
          }
        } catch (e) {
          debugPrint('⚠️ EmailService: Response parse edilemedi ama 200 status: $e');
        }
        // 200 status code varsa başarılı sayalım
        return true;
      } else {
        String errorMessage = response.body;
        try {
          final errorData = jsonDecode(response.body);
          if (errorData is Map && errorData['message'] != null) {
            errorMessage = errorData['message'].toString();
          } else if (errorData is Map && errorData['error'] != null) {
            errorMessage = errorData['error'].toString();
          }
        } catch (_) {}

        debugPrint('═══════════════════════════════════════════════════════');
        debugPrint('❌ EmailService: E-posta gönderilemedi');
        debugPrint('   Status Code: ${response.statusCode}');
        debugPrint('   Hata: $errorMessage');
        debugPrint('   Response Body: ${response.body}');
        debugPrint('═══════════════════════════════════════════════════════');
        return false;
      }
    } catch (e, stackTrace) {
      debugPrint('═══════════════════════════════════════════════════════');
      debugPrint('❌ EmailService: Exception oluştu');
      debugPrint('   Hata Tipi: ${e.runtimeType}');
      debugPrint('   Hata Mesajı: $e');
      debugPrint('   Zaman: ${DateTime.now()}');
      
      // Network hatalarını daha açıklayıcı hale getir
      if (e.toString().contains('SocketException') || e.toString().contains('Failed host lookup')) {
        debugPrint('   🔍 Sorun: İnternet bağlantısı yok veya sunucuya erişilemiyor');
        debugPrint('   💡 Çözüm: İnternet bağlantınızı kontrol edin');
      } else if (e.toString().contains('TimeoutException') || e.toString().contains('timeout')) {
        debugPrint('   🔍 Sorun: İstek zaman aşımına uğradı - Cloud Function yanıt vermiyor');
        debugPrint('   💡 Çözüm: Firebase Console\'da Cloud Function loglarını kontrol edin');
      } else if (e.toString().contains('Connection refused') || e.toString().contains('Connection closed')) {
        debugPrint('   🔍 Sorun: Cloud Function bağlantı hatası');
        debugPrint('   💡 Çözüm: Firebase Console\'da Function durumunu kontrol edin');
      } else {
        debugPrint('   🔍 Sorun: Bilinmeyen hata');
        debugPrint('   💡 Çözüm: Firebase Console loglarını kontrol edin');
      }
      
      debugPrint('   StackTrace: $stackTrace');
      debugPrint('═══════════════════════════════════════════════════════');
      
      return false;
    }
  }

  /// DEPRECATED: Direct EmailJS API call (doesn't work from mobile apps)
  /// Kept for reference but not used anymore
  @Deprecated('Use sendEmail which calls Firebase Cloud Function')
  Future<bool> sendEmailDirect({
    required String toEmail,
    required String subject,
    required String message,
    Map<String, String>? extraParams,
  }) async {
    if (!isConfigured) {
      debugPrint('❌ EmailJS: Yapılandırma eksik - ServiceId: $_serviceId, TemplateId: $_templateId, PublicKey: ${_publicKey.isNotEmpty ? "***" : "BOŞ"}');
      return false;
    }

    // EmailJS API v1.0 endpoint
    final uri = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    
    // EmailJS API format - template_params içinde tüm değişkenler olmalı
    final templateParams = <String, dynamic>{
      'to_email': toEmail,
      'subject': subject,
      'message': message,
      'to_name': toEmail.split('@')[0], // Email'in kullanıcı adı kısmı
      ...?extraParams,
    };
    
    final payload = <String, dynamic>{
      'service_id': _serviceId,
      'template_id': _templateId,
      'user_id': _publicKey, // Public Key = User ID
      'template_params': templateParams,
    };

    try {
      debugPrint('📧 EmailJS: E-posta gönderiliyor - To: $toEmail, Subject: $subject');
      debugPrint('📧 EmailJS: ServiceId: $_serviceId, TemplateId: $_templateId');
      debugPrint('📧 EmailJS: PublicKey: ${_publicKey.isNotEmpty ? "${_publicKey.substring(0, 8)}..." : "BOŞ"}');
      debugPrint('📧 EmailJS: Payload: ${jsonEncode(payload)}');
      
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          debugPrint('❌ EmailJS: İstek zaman aşımına uğradı (30 saniye)');
          throw Exception('EmailJS isteği zaman aşımına uğradı');
        },
      );

      debugPrint('📧 EmailJS: Response Status: ${response.statusCode}');
      debugPrint('📧 EmailJS: Response Headers: ${response.headers}');
      debugPrint('📧 EmailJS: Response Body: ${response.body}');

      // EmailJS başarılı yanıt kontrolü
      if (response.statusCode == 200) {
        // Response body'yi parse et
        try {
          final responseData = jsonDecode(response.body);
          if (responseData is Map) {
            // EmailJS başarılı yanıt formatı: {"text": "OK"} veya {"status": 200, "text": "OK"}
            if (responseData['text'] == 'OK' || responseData['status'] == 200) {
              debugPrint('✅ EmailJS: E-posta başarıyla gönderildi (200 OK)');
              return true;
            } else {
              debugPrint('⚠️ EmailJS: Beklenmeyen yanıt formatı: $responseData');
              // Yine de 200 döndüyse başarılı sayalım
              return true;
            }
          } else {
            // JSON değil ama 200 döndü
            debugPrint('⚠️ EmailJS: JSON olmayan yanıt ama 200 status: ${response.body}');
            return true;
          }
        } catch (e) {
          // Response body JSON değilse, sadece status code'a bak
          final bodyText = response.body.toLowerCase();
          if (bodyText.contains('ok') || bodyText.isEmpty || bodyText == 'null') {
            debugPrint('✅ EmailJS: E-posta başarıyla gönderildi (200 - OK içeriyor)');
            return true;
          }
          debugPrint('⚠️ EmailJS: Response parse edilemedi ama 200 status: $e');
          debugPrint('   Body: ${response.body}');
          // 200 status code varsa başarılı sayalım
          return true;
        }
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint('✅ EmailJS: E-posta başarıyla gönderildi (${response.statusCode})');
        return true;
      } else {
        // Hata yanıtını parse et
        String errorMessage = response.body;
        String? errorDetails;
        try {
          final errorData = jsonDecode(response.body);
          if (errorData is Map) {
            if (errorData['text'] != null) {
            errorMessage = errorData['text'].toString();
            } else if (errorData['error'] != null) {
            errorMessage = errorData['error'].toString();
          }
            if (errorData['message'] != null) {
              errorDetails = errorData['message'].toString();
            }
          }
        } catch (e) {
          debugPrint('⚠️ EmailJS: Hata yanıtı parse edilemedi: $e');
        }
        
        debugPrint('❌ EmailJS: E-posta gönderilemedi');
        debugPrint('   Status Code: ${response.statusCode}');
        debugPrint('   Hata Mesajı: $errorMessage');
        if (errorDetails != null) {
          debugPrint('   Hata Detayları: $errorDetails');
        }
        debugPrint('   Response Body: ${response.body}');
        debugPrint('   Request URL: $uri');
        debugPrint('   Service ID: $_serviceId');
        debugPrint('   Template ID: $_templateId');
        return false;
      }
    } catch (e, stackTrace) {
      debugPrint('❌ EmailJS: Exception oluştu');
      debugPrint('   Hata Tipi: ${e.runtimeType}');
      debugPrint('   Hata Mesajı: $e');
      debugPrint('   StackTrace: $stackTrace');
      return false;
    }
  }

  /// Convenience helper to verify configuration with a single call.
  /// Use your own email as [toEmail]. Requires:
  /// - EMAILJS_SERVICE_ID=service_w0lky2n (örneğiniz)
  /// - EMAILJS_TEMPLATE_ID=template_xxx (EmailJS şablon ID'niz)
  /// - EMAILJS_PUBLIC_KEY=public_xxx (EmailJS public key)
  Future<bool> sendTestEmail(String toEmail) {
    return sendEmail(
      toEmail: toEmail,
      subject: 'EmailJS Test - Gmail Service',
      message: 'Bu bir test e-postasıdır. Yapılandırma başarılı görünüyor.',
    );
  }
}


