import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/doctor_api_service.dart';
import '../services/doctor_auth_service.dart';
import '../models/doctor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorPatientsScreen extends StatelessWidget {
  const DoctorPatientsScreen({super.key});

  /// Örnek hasta verilerini Firebase'e ekle
  Future<void> _createSamplePatientsIfNeeded(AppLocalizations l10n) async {
    try {
      final firestore = FirebaseFirestore.instance;
      
      // Örnek hasta verileri
      final patientsData = [
        {
          'id': 'patient_1',
          'email': 'ahmet.yilmaz@example.com',
          'displayName': 'Ahmet Yılmaz',
          'avatarUrl': '',
          'lastAnalysisAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 5))),
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'patient_2', 
          'email': 'mehmet.kaya@example.com',
          'displayName': 'Mehmet Kaya',
          'avatarUrl': '',
          'lastAnalysisAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 12))),
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'patient_3',
          'email': 'ali.demir@example.com', 
          'displayName': 'Ali Demir',
          'avatarUrl': '',
          'lastAnalysisAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 3))),
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'patient_4',
          'email': 'fatma.sahin@example.com',
          'displayName': 'Fatma Şahin',
          'avatarUrl': '',
          'lastAnalysisAt': null, // Hiç analiz yapmamış
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'patient_5',
          'email': 'emre.ozkan@example.com',
          'displayName': 'Emre Özkan',
          'avatarUrl': '',
          'lastAnalysisAt': Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 20))),
          'createdAt': FieldValue.serverTimestamp(),
        },
      ];

      // İlk hastayı kontrol et, yoksa hepsini ekle
      final firstPatient = await firestore.collection('patients_public').doc('patient_1').get();
      if (!firstPatient.exists) {
        for (final patientData in patientsData) {
          final patientId = patientData['id'] as String;
          await firestore
              .collection('patients_public')
              .doc(patientId)
              .set(patientData);
          print('✅ ${l10n.patientAdded(patientData['displayName'] as String)}');
          
          // Her hastaya örnek analiz de ekle
          await firestore
              .collection('patients_public')
              .doc(patientId)
              .collection('analyses_public')
              .add({
                'id': 'analysis_${patientId}_1',
                'analysisDate': FieldValue.serverTimestamp(),
                'imageUrl': 'https://via.placeholder.com/300x200/4CAF50/white?text=${Uri.encodeComponent(l10n.analysisPhoto)}',
                'results': {
                  'hairDensity': 85.5,
                  'scalpHealth': l10n.scalpHealthGood,
                  'recommendation': l10n.recommendationContinue,
                },
                'approvalStatus': 'pending',
                'notes': l10n.sampleAnalysisData,
                'createdAt': FieldValue.serverTimestamp(),
              });
        }
        print('🎉 ${l10n.allSamplePatientsAdded}');
      }
    } catch (e) {
      print('❌ ${l10n.patientAddError(e.toString())}');
    }
  }

  Future<List<Map<String, dynamic>>> _fetchUsers(AppLocalizations l10n) async {
    // Önce Firebase'den hasta listesini çekmeyi dene
    try {
      final firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection('patients_public').limit(50).get();
      
      if (snapshot.docs.isNotEmpty) {
        // Firebase'den hasta verileri dönüyor
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return {
            ...data,
            'documentId': doc.id,
            'id': data['id'] ?? doc.id,
          };
        }).toList();
      }
    } catch (e) {
      print('⚠️ ${l10n.firebasePatientListError(e.toString())}');
    }
    
    // Firebase'de veri yoksa, örnek veriler oluştur
    await _createSamplePatientsIfNeeded(l10n);
    
    // API'den de çekmeyi dene (fallback)
    return DoctorApiService().listUsers(limit: 50);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.people_alt, color: AppTheme.primaryGreen),
              const SizedBox(width: 8),
              Text(l10n.myPatients,
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () async {
                  await _createSamplePatientsIfNeeded(l10n);
                  // Sayfayı yenile
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const DoctorPatientsScreen()),
                  );
                },
                icon: const Icon(Icons.add_circle_outline, size: 18),
                label: Text(l10n.testPatients),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _fetchUsers(l10n),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final items = snapshot.data ?? [];
                if (items.isEmpty) {
                  return Center(
                    child: Text(
                      l10n.noPatientsYet,
                      style: TextStyle(color: textSecondary),
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final data = items[i];
                    final name = ((data['displayName'] ?? l10n.unknown) as Object).toString();
                    final avatar = ((data['avatarUrl'] ?? '') as Object).toString();
                    final lastAnalysisAtStr = (data['lastAnalysisAt'] as Object?)?.toString();
                    String? normalize(dynamic value) {
                      if (value == null) return null;
                      final str = value.toString().trim();
                      if (str.isEmpty || str.toLowerCase() == 'null') return null;
                      return str;
                    }

                    final documentId = normalize(data['documentId']);
                    final fallbackCandidates = [
                      data['id'],
                      data['email'],
                      data['uid'],
                      data['userId'],
                    ];
                    String? inferredId;
                    for (final candidate in fallbackCandidates) {
                      final candidateValue = normalize(candidate);
                      if (candidateValue != null) {
                        inferredId = candidateValue;
                        break;
                      }
                    }
                    inferredId ??= 'patient_${name.toLowerCase().replaceAll(' ', '_').replaceAll(RegExp(r'[^a-z0-9_]'), '')}';
                    final patientId = documentId ?? inferredId;
                    final hasFirestoreRecord = documentId != null;

                    void showMissingRecordMessage() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.patientNotTransferredMessage),
                        ),
                      );
                    }
                    
                    return Material(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.getCardColor(context),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.getTextSecondaryColor(context).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: avatar.isNotEmpty 
                                ? CachedNetworkImageProvider(avatar) 
                                : null,
                            child: avatar.isEmpty ? const Icon(Icons.person_outline) : null,
                          ),
                          title: Text(name, style: TextStyle(color: textPrimary)),
                          subtitle: Text(
                            (lastAnalysisAtStr != null ? '${l10n.lastAnalysis}$lastAnalysisAtStr' : l10n.noAnalysisInfo),
                            style: TextStyle(color: textSecondary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                          trailing: Wrap(
                            spacing: 8,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              if (!hasFirestoreRecord)
                                Chip(
                                  label: Text(l10n.notTransferred),
                                  avatar: const Icon(Icons.cloud_off, size: 16),
                                  visualDensity: VisualDensity.compact,
                                ),
                              IconButton(
                                tooltip: l10n.message,
                                icon: Icon(Icons.chat_outlined, color: AppTheme.primaryGreen),
                                onPressed: () async {
                                  if (!hasFirestoreRecord) {
                                    showMissingRecordMessage();
                                    return;
                                  }
                                  
                                  // Doktor bilgilerini al
                                  final doctorAuthService = DoctorAuthService();
                                  final isAuthenticated = await doctorAuthService.isDoctorAuthenticated;
                                  
                                  if (!isAuthenticated) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(l10n.doctorSessionNotFound),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }
                                  
                                  // Doktor email'ini al
                                  final prefs = await SharedPreferences.getInstance();
                                  final doctorEmail = prefs.getString('doctor_email') ?? '';
                                  final storedDoctorName = prefs.getString('doctor_name');
                                  
                                  Doctor? doctor;
                                  if (doctorEmail.isNotEmpty) {
                                    doctor = Doctor.getDoctorByEmail(doctorEmail);
                                  }
                                  
                                  final doctorId = await doctorAuthService.getStoredDoctorId();
                                  if (doctorId == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(l10n.doctorIdNotFound),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }
                                  final doctorName = storedDoctorName ??
                                      doctor?.name ??
                                      l10n.doctor;
                                  
                                  // Yeni mesajlaşma ekranına git
                                  Navigator.pushNamed(context, '/messages', arguments: {
                                    'doctorId': doctorId,
                                    'doctorName': doctorName,
                                    'patientId': patientId,
                                    'patientName': name,
                                    'userRole': 'doctor',
                                  });
                                },
                              ),
                              IconButton(
                                tooltip: l10n.analyses,
                                icon: const Icon(Icons.photo_library_outlined),
                                onPressed: () async {
                                  try {
                                    if (!hasFirestoreRecord) {
                                      showMissingRecordMessage();
                                      return;
                                    }
                                    
                                    if (patientId.isEmpty) {
                                      debugPrint('❌ Hasta ID boş - detay sayfasına gidilemiyor');
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(l10n.patientIdNotFound),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                      return;
                                    }
                                    
                                    debugPrint('💼 Hasta detay sayfasına yönlendiriliyor:');
                                    debugPrint('   Hasta ID: $patientId');
                                    debugPrint('   Hasta Adı: $name');
                                    
                                    if (context.mounted) {
                                      Navigator.pushNamed(context, '/doctor-patient-detail',
                                          arguments: {'patientId': patientId, 'patientName': name});
                                    }
                                  } catch (e, stackTrace) {
                                    debugPrint('❌ Hasta detay sayfasına yönlendirme hatası: $e');
                                    debugPrint('   Patient ID: $patientId');
                                    debugPrint('   Stack trace: $stackTrace');
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('${l10n.errorPrefix}${e.toString()}'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                              const Icon(Icons.chevron_right),
                            ],
                          ),
                          onTap: () {
                            try {
                              if (!hasFirestoreRecord) {
                                showMissingRecordMessage();
                                return;
                              }
                              
                              if (patientId.isEmpty) {
                                debugPrint('❌ Hasta ID boş - detay sayfasına gidilemiyor');
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(l10n.patientIdNotFound),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                                return;
                              }
                              
                              debugPrint('👥 Hasta detay sayfasına yönlendiriliyor:');
                              debugPrint('   Hasta ID: $patientId');
                              debugPrint('   Hasta Adı: $name');
                              
                              if (context.mounted) {
                                Navigator.pushNamed(context, '/patient-detail', arguments: {
                                  'patientId': patientId,
                                  'patientName': name,
                                });
                              }
                            } catch (e, stackTrace) {
                              debugPrint('❌ Hasta detay sayfasına yönlendirme hatası: $e');
                              debugPrint('   Patient ID: $patientId');
                              debugPrint('   Stack trace: $stackTrace');
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${l10n.errorPrefix}${e.toString()}'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                        ),
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


