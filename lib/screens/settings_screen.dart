import 'dart:io';

import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../theme/app_theme.dart';
import '../widgets/language_selector.dart';
import '../main.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import 'privacy_policy_screen.dart';
import 'kvkk_application_screen.dart';
import 'gdpr_consent_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();
  final ImagePicker _imagePicker = ImagePicker();

  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _isLoading = true;
  bool _isUploadingPhoto = false;
  
  // Kullanıcı bilgileri - Firebase'den gelecek
  String _userName = '';
  String _userEmail = '';
  String _userPhone = '';
  String _userAddress = '';
  String _userBirthDate = '';
  String _userGender = '';
  String _userPatientId = '';
  String _userEmergencyContact = '';
  String _userPhotoUrl = '';

  Map<String, dynamic>? _userSettings;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (!_authService.isAuthenticated) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final profile = await _authService.getUserProfile();
      if (profile != null) {
        setState(() {
          _userSettings = profile['settings'] ?? {};

          // Kullanıcı bilgilerini doldur
          final profileData = profile['profile'] ?? {};
          _userName = profile['displayName'] ?? profileData['name'] ?? '';
          _userEmail = _authService.currentUser!.email ?? '';
          _userPhone = profileData['phone'] ?? '';
          _userAddress = profileData['address'] ?? '';
          _userBirthDate = profileData['birthDate'] ?? '';
          _userGender = profileData['gender'] ?? '';
          _userPatientId = profileData['patientId'] ?? '';
          _userEmergencyContact = profileData['emergencyContact'] ?? '';
          _userPhotoUrl = profile['photoURL'] ??
              profileData['photoUrl'] ??
              _authService.currentUser?.photoURL ??
              '';

          // Bildirim ayarları
          _notificationsEnabled = _userSettings?['notificationsEnabled'] ?? true;
          _emailNotifications = _userSettings?['emailNotifications'] ?? true;
          _pushNotifications = _userSettings?['pushNotifications'] ?? true;
        });
      }
    } catch (e) {
      print('Kullanıcı verileri yüklenirken hata: $e');
    } finally {
      setState(() {
        _isLoading = false;
        _userPhotoUrl = _userPhotoUrl.isNotEmpty ? _userPhotoUrl : _authService.currentUser?.photoURL ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: AppTheme.getPrimaryColor(context),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Section
                    _buildSectionTitle(l10n.settingsProfile),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
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
                      child: Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor: AppTheme.getPrimaryColor(context).withOpacity(0.1),
                                backgroundImage: _userPhotoUrl.isNotEmpty ? NetworkImage(_userPhotoUrl) : null,
                                child: _userPhotoUrl.isEmpty
                                    ? Icon(Icons.person, size: 32, color: AppTheme.getPrimaryColor(context))
                                    : null,
                              ),
                              if (_isUploadingPhoto)
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              Positioned(
                                bottom: -4,
                                right: -4,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: _isUploadingPhoto ? null : _changeProfilePhoto,
                                    borderRadius: BorderRadius.circular(16),
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: AppTheme.getPrimaryColor(context),
                                      child: const Icon(Icons.camera_alt, size: 14, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _userName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.getTextPrimaryColor(context),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _userEmail,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.getTextSecondaryColor(context),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _userPhone.isNotEmpty ? _userPhone : l10n.settingsAddPhone,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.getTextSecondaryColor(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit, color: AppTheme.getPrimaryColor(context)),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                  userName: _userName,
                                  userEmail: _userEmail,
                                  userPhone: _userPhone,
                                  userAddress: _userAddress,
                                  userBirthDate: _userBirthDate,
                                  userGender: _userGender,
                                  userPatientId: _userPatientId,
                                  userEmergencyContact: _userEmergencyContact,
                                  onProfileUpdated: (updatedData) {
                                    setState(() {
                                      _userName = updatedData['name'] ?? _userName;
                                      _userEmail = updatedData['email'] ?? _userEmail;
                                      _userPhone = updatedData['phone'] ?? _userPhone;
                                      _userAddress = updatedData['address'] ?? _userAddress;
                                      _userBirthDate = updatedData['birthDate'] ?? _userBirthDate;
                                      _userGender = updatedData['gender'] ?? _userGender;
                                      _userEmergencyContact = updatedData['emergencyContact'] ?? _userEmergencyContact;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Preferences Section
                    _buildSectionTitle(l10n.settingsPreferences),
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
                    // Notifications Section
                    _buildSectionTitle(l10n.settingsNotifications),
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
                            icon: Icons.notifications,
                            title: l10n.settingsNotifications,
                            subtitle: l10n.viewAndManageNotifications,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Switch(
                                  value: _notificationsEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      _notificationsEnabled = value;
                                      if (!value) {
                                        _emailNotifications = false;
                                        _pushNotifications = false;
                                      }
                                    });
                                  },
                                  activeColor: AppTheme.getPrimaryColor(context),
                                ),
                                const SizedBox(width: 8),
                                Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/notifications');
                            },
                          ),
                          Divider(color: AppTheme.getBorderColor(context), height: 1),
                          _buildSwitchTile(
                            icon: Icons.email,
                            title: l10n.settingsEmailNotifications,
                            subtitle: l10n.settingsEmailNotificationsSubtitle,
                            value: _emailNotifications,
                            enabled: _notificationsEnabled,
                            onChanged: (value) {
                              setState(() {
                                _emailNotifications = value;
                              });
                            },
                          ),
                          Divider(color: AppTheme.getBorderColor(context), height: 1),
                          _buildSwitchTile(
                            icon: Icons.phone_android,
                            title: l10n.settingsPushNotifications,
                            subtitle: l10n.settingsPushNotificationsSubtitle,
                            value: _pushNotifications,
                            enabled: _notificationsEnabled,
                            onChanged: (value) {
                              setState(() {
                                _pushNotifications = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Account Section
                    _buildSectionTitle(l10n.settingsAccount),
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
                    _buildSectionTitle(l10n.settingsRecordsTitle),
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
                            icon: Icons.history,
                            title: l10n.settingsTreatmentHistoryTitle,
                            subtitle: l10n.settingsTreatmentHistorySubtitle,
                            trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                            onTap: () => Navigator.pushNamed(context, '/treatment-history'),
                          ),
                          Divider(color: AppTheme.getBorderColor(context), height: 1),
                          _buildSettingsTile(
                            icon: Icons.folder_shared_outlined,
                            title: l10n.settingsDocumentsTitle,
                            subtitle: l10n.settingsDocumentsSubtitle,
                            trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                            onTap: () => Navigator.pushNamed(context, '/documents'),
                          ),
                          Divider(color: AppTheme.getBorderColor(context), height: 1),
                          _buildSettingsTile(
                            icon: Icons.receipt_long_outlined,
                            title: l10n.settingsInvoicesTitle,
                            subtitle: l10n.settingsInvoicesSubtitle,
                            trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                            onTap: () => Navigator.pushNamed(context, '/invoices'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle(l10n.settingsSupport),
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
                            icon: Icons.support_agent,
                            title: l10n.supportCenterTitle,
                            subtitle: l10n.settingsSupportCenterSubtitle,
                            trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                            onTap: () => Navigator.pushNamed(context, '/support-center'),
                          ),
                          Divider(color: AppTheme.getBorderColor(context), height: 1),
                          _buildSettingsTile(
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
                    // Support Section
                    _buildSectionTitle(l10n.settingsHelpSupport),
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
                            icon: Icons.help_outline,
                            title: l10n.settingsHelpSupport,
                            subtitle: l10n.settingsHelpSupportSubtitle,
                            trailing: Icon(Icons.chevron_right, color: AppTheme.getTextSecondaryColor(context)),
                            onTap: () {
                              // Navbar'daki chatbot'a yönlendir - direkt chat support ekranına git
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
                            // Çıkış yap
                            try {
                              await _authService.signOut();
                              // Tüm ekranları temizle ve login'e git
                              if (mounted) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/login',
                                  (route) => false,
                                );
                              }
                            } catch (e) {
                              // Hata olsa bile login'e git
                              if (mounted) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/login',
                                  (route) => false,
                                );
                              }
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
                                  l10n.settingsLogout,
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
                ),
    );
  }

  Widget _buildSectionTitle(String title) {
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

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool enabled = true,
  }) {
    return Padding(
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
                    color: enabled ? AppTheme.getTextPrimaryColor(context) : AppTheme.getTextSecondaryColor(context).withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: enabled ? AppTheme.getTextSecondaryColor(context) : AppTheme.getTextSecondaryColor(context).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: enabled ? onChanged : null,
            activeColor: AppTheme.getPrimaryColor(context),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSelectorTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required AppThemeMode currentMode,
    required ValueChanged<AppThemeMode> onModeChanged,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showThemeSelectorDialog(currentMode, onModeChanged),
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



  Future<void> _changeProfilePhoto() async {
    final l10n = AppLocalizations.of(context)!;
    if (!_authService.isAuthenticated) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.settingsProfileLoginRequired)),
        );
      }
      return;
    }

    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 1200,
    );

    if (pickedFile == null) return;

    setState(() {
      _isUploadingPhoto = true;
    });

    try {
      final file = File(pickedFile.path);
      final downloadUrl = await _storageService.uploadProfilePhoto(_authService.currentUser!.uid, file);
      await _authService.updateProfilePhoto(downloadUrl);
      if (!mounted) return;
      setState(() {
        _userPhotoUrl = downloadUrl;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.settingsProfilePhotoUpdated)),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.settingsProfilePhotoUpdateError(e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploadingPhoto = false;
        });
      }
    }
  }


}

