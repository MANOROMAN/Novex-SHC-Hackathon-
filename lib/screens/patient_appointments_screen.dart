import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../models/appointment.dart';
import '../models/doctor_model.dart';
import '../services/appointment_service.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';

/// Hasta randevu yönetim ekranı
class PatientAppointmentsScreen extends StatefulWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  State<PatientAppointmentsScreen> createState() => _PatientAppointmentsScreenState();
}

class _PatientAppointmentsScreenState extends State<PatientAppointmentsScreen> with SingleTickerProviderStateMixin {
  final AppointmentService _appointmentService = AppointmentService();
  final AuthService _authService = AuthService();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = _authService.currentUser;
    
    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.myAppointments)),
        body: Center(
          child: Text(AppLocalizations.of(context)!.loginRequired),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.myAppointments, style: const TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryGreen, AppTheme.primaryGreen.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          unselectedLabelStyle: const TextStyle(fontSize: 14, color: Colors.white70),
          tabs: [
            Tab(
              icon: const Icon(Icons.upcoming, color: Colors.white),
              text: 'Yaklaşan',
            ),
            Tab(
              icon: const Icon(Icons.history, color: Colors.white),
              text: 'Geçmiş',
            ),
            Tab(
              icon: const Icon(Icons.cancel, color: Colors.white),
              text: 'İptal',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpcomingAppointments(currentUser.uid),
          _buildPastAppointments(currentUser.uid),
          _buildCancelledAppointments(currentUser.uid),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showNewAppointmentDialog(context, currentUser.uid, currentUser.displayName ?? 'Hasta'),
        backgroundColor: AppTheme.primaryGreen,
        elevation: 8,
        icon: const Icon(Icons.add_circle_outline, size: 24),
        label: const Text('Yeni Randevu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  /// Yaklaşan randevular
  Widget _buildUpcomingAppointments(String patientId) {
    return StreamBuilder<List<Appointment>>(
      stream: _appointmentService.getPatientAppointments(patientId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(AppLocalizations.of(context)!.errorOccurred(snapshot.error.toString())));
        }

        final appointments = snapshot.data
            ?.where((a) =>
                (a.status == AppointmentStatus.pending || a.status == AppointmentStatus.confirmed) &&
                a.dateTime.isAfter(DateTime.now()))
            .toList() ??
            [];

        if (appointments.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.event_busy, size: 80, color: Colors.grey.shade300),
                const SizedBox(height: 16),
                Text(
                  'Yaklaşan randevunuz bulunmuyor',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Text(
                  'Yeni randevu almak için + butonuna tıklayın',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: appointments.length,
          itemBuilder: (context, index) => _buildAppointmentCard(appointments[index]),
        );
      },
    );
  }

  /// Geçmiş randevular
  Widget _buildPastAppointments(String patientId) {
    return StreamBuilder<List<Appointment>>(
      stream: _appointmentService.getPatientAppointments(patientId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final appointments = snapshot.data
            ?.where((a) =>
                a.status == AppointmentStatus.completed ||
                (a.dateTime.isBefore(DateTime.now()) && a.status != AppointmentStatus.cancelled))
            .toList() ??
            [];

        if (appointments.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.history, size: 80, color: Colors.grey.shade300),
                const SizedBox(height: 16),
                Text(
                  'Geçmiş randevunuz bulunmuyor',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: appointments.length,
          itemBuilder: (context, index) => _buildAppointmentCard(appointments[index]),
        );
      },
    );
  }

  /// İptal edilen randevular
  Widget _buildCancelledAppointments(String patientId) {
    return StreamBuilder<List<Appointment>>(
      stream: _appointmentService.getPatientAppointments(patientId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final appointments = snapshot.data?.where((a) => a.status == AppointmentStatus.cancelled).toList() ?? [];

        if (appointments.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, size: 80, color: Colors.grey.shade300),
                const SizedBox(height: 16),
                Text(
                  'İptal edilen randevunuz bulunmuyor',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: appointments.length,
          itemBuilder: (context, index) => _buildAppointmentCard(appointments[index]),
        );
      },
    );
  }

  /// Randevu kartı
  Widget _buildAppointmentCard(Appointment appointment) {
    final isPast = appointment.dateTime.isBefore(DateTime.now());
    final canCancel = !isPast &&
        appointment.status != AppointmentStatus.cancelled &&
        appointment.status != AppointmentStatus.completed;
    final canUpdate = !isPast && appointment.status == AppointmentStatus.pending;

    Color statusColor;
    IconData statusIcon;
    switch (appointment.status) {
      case AppointmentStatus.pending:
        statusColor = Colors.orange;
        statusIcon = Icons.schedule;
        break;
      case AppointmentStatus.confirmed:
        statusColor = AppTheme.primaryGreen;
        statusIcon = Icons.check_circle;
        break;
      case AppointmentStatus.completed:
        statusColor = Colors.blue;
        statusIcon = Icons.done_all;
        break;
      case AppointmentStatus.cancelled:
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shadowColor: statusColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: statusColor.withOpacity(0.2), width: 1),
      ),
      child: InkWell(
        onTap: () => _showAppointmentDetails(context, appointment, canCancel, canUpdate),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.white, statusColor.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.person, color: statusColor, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointment.doctorName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  appointment.typeText,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [statusColor, statusColor.withOpacity(0.7)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: statusColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(statusIcon, size: 14, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            appointment.statusText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 18, color: statusColor),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              DateFormat('dd MMMM yyyy, EEEE', 'tr_TR').format(appointment.dateTime),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18, color: statusColor),
                          const SizedBox(width: 10),
                          Text(
                            DateFormat('HH:mm').format(appointment.dateTime),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (appointment.notes.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.2)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.note_alt, size: 18, color: AppTheme.primaryGreen),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            appointment.notes,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (appointment.cancelReason != null && appointment.cancelReason!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red.withOpacity(0.2)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline, size: 18, color: Colors.red),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'İptal Nedeni:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                appointment.cancelReason!,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Randevu detayları göster
  void _showAppointmentDetails(BuildContext context, Appointment appointment, bool canCancel, bool canUpdate) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Randevu Detayları',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 24),
            _buildDetailRow(Icons.person, 'Doktor', appointment.doctorName),
            _buildDetailRow(Icons.calendar_today, 'Tarih', DateFormat('dd MMMM yyyy, EEEE', 'tr_TR').format(appointment.dateTime)),
            _buildDetailRow(Icons.access_time, 'Saat', DateFormat('HH:mm').format(appointment.dateTime)),
            _buildDetailRow(Icons.medical_services, 'Tür', appointment.typeText),
            _buildDetailRow(Icons.info_outline, 'Durum', appointment.statusText),
            if (appointment.notes.isNotEmpty)
              _buildDetailRow(Icons.note, 'Not', appointment.notes),
            if (appointment.cancelReason != null)
              _buildDetailRow(Icons.cancel, 'İptal Nedeni', appointment.cancelReason!),
            const SizedBox(height: 24),
            Row(
              children: [
                if (canUpdate)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showUpdateAppointmentDialog(context, appointment);
                      },
                      icon: const Icon(Icons.edit),
                      label: Text(AppLocalizations.of(context)!.update),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.primaryGreen,
                        side: BorderSide(color: AppTheme.primaryGreen),
                      ),
                    ),
                  ),
                if (canUpdate && canCancel) const SizedBox(width: 12),
                if (canCancel)
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showCancelDialog(context, appointment);
                      },
                      icon: const Icon(Icons.cancel),
                      label: Text(AppLocalizations.of(context)!.cancel),
                      style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryGreen),
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
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Yeni randevu dialog
  void _showNewAppointmentDialog(BuildContext context, String patientId, String patientName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewAppointmentScreen(
          patientId: patientId,
          patientName: patientName,
        ),
      ),
    );
  }

  /// Randevu güncelleme dialog
  void _showUpdateAppointmentDialog(BuildContext context, Appointment appointment) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateAppointmentScreen(appointment: appointment),
      ),
    );
  }

  /// İptal dialog
  void _showCancelDialog(BuildContext context, Appointment appointment) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.cancelAppointment),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.confirmCancelAppointment),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.cancelReasonOptional,
                hintText: AppLocalizations.of(context)!.cancelReasonExample,
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await _appointmentService.cancelAppointment(
                  appointmentId: appointment.id,
                  cancelReason: reasonController.text.trim().isEmpty
                      ? 'İptal edildi'
                      : reasonController.text.trim(),
                );
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocalizations.of(context)!.appointmentCancelled)),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocalizations.of(context)!.errorOccurred(e.toString()))),
                  );
                }
              }
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
        ],
      ),
    );
  }
}

