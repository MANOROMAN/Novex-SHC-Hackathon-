import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'package:self_capture/l10n/app_localizations.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0D121B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n?.contact ?? 'İletişim',
          style: const TextStyle(
            color: Color(0xFF0D121B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with Footer Image
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/footerimg.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      AppTheme.primaryGreen.withOpacity(0.85),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.contact_phone,
                        size: 60,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n?.contactUs ?? 'Bizimle İletişime Geçin',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Quick Contact Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickActionCard(
                          context,
                          Icons.phone,
                          l10n?.call ?? 'Ara',
                          () => _makePhoneCall(context, '05491492400'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildQuickActionCard(
                          context,
                          Icons.email,
                          l10n?.email ?? 'Email',
                          () => _sendEmail(context, 'info@smilehairclinic.com'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildQuickActionCard(
                    context,
                    Icons.chat,
                    l10n?.contactWhatsApp ?? 'WhatsApp ile İletişim',
                    () => _openWhatsApp(context),
                    isFullWidth: true,
                  ),
                  const SizedBox(height: 32),
                  // Contact Info Cards
                  _buildContactCard(
                    context,
                    Icons.location_on,
                    l10n?.address ?? 'Adres',
                    l10n?.clinicAddress ?? 'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Türkiye',
                    () => _openMaps(context),
                  ),
                  const SizedBox(height: 16),
                  _buildContactCard(
                    context,
                    Icons.phone,
                    l10n?.phone ?? 'Telefon',
                    '549 149 24 00',
                    () => _makePhoneCall(context, '05491492400'),
                  ),
                  const SizedBox(height: 16),
                  _buildContactCard(
                    context,
                    Icons.email,
                    l10n?.email ?? 'E-Posta',
                    'info@smilehairclinic.com',
                    () => _sendEmail(context, 'info@smilehairclinic.com'),
                  ),
                  const SizedBox(height: 32),
                  // Working Hours
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryGreen,
                          AppTheme.primaryGreen.withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryGreen.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 32,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n?.workingHours ?? 'Çalışma Saatleri',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildWorkingHourRow(l10n?.mondayFriday ?? 'Pazartesi - Cuma', '09:00 - 18:00'),
                        const SizedBox(height: 8),
                        _buildWorkingHourRow(l10n?.saturday ?? 'Cumartesi', '09:00 - 15:00'),
                        const SizedBox(height: 8),
                        _buildWorkingHourRow(l10n?.sunday ?? 'Pazar', l10n?.closed ?? 'Kapalı'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(BuildContext context, IconData icon, String text, VoidCallback onTap, {bool isFullWidth = false}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryGreen,
            AppTheme.primaryGreen.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 32),
                const SizedBox(height: 8),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, IconData icon, String title, String content, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: AppTheme.primaryGreen,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D121B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppTheme.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkingHourRow(String day, String hours) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          hours,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Future<void> _makePhoneCall(BuildContext context, String phoneNumber) async {
    try {
      // Telefon numarasını temizle (+ ve boşlukları kaldır)
      final cleanNumber = phoneNumber.replaceAll('+', '').replaceAll(' ', '').replaceAll('-', '');
      final Uri phoneUri = Uri(scheme: 'tel', path: cleanNumber);
      
      // Önce canLaunchUrl kontrolü yap
      bool canLaunch = await canLaunchUrl(phoneUri);
      
      if (canLaunch) {
        await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
      } else {
        // canLaunchUrl false dönerse bile denemeyi yap
        try {
          await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
        } catch (e) {
          // Hata durumunda kullanıcıya bilgi ver
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)?.phoneAppCannotOpen ?? 'Telefon uygulaması açılamadı. Lütfen cihazınızda telefon uygulamasının yüklü olduğundan emin olun.',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Bir hata oluştu: ${e.toString()}',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _sendEmail(BuildContext context, String email) async {
    try {
      final l10n = AppLocalizations.of(context);
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        query: 'subject=${Uri.encodeComponent(l10n?.emailSubject ?? 'Smile Hair Clinic İletişim')}',
      );
      
      // Önce canLaunchUrl kontrolü yap
      bool canLaunch = await canLaunchUrl(emailUri);
      
      if (canLaunch) {
        await launchUrl(emailUri, mode: LaunchMode.externalApplication);
      } else {
        // canLaunchUrl false dönerse bile denemeyi yap
        try {
          await launchUrl(emailUri, mode: LaunchMode.externalApplication);
        } catch (e) {
          // Hata durumunda kullanıcıya bilgi ver
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)?.emailAppCannotOpen ?? 'Email uygulaması açılamadı. Lütfen cihazınızda email uygulamasının yüklü olduğundan emin olun.',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Bir hata oluştu: ${e.toString()}',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _openWhatsApp(BuildContext context) async {
    try {
      // Doğru telefon numarası: 905491492400
      final Uri whatsappUri = Uri.parse('https://api.whatsapp.com/send/?phone=905491492400&text&type=phone_number&app_absent=0');
      
      // Önce canLaunchUrl kontrolü yap
      bool canLaunch = await canLaunchUrl(whatsappUri);
      
      if (canLaunch) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        // canLaunchUrl false dönerse bile denemeyi yap
        try {
          await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
        } catch (e) {
          // Hata durumunda kullanıcıya bilgi ver
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)?.whatsappCannotOpen ?? 'WhatsApp açılamadı. Lütfen WhatsApp uygulamasının yüklü olduğundan emin olun veya internet bağlantınızı kontrol edin.',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Bir hata oluştu: ${e.toString()}',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _openMaps(BuildContext context) async {
    try {
      final Uri mapsUri = Uri.parse('https://www.google.com/maps/search/?api=1&query=Tatlısu,+Alptekin+Cd.+No:15,+34774+Ümraniye/İstanbul');
      
      // Önce canLaunchUrl kontrolü yap
      bool canLaunch = await canLaunchUrl(mapsUri);
      
      if (canLaunch) {
        await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
      } else {
        // canLaunchUrl false dönerse bile denemeyi yap
        try {
          await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
        } catch (e) {
          // Hata durumunda kullanıcıya bilgi ver
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)?.mapCannotOpen ?? 'Harita açılamadı. Lütfen internet bağlantınızı kontrol edin.',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Bir hata oluştu: ${e.toString()}',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}



