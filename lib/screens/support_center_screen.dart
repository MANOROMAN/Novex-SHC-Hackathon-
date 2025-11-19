import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';

class SupportCenterScreen extends StatefulWidget {
  const SupportCenterScreen({super.key});

  @override
  State<SupportCenterScreen> createState() => _SupportCenterScreenState();
}

class _SupportCenterScreenState extends State<SupportCenterScreen> {
  static const String whatsappUrl = 'https://api.whatsapp.com/send/?phone=905491492400&type=phone_number&app_absent=0';
  static const String phoneNumber = 'tel:+905491492400';
  static const String emailAddress = 'mailto:info@smilehairclinic.com?subject=Destek%20Talebi';
  static const String knowledgeBaseUrl = 'https://www.smilehairclinic.com';
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
          l10n.supportCenterTitle,
          style: const TextStyle(
            color: Color(0xFF0D121B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeroCard(l10n),
          const SizedBox(height: 24),
          _buildSectionTitle(l10n.supportCenterQuickContact),
          const SizedBox(height: 12),
          _buildActionCard(
            title: l10n.supportCenterWhatsappTitle,
            subtitle: l10n.supportCenterWhatsappSubtitle,
            icon: Icons.chat_bubble_outline,
            color: const Color(0xFF25D366),
            onTap: () => _launchUrl(whatsappUrl),
          ),
          const SizedBox(height: 12),
          _buildActionCard(
            title: l10n.supportCenterCallTitle,
            subtitle: '+90 549 149 24 00',
            icon: Icons.phone_in_talk_outlined,
            color: AppTheme.primaryGreen,
            onTap: () => _launchUrl(phoneNumber),
          ),
          const SizedBox(height: 12),
          _buildActionCard(
            title: l10n.supportCenterEmailTitle,
            subtitle: 'info@smilehairclinic.com',
            icon: Icons.email_outlined,
            color: Colors.orange,
            onTap: () => _launchUrl(emailAddress),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(l10n.supportCenterKnowledgeBase),
          const SizedBox(height: 12),
          _buildLinkTile(
            Icons.help_outline,
            l10n.faqTitle,
            l10n.supportCenterFaqSubtitle,
            () => Navigator.pushNamed(context, '/faq'),
          ),
          const SizedBox(height: 12),
          _buildLinkTile(
            Icons.book_outlined,
            l10n.supportCenterKnowledgeBaseTitle,
            l10n.supportCenterKnowledgeBaseSubtitle,
            () => _launchUrl(knowledgeBaseUrl),
          ),
          const SizedBox(height: 12),
          _buildLinkTile(
            Icons.support_agent,
            l10n.supportCenterAppointmentSupportTitle,
            l10n.supportCenterAppointmentSupportSubtitle,
            () => Navigator.pushNamed(context, '/online-consultation'),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(l10n.supportCenterMessageSectionTitle),
          const SizedBox(height: 12),
          _buildMessageCard(context, l10n),
        ],
      ),
    );
  }

  Widget _buildHeroCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryGreen, AppTheme.primaryGreen.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.supportCenterHeroTitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.supportCenterHeroDescription,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0D121B),
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
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
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D121B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.textSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLinkTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: AppTheme.primaryGreen),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        trailing: Icon(Icons.open_in_new, color: AppTheme.textSecondary),
      ),
    );
  }

  Widget _buildMessageCard(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.supportCenterMessageLabel,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _messageController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: l10n.supportCenterMessageHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppTheme.borderLight),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: AppTheme.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (_messageController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.supportCenterMessageEmpty)),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.supportCenterMessageSuccess)),
                );
                _messageController.clear();
              },
              icon: const Icon(Icons.send),
              label: Text(l10n.supportCenterSendButton),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      final canOpen = await canLaunchUrl(uri);
      if (canOpen) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return;
      }
      // Try anyway; some platforms return false but still can open
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Bağlantı açılamadı. Lütfen uygulamanın yüklü olduğundan emin olun. (${e.toString()})',
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}



