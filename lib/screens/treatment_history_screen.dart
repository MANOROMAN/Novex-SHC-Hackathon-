import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';
import 'package:self_capture/l10n/app_localizations.dart';

class TreatmentHistoryScreen extends StatelessWidget {
  TreatmentHistoryScreen({super.key});

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;
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
          l10n.treatmentHistoryTitle,
          style: const TextStyle(
            color: Color(0xFF0D121B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: user == null
          ? _buildAuthRequired(context, l10n)
          : StreamBuilder<List<Map<String, dynamic>>>(
              stream: _firestoreService.getUserAppointmentsStream(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryGreen,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return _buildError(context, l10n, snapshot.error.toString());
                }

                final appointments = snapshot.data ?? [];

                if (appointments.isEmpty) {
                  return _buildEmptyState(context, l10n);
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final appointment = appointments[index];
                    return _buildAppointmentCard(context, l10n, appointment);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemCount: appointments.length,
                );
              },
            ),
    );
  }

  Widget _buildAuthRequired(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Text(
        l10n.treatmentHistoryLoginRequired,
        style: TextStyle(
          fontSize: 14,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, AppLocalizations l10n, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade400, size: 42),
            const SizedBox(height: 12),
            Text(
              l10n.anErrorOccurred(message),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.history_toggle_off, size: 56, color: AppTheme.textSecondary),
            const SizedBox(height: 12),
            Text(
              l10n.treatmentHistoryEmpty,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, AppLocalizations l10n, Map<String, dynamic> appointment) {
    final timestamp = appointment['dateTime'];
    DateTime? dateTime;
    if (timestamp is DateTime) {
      dateTime = timestamp;
    } else if (timestamp != null) {
      dateTime = timestamp.toDate();
    }

    final formattedDate = dateTime != null
        ? '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}'
        : l10n.treatmentHistoryDatePending;
    final formattedTime = dateTime != null ? '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}' : '--:--';

    final status = (appointment['status'] ?? 'scheduled') as String;
    final statusConfig = _getStatusConfig(l10n, status);

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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, size: 18, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                Text(
                  '$formattedDate · $formattedTime',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusConfig.color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusConfig.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: statusConfig.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              appointment['type'] ?? l10n.treatmentHistoryDefaultType,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D121B),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.person_outline, size: 18, color: AppTheme.textSecondary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    appointment['doctorName'] ?? l10n.treatmentHistoryDoctorPending,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            if (appointment['notes'] != null && (appointment['notes'] as String).isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                appointment['notes'],
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
            if (appointment['location'] != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 18, color: AppTheme.textSecondary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      appointment['location'],
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  _StatusConfig _getStatusConfig(AppLocalizations l10n, String status) {
    switch (status) {
      case 'completed':
        return _StatusConfig(l10n.treatmentHistoryStatusCompleted, Colors.green);
      case 'cancelled':
        return _StatusConfig(l10n.treatmentHistoryStatusCancelled, Colors.red);
      case 'in_progress':
        return _StatusConfig(l10n.treatmentHistoryStatusInProgress, Colors.orange);
      default:
        return _StatusConfig(l10n.treatmentHistoryStatusScheduled, AppTheme.primaryGreen);
    }
  }
}

class _StatusConfig {
  final String label;
  final Color color;
  _StatusConfig(this.label, this.color);
}



