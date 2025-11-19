import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/doctor_api_service.dart';

class DoctorPatientDetailScreen extends StatelessWidget {
  final String patientId;
  final String? patientName;
  const DoctorPatientDetailScreen({super.key, required this.patientId, this.patientName});

  Stream<DocumentSnapshot<Map<String, dynamic>>> _patientDoc() {
    return FirebaseFirestore.instance.collection('patients_public').doc(patientId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _analysesStream() {
    return FirebaseFirestore.instance
        .collection('patients_public')
        .doc(patientId)
        .collection('analyses_public')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Validate patientId with detailed error handling
    if (patientId.isEmpty) {
      debugPrint('❌ DoctorPatientDetailScreen: patientId boş');
      return Scaffold(
        appBar: AppBar(title: Text(l10n.errorTitle)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person_off, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                l10n.patientIdNotFound,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.tryAgainFromPatientList,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }
    
    debugPrint('✅ DoctorPatientDetailScreen: patientId = $patientId');
    
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final api = DoctorApiService();
    return Scaffold(
      appBar: AppBar(title: Text(patientName ?? l10n.patient)),
      backgroundColor: AppTheme.backgroundLight,
      body: Column(
        children: [
          // Header with avatar/name from patients_public
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: _patientDoc(),
            builder: (context, snap) {
              try {
                if (snap.hasError) {
                  debugPrint('❌ Patient doc stream hatası: ${snap.error}');
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.error_outline)),
                    title: Text('${l10n.errorTitle}: ${snap.error}', style: const TextStyle(color: Colors.red)),
                    subtitle: Text(l10n.patientInfoLoadError),
                  );
                }
                
                final data = snap.data?.data() ?? {};
                final avatarUrl = (data['avatarUrl'] ?? '') as String;
                final name = patientName ?? (data['displayName'] ?? l10n.patient) as String;
                
                debugPrint('✅ Patient doc yüklendi: name=$name, avatarUrl=${avatarUrl.isNotEmpty}');
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                    child: avatarUrl.isEmpty ? const Icon(Icons.person_outline) : null,
                  ),
                  title: Text(name, style: TextStyle(color: textPrimary, fontWeight: FontWeight.w600)),
                  subtitle: Text(l10n.analyses),
                );
              } catch (e, stackTrace) {
                debugPrint('❌ Patient doc builder hatası: $e');
                debugPrint('   Stack trace: $stackTrace');
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.error_outline)),
                  title: Text('${l10n.errorTitle}: ${e.toString()}', style: const TextStyle(color: Colors.red)),
                  subtitle: Text(l10n.patientInfoLoadError),
                );
              }
            },
          ),
          const Divider(height: 0),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _analysesStream(),
              builder: (context, snapshot) {
                try {
                  if (snapshot.hasError) {
                    debugPrint('❌ Analyses stream hatası: ${snapshot.error}');
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, size: 64, color: Colors.red),
                          const SizedBox(height: 16),
                          Text('${l10n.errorTitle}: ${snapshot.error}', style: const TextStyle(color: Colors.red)),
                          const SizedBox(height: 8),
                          Text(l10n.analysesLoadError),
                        ],
                      ),
                    );
                  }
                  
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  final docs = snapshot.data?.docs ?? [];
                  debugPrint('✅ Analyses stream: ${docs.length} analiz bulundu');
                  
                  if (docs.isEmpty) {
                    return Center(child: Text(l10n.noAnalysesFound));
                  }
                  
                  return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final d = docs[i].data();
                    final imageUrl = (d['imageUrl'] as String?) ?? '';
                    final stage = (d['stage'] as String?) ?? '';
                    final status = (d['approvalStatus'] as String?) ?? 'pending';
                    final analysisId = docs[i].id;
                    return Container(
                      decoration: BoxDecoration(color: AppTheme.getCardColor(context), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: GestureDetector(
                                onTap: () {
                                  if (imageUrl.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(l10n.imageNotFound)),
                                    );
                                    return;
                                  }
                                  Navigator.pushNamed(context, '/doctor-image-viewer',
                                      arguments: {'imageUrl': imageUrl});
                                },
                                child: imageUrl.isNotEmpty
                                    ? Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => Container(
                                          color: Colors.grey.shade200,
                                          child: const Icon(Icons.broken_image, size: 48),
                                        ),
                                      )
                                    : Container(
                                        color: Colors.grey.shade200,
                                        child: const Icon(Icons.image_not_supported_outlined, size: 48),
                                      ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stage.isEmpty ? l10n.dashboardAnalysis : stage,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: textPrimary, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Chip(
                                      label: Text(
                                        status == 'approved'
                                            ? l10n.approved
                                            : status == 'rejected'
                                                ? l10n.rejected
                                                : l10n.pending,
                                      ),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      tooltip: l10n.approve,
                                      onPressed: status == 'approved'
                                          ? null
                                          : () async {
                                              final ok = await api.approveAnalysis(patientId, analysisId);
                                              if (!context.mounted) return;
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text(ok ? l10n.photoApproved : l10n.approvalFailed)),
                                              );
                                            },
                                      icon: const Icon(Icons.check_circle_outline, color: Colors.green),
                                    ),
                                    IconButton(
                                      tooltip: l10n.reject,
                                      onPressed: status == 'rejected'
                                          ? null
                                          : () async {
                                              final ok = await api.rejectAnalysis(patientId, analysisId);
                                              if (!context.mounted) return;
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text(ok ? l10n.photoRejected : l10n.rejectionFailed)),
                                              );
                                            },
                                      icon: const Icon(Icons.cancel_outlined, color: Colors.redAccent),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                } catch (e, stackTrace) {
                  debugPrint('❌ Analyses builder hatası: $e');
                  debugPrint('   Stack trace: $stackTrace');
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text('${l10n.errorTitle}: ${e.toString()}', style: const TextStyle(color: Colors.red)),
                        const SizedBox(height: 8),
                        Text(l10n.analysesLoadError),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


