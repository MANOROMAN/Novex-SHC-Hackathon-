import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/doctor_auth_service.dart';
import 'doctor_appointments_screen.dart';
import 'doctor_messages_screen.dart';
import 'doctor_approvals_screen.dart';
import 'doctor_settings_screen.dart';

class DoctorDashboardShell extends StatefulWidget {
  const DoctorDashboardShell({super.key});

  @override
  State<DoctorDashboardShell> createState() => _DoctorDashboardShellState();
}

class _DoctorDashboardShellState extends State<DoctorDashboardShell> {
  int _index = 0;

  final _pages = const [
    _DoctorAppointmentsWrapper(),
    DoctorMessagesScreen(),
    DoctorApprovalsScreen(),
    DoctorSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            backgroundColor: Colors.transparent,
            elevation: 0,
            height: 70,
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              NavigationDestination(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _index == 0 
                        ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: _index == 0 
                        ? AppTheme.getBrandPrimaryColor(context) 
                        : AppTheme.getTextSecondaryColor(context),
                    size: 24,
                  ),
                ),
                selectedIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.calendar_month,
                    color: AppTheme.getBrandPrimaryColor(context),
                    size: 24,
                  ),
                ),
                label: AppLocalizations.of(context)?.appointment ?? 'Randevular',
              ),
              NavigationDestination(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _index == 1 
                        ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: _index == 1 
                        ? AppTheme.getBrandPrimaryColor(context) 
                        : AppTheme.getTextSecondaryColor(context),
                    size: 24,
                  ),
                ),
                selectedIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.chat_bubble,
                    color: AppTheme.getBrandPrimaryColor(context),
                    size: 24,
                  ),
                ),
                label: AppLocalizations.of(context)?.message ?? 'Mesajlarım',
              ),
              NavigationDestination(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _index == 2 
                        ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.photo_library_outlined,
                    color: _index == 2 
                        ? AppTheme.getBrandPrimaryColor(context) 
                        : AppTheme.getTextSecondaryColor(context),
                    size: 24,
                  ),
                ),
                selectedIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.photo_library,
                    color: AppTheme.getBrandPrimaryColor(context),
                    size: 24,
                  ),
                ),
                label: AppLocalizations.of(context)?.photo ?? 'Fotoğraflar',
              ),
              NavigationDestination(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _index == 3 
                        ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.settings_outlined,
                    color: _index == 3 
                        ? AppTheme.getBrandPrimaryColor(context) 
                        : AppTheme.getTextSecondaryColor(context),
                    size: 24,
                  ),
                ),
                selectedIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.settings,
                    color: AppTheme.getBrandPrimaryColor(context),
                    size: 24,
                  ),
                ),
                label: AppLocalizations.of(context)?.settings ?? 'Ayarlar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Wrapper widget that provides doctor info to DoctorAppointmentsScreen
class _DoctorAppointmentsWrapper extends StatelessWidget {
  const _DoctorAppointmentsWrapper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: _getDoctorInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final doctorInfo = snapshot.data ?? {'id': '', 'name': 'Doktor'};
        
        return DoctorAppointmentsScreen(
          doctorId: doctorInfo['id']!,
          doctorName: doctorInfo['name']!,
        );
      },
    );
  }
  
  Future<Map<String, String>> _getDoctorInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final doctorAuthService = DoctorAuthService();
      final storedDoctorId = await doctorAuthService.getStoredDoctorId();
      final doctorName = prefs.getString('doctor_name') ?? 'Doktor';

      if (storedDoctorId == null || storedDoctorId.isEmpty) {
        return {'id': '', 'name': doctorName};
      }

      return {'id': storedDoctorId, 'name': doctorName};
    } catch (e) {
      return {'id': '', 'name': 'Doktor'};
    }
  }
}