// Profil Düzenleme Ekranı
class EditProfileScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userAddress;
  final String userBirthDate;
  final String userGender;
  final String userPatientId;
  final String userEmergencyContact;
  final Function(Map<String, String>) onProfileUpdated;

  const EditProfileScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userAddress,
    required this.userBirthDate,
    required this.userGender,
    required this.userPatientId,
    required this.userEmergencyContact,
    required this.onProfileUpdated,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _birthDateController;
  late TextEditingController _emergencyContactController;
  
  String _selectedGender = 'Erkek';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userName);
    _emailController = TextEditingController(text: widget.userEmail);
    _phoneController = TextEditingController(text: widget.userPhone);
    _addressController = TextEditingController(text: widget.userAddress);
    _birthDateController = TextEditingController(text: widget.userBirthDate);
    _emergencyContactController = TextEditingController(text: widget.userEmergencyContact);
    _selectedGender = widget.userGender;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _birthDateController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 30)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('tr', 'TR'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.getPrimaryColor(context),
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              onSurface: AppTheme.getTextPrimaryColor(context),
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _birthDateController.text = 
          '${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}';
      });
    }
  }

  void _saveProfile() {
    final l10n = AppLocalizations.of(context)!;
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final address = _addressController.text.trim();
    final birthDate = _birthDateController.text.trim();
    final emergencyContact = _emergencyContactController.text.trim();

    // Validation
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.nameRequired)),
      );
      return;
    }

    if (email.isEmpty || !email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.emailInvalid)),
      );
      return;
    }

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.phoneRequired)),
      );
      return;
    }

    if (address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.addressRequired)),
      );
      return;
    }

    if (birthDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.birthDateRequired)),
      );
      return;
    }

    // Profil bilgilerini güncelle
    widget.onProfileUpdated({
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'birthDate': birthDate,
      'gender': _selectedGender,
      'emergencyContact': emergencyContact,
    });

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.profileUpdatedSuccessfully),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Get gender options from l10n

    final List<String> genders = [l10n.male, l10n.female, l10n.preferNotToSay];
    
    // Update selected gender based on current locale if needed
    if (_selectedGender == 'Erkek' || _selectedGender == 'Male' || 
        _selectedGender == 'Männlich' || _selectedGender == 'Masculino' ||
        _selectedGender == 'Maschio' || _selectedGender == 'Masculino' ||
        _selectedGender == 'Мужской' || _selectedGender == 'Masculino' ||
        _selectedGender == 'ذكر' || _selectedGender == 'Homme' ||
        _selectedGender == 'Mashkull' || _selectedGender == 'זכר' ||
        _selectedGender == 'Masculino') {
      _selectedGender = l10n.male;
    } else if (_selectedGender == 'Kadın' || _selectedGender == 'Female' ||
               _selectedGender == 'Weiblich' || _selectedGender == 'Femenino' ||
               _selectedGender == 'Femmina' || _selectedGender == 'Feminino' ||
               _selectedGender == 'Женский' || _selectedGender == 'Femme' ||
               _selectedGender == 'أنثى' || _selectedGender == 'Femër' ||
               _selectedGender == 'נקבה' || _selectedGender == 'Feminino') {
      _selectedGender = l10n.female;
    } else if (!genders.contains(_selectedGender)) {
      _selectedGender = l10n.preferNotToSay;
    }
    
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.editProfile,
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: Text(
              l10n.save,
              style: TextStyle(
                color: AppTheme.primaryGreen,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Fotoğrafı
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDyXayJ-WS1scfowfip54izMi-Kbii8F63ikQ_HCGo9eNcstkYhzqJ37a_SoDu1ItwCMBKfbrbwyJYxzdjq8H4pCjYK9pVNLB2oUQQpFhpzm6muXO4C18kguHznagrERBOTP-MXeDoH5ArimxMOTDQiyWc-9ZkapC-ouK_2IhBDkve20Psdkcp8M0A_IlJ85Zg_b59oiD1-jLbMhoSTK-7tnDfFkwa4XQbewjt628UEg0vcL2Aa_dT2UZ6rLhEPPzqIlSVoSEZNCg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.photoChangeFeatureComingSoon)),
                  );
                },
                child: Text(
                  l10n.changePhoto,
                  style: TextStyle(color: AppTheme.primaryGreen),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Hasta ID (Read-only)
            _buildInfoCard(
              l10n.patientId,
              widget.userPatientId,
              Icons.badge,
              isReadOnly: true,
            ),
            const SizedBox(height: 16),

            // Ad Soyad
            _buildTextField(
              label: l10n.fullName,
              controller: _nameController,
              icon: Icons.person_outline,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),

            // E-posta
            _buildTextField(
              label: l10n.email,
              controller: _emailController,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Telefon
            _buildTextField(
              label: l10n.phone,
              controller: _phoneController,
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              hint: '+90 555 123 4567',
            ),
            const SizedBox(height: 16),

            // Adres
            _buildTextField(
              label: l10n.address,
              controller: _addressController,
              icon: Icons.location_on_outlined,
              keyboardType: TextInputType.streetAddress,
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            // Doğum Tarihi
            _buildDateField(
              label: l10n.birthDate,
              controller: _birthDateController,
              icon: Icons.calendar_today_outlined,
              onTap: _selectBirthDate,
            ),
            const SizedBox(height: 16),

            // Cinsiyet
            _buildDropdownField(
              label: l10n.gender,
              value: _selectedGender,
              items: genders,
              icon: Icons.person_outline,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Acil Durum İletişim
            _buildTextField(
              label: l10n.emergencyContact,
              controller: _emergencyContactController,
              icon: Icons.emergency_outlined,
              keyboardType: TextInputType.text,
              hint: l10n.emergencyContactHint,
            ),
            const SizedBox(height: 32),

            // Kaydet Butonu
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _saveProfile,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.save, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          l10n.saveChanges,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
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
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
    String? hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.borderLight),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(icon, color: AppTheme.primaryGreen),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.borderLight),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: IgnorePointer(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(icon, color: AppTheme.primaryGreen),
                  suffixIcon: Icon(Icons.calendar_today, color: AppTheme.textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required IconData icon,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.borderLight),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButtonFormField<String>(
            value: value,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppTheme.primaryGreen),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
            dropdownColor: Colors.white,
            style: TextStyle(color: AppTheme.textPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon, {bool isReadOnly = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isReadOnly ? Colors.grey[100] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.primaryGreen, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (isReadOnly)
            Icon(Icons.lock_outline, size: 16, color: AppTheme.textSecondary),
        ],
      ),
    );
  }
}



