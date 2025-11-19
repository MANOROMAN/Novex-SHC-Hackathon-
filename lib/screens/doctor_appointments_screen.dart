import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../models/appointment.dart';
import '../models/notification_model.dart';
import '../services/appointment_service.dart';
import '../services/notification_service.dart';
import '../theme/app_theme.dart';

/// Doktor randevu yönetim ekranı
class DoctorAppointmentsScreen extends StatefulWidget {
  final String doctorId;
  final String doctorName;

  const DoctorAppointmentsScreen({
    super.key,
    required this.doctorId,
    required this.doctorName,
  });

  @override
  State<DoctorAppointmentsScreen> createState() => _DoctorAppointmentsScreenState();
}

class _DoctorAppointmentsScreenState extends State<DoctorAppointmentsScreen> with SingleTickerProviderStateMixin {
  final AppointmentService _appointmentService = AppointmentService();
  late TabController _tabController;
  int _refreshKey = 0; // Stream'i yeniden başlatmak için

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    debugPrint('🔍 DoctorAppointmentsScreen initState:');
    debugPrint('   doctorId: ${widget.doctorId}');
    debugPrint('   doctorName: ${widget.doctorName}');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Expanded(
              child: Text('${AppLocalizations.of(context)?.appointmentManagement ?? 'Randevu Yönetimi'} - ${widget.doctorName}', 
                style: const TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            // Refresh butonu
            IconButton(
              icon: const Icon(Icons.refresh),
              color: Colors.white,
              tooltip: AppLocalizations.of(context)?.refresh ?? 'Yenile',
              onPressed: () {
                debugPrint('🔄 Randevu listesi yenileniyor...');
                setState(() {
                  _refreshKey++;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppLocalizations.of(context)?.refreshingList ?? '🔄 Liste yenileniyor...'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: AppTheme.primaryGreen,
                  ),
                );
              },
            ),
          ],
        ),
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
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 14,
            color: Colors.white,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            color: Colors.white70,
          ),
          tabs: [
            Tab(
              icon: const Icon(Icons.pending_actions, size: 20),
              text: AppLocalizations.of(context)?.pendingApproval ?? 'Onay Bekleyen',
            ),
            Tab(
              icon: const Icon(Icons.check_circle_outline, size: 20),
              text: AppLocalizations.of(context)?.approved ?? 'Onaylı',
            ),
            Tab(
              icon: const Icon(Icons.done_all, size: 20),
              text: AppLocalizations.of(context)?.completed ?? 'Tamamlanan',
            ),
            Tab(
              icon: const Icon(Icons.cancel_outlined, size: 20),
              text: AppLocalizations.of(context)?.cancelled ?? 'İptal',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Dashboard - Bugünkü randevu sayısı
          _buildDashboard(),
          // Tab içerikleri
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPendingAppointments(),
                _buildConfirmedAppointments(),
                _buildCompletedAppointments(),
                _buildCancelledAppointments(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Dashboard - Bugünkü randevu sayısı
  Widget _buildDashboard() {
    return StreamBuilder<List<Appointment>>(
      key: ValueKey('dashboard_$_refreshKey'),
      stream: _appointmentService.getDoctorAppointments(widget.doctorId),
      builder: (context, snapshot) {
        final allAppointments = snapshot.data ?? [];
        final now = DateTime.now();
        final todayStart = DateTime(now.year, now.month, now.day);
        final todayEnd = todayStart.add(const Duration(days: 1));
        
        // Bugünkü randevuları filtrele
        final todayAppointments = allAppointments.where((apt) {
          return apt.dateTime.isAfter(todayStart) && apt.dateTime.isBefore(todayEnd);
        }).toList();
        
        // Bugünkü onay bekleyen randevular
        final todayPending = todayAppointments.where((apt) => apt.status == AppointmentStatus.pending).length;
        
        // Bugünkü onaylı randevular
        final todayConfirmed = todayAppointments.where((apt) => apt.status == AppointmentStatus.confirmed).length;
        
        // Bugünkü toplam randevu sayısı
        final todayTotal = todayAppointments.length;
        
        final isDark = Theme.of(context).brightness == Brightness.dark;
        
        return Container(
          margin: const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppTheme.primaryGreen.withOpacity(0.15),
                      AppTheme.primaryGreen.withOpacity(0.08),
                    ]
                  : [
                      AppTheme.primaryGreen.withOpacity(0.1),
                      AppTheme.primaryGreen.withOpacity(0.05),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark
                  ? AppTheme.primaryGreen.withOpacity(0.4)
                  : AppTheme.primaryGreen.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.3)
                    : AppTheme.primaryGreen.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppTheme.primaryGreen.withOpacity(0.25)
                      : AppTheme.primaryGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.calendar_today,
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
                      AppLocalizations.of(context)?.todaysAppointments ?? 'Bugünkü Randevular',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.getTextSecondaryColor(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          '$todayTotal',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryGreen,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            AppLocalizations.of(context)?.appointmentCount ?? 'randevu',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.getTextSecondaryColor(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (todayTotal > 0) ...[
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildStatBadge(AppLocalizations.of(context)?.pendingApproval ?? 'Onay Bekleyen', todayPending, Colors.orange),
                          _buildStatBadge(AppLocalizations.of(context)?.approved ?? 'Onaylı', todayConfirmed, AppTheme.primaryGreen),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatBadge(String label, int count, Color color) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark
            ? color.withOpacity(0.2)
            : color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark
              ? color.withOpacity(0.5)
              : color.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: AppTheme.getTextPrimaryColor(context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Onay bekleyen randevular
  Widget _buildPendingAppointments() {
    return StreamBuilder<List<Appointment>>(
      key: ValueKey('pending_$_refreshKey'),
      stream: _appointmentService.getDoctorAppointments(widget.doctorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          debugPrint('❌ Randevu stream hatası: ${snapshot.error}');
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.appointmentDataLoadFailed ?? 'Randevu verileri yüklenemedi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.getTextPrimaryColor(context)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${AppLocalizations.of(context)?.anErrorOccurred('') ?? 'Hata'}: ${snapshot.error}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'DoctorId: ${widget.doctorId}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text(AppLocalizations.of(context)?.tryAgain ?? 'Yeniden Dene'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final allAppointments = snapshot.data ?? [];
        debugPrint('📋 Tüm randevular: ${allAppointments.length}');
        debugPrint('   DoctorId ile sorgu: ${widget.doctorId}');
        
        // Debug: Tüm randevuları listele
        for (final apt in allAppointments) {
          debugPrint('   - ${apt.id}: doctorId=${apt.doctorId}, status=${apt.status.name}, dateTime=${apt.dateTime}');
        }

        // Onay bekleyen randevular: pending status ve gelecek tarihli
        final appointments = allAppointments
            .where((a) {
              final isPending = a.status == AppointmentStatus.pending;
              final isFuture = a.dateTime.isAfter(DateTime.now());
              debugPrint('   Randevu ${a.id}: status=${a.status.name}, isPending=$isPending, isFuture=$isFuture, dateTime=${a.dateTime}');
              return isPending && isFuture;
            })
            .toList();

        appointments.sort((a, b) => a.dateTime.compareTo(b.dateTime));

        debugPrint('✅ Onay bekleyen randevular: ${appointments.length}');

        if (appointments.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.pending_actions, size: 64, color: Colors.orange.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.noPendingAppointments ?? 'Onay bekleyen randevu bulunmuyor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.appointmentsWillAppearHere ?? 'Hastalar randevu oluşturduğunda burada görünecek',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return PageView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _buildAppointmentCard(appointments[index], showActions: true),
          ),
        );
      },
    );
  }

  /// Onaylı randevular
  Widget _buildConfirmedAppointments() {
    return StreamBuilder<List<Appointment>>(
      key: ValueKey('confirmed_$_refreshKey'),
      stream: _appointmentService.getDoctorAppointments(widget.doctorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.appointmentDataLoadFailed ?? 'Randevu verileri yüklenemedi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.getTextPrimaryColor(context)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${AppLocalizations.of(context)?.anErrorOccurred('') ?? 'Hata'}: ${snapshot.error}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        final appointments = snapshot.data
            ?.where((a) => a.status == AppointmentStatus.confirmed && a.dateTime.isAfter(DateTime.now()))
            .toList() ??
            [];

        appointments.sort((a, b) => a.dateTime.compareTo(b.dateTime));

        if (appointments.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.event_available, size: 64, color: AppTheme.primaryGreen.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.noConfirmedAppointments ?? 'Onaylı randevu bulunmuyor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.confirmedAppointmentsWillAppearHere ?? 'Onayladığınız randevular burada görünecek',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: appointments.length,
          itemBuilder: (context, index) => _buildAppointmentCard(appointments[index], showComplete: true),
        );
      },
    );
  }

  /// Tamamlanan randevular
  Widget _buildCompletedAppointments() {
    return StreamBuilder<List<Appointment>>(
      key: ValueKey('completed_$_refreshKey'),
      stream: _appointmentService.getDoctorAppointments(widget.doctorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.appointmentDataLoadFailed ?? 'Randevu verileri yüklenemedi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.getTextPrimaryColor(context)),
                  ),
                ],
              ),
            ),
          );
        }

        final appointments = snapshot.data?.where((a) => a.status == AppointmentStatus.completed).toList() ?? [];

        appointments.sort((a, b) => b.dateTime.compareTo(a.dateTime));

        if (appointments.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.assignment_turned_in, size: 64, color: Colors.blue.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.noCompletedAppointments ?? 'Tamamlanan randevu bulunmuyor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.completedAppointmentsWillAppearHere ?? 'Tamamladığınız randevular burada görünecek',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
  Widget _buildCancelledAppointments() {
    return StreamBuilder<List<Appointment>>(
      key: ValueKey('cancelled_$_refreshKey'),
      stream: _appointmentService.getDoctorAppointments(widget.doctorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.appointmentDataLoadFailed ?? 'Randevu verileri yüklenemedi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.getTextPrimaryColor(context)),
                  ),
                ],
              ),
            ),
          );
        }

        final appointments = snapshot.data?.where((a) => a.status == AppointmentStatus.cancelled).toList() ?? [];

        appointments.sort((a, b) => b.dateTime.compareTo(a.dateTime));

        if (appointments.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.block, size: 64, color: Colors.red.shade300),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)?.noCancelledAppointments ?? 'İptal edilen randevu bulunmuyor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.cancelledAppointmentsWillAppearHere ?? 'İptal edilen randevular burada görünecek',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
  Widget _buildAppointmentCard(Appointment appointment, {bool showActions = false, bool showComplete = false}) {
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

    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: isDark ? 2 : 4,
      shadowColor: isDark
          ? Colors.black.withOpacity(0.4)
          : statusColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDark
              ? statusColor.withOpacity(0.4)
              : statusColor.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      color: isDark
          ? AppTheme.getCardColor(context)
          : Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isDark
              ? null
              : LinearGradient(
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
                        FutureBuilder<Map<String, String>>(
                          future: _appointmentService.getPatientInfo(appointment.patientId),
                          builder: (context, snapshot) {
                            final patientInfo = snapshot.data ?? {};
                            final avatarUrl = patientInfo['avatarUrl'] ?? '';
                            
                            return Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: CircleAvatar(
                                radius: 24,
                                backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                                child: avatarUrl.isEmpty 
                                  ? Icon(Icons.person, color: statusColor, size: 28)
                                  : null,
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder<Map<String, String>>(
                                future: _appointmentService.getPatientInfo(appointment.patientId),
                                builder: (context, snapshot) {
                                  final patientInfo = snapshot.data ?? {};
                                  final displayName = patientInfo['displayName'] ?? appointment.patientName;
                                  
                                  return Text(
                                    displayName,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
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
              // Hasta analiz fotoğrafları (bekleyen randevular için)
              if (appointment.status == AppointmentStatus.pending) ...[
                const SizedBox(height: 20),
                _buildPatientPhotos(appointment.patientId),
              ],
              if (showActions) ...[
                const SizedBox(height: 16),
                _buildActionButtons(appointment),
              ],
              if (showComplete) ...[
                const SizedBox(height: 16),
                _buildCompleteButton(appointment),
              ],
              // Ek küçük aksiyonlar: Not ekle / Sil (bekleyen ve onaylı için)
              if (appointment.status == AppointmentStatus.pending || appointment.status == AppointmentStatus.confirmed) ...[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () => _addNote(appointment),
                      icon: const Icon(Icons.note_add_outlined),
                      label: Text(AppLocalizations.of(context)?.addNote ?? 'Not Ekle'),
                      style: TextButton.styleFrom(foregroundColor: AppTheme.primaryGreen),
                    ),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      onPressed: () => _deleteAppointment(appointment),
                      icon: const Icon(Icons.delete_outline),
                      label: Text(AppLocalizations.of(context)?.delete ?? 'Sil'),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Hasta analiz fotoğraflarını göster
  Widget _buildPatientPhotos(String patientId) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('patients_public')
          .doc(patientId)
          .collection('analyses_public')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return const SizedBox.shrink();
        }

        final analysisDoc = snapshot.data!.docs.first;
        final analysisData = analysisDoc.data();
        
        // photoUrls'i parse et
        Map<String, String> photoUrls = {};
        try {
          final photoUrlsData = analysisData['photoUrls'];
          if (photoUrlsData is Map) {
            photoUrls = photoUrlsData.map((key, value) => MapEntry(
              key.toString(),
              value?.toString() ?? '',
            ));
          }
        } catch (e) {
          debugPrint('⚠️ photoUrls parse hatası: $e');
        }

        // Eğer photoUrls boşsa görünmez yap
        if (photoUrls.isEmpty) {
          return const SizedBox.shrink();
        }

        const orderedStages = ['front', 'right45', 'left45', 'vertex', 'donor'];
        final availablePhotos = orderedStages.where((stage) => 
          photoUrls[stage] != null && (photoUrls[stage] ?? '').isNotEmpty
        ).toList();

        if (availablePhotos.isEmpty) {
          return const SizedBox.shrink();
        }

        final isDark = Theme.of(context).brightness == Brightness.dark;
        final textPrimary = AppTheme.getTextPrimaryColor(context);

        String _getStageLabel(String stage) {
          final l10n = AppLocalizations.of(context);
          switch (stage) {
            case 'front':
              return l10n?.front ?? 'Ön';
            case 'right45':
              return l10n?.right45 ?? 'Sağ 45°';
            case 'left45':
              return l10n?.left45 ?? 'Sol 45°';
            case 'vertex':
              return l10n?.top ?? 'Tepe';
            case 'donor':
              return l10n?.donorArea ?? 'Donör Bölge';
            default:
              return stage;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)?.photos(availablePhotos.length.toString()) ?? 'Fotoğraflar (${availablePhotos.length})',
              style: TextStyle(
                color: textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.9,
              ),
              itemCount: orderedStages.length,
              itemBuilder: (context, index) {
                final stage = orderedStages[index];
                final url = photoUrls[stage] ?? '';
                
                if (url.isEmpty) {
                  return Container(
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppTheme.getBorderColor(context),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 24,
                        color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                      ),
                    ),
                  );
                }
                
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/doctor-image-viewer',
                      arguments: {'imageUrl': url},
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppTheme.getBorderColor(context),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                              child: const Center(
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                            errorWidget: (_, __, ___) => Container(
                              color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                              child: Icon(
                                Icons.broken_image,
                                size: 24,
                                color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                              ),
                            ),
                            memCacheWidth: 300,
                            memCacheHeight: 300,
                          ),
                          Positioned(
                            left: 4,
                            bottom: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                _getStageLabel(stage),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  /// Aksiyon butonları (Onayla/Reddet)
  Widget _buildActionButtons(Appointment appointment) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _confirmAppointment(appointment),
            icon: const Icon(Icons.check_circle, size: 20),
            label: Text(AppLocalizations.of(context)?.approve ?? 'Onayla', style: const TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _rejectAppointment(appointment),
            icon: const Icon(Icons.cancel, size: 20),
            label: Text(AppLocalizations.of(context)?.reject ?? 'Reddet', style: const TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
          ),
        ),
      ],
    );
  }

  /// Tamamla butonu
  Widget _buildCompleteButton(Appointment appointment) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _completeAppointment(appointment),
        icon: const Icon(Icons.done_all, size: 20),
        label: Text(AppLocalizations.of(context)?.markAsCompleted ?? 'Tamamlandı Olarak İşaretle', style: const TextStyle(fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
      ),
    );
  }

  /// Randevu onayla
  Future<void> _confirmAppointment(Appointment appointment) async {
    try {
      debugPrint('✅ Randevu onaylanıyor...');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Patient ID: ${appointment.patientId}');
      debugPrint('   Doctor ID: ${appointment.doctorId}');
      debugPrint('   Date: ${appointment.dateTime}');
      
      await _appointmentService.confirmAppointment(appointment.id);
      debugPrint('✅ Randevu başarıyla onaylandı');
      
      // Stream'i yenile
      if (mounted) {
        setState(() {
          _refreshKey++;
        });
      }
      
      // Hastaya bildirim gönder
      try {
        final l10n = AppLocalizations.of(context);
        await NotificationService().addNotificationForUser(
          userId: appointment.patientId,
          title: l10n?.appointmentApproved ?? 'Randevu Onaylandı',
          message: l10n?.appointmentApprovedMessage(appointment.doctorName, DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime)) ?? '${appointment.doctorName} ile ${DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime)} tarihli randevunuz onaylandı.',
          type: NotificationType.appointment,
          metadata: {
            'appointmentId': appointment.id,
            'doctorId': appointment.doctorId,
            'doctorName': appointment.doctorName,
            'dateTime': appointment.dateTime.toIso8601String(),
            'action': 'appointment_confirmed',
          },
        );
        debugPrint('✅ Bildirim gönderildi');
      } catch (e) {
        debugPrint('⚠️ Bildirim gönderme hatası (randevu onaylandı): $e');
        // Bildirim hatası randevu onayını etkilemez
      }
      
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.appointmentApprovedNotification ?? 'Randevu onaylandı ve hasta bilgilendirildi'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu onaylama):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Stack trace: $stackTrace');
      
      String errorMessage = AppLocalizations.of(context)?.appointmentApprovalError ?? 'Randevu onaylanırken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = AppLocalizations.of(context)?.appointmentApprovalPermissionDenied ?? 'Randevu onaylama izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
      } else if (e.code == 'not-found') {
        errorMessage = AppLocalizations.of(context)?.appointmentNotFound ?? 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
      } else if (e.code == 'unavailable') {
        errorMessage = AppLocalizations.of(context)?.firebaseUnavailable ?? 'Firebase servisi şu anda kullanılamıyor. Lütfen internet bağlantınızı kontrol edin.';
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}$errorMessage'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu onaylama hatası: $e');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Stack trace: $stackTrace');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}${AppLocalizations.of(context)?.appointmentApprovalError ?? 'Randevu onaylanırken hata oluştu'}: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  /// Randevu reddet
  Future<void> _rejectAppointment(Appointment appointment) async {
    final TextEditingController reasonController = TextEditingController();
    
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n?.rejectAppointment ?? 'Randevu Reddet'),
        content: TextField(
          controller: reasonController,
          decoration: InputDecoration(
            labelText: l10n?.rejectionReason ?? 'Red nedeni',
            hintText: l10n?.rejectionReasonHint ?? 'Lütfen red nedenini yazın',
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n?.cancel ?? 'İptal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(l10n?.reject ?? 'Reddet'),
          ),
        ],
      ),
    );

    if (confirmed == true && reasonController.text.isNotEmpty) {
      try {
        debugPrint('❌ Randevu reddediliyor...');
        debugPrint('   Appointment ID: ${appointment.id}');
        debugPrint('   Reason: ${reasonController.text}');
        
        await _appointmentService.cancelAppointment(
          appointmentId: appointment.id,
          cancelReason: reasonController.text,
        );
        debugPrint('✅ Randevu başarıyla reddedildi');
        
        // Stream'i yenile
        if (mounted) {
          setState(() {
            _refreshKey++;
          });
        }
        
        // Hastaya bildirim gönder
        try {
          final l10n = AppLocalizations.of(context);
          await NotificationService().addNotificationForUser(
            userId: appointment.patientId,
            title: l10n?.appointmentRejected ?? 'Randevu Reddedildi',
            message: l10n?.appointmentRejectedMessage(appointment.doctorName, DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime), reasonController.text) ?? '${appointment.doctorName} ile ${DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime)} tarihli randevunuz reddedildi. Neden: ${reasonController.text}',
            type: NotificationType.appointment,
            metadata: {
              'appointmentId': appointment.id,
              'doctorId': appointment.doctorId,
              'doctorName': appointment.doctorName,
              'dateTime': appointment.dateTime.toIso8601String(),
              'cancelReason': reasonController.text,
              'action': 'appointment_rejected',
            },
          );
          debugPrint('✅ Bildirim gönderildi');
        } catch (e) {
          debugPrint('⚠️ Bildirim gönderme hatası (randevu reddedildi): $e');
          // Bildirim hatası randevu reddini etkilemez
        }
        
        if (mounted) {
          final l10n = AppLocalizations.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n?.appointmentRejectedNotification ?? 'Randevu reddedildi ve hasta bilgilendirildi'),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } on FirebaseException catch (e, stackTrace) {
        debugPrint('❌ Firebase Firestore hatası (randevu reddetme):');
        debugPrint('   Code: ${e.code}');
        debugPrint('   Message: ${e.message}');
        debugPrint('   Plugin: ${e.plugin}');
        debugPrint('   Appointment ID: ${appointment.id}');
        debugPrint('   Stack trace: $stackTrace');
        
        String errorMessage = AppLocalizations.of(context)?.appointmentRejectionError ?? 'Randevu reddedilirken hata oluştu';
        if (e.code == 'permission-denied') {
          errorMessage = AppLocalizations.of(context)?.appointmentRejectionPermissionDenied ?? 'Randevu reddetme izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
        } else if (e.code == 'not-found') {
          errorMessage = AppLocalizations.of(context)?.appointmentNotFound ?? 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
        }
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}$errorMessage'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
            ),
          );
        }
      } catch (e, stackTrace) {
        debugPrint('❌ Randevu reddetme hatası: $e');
        debugPrint('   Appointment ID: ${appointment.id}');
        debugPrint('   Stack trace: $stackTrace');
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}${AppLocalizations.of(context)?.appointmentRejectionError ?? 'Randevu reddedilirken hata oluştu'}: ${e.toString()}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
            ),
          );
        }
      }
    }
    
    reasonController.dispose();
  }

  /// Randevu tamamla
  Future<void> _completeAppointment(Appointment appointment) async {
    final l10n = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n?.completeAppointment ?? 'Randevu Tamamla'),
        content: Text(l10n?.completeAppointmentConfirmation ?? 'Bu randevuyu tamamlandı olarak işaretlemek istediğinizden emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n?.cancel ?? 'İptal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text(l10n?.completed ?? 'Tamamla'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        debugPrint('✅ Randevu tamamlanıyor...');
        debugPrint('   Appointment ID: ${appointment.id}');
        
        await _appointmentService.completeAppointment(appointment.id);
        debugPrint('✅ Randevu başarıyla tamamlandı');
        
        // Stream'i yenile
        if (mounted) {
          setState(() {
            _refreshKey++;
          });
        }
        
        // Hastaya bildirim gönder
        try {
          final l10n = AppLocalizations.of(context);
          await NotificationService().addNotificationForUser(
            userId: appointment.patientId,
            title: l10n?.appointmentCompleted ?? 'Randevu Tamamlandı',
            message: l10n?.appointmentCompletedMessage(appointment.doctorName, DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime)) ?? '${appointment.doctorName} ile ${DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime)} tarihli randevunuz tamamlandı.',
            type: NotificationType.appointment,
            metadata: {
              'appointmentId': appointment.id,
              'doctorId': appointment.doctorId,
              'doctorName': appointment.doctorName,
              'dateTime': appointment.dateTime.toIso8601String(),
              'action': 'appointment_completed',
            },
          );
          debugPrint('✅ Bildirim gönderildi');
        } catch (e) {
          debugPrint('⚠️ Bildirim gönderme hatası (randevu tamamlandı): $e');
          // Bildirim hatası randevu tamamlamayı etkilemez
        }
        
        if (mounted) {
          final l10n = AppLocalizations.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n?.appointmentCompletedNotification ?? 'Randevu tamamlandı ve hasta bilgilendirildi'),
              backgroundColor: Colors.blue,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } on FirebaseException catch (e, stackTrace) {
        debugPrint('❌ Firebase Firestore hatası (randevu tamamlama):');
        debugPrint('   Code: ${e.code}');
        debugPrint('   Message: ${e.message}');
        debugPrint('   Plugin: ${e.plugin}');
        debugPrint('   Appointment ID: ${appointment.id}');
        debugPrint('   Stack trace: $stackTrace');
        
        String errorMessage = AppLocalizations.of(context)?.appointmentCompletionError ?? 'Randevu tamamlanırken hata oluştu';
        if (e.code == 'permission-denied') {
          errorMessage = AppLocalizations.of(context)?.appointmentCompletionPermissionDenied ?? 'Randevu tamamlama izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
        } else if (e.code == 'not-found') {
          errorMessage = AppLocalizations.of(context)?.appointmentNotFound ?? 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
        }
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}$errorMessage'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
            ),
          );
        }
      } catch (e, stackTrace) {
        debugPrint('❌ Randevu tamamlama hatası: $e');
        debugPrint('   Appointment ID: ${appointment.id}');
        debugPrint('   Stack trace: $stackTrace');
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}${AppLocalizations.of(context)?.appointmentCompletionError ?? 'Randevu tamamlanırken hata oluştu'}: ${e.toString()}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
            ),
          );
        }
      }
    }
  }

  /// Randevuya doktor notu ekle ve hastayı bilgilendir
  Future<void> _addNote(Appointment appointment) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController(text: appointment.notes);
    final result = await showDialog<String?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n?.appointmentNote ?? 'Randevu Notu'),
        content: TextField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: l10n?.noteVisibleToPatient ?? 'Hastaya görünecek açıklama / not',
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, null), child: Text(l10n?.cancel ?? 'İptal')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryGreen, foregroundColor: Colors.white),
            child: Text(l10n?.save ?? 'Kaydet'),
          ),
        ],
      ),
    );

    if (result == null) return;

    try {
      debugPrint('📝 Randevu notu ekleniyor...');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Note: ${result.isEmpty ? '(boş not)' : result}');
      
      await _appointmentService.updateAppointment(
        appointmentId: appointment.id,
        notes: result,
      );
      debugPrint('✅ Randevu notu başarıyla eklendi');

      // Hastaya bildirim gönder
      try {
        final l10n = AppLocalizations.of(context);
        await NotificationService().addNotificationForUser(
          userId: appointment.patientId,
          title: l10n?.appointmentNote ?? 'Randevu Notu',
          message: l10n?.appointmentNoteMessage(appointment.doctorName, result.isEmpty ? (l10n?.emptyNote ?? '(boş not)') : result) ?? '${appointment.doctorName} randevunuza bir not ekledi: ${result.isEmpty ? '(boş not)' : result}',
          type: NotificationType.appointment,
          metadata: {
            'appointmentId': appointment.id,
            'doctorId': appointment.doctorId,
            'doctorName': appointment.doctorName,
            'dateTime': appointment.dateTime.toIso8601String(),
            'action': 'note_added',
          },
        );
        debugPrint('✅ Bildirim gönderildi');
      } catch (e) {
        debugPrint('⚠️ Bildirim gönderme hatası (not eklendi): $e');
        // Bildirim hatası not eklemeyi etkilemez
      }

      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.noteSavedNotification ?? 'Not kaydedildi ve hasta bilgilendirildi'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (not ekleme):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Stack trace: $stackTrace');
      
      String errorMessage = AppLocalizations.of(context)?.noteAddError ?? 'Not eklenirken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = AppLocalizations.of(context)?.noteAddPermissionDenied ?? 'Not ekleme izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
      } else if (e.code == 'not-found') {
        errorMessage = AppLocalizations.of(context)?.appointmentNotFound ?? 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}$errorMessage'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Not ekleme hatası: $e');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Stack trace: $stackTrace');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}${AppLocalizations.of(context)?.noteAddError ?? 'Not eklenirken hata oluştu'}: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  /// Randevuyu sil ve hastayı bilgilendir
  Future<void> _deleteAppointment(Appointment appointment) async {
    final l10n = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n?.deleteAppointment ?? 'Randevuyu Sil'),
        content: Text(l10n?.deleteAppointmentConfirmation ?? 'Bu randevuyu tamamen silmek istediğinizden emin misiniz? İşlem geri alınamaz.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n?.cancel ?? 'İptal')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: Text(l10n?.delete ?? 'Sil'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      debugPrint('🗑️ Randevu siliniyor...');
      debugPrint('   Appointment ID: ${appointment.id}');
      
      await _appointmentService.deleteAppointment(appointment.id);
      debugPrint('✅ Randevu başarıyla silindi');

      // Hastaya bildirim gönder
      try {
        final l10n = AppLocalizations.of(context);
        await NotificationService().addNotificationForUser(
          userId: appointment.patientId,
          title: l10n?.appointmentCancellation ?? 'Randevu İptali',
          message: l10n?.appointmentCancelledMessage(appointment.doctorName, DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime)) ?? '${appointment.doctorName} ile ${DateFormat('dd MMM yyyy HH:mm', 'tr_TR').format(appointment.dateTime)} tarihli randevunuz iptal edildi.',
          type: NotificationType.appointment,
          metadata: {
            'appointmentId': appointment.id,
            'doctorId': appointment.doctorId,
            'doctorName': appointment.doctorName,
            'dateTime': appointment.dateTime.toIso8601String(),
            'action': 'appointment_deleted',
          },
        );
        debugPrint('✅ Bildirim gönderildi');
      } catch (e) {
        debugPrint('⚠️ Bildirim gönderme hatası (randevu silindi): $e');
        // Bildirim hatası randevu silmeyi etkilemez
      }

      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.appointmentDeletedNotification ?? 'Randevu silindi ve hasta bilgilendirildi'),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (randevu silme):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Stack trace: $stackTrace');
      
      String errorMessage = AppLocalizations.of(context)?.appointmentDeletionError ?? 'Randevu silinirken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = AppLocalizations.of(context)?.appointmentDeletionPermissionDenied ?? 'Randevu silme izni reddedildi. Lütfen Firebase Firestore kurallarını kontrol edin.';
      } else if (e.code == 'not-found') {
        errorMessage = AppLocalizations.of(context)?.appointmentNotFound ?? 'Randevu bulunamadı. Lütfen sayfayı yenileyin.';
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}$errorMessage'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Randevu silme hatası: $e');
      debugPrint('   Appointment ID: ${appointment.id}');
      debugPrint('   Stack trace: $stackTrace');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)?.errorPrefix ?? 'Hata: '}${AppLocalizations.of(context)?.appointmentDeletionError ?? 'Randevu silinirken hata oluştu'}: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }
}
