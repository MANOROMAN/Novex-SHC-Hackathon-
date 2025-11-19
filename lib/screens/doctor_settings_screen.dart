import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../widgets/language_selector.dart';
import '../main.dart';
import '../services/doctor_auth_service.dart';
import 'doctor_profile_settings_screen.dart';
import 'privacy_policy_screen.dart';
import 'kvkk_application_screen.dart';
import 'gdpr_consent_screen.dart';

class DoctorSettingsScreen extends StatefulWidget {
  const DoctorSettingsScreen({super.key});

  @override
  State<DoctorSettingsScreen> createState() => _DoctorSettingsScreenState();
}

class _DoctorSettingsScreenState extends State<DoctorSettingsScreen> {
  String? _email;
  String? _name;
  String? _photoUrl;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final doctorAuthService = DoctorAuthService();
    
    try {
      // Doktor ID'sini DoctorAuthService'den al (manuel auth kullanıyoruz)
      final doctorId = await doctorAuthService.getStoredDoctorId();
      if (doctorId == null || doctorId.isEmpty) {
        // Doktor ID yoksa SharedPreferences'dan bilgileri al
        setState(() {
          _email = prefs.getString('doctor_email') ?? '';
          _name = prefs.getString('doctor_name') ?? 'Doktor';
          _photoUrl = null;
        });
        return;
      }
      
      // Firestore'dan doktor bilgilerini al
      final docSnapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(doctorId)
          .get();
      
      if (docSnapshot.exists) {
        final data = docSnapshot.data() ?? {};
        setState(() {
          _email = data['email'] ?? prefs.getString('doctor_email') ?? '';
          _name = data['name'] ?? prefs.getString('doctor_name') ?? 'Doktor';
          _photoUrl = data['photoURL'];
        });
      } else {
        // Doktor kaydı yoksa SharedPreferences'dan bilgileri al
        setState(() {
          _email = prefs.getString('doctor_email') ?? '';
          _name = prefs.getString('doctor_name') ?? 'Doktor';
          _photoUrl = null;
        });
      }
    } catch (e) {
      // Hata durumunda SharedPreferences'dan bilgileri al
      setState(() {
        _email = prefs.getString('doctor_email') ?? '';
        _name = prefs.getString('doctor_name') ?? 'Doktor';
        _photoUrl = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Başlık
              Row(
                children: [
                  Icon(Icons.settings, color: AppTheme.primaryGreen),
                  const SizedBox(width: 8),
                  Text(
                    'Ayarlar',
                    style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Profil Kartı
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF192633) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: AppTheme.getBrandPrimaryColor(context),
                      backgroundImage: _photoUrl != null && _photoUrl!.isNotEmpty
                          ? NetworkImage(_photoUrl!)
                          : null,
                      child: (_photoUrl == null || _photoUrl!.isEmpty)
                          ? Text(
                              _name?.isNotEmpty == true ? _name![0].toUpperCase() : 'D',
                              style: const TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _name ?? 'Doktor',
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _email ?? '',
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DoctorProfileSettingsScreen(),
                          ),
                        ).then((_) => _load()); // Dönünce yenile
                      },
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.getBrandPrimaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Diğer Ayarlar (Dökümanlar hariç)
              _DoctorSettingsContent(),
            ],
          ),
        ),
      ),
    );
  }
}

