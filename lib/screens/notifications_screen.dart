import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../models/notification_model.dart';
import '../services/notification_service.dart';
import '../services/firestore_service.dart';
import '../services/auth_service.dart';
import 'scheduled_emails_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final NotificationService _notificationService = NotificationService();
  final FirestoreService _firestoreService = FirestoreService();
  final AuthService _authService = AuthService();
  int _selectedTab = 0; // 0: Tümü, 1: Okunmamış, 2: Planlanmış

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.notificationsTitle ?? 'Bildirimler',
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (_authService.isAuthenticated) {
                await _firestoreService.markAllNotificationsAsRead(_authService.currentUser!.uid);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocalizations.of(context)!.allNotificationsMarkedAsRead)),
                  );
                }
              }
            },
            child: Text(
              AppLocalizations.of(context)?.markAllAsRead ?? 'Tümünü Okundu İşaretle',
              style: TextStyle(color: AppTheme.getPrimaryColor(context), fontSize: 12),
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: AppTheme.getTextPrimaryColor(context)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScheduledEmailsScreen(),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(bottom: BorderSide(color: AppTheme.borderLight)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildTabButton(AppLocalizations.of(context)?.all ?? 'Tümü', 0),
                ),
                Expanded(
                  child: _buildTabButton(AppLocalizations.of(context)?.unread ?? 'Okunmamış', 1),
                ),
                Expanded(
                  child: _buildTabButton(AppLocalizations.of(context)?.scheduled ?? 'Planlanmış', 2),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _selectedTab == 2
          ? _buildScheduledEmailsView()
          : _authService.isAuthenticated
              ? StreamBuilder<List<NotificationModel>>(
                  stream: _firestoreService.getUserNotificationsStream(_authService.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: AppTheme.primaryGreen),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(AppLocalizations.of(context)!.errorOccurred(snapshot.error.toString())),
                      );
                    }

                    var notifications = snapshot.data ?? [];
                    
                    // Filter based on selected tab
                    if (_selectedTab == 1) {
                      notifications = notifications.where((n) => !n.isRead).toList();
                    }

                    return notifications.isEmpty
                        ? _buildEmptyState()
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              return _buildNotificationItem(notifications[index]);
                            },
                          );
                  },
                )
              : Center(
                  child: Text(
                    AppLocalizations.of(context)?.loginRequired ?? 'Giriş yapmanız gerekiyor',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                  ),
                ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = _selectedTab == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppTheme.primaryGreen : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.primaryGreen : AppTheme.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    IconData icon;
    Color iconColor;

    switch (notification.type) {
      case NotificationType.appointment:
        icon = Icons.calendar_today;
        iconColor = Colors.blue;
        break;
      case NotificationType.medication:
        icon = Icons.medical_services;
        iconColor = Colors.orange;
        break;
      case NotificationType.photo:
        icon = Icons.photo_camera;
        iconColor = Colors.purple;
        break;
      case NotificationType.email:
        icon = Icons.email;
        iconColor = Colors.red;
        break;
      default:
        icon = Icons.notifications;
        iconColor = AppTheme.primaryGreen;
    }

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.surface),
      ),
      onDismissed: (direction) async {
        if (_authService.isAuthenticated) {
          await _firestoreService.deleteNotification(
            _authService.currentUser!.uid,
            notification.id,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: notification.isRead ? Colors.white : AppTheme.primaryGreen.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: notification.isRead
                ? AppTheme.borderLight
                : AppTheme.primaryGreen.withOpacity(0.3),
            width: notification.isRead ? 1 : 1.5,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              if (_authService.isAuthenticated && !notification.isRead) {
                await _firestoreService.markNotificationAsRead(
                  _authService.currentUser!.uid,
                  notification.id,
                );
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: iconColor, size: 24),
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
                                notification.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: notification.isRead
                                      ? FontWeight.w500
                                      : FontWeight.w700,
                                  color: AppTheme.getTextPrimaryColor(context),
                                ),
                              ),
                            ),
                            if (!notification.isRead)
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
                        const SizedBox(height: 6),
                        Text(
                          notification.message,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.getTextSecondaryColor(context),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          notification.timeAgo,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.getTextSecondaryColor(context).withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 64,
            color: AppTheme.getTextSecondaryColor(context).withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)?.noNotificationsYet ?? 'Henüz bildirim yok',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)?.newNotificationsWillAppearHere ?? 'Yeni bildirimler burada görünecek',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.getTextSecondaryColor(context).withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduledEmailsView() {
    return FutureBuilder<List<ScheduledEmailTask>>(
      future: _notificationService.getScheduledTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppTheme.getPrimaryColor(context),
            ),
          );
        }

        final tasks = snapshot.data ?? [];

        if (tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.schedule,
                  size: 64,
                  color: AppTheme.getTextSecondaryColor(context).withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)?.noScheduledEmails ?? 'Planlanmış email yok',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.getTextSecondaryColor(context),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScheduledEmailsScreen(),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  icon: const Icon(Icons.add),
                  label: Text(AppLocalizations.of(context)?.newScheduledEmail ?? 'Yeni Planlanmış Email'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borderLight),
                ),
                child: ListTile(
                  title: Text(task.title),
                  subtitle: Text('${task.scheduledTime.format(context)} - ${task.daysDisplay}'),
                  trailing: Switch(
                    value: task.isActive,
                    onChanged: (value) async {
                      await _notificationService.toggleScheduledTask(task.id, value);
                      setState(() {}); // FutureBuilder'ı yeniden tetikler
                    },
                    activeColor: AppTheme.primaryGreen,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}


