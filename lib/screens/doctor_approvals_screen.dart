import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import 'dart:async';

import '../services/doctor_api_service.dart';
import '../theme/app_theme.dart';

class DoctorApprovalsScreen extends StatefulWidget {
  const DoctorApprovalsScreen({super.key});

  @override
  State<DoctorApprovalsScreen> createState() => _DoctorApprovalsScreenState();
}

class _DoctorApprovalsScreenState extends State<DoctorApprovalsScreen> with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DoctorApiService _doctorApiService = DoctorApiService();
  final Map<String, _PatientSummary> _patientCache = {};
  final Set<String> _loadingItems = {};
  late TabController _tabController;
  int _refreshKey = 0; // Stream'i yeniden başlatmak için

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Tamamlanmış analizleri getir (status: 'completed' veya isValid: true) - Bekleyen onaylar için
  // MVP için: Sadece doctor_approved_results'tan AI onaylı analizleri çek (permission sorunu yok)
  Stream<List<_CompletedAnalysis>> _completedAnalysesStream() {
    try {
      debugPrint('📊 _completedAnalysesStream: Sadece AI onaylı analizler çekiliyor...');
      
      // DEBUG: Önce tüm doctor_approved_results kayıtlarını kontrol et
      _firestore
          .collection('doctor_approved_results')
          .limit(10)
          .get()
          .then((snapshot) {
        debugPrint('🔍 DEBUG: doctor_approved_results koleksiyonunda toplam ${snapshot.docs.length} kayıt var');
        for (final doc in snapshot.docs) {
          final data = doc.data();
          debugPrint('   📄 ${doc.id}: approvalStatus=${data['approvalStatus']}, patientId=${data['patientId']}');
        }
      }).catchError((error) {
        debugPrint('❌ DEBUG: doctor_approved_results okuma hatası: $error');
      });
      
      // doctor_approved_results'tan AI onaylı analizleri çek (doktor onayı bekliyor)
      // Bu koleksiyon zaten yapay zeka tarafından otomatik olarak dolduruluyor
      return _firestore
          .collection('doctor_approved_results')
          .where('approvalStatus', isEqualTo: 'ai_approved')
          .snapshots()
          .map((snapshot) {
        try {
          debugPrint('📊 AI onaylı analizler: ${snapshot.docs.length} doküman bulundu');
          final items = <_CompletedAnalysis>[];
          
          for (final doc in snapshot.docs) {
            try {
              final data = doc.data();
              final patientId = data['patientId'] as String? ?? '';
              
              if (patientId.isEmpty) {
                debugPrint('⚠️ AI onaylı analizde patientId boş: ${doc.id}');
                continue;
              }
              
              // photoUrls'i doğru şekilde parse et
              Map<String, String> photoUrls = {};
              try {
                final photoUrlsData = data['photoUrls'];
                if (photoUrlsData is Map) {
                  photoUrls = photoUrlsData.map((key, value) => MapEntry(
                    key.toString(),
                    value?.toString() ?? '',
                  ));
                }
              } catch (e) {
                debugPrint('⚠️ photoUrls parse hatası: $e');
              }
              
              items.add(_CompletedAnalysis(
                analysisId: data['analysisId'] as String? ?? doc.id,
                patientId: patientId,
                imageUrl: (data['imageUrl'] as String?) ?? (photoUrls['front'] ?? photoUrls.values.firstOrNull ?? ''),
                photoUrls: photoUrls,
                stage: (data['stage'] as String?) ?? '',
                description: (data['description'] as String?) ?? (data['message'] as String?) ?? '',
                approvalStatus: 'ai_approved', // AI onaylı, doktor onayı bekliyor
                createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? 
                          (data['originalCreatedAt'] as Timestamp?)?.toDate() ??
                          (data['aiApprovedAt'] as Timestamp?)?.toDate(),
              ));
            } catch (e, stackTrace) {
              debugPrint('❌ AI onaylı analiz parse hatası: $e');
              debugPrint('   Stack trace: $stackTrace');
            }
          }
          
          // Client-side sorting by createdAt (most recent first)
          items.sort((a, b) {
            final aDate = a.createdAt ?? DateTime(1970);
            final bDate = b.createdAt ?? DateTime(1970);
            return bDate.compareTo(aDate);
          });
          
          debugPrint('✅ Toplam AI onaylı analiz: ${items.length}');
          return items.take(50).toList(); // Limit to 50
        } catch (e, stackTrace) {
          debugPrint('❌ _completedAnalysesStream map hatası: $e');
          debugPrint('   Stack trace: $stackTrace');
          return <_CompletedAnalysis>[];
        }
      }).handleError((error, stackTrace) {
        debugPrint('❌ _completedAnalysesStream stream hatası: $error');
        debugPrint('   Stack trace: $stackTrace');
        return <_CompletedAnalysis>[];
      });
    } catch (e, stackTrace) {
      debugPrint('❌ _completedAnalysesStream başlatma hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      return Stream.value(<_CompletedAnalysis>[]);
    }
  }
  
  // Onaylanmış analizleri getir (doctor_approved_results koleksiyonundan - sadece doktor onaylı)
  Stream<List<_CompletedAnalysis>> _approvedAnalysesStream() {
    try {
      debugPrint('📊 _approvedAnalysesStream: Stream başlatılıyor...');
      
      // doctor_approved_results'tan sadece doktor onaylı analizleri getir (ai_approved değil)
      return _firestore
          .collection('doctor_approved_results')
          .where('approvalStatus', isEqualTo: 'approved')
          .snapshots()
          .map((snapshot) {
        try {
          debugPrint('═══════════════════════════════════════════════════════');
          debugPrint('📊 _approvedAnalysesStream: ${snapshot.docs.length} doküman bulundu');
          final items = <_CompletedAnalysis>[];
          
          for (final doc in snapshot.docs) {
            try {
              final data = doc.data();
              debugPrint('   📄 Doküman ID: ${doc.id}');
              debugPrint('      approvalStatus: ${data['approvalStatus']}');
              debugPrint('      patientId: ${data['patientId']}');
              
              // photoUrls'i doğru şekilde parse et
              Map<String, String> photoUrls = {};
              try {
                final photoUrlsData = data['photoUrls'];
                if (photoUrlsData is Map) {
                  photoUrls = photoUrlsData.map((key, value) => MapEntry(
                    key.toString(),
                    value?.toString() ?? '',
                  ));
                  debugPrint('      photoUrls: ${photoUrls.keys.toList()}');
                }
              } catch (e) {
                debugPrint('⚠️ photoUrls parse hatası: $e');
              }
              
              final analysisPatientId = data['patientId'] as String? ?? '';
              
              // patientId boş olan analizleri atla
              if (analysisPatientId.isEmpty) {
                debugPrint('⚠️ Onaylanmış analizde patientId boş: ${doc.id}');
                continue;
              }
              
              final analysisId = data['analysisId'] as String? ?? doc.id;
              final approvalStatus = (data['approvalStatus'] as String?) ?? 'approved';
              
              // Sadece 'approved' status'ü olanları ekle (ai_approved değil)
              if (approvalStatus != 'approved') {
                debugPrint('⚠️ Onaylanmış analizde status yanlış: $approvalStatus (beklenen: approved)');
                continue;
              }
              
              items.add(_CompletedAnalysis(
                analysisId: analysisId,
                patientId: analysisPatientId,
                imageUrl: (data['imageUrl'] as String?) ?? (photoUrls['front'] ?? photoUrls.values.firstOrNull ?? ''),
                photoUrls: photoUrls,
                stage: (data['stage'] as String?) ?? '',
                description: (data['description'] as String?) ?? (data['message'] as String?) ?? '',
                approvalStatus: approvalStatus,
                createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? 
                          (data['originalCreatedAt'] as Timestamp?)?.toDate() ??
                          (data['approvedAt'] as Timestamp?)?.toDate() ??
                          (data['doctorApprovedAt'] as Timestamp?)?.toDate() ??
                          (data['aiApprovedAt'] as Timestamp?)?.toDate(),
              ));
              
              debugPrint('✅ Onaylanmış analiz eklendi: $analysisId, patientId: $analysisPatientId, status: $approvalStatus');
            } catch (e, stackTrace) {
              debugPrint('❌ Onaylanmış analiz parse hatası (${doc.id}): $e');
              debugPrint('   Data: ${doc.data()}');
              debugPrint('   Stack trace: $stackTrace');
            }
          }
          
          debugPrint('📊 Toplam onaylanmış analiz: ${items.length}');
          debugPrint('═══════════════════════════════════════════════════════');
          
          // Client-side sorting by createdAt (most recent first)
          items.sort((a, b) {
            final aDate = a.createdAt ?? DateTime(1970);
            final bDate = b.createdAt ?? DateTime(1970);
            return bDate.compareTo(aDate);
          });
          
          return items.take(100).toList(); // Limit to 100
        } catch (e, stackTrace) {
          debugPrint('❌ _approvedAnalysesStream map hatası: $e');
          debugPrint('   Stack trace: $stackTrace');
          return <_CompletedAnalysis>[];
        }
      }).handleError((error, stackTrace) {
        debugPrint('═══════════════════════════════════════════════════════');
        debugPrint('❌ _approvedAnalysesStream stream hatası: $error');
        debugPrint('   Stack trace: $stackTrace');
        debugPrint('═══════════════════════════════════════════════════════');
        return <_CompletedAnalysis>[];
      });
    } catch (e, stackTrace) {
      debugPrint('❌ _approvedAnalysesStream başlatma hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      return Stream.value(<_CompletedAnalysis>[]);
    }
  }

  Future<_PatientSummary> _fetchPatientSummary(String patientId) async {
    try {
      debugPrint('👤 Hasta bilgileri getiriliyor: $patientId');
      
      if (patientId.isEmpty) {
        debugPrint('⚠️ PatientId boş');
        return _PatientSummary(name: 'Hasta', avatarUrl: '');
      }
      
      if (_patientCache.containsKey(patientId)) {
        debugPrint('✅ Hasta bilgisi cache\'den alındı: ${_patientCache[patientId]!.name}');
        return _patientCache[patientId]!;
      }

      debugPrint('📥 Firestore\'dan hasta bilgileri çekiliyor...');
      final snap = await _firestore.collection('patients_public').doc(patientId).get();
      
      if (!snap.exists) {
        debugPrint('⚠️ Hasta kaydı bulunamadı: $patientId');
        // users koleksiyonundan da deneyelim
        try {
          final userSnap = await _firestore.collection('users').doc(patientId).get();
          if (userSnap.exists) {
            final userData = userSnap.data() ?? {};
            final summary = _PatientSummary(
              name: (userData['displayName'] as String?) ?? 
                    (userData['name'] as String?) ?? 
                    (userData['email'] as String?) ?? 
                    'Hasta',
              avatarUrl: (userData['avatarUrl'] as String?) ?? 
                        (userData['photoURL'] as String?) ?? 
                        '',
            );
            _patientCache[patientId] = summary;
            debugPrint('✅ Hasta bilgisi users koleksiyonundan alındı: ${summary.name}');
            return summary;
          }
        } catch (e) {
          debugPrint('⚠️ users koleksiyonundan hasta bilgisi alınamadı: $e');
        }
        
        // Varsayılan değer döndür
        final defaultSummary = _PatientSummary(name: 'Hasta', avatarUrl: '');
        _patientCache[patientId] = defaultSummary;
        return defaultSummary;
      }
      
      final data = snap.data() ?? {};
      final summary = _PatientSummary(
        name: (data['displayName'] as String?) ?? 
              (data['name'] as String?) ?? 
              (data['email'] as String?) ?? 
              'Hasta',
        avatarUrl: (data['avatarUrl'] as String?) ?? 
                  (data['photoURL'] as String?) ?? 
                  '',
      );
      _patientCache[patientId] = summary;
      debugPrint('✅ Hasta bilgisi başarıyla alındı: ${summary.name}');
      return summary;
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('❌ Firebase Firestore hatası (hasta bilgisi getirme):');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      debugPrint('   Patient ID: $patientId');
      debugPrint('   Stack trace: $stackTrace');
      
      // Varsayılan değer döndür
      final defaultSummary = _PatientSummary(name: 'Hasta', avatarUrl: '');
      _patientCache[patientId] = defaultSummary;
      return defaultSummary;
    } catch (e, stackTrace) {
      debugPrint('❌ Hasta bilgisi getirme hatası: $e');
      debugPrint('   Patient ID: $patientId');
      debugPrint('   Stack trace: $stackTrace');
      
      // Varsayılan değer döndür
      final defaultSummary = _PatientSummary(name: 'Hasta', avatarUrl: '');
      _patientCache[patientId] = defaultSummary;
      return defaultSummary;
    }
  }

  Future<void> _handleApprove(_CompletedAnalysis analysis) async {
    try {
      debugPrint('═══════════════════════════════════════════════════════');
      debugPrint('✅ Fotoğraf onaylanıyor...');
      debugPrint('   Patient ID: ${analysis.patientId}');
      debugPrint('   Analysis ID: ${analysis.analysisId}');
      debugPrint('   Status: ${analysis.approvalStatus}');
      debugPrint('═══════════════════════════════════════════════════════');
      
      setState(() {
        _loadingItems.add(analysis.uniqueKey);
      });
      
      final ok = await _doctorApiService.approveAnalysis(
        analysis.patientId,
        analysis.analysisId,
      );
      
      if (!mounted) return;
      
      setState(() {
        _loadingItems.remove(analysis.uniqueKey);
      });
      
      final l10n = AppLocalizations.of(context);
      if (ok) {
        debugPrint('═══════════════════════════════════════════════════════');
        debugPrint('✅ Fotoğraf başarıyla onaylandı');
        debugPrint('   Patient ID: ${analysis.patientId}');
        debugPrint('   Analysis ID: ${analysis.analysisId}');
        debugPrint('   Önceki Status: ${analysis.approvalStatus}');
        debugPrint('═══════════════════════════════════════════════════════');
        
        // İlk gecikme - Firestore'un güncellenmesi için
        await Future.delayed(const Duration(milliseconds: 800));
        
        // Stream'i yenile (hem pending hem approved için)
        if (mounted) {
          setState(() {
            _refreshKey++;
          });
          debugPrint('🔄 Stream yenilendi (1. adım): refreshKey = $_refreshKey');
        }
        
        // İkinci gecikme - Stream'in güncellenmesi için
        await Future.delayed(const Duration(milliseconds: 500));
        
        if (mounted) {
          setState(() {
            _refreshKey++;
          });
          debugPrint('🔄 Stream yenilendi (2. adım): refreshKey = $_refreshKey');
        }
        
        // Üçüncü gecikme - Approved stream'in güncellenmesi için
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              _refreshKey++;
            });
            debugPrint('🔄 Stream yenilendi (3. adım): refreshKey = $_refreshKey');
          }
        });
        
        // Dördüncü gecikme - Son kontrol
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) {
            setState(() {
              _refreshKey++;
            });
            debugPrint('🔄 Stream yenilendi (4. adım - son kontrol): refreshKey = $_refreshKey');
          }
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n?.photoApproved ?? '✅ Fotoğraf onaylandı'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } else {
        debugPrint('❌ Fotoğraf onaylama başarısız');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.approvalFailed ?? '❌ Onay başarısız'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('═══════════════════════════════════════════════════════');
      debugPrint('❌ Fotoğraf onaylama hatası:');
      debugPrint('   Error: $e');
      debugPrint('   Patient ID: ${analysis.patientId}');
      debugPrint('   Analysis ID: ${analysis.analysisId}');
      debugPrint('   Stack trace: $stackTrace');
      debugPrint('═══════════════════════════════════════════════════════');
      
      if (!mounted) return;
      
      setState(() {
        _loadingItems.remove(analysis.uniqueKey);
      });
      
      final l10n = AppLocalizations.of(context);
      String errorMessage = l10n?.approvalFailed ?? '❌ Onay başarısız';
      
      if (e.toString().contains('permission') || e.toString().contains('PERMISSION_DENIED')) {
        errorMessage = l10n?.approvalPermissionDenied ?? 'Onay izni reddedildi. Lütfen Firebase kurallarını kontrol edin.';
      } else if (e.toString().contains('network') || e.toString().contains('unavailable')) {
        errorMessage = l10n?.networkError ?? 'Ağ hatası. Lütfen internet bağlantınızı kontrol edin.';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> _handleReject(_CompletedAnalysis analysis) async {
    try {
      debugPrint('❌ Fotoğraf reddediliyor...');
      debugPrint('   Patient ID: ${analysis.patientId}');
      debugPrint('   Analysis ID: ${analysis.analysisId}');
      debugPrint('   Status: ${analysis.approvalStatus}');
      
      setState(() {
        _loadingItems.add(analysis.uniqueKey);
      });
      
      final ok = await _doctorApiService.rejectAnalysis(
        analysis.patientId,
        analysis.analysisId,
      );
      
      if (!mounted) return;
      
      setState(() {
        _loadingItems.remove(analysis.uniqueKey);
      });
      
      final l10n = AppLocalizations.of(context);
      if (ok) {
        debugPrint('✅ Fotoğraf başarıyla reddedildi');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.photoRejected ?? '❌ Fotoğraf reddedildi. Hastaya bildirim gönderildi.'),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        debugPrint('❌ Fotoğraf reddetme başarısız');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n?.rejectionFailed ?? '❌ Reddetme başarısız'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Fotoğraf reddetme hatası:');
      debugPrint('   Error: $e');
      debugPrint('   Patient ID: ${analysis.patientId}');
      debugPrint('   Analysis ID: ${analysis.analysisId}');
      debugPrint('   Stack trace: $stackTrace');
      
      if (!mounted) return;
      
      setState(() {
        _loadingItems.remove(analysis.uniqueKey);
      });
      
      final l10n = AppLocalizations.of(context);
      String errorMessage = l10n?.rejectionFailed ?? '❌ Reddetme başarısız';
      
      if (e.toString().contains('permission') || e.toString().contains('PERMISSION_DENIED')) {
        errorMessage = l10n?.rejectionPermissionDenied ?? 'Reddetme izni reddedildi. Lütfen Firebase kurallarını kontrol edin.';
      } else if (e.toString().contains('network') || e.toString().contains('unavailable')) {
        errorMessage = l10n?.networkError ?? 'Ağ hatası. Lütfen internet bağlantınızı kontrol edin.';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return AppLocalizations.of(context)?.noDate ?? 'Tarih yok';
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }

  String _getApprovalStatusText(String status) {
    switch (status) {
      case 'approved':
        return AppLocalizations.of(context)?.statusApproved ?? 'Onaylandı';
      case 'rejected':
        return AppLocalizations.of(context)?.statusRejected ?? 'Reddedildi';
      case 'pending':
      default:
        return AppLocalizations.of(context)?.statusPending ?? 'Beklemede';
    }
  }

  Color _getApprovalStatusColor(String status) {
    switch (status) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Başlık
        Container(
          margin: const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppTheme.primaryGreen.withOpacity(0.25)
                      : AppTheme.primaryGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.photo_library_outlined,
                  color: AppTheme.primaryGreen,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.photoReview ?? 'Fotoğraf İnceleme',
                      style: TextStyle(
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)?.reviewAndApproveAnalyses ?? 'Analizleri inceleyin ve onaylayın',
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Refresh butonu
              Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? AppTheme.primaryGreen.withOpacity(0.2)
                      : AppTheme.primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  color: AppTheme.primaryGreen,
                  tooltip: AppLocalizations.of(context)?.refresh ?? 'Yenile',
                  onPressed: () {
                    debugPrint('🔄 Fotoğraf listesi yenileniyor...');
                    setState(() {
                      _refreshKey++;
                      _patientCache.clear();
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
              ),
            ],
          ),
        ),
        // Tab Bar
        TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryGreen,
          unselectedLabelColor: textSecondary,
          indicatorColor: AppTheme.primaryGreen,
          tabs: [
            Tab(
              icon: const Icon(Icons.pending_actions, size: 20),
              text: AppLocalizations.of(context)?.pending ?? 'Bekleyen',
            ),
            Tab(
              icon: const Icon(Icons.check_circle, size: 20),
              text: AppLocalizations.of(context)?.approved ?? 'Onaylanmış',
            ),
          ],
        ),
        // İçerik
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Bekleyen Tab
              Padding(
                padding: const EdgeInsets.all(16),
                child: StreamBuilder<List<_CompletedAnalysis>>(
                  key: ValueKey('pending_$_refreshKey'), // Refresh için key
                  stream: _completedAnalysesStream(),
                  builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final analyses = snapshot.data ?? [];
                if (analyses.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 64,
                          color: textSecondary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)?.noCompletedAnalyses ?? 'Henüz tamamlanmış analiz yok',
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)?.analysesWillAppearHere ?? 'Hastalar fotoğraf analizi tamamladığında burada görünecek',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)?.analysisProcess ?? 'Analiz süreci:\n• Hasta fotoğraf çeker\n• AI analizi yapar\n• Geçerli analizler burada listelenir',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textSecondary.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                    return ListView.separated(
                      itemCount: analyses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final analysis = analyses[index];
                        return FutureBuilder<_PatientSummary>(
                          future: _fetchPatientSummary(analysis.patientId),
                          builder: (context, snapshot) {
                            final summary = snapshot.data;
                            return _buildAnalysisCard(
                              context: context,
                              analysis: analysis,
                              patientSummary: summary,
                              isLoading: _loadingItems.contains(analysis.uniqueKey),
                              isDark: isDark,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              // Onaylanmış Tab
              Padding(
                padding: const EdgeInsets.all(16),
                child: StreamBuilder<List<_CompletedAnalysis>>(
                  key: ValueKey('approved_$_refreshKey'), // Refresh için key
                  stream: _approvedAnalysesStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final analyses = snapshot.data ?? [];
                    if (analyses.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 64,
                              color: textSecondary.withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)?.noApprovedPhotos ?? 'Henüz onaylanmış fotoğraf yok',
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)?.approvedPhotosWillAppearHere ?? 'Onayladığınız fotoğraflar burada görünecek',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: analyses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final analysis = analyses[index];
                        return FutureBuilder<_PatientSummary>(
                          future: _fetchPatientSummary(analysis.patientId),
                          builder: (context, snapshot) {
                            final summary = snapshot.data;
                            return _buildApprovedAnalysisCard(
                              context: context,
                              analysis: analysis,
                              patientSummary: summary,
                              isDark: isDark,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnalysisCard({
    required BuildContext context,
    required _CompletedAnalysis analysis,
    required _PatientSummary? patientSummary,
    required bool isLoading,
    required bool isDark,
  }) {
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final statusColor = _getApprovalStatusColor(analysis.approvalStatus);
    final statusText = _getApprovalStatusText(analysis.approvalStatus);
    final mainImageUrl = analysis.imageUrl.isNotEmpty
        ? analysis.imageUrl
        : (analysis.photoUrls['front'] ?? analysis.photoUrls.values.firstOrNull ?? '');

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.getCardColor(context) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.4)
                : Colors.black.withOpacity(0.05),
            blurRadius: isDark ? 12 : 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isDark
              ? statusColor.withOpacity(0.5)
              : statusColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Hasta bilgisi ve durum
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark
                  ? statusColor.withOpacity(0.2)
                  : statusColor.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: (patientSummary?.avatarUrl.isNotEmpty ?? false)
                      ? CachedNetworkImageProvider(patientSummary!.avatarUrl)
                      : null,
                  child: (patientSummary?.avatarUrl.isEmpty ?? true)
                      ? const Icon(Icons.person_outline)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientSummary?.name ?? (AppLocalizations.of(context)?.patient ?? 'Hasta'),
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppTheme.getTextSecondaryColor(context),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatDate(analysis.createdAt),
                            style: TextStyle(
                              color: AppTheme.getTextSecondaryColor(context),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDark
                        ? statusColor.withOpacity(0.3)
                        : statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: statusColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ana fotoğraf
          if (mainImageUrl.isNotEmpty)
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/doctor-image-viewer',
                  arguments: {'imageUrl': mainImageUrl},
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl: mainImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: isDark
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (_, __, ___) => Container(
                      color: isDark
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      child: Icon(
                        Icons.broken_image,
                        size: 48,
                        color: isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                      ),
                    ),
                    memCacheWidth: 800,
                    memCacheHeight: 450,
                  ),
                ),
              ),
            )
          else
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.grey.shade800
                    : Colors.grey.shade200,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
              ),
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 48,
                color: isDark
                    ? Colors.grey.shade400
                    : Colors.grey.shade600,
              ),
            ),
          // Açıklama ve butonlar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (analysis.description.isNotEmpty) ...[
                  Text(
                    AppLocalizations.of(context)?.description ?? 'Açıklama',
                    style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    analysis.description,
                    style: TextStyle(
                      color: AppTheme.getTextSecondaryColor(context),
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                ],
                // Fotoğraf sayısı
                if (analysis.photoUrls.isNotEmpty) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.photo_library,
                        size: 16,
                        color: AppTheme.getTextSecondaryColor(context),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${analysis.photoUrls.length} ${AppLocalizations.of(context)?.photoCountSuffix ?? 'fotoğraf'}',
                        style: TextStyle(
                          color: AppTheme.getTextSecondaryColor(context),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
                // Onay/Red butonları (pending veya ai_approved ise)
                if (analysis.approvalStatus == 'pending' || analysis.approvalStatus == 'pending_doctor_review' || analysis.approvalStatus == 'ai_approved')
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: isLoading ? null : () => _handleReject(analysis),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.redAccent,
                            side: const BorderSide(color: Colors.redAccent),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          icon: const Icon(Icons.close, size: 18),
                          label: Text(AppLocalizations.of(context)?.reject ?? 'Reddet'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: isLoading ? null : () => _handleApprove(analysis),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryGreen,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          icon: isLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(Icons.check_circle_outline, size: 18),
                          label: Text(isLoading ? (AppLocalizations.of(context)?.processing ?? 'İşleniyor...') : (AppLocalizations.of(context)?.approve ?? 'Onayla')),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Onaylanmış analiz kartı - Tüm fotoğrafları gösterir
  Widget _buildApprovedAnalysisCard({
    required BuildContext context,
    required _CompletedAnalysis analysis,
    required _PatientSummary? patientSummary,
    required bool isDark,
  }) {
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final photoUrls = analysis.photoUrls;
    const orderedStages = ['front', 'right45', 'left45', 'vertex', 'donor'];
    
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

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF192633) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.green.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Hasta bilgisi
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: (patientSummary?.avatarUrl.isNotEmpty ?? false)
                      ? CachedNetworkImageProvider(patientSummary!.avatarUrl)
                      : null,
                  child: (patientSummary?.avatarUrl.isEmpty ?? true)
                      ? const Icon(Icons.person_outline)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientSummary?.name ?? (AppLocalizations.of(context)?.patient ?? 'Hasta'),
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppTheme.getTextSecondaryColor(context),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatDate(analysis.createdAt),
                            style: TextStyle(
                              color: AppTheme.getTextSecondaryColor(context),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle, size: 14, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(
                        AppLocalizations.of(context)?.approved ?? 'Onaylandı',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tüm fotoğraflar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (analysis.description.isNotEmpty) ...[
                  Text(
                    AppLocalizations.of(context)?.description ?? 'Açıklama',
                    style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    analysis.description,
                    style: TextStyle(
                      color: AppTheme.getTextSecondaryColor(context),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Text(
                  AppLocalizations.of(context)?.photos(photoUrls.length.toString()) ?? 'Fotoğraflar (${photoUrls.length})',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                // Fotoğraf grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: orderedStages.length,
                  itemBuilder: (context, index) {
                    final stage = orderedStages[index];
                    final url = photoUrls[stage] ?? '';
                    
                    return GestureDetector(
                      onTap: url.isNotEmpty ? () {
                        Navigator.pushNamed(
                          context,
                          '/doctor-image-viewer',
                          arguments: {'imageUrl': url},
                        );
                      } : null,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.getBorderColor(context),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: url.isNotEmpty
                              ? Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: url,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        color: Colors.grey.shade200,
                                        child: const Center(
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        ),
                                      ),
                                      errorWidget: (_, __, ___) => Container(
                                        color: Colors.grey.shade200,
                                        child: const Icon(Icons.broken_image, size: 32),
                                      ),
                                      memCacheWidth: 400,
                                      memCacheHeight: 400,
                                    ),
                                    Positioned(
                                      left: 8,
                                      bottom: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          _getStageLabel(stage),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  color: Colors.grey.shade200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 32,
                                        color: AppTheme.getTextSecondaryColor(context),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        _getStageLabel(stage),
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: AppTheme.getTextSecondaryColor(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CompletedAnalysis {
  final String analysisId;
  final String patientId;
  final String imageUrl;
  final Map<String, String> photoUrls;
  final String stage;
  final String description;
  final String approvalStatus;
  final DateTime? createdAt;

  _CompletedAnalysis({
    required this.analysisId,
    required this.patientId,
    required this.imageUrl,
    required this.photoUrls,
    required this.stage,
    required this.description,
    required this.approvalStatus,
    required this.createdAt,
  });

  String get uniqueKey => '$patientId/$analysisId';
}

class _PatientSummary {
  final String name;
  final String avatarUrl;

  _PatientSummary({
    required this.name,
    required this.avatarUrl,
  });
}
