import 'package:flutter/material.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../widgets/common/gradient_button.dart';
import '../widgets/common/glassmorphic_card.dart';
import '../widgets/common/custom_text_field.dart';
import '../widgets/common/animated_background.dart';

/// Modern Forgot Password Screen
class ForgotPasswordScreenNew extends StatefulWidget {
  const ForgotPasswordScreenNew({super.key});

  @override
  State<ForgotPasswordScreenNew> createState() =>
      _ForgotPasswordScreenNewState();
}

class _ForgotPasswordScreenNewState extends State<ForgotPasswordScreenNew> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authService.sendPasswordResetEmail(
        _emailController.text.trim(),
      );

      setState(() => _emailSent = true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorOccurred(e.toString())),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: AnimatedGradientBackground(
        colors: isDark
            ? AppTheme.premiumDarkGradient1
            : AppTheme.vibrantGradient1,
        child: BubbleBackground(
          bubbleCount: 12,
          bubbleColor: Colors.white.withOpacity(isDark ? 0.05 : 0.1),
          child: SafeArea(
            child: Column(
              children: [
                // App Bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      GlassContainer(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: _emailSent
                          ? _buildSuccessContent()
                          : _buildFormContent(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
          ),
          child: const Icon(
            Icons.lock_reset,
            size: 64,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),

        // Title
        Text(
          'Şifrenizi mi Unuttunuz?',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),

        Text(
          'E-posta adresinize şifre sıfırlama\nbağlantısı göndereceğiz',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // Form
        GlassmorphicCard(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                EmailTextField(
                  controller: _emailController,
                  autofocus: true,
                ),
                const SizedBox(height: 24),
                GradientButton.primary(
                  text: 'Sıfırlama Bağlantısı Gönder',
                  onPressed: _resetPassword,
                  isLoading: _isLoading,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Success Icon
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF10B981).withOpacity(0.2),
            border: Border.all(
              color: const Color(0xFF10B981).withOpacity(0.5),
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.mark_email_read,
            size: 64,
            color: Color(0xFF10B981),
          ),
        ),
        const SizedBox(height: 32),

        // Success Message
        GlassmorphicCard(
          child: Column(
            children: [
              const Text(
                'E-posta Gönderildi! ✉️',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Şifre sıfırlama bağlantısı\n${_emailController.text}\nadresine gönderildi',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              GradientButton.success(
                text: 'Giriş Sayfasına Dön',
                onPressed: () {
                  Navigator.pop(context);
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}



