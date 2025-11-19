import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'settings_screen.dart';
import 'chat_support_screen.dart';
import 'analysis_screen.dart';
import 'capture_flow_screen.dart';
import 'my_photos_screen.dart';
import 'past_analyses_history_screen.dart';
import 'patient_messages_screen.dart';

class PatientDashboardScreen extends StatefulWidget {
  const PatientDashboardScreen({super.key});

  @override
  State<PatientDashboardScreen> createState() => _PatientDashboardScreenState();
}

class _PatientDashboardScreenState extends State<PatientDashboardScreen> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  final StorageService _storageService = StorageService();
  final ImagePicker _imagePicker = ImagePicker();
  int _selectedIndex = 0;
  String? _userName;
  String _userPhotoUrl = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (!_authService.isAuthenticated) {
      setState(() {
        _userName = null;
        _userPhotoUrl = '';
      });
      return;
    }

    try {
      final profile = await _authService.getUserProfile();
      var displayName = _authService.currentUser?.displayName ?? '';
      var photoUrl = _authService.currentUser?.photoURL ?? '';

      if (profile != null) {
        final profileData = profile['profile'] ?? {};
        displayName = profile['displayName'] ?? profileData['name'] ?? displayName;
        photoUrl = profile['photoURL'] ?? profileData['photoUrl'] ?? photoUrl;
      }

      if (!mounted) return;
      setState(() {
        _userName = displayName.isNotEmpty ? displayName : null;
        _userPhotoUrl = photoUrl;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _userName = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top App Bar - Light background like HTML
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.getBackgroundColor(context),
                border: Border(
                  bottom: BorderSide(color: AppTheme.getBorderColor(context), width: 1),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppTheme.getPrimaryColor(context).withValues(alpha: 0.15),
                    backgroundImage: _userPhotoUrl.isNotEmpty ? NetworkImage(_userPhotoUrl) : null,
                    child: _userPhotoUrl.isEmpty
                        ? Icon(Icons.person, color: AppTheme.getPrimaryColor(context))
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _userName ?? l10n.appName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.getTextPrimaryColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Messages quick access
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline, color: AppTheme.getTextPrimaryColor(context)),
                    tooltip: AppLocalizations.of(context)!.messages,
                    onPressed: () {
                      // Auth kontrolü
                      if (_authService.currentUser == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppLocalizations.of(context)!.loginRequiredForMessaging),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PatientMessagesScreen(),
                        ),
                      );
                    },
                  ),
                  // Notification icon with badge - CANLI VERİ
                  StreamBuilder<int>(
                    stream: FirestoreService().getUnreadNotificationCountStream(_authService.currentUser?.uid ?? ''),
                    builder: (context, snapshot) {
                      final unreadCount = snapshot.data ?? 0;
                      return Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.notifications_outlined, color: AppTheme.getTextPrimaryColor(context)),
                            onPressed: () => _showNotifications(),
                          ),
                          if (unreadCount > 0)
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 18,
                                  minHeight: 18,
                                ),
                                child: Text(
                                  unreadCount > 9 ? '9+' : '$unreadCount',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            // Main Content - IndexedStack for different pages
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  // 0: Home (Dashboard)
                  _buildHomeContent(),
                  // 1: ChatBot
                  _buildChatBotContent(),
                  // 2: Analysis (Capture Flow)
                  _buildAnalysisContent(),
                  // 3: Resources
                  _buildResourcesContent(),
                  // 4: Settings
                  _buildSettingsContent(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(

            color: AppTheme.getSurfaceColor(context),
            boxShadow: [
              BoxShadow(
                color: AppTheme.getShadowColor(context),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: ClipRRect(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _buildNavItem(Icons.home_rounded, l10n.dashboardHome, 0)),
                  Expanded(child: _buildNavItem(Icons.chat_bubble_outline_rounded, l10n.dashboardChatbot, 1)),
                  Expanded(child: _buildNavItem(Icons.camera_enhance_rounded, l10n.dashboardAnalysis, 2)),
                  Expanded(child: _buildNavItem(Icons.book_rounded, l10n.dashboardResources, 3)),
                  Expanded(child: _buildNavItem(Icons.person_rounded, l10n.settingsProfile, 4)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHomeHeroSection(l10n),
          const SizedBox(height: 24),
          _buildQuickActions(l10n),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              l10n.dashboardResources,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildHomeResourceHighlights(l10n),
        ],
      ),
    );
  }

  Widget _buildHomeHeroSection(AppLocalizations l10n) {
    final greetingName = (_userName?.isNotEmpty ?? false) ? _userName! : l10n.dashboardDefaultUserName;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: AppTheme.buildBrandGradient(
            context,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppTheme.getShadowColor(context),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeGreeting(greetingName),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.getBrandPrimaryColor(context),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  // Auth kontrolü
                  if (_authService.currentUser == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context)!.loginRequiredForMessaging),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PatientMessagesScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.chat_bubble_outline_rounded),
                label: Text(
                  AppLocalizations.of(context)!.chatWithMyDoctor,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _buildHeroStat kaldırıldı

  Widget _buildQuickActions(AppLocalizations l10n) {
    final actions = [
      _QuickAction(
        icon: Icons.camera_enhance_rounded,
        label: l10n.dashboardAnalysis,
        color: const Color(0xFFFFB300),
        onTap: _startCaptureFlow,
      ),
      _QuickAction(
        icon: Icons.calendar_month_rounded,
        label: AppLocalizations.of(context)!.myAppointments,
        color: const Color(0xFFEF5350),
        onTap: () => Navigator.pushNamed(context, '/appointments'),
      ),
      _QuickAction(
        icon: Icons.photo_library_rounded,
        label: l10n.captureFlowCapturedPhotos,
        color: const Color(0xFF7C4DFF),
        onTap: _openMyPhotos,
      ),
      _QuickAction(
        icon: Icons.history_rounded,
        label: l10n.pastAnalysesTitle,
        color: const Color(0xFF26C6DA),
        onTap: _openPastAnalyses,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: actions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.35,
        ),
        itemBuilder: (context, index) => _buildQuickActionCard(actions[index]),
      ),
    );
  }

  Widget _buildQuickActionCard(_QuickAction action) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: action.onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: action.color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: action.color.withValues(alpha: 0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: action.color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(action.icon, color: action.color, size: 22),
              ),
              Text(
                action.label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeResourceHighlights(AppLocalizations l10n) {
    final items = _buildResourceItems(l10n).take(3).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildResourceCard(
                  item.icon,
                  item.title,
                  item.subtitle,
                  item.onTap,
                  item.iconColor,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _startCaptureFlow() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CaptureFlowScreen()),
    );
  }

  Future<void> _openMyPhotos() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MyPhotosScreen()),
    );
  }

  Future<void> _openPastAnalyses() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PastAnalysesHistoryScreen()),
    );
  }


  Widget _buildChatBotContent() {
    // Show chatbot screen
    return const ChatSupportScreen();
  }

  Widget _buildAnalysisContent() {
    // Show analysis screen (same design as ChatBot)
    return const AnalysisScreen();
  }

  Widget _buildResourcesContent() {
    final l10n = AppLocalizations.of(context)!;
    final items = _buildResourceItems(l10n);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(

                  color: AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.book_rounded,

                  color: AppTheme.getBrandPrimaryColor(context),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.dashboardResources,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getTextPrimaryColor(context),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          for (final item in items) ...[
            _buildResourceCard(
              item.icon,
              item.title,
              item.subtitle,
              item.onTap,
              item.iconColor,
            ),
            const SizedBox(height: 16),
          ],
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  List<_ResourceCardData> _buildResourceItems(AppLocalizations l10n) {
    return [
      _ResourceCardData(
        icon: Icons.article_rounded,
        title: l10n.dashboardCareGuide,
        subtitle: l10n.dashboardCareGuideSubtitle,
        iconColor: const Color(0xFF4CAF50),
        onTap: () => Navigator.pushNamed(context, '/patient-care'),
      ),
      _ResourceCardData(
        icon: Icons.content_cut_rounded,
        title: l10n.dashboardHairTransplantTitle,
        subtitle: l10n.dashboardHairTransplantSubtitle,
        iconColor: const Color(0xFF8B4513),
        onTap: () => Navigator.pushNamed(context, '/hair-transplant'),
      ),
      _ResourceCardData(
        icon: Icons.chat_bubble_outline_rounded,
        title: l10n.dashboardOnlineConsultationTitle,
        subtitle: l10n.dashboardOnlineConsultationSubtitle,
        iconColor: const Color(0xFF25D366),
        onTap: () => Navigator.pushNamed(context, '/online-consultation'),
      ),
      _ResourceCardData(
        icon: Icons.medical_services_rounded,
        title: l10n.dashboardDoctorsTitle,
        subtitle: l10n.dashboardDoctorsSubtitle,
        iconColor: const Color(0xFF4CAF50),
        onTap: () => Navigator.pushNamed(context, '/doctors'),
      ),
      _ResourceCardData(
        icon: Icons.info_outline_rounded,
        title: l10n.dashboardAboutUsTitle,
        subtitle: l10n.dashboardAboutUsSubtitle,
        iconColor: const Color(0xFF9C27B0),
        onTap: () => Navigator.pushNamed(context, '/about-us'),
      ),
      _ResourceCardData(
        icon: Icons.contact_phone_outlined,
        title: l10n.dashboardContactTitle,
        subtitle: l10n.dashboardContactSubtitle,
        iconColor: const Color(0xFFFF5722),
        onTap: () => Navigator.pushNamed(context, '/contact'),
      ),
      _ResourceCardData(
        icon: Icons.help_outline_rounded,
        title: l10n.faqTitle,
        subtitle: l10n.faqSubtitle,
        iconColor: const Color(0xFF2196F3),
        onTap: () => Navigator.pushNamed(context, '/faq'),
      ),
      _ResourceCardData(
        icon: Icons.history_rounded,
        title: l10n.pastAnalysesTitle,
        subtitle: l10n.dashboardPastAnalysesSubtitle,
        iconColor: const Color(0xFF9C27B0),
        onTap: () => Navigator.pushNamed(context, '/past-analyses'),
      ),
    ];
  }

  Widget _buildSettingsContent() {
    return const SettingsScreen();
  }

  Widget _buildResourceCard(IconData icon, String title, String subtitle, VoidCallback onTap, Color iconColor) {
    return Container(
      decoration: BoxDecoration(

        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getShadowColor(context),
            blurRadius: 15,
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
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: iconColor, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getTextPrimaryColor(context),
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTextSecondaryColor(context),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppTheme.getBrandPrimaryColor(context),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (_selectedIndex != index) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected

                ? AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelected)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        gradient: AppTheme.buildBrandGradient(
                          context,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          subtle: true,
                        ),
                      ),
                    ),
                  Icon(
                    icon,
                    color: isSelected

                        ? AppTheme.getBrandPrimaryColor(context)
                        : AppTheme.getTextSecondaryColor(context).withValues(alpha: 0.8),
                    size: isSelected ? 26 : 24,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: isSelected ? 11 : 10,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected

                      ? AppTheme.getBrandPrimaryColor(context)
                      : AppTheme.getTextSecondaryColor(context).withValues(alpha: 0.9),
                  letterSpacing: isSelected ? 0.2 : 0,
                ),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              if (isSelected)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(

                    color: AppTheme.getBrandPrimaryColor(context),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final modalL10n = AppLocalizations.of(context)!;
        return Container(

          decoration: BoxDecoration(
            color: AppTheme.getElevatedSurfaceColor(context),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    modalL10n.notifications,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildNotificationItem(
                        Icons.calendar_today,
                        modalL10n.appointmentReminder,
                        modalL10n.appointmentReminderMessage('10:30'),
                        modalL10n.hoursAgo('2'),
                        true,
                      ),
                      const SizedBox(height: 12),
                      _buildNotificationItem(
                        Icons.medical_services,
                        modalL10n.medicationReminder,
                        modalL10n.morningMedicationReminder,
                        modalL10n.hoursAgo('5'),
                        false,
                      ),
                      const SizedBox(height: 12),
                      _buildNotificationItem(
                        Icons.photo_camera,
                        modalL10n.photoReminder,
                        modalL10n.weeklyProgressPhotoReminder,
                        modalL10n.daysAgo('1'),
                        false,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem(IconData icon, String title, String message, String time, bool isUnread) {
    final l10n = AppLocalizations.of(context)!;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Bildirime tıklandığında yapılacak işlem
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.notificationOpened(title))),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(

            color: isUnread
                ? AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.07)
                : AppTheme.getMutedSurfaceColor(context),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isUnread
                  ? AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.3)
                  : AppTheme.getBorderColor(context),
              width: isUnread ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(

                  color: AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppTheme.getBrandPrimaryColor(context), size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isUnread ? FontWeight.w700 : FontWeight.w600,
                              color: AppTheme.getTextPrimaryColor(context),
                            ),
                          ),
                        ),
                        if (isUnread)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppTheme.getPrimaryColor(context),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.getTextSecondaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 10,
                        color: AppTheme.getTextSecondaryColor(context).withValues(alpha: 0.7),
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



class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class _ResourceCardData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final VoidCallback onTap;

  const _ResourceCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.onTap,
  });
}
