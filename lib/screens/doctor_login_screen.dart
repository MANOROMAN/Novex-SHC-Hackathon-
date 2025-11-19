import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../services/doctor_auth_service.dart';
import '../theme/app_theme.dart';

class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({super.key});

  @override
  State<DoctorLoginScreen> createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _service = DoctorAuthService();
  bool _isLoading = false;
  bool _isVerifying = false;
  String? _error;
  String? _info;

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Email önbelleği GÜVENLİK nedeniyle kaldırıldı
    _codeController.addListener(() {
      setState(() {}); // Buton durumunu güncellemek için
    });
  }

  Future<void> _requestCode() async {
    debugPrint('🔄 DoctorLogin: _requestCode başlatıldı');
    setState(() {
      _isLoading = true;
      _error = null;
      _info = null;
    });
    debugPrint('🔄 DoctorLogin: _isLoading = true set edildi');
    
    final email = _emailController.text.trim();
    final l10n = AppLocalizations.of(context);
    if (email.isEmpty) {
      debugPrint('⚠️ DoctorLogin: Email boş, hata gösteriliyor');
      setState(() {
        _isLoading = false;
        _error = l10n?.pleaseEnterDoctorEmail ?? 'Lütfen doktor e-postanızı girin.';
      });
      return;
    }
    try {
      debugPrint('═══════════════════════════════════════════════════════');
      debugPrint('🚀 DoctorLogin: Kod gönderme işlemi başlatıldı');
      debugPrint('   Email: $email');
      debugPrint('   Zaman: ${DateTime.now()}');
      debugPrint('═══════════════════════════════════════════════════════');
      
      await _service.sendLoginCode(email);
      debugPrint('✅ DoctorLogin: sendLoginCode başarıyla tamamlandı');
      
      // Debug modunda kodu konsola yazdır
      if (kDebugMode) {
        final prefs = await SharedPreferences.getInstance();
        final lastCode = prefs.getString('doctor_last_code');
        if (lastCode != null) {
          debugPrint('═══════════════════════════════════════════════════════');
          debugPrint('🔑 DEBUG: Doğrulama kodu: $lastCode');
          debugPrint('═══════════════════════════════════════════════════════');
        }
      }
      
      if (!mounted) {
        debugPrint('⚠️ DoctorLogin: Widget unmounted, setState atlanıyor');
        return;
      }
      
      debugPrint('✅ DoctorLogin: Başarı mesajı gösteriliyor');
      setState(() {
        _info = '✅ Doğrulama kodu e-postanıza gönderildi!\n\nKod 10 dakika geçerlidir.\n\nTest için: Erhan Bey (atalare@itu.edu.tr) bu mail ile girerseniz doğrulama kodu gelecektir.${kDebugMode ? "\n\n(DEBUG: Konsol loglarında kodu görebilirsiniz)" : ""}';
        _codeController.clear();
      });
    } catch (e, stackTrace) {
      debugPrint('═══════════════════════════════════════════════════════');
      debugPrint('❌ DoctorLogin: Hata oluştu');
      debugPrint('   Exception: $e');
      debugPrint('   Exception Type: ${e.runtimeType}');
      debugPrint('   Zaman: ${DateTime.now()}');
      debugPrint('   StackTrace: $stackTrace');
      debugPrint('═══════════════════════════════════════════════════════');
      
      if (!mounted) {
        debugPrint('⚠️ DoctorLogin: Widget unmounted (error handler), setState atlanıyor');
        return;
      }
      setState(() {
        final errorMsg = e.toString();
        _error = '❌ Kod gönderilemedi!\n\n$errorMsg\n\n📋 Lütfen Flutter konsol loglarını kontrol edin:\n• VS Code: Terminal sekmesi\n• Android Studio: Run sekmesi\n• Tüm "📧" ve "❌" işaretli logları kontrol edin';
      });
    } finally {
      if (!mounted) {
        debugPrint('⚠️ DoctorLogin: Widget unmounted (finally), setState atlanıyor');
        return;
      }
      debugPrint('🔄 DoctorLogin: _isLoading = false set ediliyor (finally block)');
      setState(() {
        _isLoading = false;
      });
      debugPrint('✅ DoctorLogin: _requestCode tamamlandı');
    }
  }

  Future<void> _verifyCode() async {
    setState(() {
      _isVerifying = true;
      _error = null;
    });
    final email = _emailController.text.trim();
    final code = _codeController.text.trim();
    final l10n = AppLocalizations.of(context);
    if (email.isEmpty || code.isEmpty) {
      setState(() {
        _isVerifying = false;
        _error = l10n?.emailAndCodeRequired ?? 'E-posta ve kod zorunludur.';
      });
      return;
    }
    if (code.length != 6) {
      setState(() {
        _isVerifying = false;
        _error = l10n?.codeMustBe6Digits ?? 'Kod 6 haneli olmalıdır.';
      });
      return;
    }
    try {
      final ok = await _service.verifyCode(email, code);
      if (!mounted) return;
      if (ok) {
        Navigator.pushNamedAndRemoveUntil(context, '/doctor-dashboard', (r) => false);
      } else {
        final l10n = AppLocalizations.of(context);
        setState(() {
          _error = l10n?.codeInvalidOrExpired ?? 'Kod geçersiz veya süresi dolmuş. Lütfen konsol loglarını kontrol edin.';
        });
      }
    } catch (e) {
      if (!mounted) return;
      debugPrint('❌ DoctorLogin: verifyCode exception: $e');
      final l10n = AppLocalizations.of(context);
      setState(() {
        _error = l10n?.verificationFailed(e.toString()) ?? 'Doğrulama başarısız: $e';
      });
    } finally {
      if (!mounted) return;
      setState(() {
        _isVerifying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = AppTheme.getBackgroundColor(context);
    final cardColor = AppTheme.getCardColor(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: isDark
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.backgroundDark,
                        AppTheme.backgroundDark.withOpacity(0.95),
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.primaryGreen.withOpacity(0.05),
                        AppTheme.backgroundLight,
                      ],
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  // Logo ve Başlık
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppTheme.primaryGreen.withOpacity(0.15)
                          : AppTheme.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDark
                            ? AppTheme.primaryGreen.withOpacity(0.4)
                            : AppTheme.primaryGreen.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppTheme.primaryGreen.withOpacity(0.25)
                                : AppTheme.primaryGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.local_hospital,
                            color: AppTheme.primaryGreen,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n?.doctorLogin ?? 'Doktor Girişi',
                                style: TextStyle(
                                  color: textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                l10n?.doctorLoginDescription ?? 'Kayıtlı doktor e-postanızı girin, doğrulama kodu isteyin ve giriş yapın.',
                                style: TextStyle(
                                  color: textSecondary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Giriş Formu
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withOpacity(0.4)
                              : AppTheme.primaryGreen.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      border: Border.all(
                        color: isDark
                            ? AppTheme.primaryGreen.withOpacity(0.3)
                            : Colors.grey.shade200,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // E-posta alanı
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: textPrimary),
                          decoration: InputDecoration(
                            labelText: l10n?.doctorEmail ?? 'Doktor E-posta',
                            labelStyle: TextStyle(color: textSecondary),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: AppTheme.primaryGreen,
                            ),
                            hintText: l10n?.doctorEmailHint ?? 'doktor@example.com',
                            hintStyle: TextStyle(color: textSecondary.withOpacity(0.5)),
                            filled: true,
                            fillColor: isDark
                                ? Colors.grey.shade900.withOpacity(0.5)
                                : Colors.grey.shade50,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppTheme.primaryGreen,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Doğrulama kodu alanı
                        TextField(
                          controller: _codeController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 24,
                            letterSpacing: 8,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          decoration: InputDecoration(
                            labelText: l10n?.verificationCode ?? '6 Haneli Doğrulama Kodu',
                            labelStyle: TextStyle(color: textSecondary),
                            prefixIcon: Icon(
                              Icons.verified_outlined,
                              color: AppTheme.primaryGreen,
                            ),
                            hintText: l10n?.verificationCodeHint ?? '000000',
                            hintStyle: TextStyle(
                              color: textSecondary.withOpacity(0.3),
                              fontSize: 24,
                              letterSpacing: 8,
                            ),
                            filled: true,
                            fillColor: isDark
                                ? Colors.grey.shade900.withOpacity(0.5)
                                : Colors.grey.shade50,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppTheme.primaryGreen,
                                width: 2,
                              ),
                            ),
                            counterText: '',
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Butonlar
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _isLoading || _isVerifying ? null : _requestCode,
                                icon: _isLoading
                                    ? SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: AppTheme.primaryGreen,
                                        ),
                                      )
                                    : const Icon(Icons.email_outlined),
                                label: Text(
                                  _isLoading
                                      ? (l10n?.sending ?? 'Gönderiliyor...')
                                      : (l10n?.requestCode ?? 'Kod İste'),
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  side: BorderSide(
                                    color: AppTheme.primaryGreen,
                                    width: 2,
                                  ),
                                  foregroundColor: AppTheme.primaryGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: (_isVerifying ||
                                        _isLoading ||
                                        _codeController.text.length != 6)
                                    ? null
                                    : _verifyCode,
                                icon: _isVerifying
                                    ? const SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Icon(Icons.login),
                                label: Text(
                                  l10n?.login ?? 'Giriş Yap',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppTheme.primaryGreen,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Hata mesajı
                        if (_error != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.red.shade900.withOpacity(0.3)
                                  : Colors.red.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDark
                                    ? Colors.red.shade700
                                    : Colors.red.shade200,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: isDark
                                      ? Colors.red.shade400
                                      : Colors.red.shade700,
                                  size: 22,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    _error!,
                                    style: TextStyle(
                                      color: isDark
                                          ? Colors.red.shade300
                                          : Colors.red.shade700,
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        // Bilgi mesajı
                        if (_info != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.green.shade900.withOpacity(0.3)
                                  : Colors.green.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDark
                                    ? Colors.green.shade700
                                    : Colors.green.shade200,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: isDark
                                      ? Colors.green.shade400
                                      : Colors.green.shade700,
                                  size: 22,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    _info!,
                                    style: TextStyle(
                                      color: isDark
                                          ? Colors.green.shade300
                                          : Colors.green.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Alt bilgi metni
                  Center(
                    child: Text(
                      'Erkan bey kendi mail adresiniz ile girebilirsin',
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


