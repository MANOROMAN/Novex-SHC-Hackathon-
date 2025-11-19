import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme/app_theme.dart';
import '../services/firestore_service.dart';
import '../services/auth_service.dart';
import 'package:self_capture/l10n/app_localizations.dart';

class MyPhotosScreen extends StatefulWidget {
  const MyPhotosScreen({super.key});

  @override
  State<MyPhotosScreen> createState() => _MyPhotosScreenState();
}

class _MyPhotosScreenState extends State<MyPhotosScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final AuthService _authService = AuthService();

  String _formatAnalysisDate(dynamic timestamp) {
    final l10n = AppLocalizations.of(context);
    if (timestamp == null) return l10n?.noDateInfo ?? 'Tarih bilgisi yok';
    
    DateTime date;
    if (timestamp is Timestamp) {
      date = timestamp.toDate();
    } else if (timestamp is DateTime) {
      date = timestamp;
    } else {
      return l10n?.invalidDate ?? 'Geçersiz tarih';
    }

    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return l10n?.today ?? 'Bugün';
    } else if (difference.inDays == 1) {
      return l10n?.yesterday ?? 'Dün';
    } else if (difference.inDays < 7) {
      final daysString = difference.inDays.toString();
      return l10n?.daysAgo(daysString) ?? '$daysString gün önce';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return l10n?.weeksAgo(weeks.toString()) ?? '$weeks hafta önce';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return l10n?.monthsAgo(months.toString()) ?? '$months ay önce';
    } else {
      final years = (difference.inDays / 365).floor();
      return l10n?.yearsAgo(years.toString()) ?? '$years yıl önce';
    }
  }

  Widget _buildAnalysisCard({
    required String date,
    required Map<String, dynamic> analysis,
    required String analysisId,
  }) {
    final l10n = AppLocalizations.of(context);
    final photoUrls = analysis['photoUrls'] as Map<String, dynamic>? ?? {};
    final isValid = analysis['isValid'] as bool? ?? false;
    final message = analysis['message'] as String? ?? '';
    final detectedAngles = analysis['detectedAngles'] as Map<String, dynamic>? ?? {};
    final samePerson = analysis['samePerson'] as bool? ?? true;

    // Sabit sıra
    const orderedStages = ['front', 'right45', 'left45', 'vertex', 'donor'];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getShadowColor(context),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showAnalysisDetailModal(analysisId, analysis),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.photo_library_rounded,
                              size: 20,
                              color: AppTheme.getBrandPrimaryColor(context),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  date,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.getTextPrimaryColor(context),
                                  ),
                                ),
                                if (message.isNotEmpty)
                                  Text(
                                    message,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppTheme.getTextSecondaryColor(context),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isValid ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isValid ? Icons.check_circle : Icons.warning,
                            size: 16,
                            color: isValid ? Colors.green : Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            isValid ? (l10n?.valid ?? 'Geçerli') : (l10n?.retake ?? 'Tekrar Çek'),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isValid ? Colors.green : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildSamePersonChip(l10n, samePerson),
                    if (detectedAngles.isNotEmpty)
                      ...orderedStages.map(
                        (stage) => _buildStageStatusChip(
                          stage: stage,
                          detectedAngles: detectedAngles,
                          l10n: l10n,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 12),
                // Fotoğraf önizlemeleri
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: orderedStages.map((stage) {
                      final url = (photoUrls[stage] as String?) ?? '';
                      final label = _localizedStage(stage, l10n);
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.getBorderColor(context)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: url.isNotEmpty
                              ? Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: AppTheme.getMutedSurfaceColor(context),
                                      child: Icon(
                                        Icons.broken_image,
                                        color: AppTheme.getTextSecondaryColor(context),
                                      ),
                                    );
                                  },
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                            : null,
                                        strokeWidth: 2,
                                        color: AppTheme.getBrandPrimaryColor(context),
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: AppTheme.getMutedSurfaceColor(context),
                                  child: Center(
                                    child: Text(
                                      label,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.getTextSecondaryColor(context),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSamePersonChip(AppLocalizations? l10n, bool samePerson) {
    final color = samePerson ? Colors.green : Colors.red;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            samePerson ? Icons.person : Icons.person_off,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            samePerson ? (l10n?.samePerson ?? 'Aynı kişi') : (l10n?.differentPersonSuspicion ?? 'Farklı kişi şüphesi'),
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageStatusChip({
    required String stage,
    required Map<String, dynamic> detectedAngles,
    required AppLocalizations? l10n,
  }) {
    final detected = detectedAngles[stage] as String?;
    final bool? ok = detected == null ? null : detected == stage;
    final Color bg;
    final Color fg;
    final IconData icon;
    if (ok == null) {
      bg = AppTheme.getMutedSurfaceColor(context);
      fg = AppTheme.getTextSecondaryColor(context);
      icon = Icons.help_outline;
    } else if (ok) {
      bg = Colors.green.withValues(alpha: 0.1);
      fg = Colors.green;
      icon = Icons.check_circle;
    } else {
      bg = Colors.orange.withValues(alpha: 0.1);
      fg = Colors.orange;
      icon = Icons.error_outline;
    }
    final label = _localizedStage(stage, l10n);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: fg),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: fg),
          ),
        ],
      ),
    );
  }

  String _localizedStage(String stageKey, AppLocalizations? l10n) {
    switch (stageKey) {
      case 'front':
        return l10n?.photoCaptureFront ?? 'Front';
      case 'right45':
        return l10n?.captureStageRight45Title ?? 'Right 45°';
      case 'left45':
        return l10n?.captureStageLeft45Title ?? 'Left 45°';
      case 'vertex':
        return l10n?.photoCaptureTop ?? 'Top';
      case 'donor':
        return l10n?.captureStageDonorTitle ?? 'Donor Area';
      default:
        return stageKey;
    }
  }

  void _showAnalysisDetailModal(String analysisId, Map<String, dynamic> analysis) {
    final photoUrls = analysis['photoUrls'] as Map<String, dynamic>? ?? {};
    final detectedAngles = analysis['detectedAngles'] as Map<String, dynamic>? ?? {};
    final samePerson = analysis['samePerson'] as bool? ?? true;
    final message = analysis['message'] as String? ?? '';
    final analysisData = analysis['analysisData'] as Map<String, dynamic>? ?? {};
    const orderedStages = ['front', 'right45', 'left45', 'vertex', 'donor'];
    final l10n = AppLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.getElevatedSurfaceColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          l10n?.pastAnalysesDetailedView ?? 'Analysis Detail',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.getTextPrimaryColor(context),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: (samePerson ? Colors.green : Colors.red).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                samePerson ? Icons.person : Icons.person_off,
                                size: 14,
                                color: samePerson ? Colors.green : Colors.red,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                samePerson ? (l10n?.photoCaptureFront ?? 'Same person') : (l10n?.anErrorOccurred('Different person') ?? 'Different person suspected'),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: samePerson ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (message.isNotEmpty)
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTextSecondaryColor(context),
                        ),
                      ),
                    const SizedBox(height: 12),
                    // Büyük görseller, sabit sırada
                    Column(
                      children: orderedStages.map((stage) {
                        final url = (photoUrls[stage] as String?) ?? '';
                        final detected = detectedAngles[stage] as String?;
                        final ok = detected == null ? null : (detected == stage);
                        final label = _localizedStage(stage, l10n).toUpperCase();
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.getBorderColor(context)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Text(
                                      label,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.getTextPrimaryColor(context),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    if (ok != null)
                                      Icon(
                                        ok ? Icons.check_circle : Icons.error_outline,
                                        size: 16,
                                        color: ok ? Colors.green : Colors.orange,
                                      ),
                                  ],
                                ),
                              ),
                              if (url.isNotEmpty)
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 180,
                                        color: AppTheme.getMutedSurfaceColor(context),
                                        child: Center(
                                          child: Icon(
                                            Icons.broken_image,
                                            color: AppTheme.getTextSecondaryColor(context),
                                          ),
                                        ),
                                      );
                                    },
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        height: 180,
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                                  loadingProgress.expectedTotalBytes!
                                              : null,
                                          strokeWidth: 2,
                                          color: AppTheme.getBrandPrimaryColor(context),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              else
                                Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: AppTheme.getMutedSurfaceColor(context),
                                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    l10n?.noScheduledEmails ?? 'No photo',
                                    style: TextStyle(color: AppTheme.getTextSecondaryColor(context)),
                                  ),
                                ),
                              // Issue/valid detayları
                              if (analysisData.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Builder(
                                    builder: (_) {
                                      final stageData = analysisData[stage];
                                      if (stageData is Map) {
                                        final valid = stageData['valid'] as bool? ?? true;
                                        final issue = stageData['issue'] as String? ?? '';
                                        return Row(
                                          children: [
                                            Icon(
                                              valid ? Icons.check_circle : Icons.error,
                                              size: 16,
                                              color: valid ? Colors.green : Colors.orange,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                issue.isNotEmpty ? issue : (valid ? 'Doğru çekilmiş' : 'Hata var'),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.getTextSecondaryColor(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppTheme.getBackgroundColor(context),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppTheme.getBrandPrimaryColor(context),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.getBrandPrimaryColor(context).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.photo_library_rounded,
                color: AppTheme.getBrandPrimaryColor(context),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Fotoğraflarım',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.getTextPrimaryColor(context),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Analysis List
            if (_authService.isAuthenticated)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _firestoreService.getUserAnalysesStream(_authService.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: CircularProgressIndicator(
                            color: AppTheme.getBrandPrimaryColor(context),
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Text(
                            'Bir hata oluştu: ${snapshot.error}',
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    final analyses = snapshot.data ?? [];

                    if (analyses.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_search,
                                size: 64,
                                color: AppTheme.getTextSecondaryColor(context).withValues(alpha: 0.5),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Henüz fotoğraf yok',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.getTextSecondaryColor(context),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'İlk analizini yapmak için analiz sayfasına dön',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.getTextSecondaryColor(context).withValues(alpha: 0.7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: analyses.map((analysis) {
                        final analysisId = analysis['id'] as String? ?? '';
                        return _buildAnalysisCard(
                          date: _formatAnalysisDate(analysis['createdAt']),
                          analysis: analysis,
                          analysisId: analysisId,
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