// SettingsScreen'in içeriğini kopyalayıp dökümanlar kısmını çıkaran widget
class _DoctorSettingsContent extends StatelessWidget {
  const _DoctorSettingsContent();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Preferences Section
        _buildSectionTitle(context, l10n.settingsPreferences),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.getBorderColor(context), width: 1),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSettingsTile(
                context: context,
                icon: Icons.language,
                title: l10n.settingsLanguage,
                subtitle: l10n.settingsLanguageSubtitle,
                trailing: const LanguageSelector(),
                onTap: () {},
              ),
              Divider(color: AppTheme.getBorderColor(context), height: 1),
              Builder(
                builder: (localContext) {
                  final themeNotifier = AppThemeModeNotifier.of(localContext);
                  final currentThemeMode = themeNotifier?.appThemeMode ?? AppThemeMode.system;
                  final localL10n = AppLocalizations.of(localContext)!;
                  return _buildThemeSelectorTile(
                    context: context,
                    icon: Icons.palette,
                    title: localL10n.settingsThemeMode,
                    subtitle: _getThemeModeDescription(localL10n, currentThemeMode),
                    currentMode: currentThemeMode,
                    onModeChanged: (mode) {
                      themeNotifier?.onAppThemeModeChanged(mode);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Account Section
        _buildSectionTitle(context, l10n.settingsAccount),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.getBorderColor(context), width: 1),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSettingsTile(
                context: context,
                icon: Icons.privacy_tip,
                title: l10n.settingsPrivacyPolicy,
                subtitle: l10n.settingsPrivacyPolicySubtitle,
                trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
              ),
              Divider(color: AppTheme.getBorderColor(context), height: 1),
              _buildSettingsTile(
                context: context,
                icon: Icons.assignment,
                title: l10n.settingsKvkkFormTitle,
                subtitle: l10n.settingsKvkkFormSubtitle,
                trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KvkkApplicationScreen(),
                    ),
                  );
                },
              ),
              Divider(color: AppTheme.getBorderColor(context), height: 1),
              _buildSettingsTile(
                context: context,
                icon: Icons.security,
                title: l10n.settingsGdprFormTitle,
                subtitle: l10n.settingsGdprFormSubtitle,
                trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GdprConsentScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Support Section
        _buildSectionTitle(context, l10n.settingsSupport),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.getBorderColor(context), width: 1),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSettingsTile(
                context: context,
                icon: Icons.support_agent,
                title: l10n.supportCenterTitle,
                subtitle: l10n.settingsSupportCenterSubtitle,
                trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                onTap: () => Navigator.pushNamed(context, '/support-center'),
              ),
              Divider(color: AppTheme.getBorderColor(context), height: 1),
              _buildSettingsTile(
                context: context,
                icon: Icons.contact_phone_outlined,
                title: l10n.settingsContactTitle,
                subtitle: l10n.settingsContactSubtitle,
                trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                onTap: () => Navigator.pushNamed(context, '/contact'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Help & Support Section
        _buildSectionTitle(context, l10n.settingsHelpSupport),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.getBorderColor(context), width: 1),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSettingsTile(
                context: context,
                icon: Icons.help_outline,
                title: l10n.settingsHelpSupport,
                subtitle: l10n.settingsHelpSupportSubtitle,
                trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                onTap: () {
                  Navigator.pushNamed(context, '/chat-support');
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Logout Button
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.getErrorColor(context).withOpacity(0.5), width: 1),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                final doctorAuthService = DoctorAuthService();
                await doctorAuthService.signOutDoctor();
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/doctor-login',
                    (route) => false,
                  );
                }
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: AppTheme.getErrorColor(context)),
                    const SizedBox(width: 8),
                    Text(
                      'Çıkış Yap',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getErrorColor(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppTheme.getTextPrimaryColor(context),
        letterSpacing: -0.015,
      ),
    );
  }

  Widget _buildSettingsTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.getPrimaryColor(context).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppTheme.getPrimaryColor(context), size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.getTextPrimaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.getTextSecondaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
              trailing,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeSelectorTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required AppThemeMode currentMode,
    required ValueChanged<AppThemeMode> onModeChanged,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showThemeSelectorDialog(context, currentMode, onModeChanged),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.getPrimaryColor(context).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppTheme.getPrimaryColor(context), size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.getTextPrimaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.getTextSecondaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
            ],
          ),
        ),
      ),
    );
  }

  String _getThemeModeDescription(AppLocalizations l10n, AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.system:
        return l10n.settingsThemeDescriptionSystem;
      case AppThemeMode.light:
        return l10n.settingsThemeDescriptionLight;
      case AppThemeMode.dark:
        return l10n.settingsThemeDescriptionDark;
    }
  }

  void _showThemeSelectorDialog(
    BuildContext context,
    AppThemeMode currentMode,
    ValueChanged<AppThemeMode> onModeChanged,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final dialogL10n = AppLocalizations.of(dialogContext)!;
        return AlertDialog(
          title: Text(dialogL10n.settingsThemeDialogTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption(
                dialogContext,
                AppThemeMode.system,
                dialogL10n.settingsThemeOptionSystem,
                dialogL10n.settingsThemeOptionSystemSubtitle,
                Icons.brightness_auto,
                currentMode == AppThemeMode.system,
                () {
                  onModeChanged(AppThemeMode.system);
                  Navigator.pop(dialogContext);
                },
              ),
              const SizedBox(height: 12),
              _buildThemeOption(
                dialogContext,
                AppThemeMode.light,
                dialogL10n.settingsThemeOptionLight,
                dialogL10n.settingsThemeOptionLightSubtitle,
                Icons.light_mode,
                currentMode == AppThemeMode.light,
                () {
                  onModeChanged(AppThemeMode.light);
                  Navigator.pop(dialogContext);
                },
              ),
              const SizedBox(height: 12),
              _buildThemeOption(
                dialogContext,
                AppThemeMode.dark,
                dialogL10n.settingsThemeOptionDark,
                dialogL10n.settingsThemeOptionDarkSubtitle,
                Icons.dark_mode,
                currentMode == AppThemeMode.dark,
                () {
                  onModeChanged(AppThemeMode.dark);
                  Navigator.pop(dialogContext);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    AppThemeMode mode,
    String title,
    String subtitle,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppTheme.getPrimaryColor(context).withOpacity(0.1) 
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected 
                ? AppTheme.getPrimaryColor(context) 
                : AppTheme.getBorderColor(context),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected 
                  ? AppTheme.getPrimaryColor(context) 
                  : AppTheme.getTextSecondaryColor(context),
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected 
                          ? AppTheme.getPrimaryColor(context) 
                          : AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppTheme.getPrimaryColor(context),
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

}