// Yeni randevu ekranı (ayrı dosyada olabilir)
class NewAppointmentScreen extends StatefulWidget {
  final String patientId;
  final String patientName;

  const NewAppointmentScreen({
    super.key,
    required this.patientId,
    required this.patientName,
  });

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  final AppointmentService _appointmentService = AppointmentService();
  Doctor? _selectedDoctor;
  DateTime? _selectedDate;
  DateTime? _selectedTime;
  AppointmentType _selectedType = AppointmentType.checkup;
  final _notesController = TextEditingController();
  bool _isLoading = false;
  List<DateTime> _availableSlots = [];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.newAppointment)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDoctorSelector(),
            const SizedBox(height: 16),
            _buildTypeSelector(),
            const SizedBox(height: 16),
            _buildDateSelector(),
            if (_selectedDate != null) ...[
              const SizedBox(height: 16),
              _buildTimeSlotSelector(),
            ],
            const SizedBox(height: 16),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.notesOptional,
                hintText: AppLocalizations.of(context)!.appointmentNotesHint,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _selectedDoctor != null && _selectedTime != null && !_isLoading
                  ? _createAppointment
                  : null,
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.primaryGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  : Text(AppLocalizations.of(context)!.createAppointment),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorSelector() {
    final doctors = Doctor.getAllDoctors().where((d) => d.canMessage).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Doktor Seçin',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.getTextPrimaryColor(context),
          ),
        ),
        const SizedBox(height: 12),
        ...doctors.map((doctor) {
          final isSelected = _selectedDoctor?.id == doctor.id;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDoctor = doctor;
                _selectedDate = null;
                _selectedTime = null;
                _availableSlots = [];
              });
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: isSelected ? 8 : 2,
              shadowColor: AppTheme.primaryGreen.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: isSelected
                      ? AppTheme.primaryGreen
                      : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            AppTheme.primaryGreen.withOpacity(0.08),
                            AppTheme.primaryGreen.withOpacity(0.02),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Avatar
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.primaryGreen
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: AppTheme.primaryGreen.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            doctor.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.grey.shade600,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Doktor bilgileri
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? AppTheme.primaryGreen
                                    : AppTheme.getTextPrimaryColor(context),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryGreen.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                doctor.getLocalizedSpecialization(context),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.primaryGreen,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.work_history, 
                                  size: 14, 
                                  color: Colors.grey.shade600),
                                const SizedBox(width: 4),
                                Text(
                                  '${doctor.experienceYears} yıl deneyim',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.medical_services, 
                                  size: 14, 
                                  color: Colors.grey.shade600),
                                const SizedBox(width: 4),
                                Text(
                                  '${doctor.completedSurgeries}+ işlem',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Seçim göstergesi
                      if (isSelected)
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryGreen,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryGreen.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTypeSelector() {
    final typeIcons = {
      AppointmentType.consultation: Icons.chat_bubble_outline,
      AppointmentType.checkup: Icons.medical_information_outlined,
      AppointmentType.surgery: Icons.healing,
      AppointmentType.followUp: Icons.trending_up,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Randevu Tipi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.getTextPrimaryColor(context),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: AppointmentType.values.map((type) {
            final isSelected = _selectedType == type;
            return GestureDetector(
              onTap: () {
                setState(() => _selectedType = type);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            AppTheme.primaryGreen,
                            AppTheme.primaryGreen.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.primaryGreen
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: AppTheme.primaryGreen.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      typeIcons[type] ?? Icons.info_outline,
                      size: 18,
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _getTypeText(type),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tarih Seçin',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.getTextPrimaryColor(context),
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: _selectedDoctor == null ? null : _selectDate,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              gradient: _selectedDate != null
                  ? LinearGradient(
                      colors: [
                        AppTheme.primaryGreen.withOpacity(0.1),
                        AppTheme.primaryGreen.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: _selectedDate == null ? Colors.grey.shade100 : null,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _selectedDate != null
                    ? AppTheme.primaryGreen
                    : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    color: AppTheme.primaryGreen,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tarih Seçin',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _selectedDate == null
                            ? 'Lütfen bir tarih seçin'
                            : DateFormat('dd MMMM yyyy, EEEE', 'tr_TR')
                                .format(_selectedDate!),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.getTextPrimaryColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.primaryGreen,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlotSelector() {
    if (_availableSlots.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.schedule, size: 80, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(
              'Bu tarih için müsait saat bulunmuyor',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saat Seçin',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.getTextPrimaryColor(context),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _availableSlots.map((slot) {
            final isSelected = _selectedTime == slot;
            return GestureDetector(
              onTap: () {
                setState(() => _selectedTime = slot);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            AppTheme.primaryGreen,
                            AppTheme.primaryGreen.withOpacity(0.85),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.primaryGreen
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: AppTheme.primaryGreen.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 18,
                      color: isSelected ? Colors.white : AppTheme.primaryGreen,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      DateFormat('HH:mm').format(slot),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final firstDate = now;
    final lastDate = now.add(const Duration(days: 90));

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
      locale: const Locale('tr', 'TR'),
      selectableDayPredicate: (date) {
        // Pazar günü seçilemez
        return date.weekday != DateTime.sunday;
      },
    );

    if (pickedDate != null && _selectedDoctor != null) {
      setState(() {
        _selectedDate = pickedDate;
        _selectedTime = null;
        _isLoading = true;
      });

      // Müsait saatleri getir
      final slots = await _appointmentService.getAvailableSlots(
        doctorId: _selectedDoctor!.id,
        date: pickedDate,
      );

      setState(() {
        _availableSlots = slots;
        _isLoading = false;
      });
    }
  }

  Future<void> _createAppointment() async {
    if (_selectedDoctor == null || _selectedTime == null) return;

    setState(() => _isLoading = true);

    try {
      // Doktor ID'sini belirle: email varsa HER ZAMAN email'den oluştur, yoksa eski ID'yi kullan
      String doctorId = _selectedDoctor!.id;
      if (_selectedDoctor!.email != null && _selectedDoctor!.email!.isNotEmpty) {
        // Email'den doğru ID formatını oluştur (saricitarik@gmail.com -> saricitarik_at_gmail_com)
        // ÖNEMLİ: Her zaman email'den ID oluştur, çünkü Doctor.getAllDoctors() eski ID formatını kullanıyor
        doctorId = _selectedDoctor!.email!
            .toLowerCase()
            .trim()
            .replaceAll('@', '_at_')
            .replaceAll('.', '_');
        debugPrint('📝 Randevu için email\'den ID oluşturuldu:');
        debugPrint('   Email: ${_selectedDoctor!.email}');
        debugPrint('   Eski ID: ${_selectedDoctor!.id}');
        debugPrint('   Yeni ID: $doctorId');
      } else {
        debugPrint('⚠️ Randevu için email bulunamadı, eski ID kullanılıyor: $doctorId');
      }
      
      await _appointmentService.createAppointment(
        patientId: widget.patientId,
        patientName: widget.patientName,
        doctorId: doctorId,
        doctorName: _selectedDoctor!.name,
        dateTime: _selectedTime!,
        type: _selectedType,
        notes: _notesController.text.trim(),
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.appointmentCreatedWaitingApproval)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _getTypeText(AppointmentType type) {
    switch (type) {
      case AppointmentType.consultation:
        return 'Konsültasyon';
      case AppointmentType.checkup:
        return 'Kontrol';
      case AppointmentType.surgery:
        return 'Ameliyat';
      case AppointmentType.followUp:
        return 'Takip';
    }
  }
}

// Randevu güncelleme ekranı (basitleştirilmiş - sadece tarih değişikliği)
class UpdateAppointmentScreen extends StatefulWidget {
  final Appointment appointment;

  const UpdateAppointmentScreen({super.key, required this.appointment});

  @override
  State<UpdateAppointmentScreen> createState() => _UpdateAppointmentScreenState();
}

class _UpdateAppointmentScreenState extends State<UpdateAppointmentScreen> {
  final AppointmentService _appointmentService = AppointmentService();
  DateTime? _newDateTime;
  List<DateTime> _availableSlots = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.updateAppointment)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${AppLocalizations.of(context)!.currentDate} ${DateFormat('dd MMMM yyyy, HH:mm', 'tr_TR').format(widget.appointment.dateTime)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(AppLocalizations.of(context)!.selectNewDate, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _selectNewDate,
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _newDateTime == null ? 'Tarih Seçin' : DateFormat('dd MMMM yyyy', 'tr_TR').format(_newDateTime!),
              ),
            ),
            if (_availableSlots.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('Saat Seç', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _availableSlots.map((slot) {
                  final isSelected = _newDateTime == slot;
                  return ChoiceChip(
                    label: Text(DateFormat('HH:mm').format(slot)),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _newDateTime = slot);
                    },
                  );
                }).toList(),
              ),
            ],
            const Spacer(),
            FilledButton(
              onPressed: _newDateTime != null && !_isLoading ? _updateAppointment : null,
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.primaryGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  : Text(AppLocalizations.of(context)!.update),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectNewDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.appointment.dateTime,
      firstDate: now,
      lastDate: now.add(const Duration(days: 90)),
      locale: const Locale('tr', 'TR'),
      selectableDayPredicate: (date) => date.weekday != DateTime.sunday,
    );

    if (pickedDate != null) {
      setState(() => _isLoading = true);

      final slots = await _appointmentService.getAvailableSlots(
        doctorId: widget.appointment.doctorId,
        date: pickedDate,
      );

      setState(() {
        _availableSlots = slots;
        _newDateTime = null;
        _isLoading = false;
      });
    }
  }

  Future<void> _updateAppointment() async {
    if (_newDateTime == null) return;

    setState(() => _isLoading = true);

    try {
      await _appointmentService.updateAppointment(
        appointmentId: widget.appointment.id,
        newDateTime: _newDateTime,
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Randevu güncellendi')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
