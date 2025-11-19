import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/notification_service.dart';
import '../services/firestore_service.dart';
import '../services/auth_service.dart';

class ScheduledEmailsScreen extends StatefulWidget {
  const ScheduledEmailsScreen({super.key});

  @override
  State<ScheduledEmailsScreen> createState() => _ScheduledEmailsScreenState();
}

class _ScheduledEmailsScreenState extends State<ScheduledEmailsScreen> {
  final NotificationService _notificationService = NotificationService();
  final FirestoreService _firestoreService = FirestoreService();
  final AuthService _authService = AuthService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  
  TimeOfDay _selectedTime = const TimeOfDay(hour: 9, minute: 0);
  final List<int> _selectedDays = [];
  List<String> _getDayNames(AppLocalizations l10n) {
    return [l10n.monday, l10n.tuesday, l10n.wednesday, l10n.thursday, l10n.friday, l10n.saturday, l10n.sunday];
  }
  final List<int> _dayValues = [1, 2, 3, 4, 5, 6, 7];

  @override
  void initState() {
    super.initState();
    _emailController.text = 'david@example.com';
    _nameController.text = 'David';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.primaryGreen,
              onPrimary: Colors.white,
              onSurface: AppTheme.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _toggleDay(int day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        _selectedDays.remove(day);
      } else {
        _selectedDays.add(day);
      }
      _selectedDays.sort();
    });
  }

  Future<void> _saveScheduledEmail() async {
    final l10n = AppLocalizations.of(context)!;
    
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.titleCannotBeEmpty)),
      );
      return;
    }

    if (_messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.messageCannotBeEmpty)),
      );
      return;
    }

    if (_emailController.text.trim().isEmpty || !_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.pleaseEnterValidEmail)),
      );
      return;
    }

    if (_selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.selectAtLeastOneDay)),
      );
      return;
    }

    if (!_authService.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.loginRequired)),
      );
      return;
    }

    // Firebase'e kaydet
    try {
      await _firestoreService.addScheduledEmail(
        _authService.currentUser!.uid,
        {
          'title': _titleController.text.trim(),
          'message': _messageController.text.trim(),
          'recipientEmail': _emailController.text.trim(),
          'recipientName': _nameController.text.trim(),
          'time': '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}',
          'daysOfWeek': _selectedDays,
          'isActive': true,
        },
      );

      // Local notification service'e de ekle
      _notificationService.scheduleDailyEmail(
        title: _titleController.text.trim(),
        message: _messageController.text.trim(),
        recipientEmail: _emailController.text.trim(),
        recipientName: _nameController.text.trim(),
        time: _selectedTime,
        daysOfWeek: _selectedDays,
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.dailyEmailScheduled),
            backgroundColor: Colors.green,
          ),
        );
        setState(() {}); // Refresh list
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.errorOccurred(e.toString())), backgroundColor: Colors.red),
        );
      }
    }
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
          icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.scheduledEmails,
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: AppTheme.primaryGreen),
            onPressed: () => _showAddScheduleDialog(),
          ),
        ],
      ),
      body: _authService.isAuthenticated
          ? StreamBuilder<List<Map<String, dynamic>>>(
              stream: _firestoreService.getScheduledEmailsStream(_authService.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryGreen,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(AppLocalizations.of(context)!.errorOccurred(snapshot.error.toString())),
                  );
                }

                final tasks = snapshot.data ?? [];

                return tasks.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return _buildFirebaseTaskCard(task);
                        },
                      );
              },
            )
          : Center(
              child: Text(
                l10n.loginRequired,
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.getTextSecondaryColor(context),
                ),
              ),
            ),
    );
  }

  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context)!;
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
            l10n.noScheduledEmails,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.createDailyEmailTasks,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.getTextSecondaryColor(context).withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showAddScheduleDialog(),
            icon: const Icon(Icons.add),
            label: Text(l10n.newScheduledEmail), // l10n already defined in _buildEmptyState
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

  Widget _buildFirebaseTaskCard(Map<String, dynamic> task) {
    final l10n = AppLocalizations.of(context)!;
    final daysOfWeek = (task['daysOfWeek'] as List<dynamic>?)?.cast<int>() ?? [];
    final time = task['time'] as String? ?? '09:00';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task['title'] ?? l10n.noTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () => _showFirebaseDeleteConfirmation(task),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              task['message'] ?? '',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.getTextSecondaryColor(context),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: AppTheme.getPrimaryColor(context)),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.getTextPrimaryColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.calendar_today, size: 16, color: AppTheme.getPrimaryColor(context)),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    daysOfWeek.map((day) => _getDayNames(l10n)[day - 1].substring(0, 3)).join(', '),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.getTextPrimaryColor(context),
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.email, size: 16, color: AppTheme.getTextSecondaryColor(context)),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    task['recipientEmail'] ?? '',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(ScheduledEmailTask task) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: task.isActive
                        ? AppTheme.primaryGreen.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    task.isActive ? l10n.active : l10n.inactive,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: task.isActive ? AppTheme.primaryGreen : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              task.message,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.email, size: 16, color: AppTheme.getTextSecondaryColor(context)),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    task.recipientEmail,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: AppTheme.getTextSecondaryColor(context)),
                const SizedBox(width: 4),
                Text(
                  '${task.scheduledTime.hour.toString().padLeft(2, '0')}:${task.scheduledTime.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.getTextSecondaryColor(context),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.calendar_today, size: 16, color: AppTheme.getTextSecondaryColor(context)),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    task.daysDisplay,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Switch(
                  value: task.isActive,
                  onChanged: (value) {
                    _notificationService.toggleScheduledTask(task.id, value);
                    setState(() {});
                  },
                  activeColor: AppTheme.primaryGreen,
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showDeleteConfirmation(task);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showFirebaseDeleteConfirmation(Map<String, dynamic> task) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) {
        final dialogL10n = AppLocalizations.of(context)!;
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(dialogL10n.deleteTask),
          content: Text(dialogL10n.deleteTaskConfirmation(task['title'] ?? 'Bu görev')),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(dialogL10n.cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (_authService.isAuthenticated && task['id'] != null) {
                    await _firestoreService.deleteScheduledEmail(
                      _authService.currentUser!.uid,
                      task['id'],
                    );
                    
                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(dialogL10n.taskDeleted)),
                      );
                    }
                  }
                } catch (e) {
                  if (mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppLocalizations.of(context)!.errorOccurred(e.toString())), backgroundColor: Colors.red),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text(dialogL10n.delete),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmation(ScheduledEmailTask task) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) {
        final dialogL10n = AppLocalizations.of(context)!;
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(dialogL10n.deleteTask),
          content: Text(dialogL10n.deleteTaskConfirmation(task.title)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(dialogL10n.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                _notificationService.removeScheduledTask(task.id);
                Navigator.pop(context);
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(dialogL10n.taskDeleted)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text(dialogL10n.delete),
            ),
          ],
        );
      },
    );
  }

  void _showAddScheduleDialog() {
    final l10n = AppLocalizations.of(context)!;
    _titleController.clear();
    _messageController.clear();
    _selectedDays.clear();
    _selectedTime = const TimeOfDay(hour: 9, minute: 0);

    showDialog(
      context: context,
      builder: (context) {
        final dialogL10n = AppLocalizations.of(context)!;
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dialogL10n.newScheduledEmail,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(dialogL10n.titleLabel, _titleController, Icons.title),
                  const SizedBox(height: 16),
                  _buildTextField(dialogL10n.messageLabel, _messageController, Icons.message, maxLines: 3),
                  const SizedBox(height: 16),
                  _buildTextField(dialogL10n.email, _emailController, Icons.email, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  _buildTextField(dialogL10n.recipientNameLabel, _nameController, Icons.person),
                  const SizedBox(height: 16),
                  Text(
                    dialogL10n.timeLabel,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: _selectTime,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.borderLight),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: AppTheme.primaryGreen),
                        const SizedBox(width: 12),
                        Text(
                          '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.getTextPrimaryColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  dialogL10n.daysLabel,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.getTextPrimaryColor(context),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(7, (index) {
                    final day = _dayValues[index];
                    final isSelected = _selectedDays.contains(day);
                    return ChoiceChip(
                      label: Text(_getDayNames(l10n)[index]),
                      selected: isSelected,
                      onSelected: (_) => _toggleDay(day),
                      selectedColor: AppTheme.primaryGreen.withOpacity(0.2),
                      labelStyle: TextStyle(
                        color: isSelected ? AppTheme.primaryGreen : AppTheme.textSecondary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(dialogL10n.cancel),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _saveScheduledEmail();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryGreen,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(dialogL10n.save),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon, {int maxLines = 1, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.getTextPrimaryColor(context),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.borderLight),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
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
}



