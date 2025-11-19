import 'dart:async';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final AuthService _authService = AuthService();
  bool _isResending = false;
  bool _isChecking = false;
  String? _errorMessage;
  String? _successMessage;
  DateTime? _lastEmailSentTime;
  static const int _cooldownMinutes = 1; // 1 dakika cooldown
  Timer? _cooldownTimer;

  @override
  void initState() {
    super.initState();
    _checkVerificationStatus();
    _startCooldownTimer();
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  void _startCooldownTimer() {
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && _lastEmailSentTime != null && !_canResendEmail()) {
        setState(() {
          // UI'ı güncelle
        });
      } else if (_canResendEmail() && _lastEmailSentTime != null) {
        timer.cancel();
      }
    });
  }

  Future<void> _checkVerificationStatus() async {
    setState(() {
      _isChecking = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      final isVerified = await _authService.checkEmailVerification();
      if (isVerified && mounted) {
        // Email doğrulandı, dashboard'a yönlendir
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Doğrulama durumu kontrol edilemedi: ${e.toString()}';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isChecking = false;
        });
      }
    }
  }

  bool _canResendEmail() {
    if (_lastEmailSentTime == null) return true;
    final now = DateTime.now();
    final difference = now.difference(_lastEmailSentTime!);
    return difference.inMinutes >= _cooldownMinutes;
  }

  String? _getCooldownMessage() {
    if (_lastEmailSentTime == null) return null;
    if (_canResendEmail()) return null;
    
    final now = DateTime.now();
    final difference = now.difference(_lastEmailSentTime!);
    final remainingSeconds = (_cooldownMinutes * 60) - difference.inSeconds;
    
    if (remainingSeconds > 0) {
      final minutes = remainingSeconds ~/ 60;
      final seconds = remainingSeconds % 60;
      if (minutes > 0) {
        return 'Lütfen $minutes dakika ${seconds > 0 ? '$seconds saniye' : ''} sonra tekrar deneyin.';
      } else {
        return 'Lütfen $remainingSeconds saniye sonra tekrar deneyin.';
      }
    }
    return null;
  }

  Future<void> _resendVerificationEmail() async {
    // Cooldown kontrolü
    if (!_canResendEmail()) {
      final cooldownMsg = _getCooldownMessage();
      if (mounted) {
        setState(() {
          _errorMessage = cooldownMsg ?? 'Lütfen bir süre bekleyip tekrar deneyin.';
        });
      }
      return;
    }

    setState(() {
      _isResending = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      await _authService.sendEmailVerification();
      if (mounted) {
        setState(() {
          _lastEmailSentTime = DateTime.now();
          _successMessage = 'Doğrulama emaili tekrar gönderildi. Lütfen email kutunuzu kontrol edin.';
        });
        _startCooldownTimer(); // Timer'ı başlat
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'Email gönderilemedi.';
        
        // Firebase rate limiting hatalarını yakala
        final errorString = e.toString().toLowerCase();
        if (errorString.contains('too-many-requests') || 
            errorString.contains('too many requests') ||
            errorString.contains('quota exceeded') ||
            errorString.contains('rate limit')) {
          errorMessage = 'Çok fazla deneme yapıldı. Lütfen birkaç dakika bekleyip tekrar deneyin.';
          _lastEmailSentTime = DateTime.now(); // Cooldown başlat
          _startCooldownTimer(); // Timer'ı başlat
        } else if (errorString.contains('email zaten doğrulanmış')) {
          errorMessage = 'Email adresiniz zaten doğrulanmış. Dashboard\'a yönlendiriliyorsunuz...';
          // Otomatik kontrol et
          Future.delayed(const Duration(seconds: 1), () {
            _checkVerificationStatus();
          });
        } else {
          errorMessage = 'Email gönderilemedi: ${e.toString().length > 100 ? "${e.toString().substring(0, 100)}..." : e.toString()}';
        }
        
        setState(() {
          _errorMessage = errorMessage;
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isResending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = _authService.currentUser?.email ?? '';

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0D121B)),
          onPressed: () {
            // Çıkış yap
            _authService.signOut();
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        title: const Text(
          'Email Doğrulama',
          style: TextStyle(
            color: Color(0xFF0D121B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // Icon
              Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.email_outlined,
                    size: 80,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Title
              const Text(
                'Email Adresinizi Doğrulayın',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D121B),
                ),
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                'Hesabınızı aktifleştirmek için email adresinize gönderilen doğrulama linkine tıklayın.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              // Email
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.email, color: AppTheme.primaryGreen),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        userEmail,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0D121B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Success Message
              if (_successMessage != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _successMessage!,
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              // Error Message
              if (_errorMessage != null)
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 32),
              // Cooldown Message
              if (_getCooldownMessage() != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.timer_outlined, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _getCooldownMessage()!,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // Resend Button
              ElevatedButton(
                onPressed: (_isResending || !_canResendEmail()) ? null : _resendVerificationEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: _isResending
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        'Email\'i Tekrar Gönder',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              // Check Button
              OutlinedButton(
                onPressed: _isChecking ? null : _checkVerificationStatus,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primaryGreen,
                  side: const BorderSide(color: AppTheme.primaryGreen),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isChecking
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryGreen),
                        ),
                      )
                    : const Text(
                        'Doğrulama Durumunu Kontrol Et',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 24),
              // Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.blue, size: 20),
                        const SizedBox(width: 8),
                        const Text(
                          'Bilgi',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• Email\'inizi kontrol edin (spam klasörünü de kontrol edin)\n• Doğrulama linkine tıklayın\n• Link 3 gün süreyle geçerlidir',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

