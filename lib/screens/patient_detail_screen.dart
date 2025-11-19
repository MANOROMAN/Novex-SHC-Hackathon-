import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/doctor_api_service.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  Stream<DocumentSnapshot<Map<String, dynamic>>> _patientDoc(String patientId) {
    return FirebaseFirestore.instance.collection('patients_public').doc(patientId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _analysesStream(String patientId) {
    return FirebaseFirestore.instance
        .collection('patients_public')
        .doc(patientId)
        .collection('analyses_public')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String patientId;
    String? patientName;
    
    // Arguments can be either a String (patientId) or Map
    if (args is String) {
      patientId = args;
    } else if (args is Map) {
      patientId = (args['patientId'] ?? '').toString();
      patientName = args['patientName']?.toString();
    } else {
      patientId = '';
    }

    // Validate patientId
    if (patientId.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Hata')),
        body: const Center(
          child: Text('Hasta ID bulunamadı. Lütfen hasta listesinden tekrar deneyin.'),
        ),
      );
    }
    
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final api = DoctorApiService();
    return Scaffold(
      appBar: AppBar(title: Text(patientName ?? 'Hasta')),
      backgroundColor: AppTheme.backgroundLight,
      body: Column(
        children: [
          // Header with avatar/name from patients_public
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: _patientDoc(patientId),
            builder: (context, snap) {
              final data = snap.data?.data() ?? {};
              final avatarUrl = (data['avatarUrl'] ?? '') as String;
              final name = patientName ?? (data['displayName'] ?? 'Hasta') as String;
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                  child: avatarUrl.isEmpty ? const Icon(Icons.person_outline, size: 30) : null,
                ),
                title: Text(name, style: TextStyle(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 18)),
                subtitle: const Text('Analizler'),
              );
            },
          ),
          const Divider(height: 0),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _analysesStream(patientId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data?.docs ?? [];
                if (docs.isEmpty) {
                  return const Center(child: Text('Analiz bulunamadı.'));
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
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                                      const SnackBar(content: Text('Görsel bulunamadı')),
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
                                  stage.isEmpty ? 'Analiz' : stage,
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
                                            ? 'Onaylandı'
                                            : status == 'rejected'
                                                ? 'Reddedildi'
                                                : 'Bekliyor',
                                      ),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      tooltip: 'Onayla',
                                      onPressed: status == 'approved'
                                          ? null
                                          : () async {
                                              final ok = await api.approveAnalysis(patientId, analysisId);
                                              if (!context.mounted) return;
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text(ok ? 'Onaylandı' : 'Onay başarısız')),
                                              );
                                            },
                                      icon: const Icon(Icons.check_circle_outline, color: Colors.green),
                                    ),
                                    IconButton(
                                      tooltip: 'Reddet',
                                      onPressed: status == 'rejected'
                                          ? null
                                          : () async {
                                              final ok = await api.rejectAnalysis(patientId, analysisId);
                                              if (!context.mounted) return;
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text(ok ? 'Reddedildi' : 'Reddetme başarısız')),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}


