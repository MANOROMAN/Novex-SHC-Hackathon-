import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme/app_theme.dart';
import '../services/firestore_service.dart';
import '../services/auth_service.dart';

class PastAnalysesHistoryScreen extends StatefulWidget {
  const PastAnalysesHistoryScreen({super.key});

  @override
  State<PastAnalysesHistoryScreen> createState() => _PastAnalysesHistoryScreenState();
}

class _PastAnalysesHistoryScreenState extends State<PastAnalysesHistoryScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final AuthService _authService = AuthService();

  static const _captureStages = ['front', 'right45', 'left45', 'vertex', 'donor'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final brand = AppTheme.getBrandPrimaryColor(context);
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppTheme.getSurfaceColor(context),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: brand.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: brand),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          l10n.pastAnalysesTitle,
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: AppTheme.getBorderColor(context),
          ),
        ),
      ),
      body: _authService.isAuthenticated
          ? StreamBuilder<List<Map<String, dynamic>>>(
              stream: _firestoreService.getUserAnalysesStream(_authService.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: brand),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        l10n.errorOccurred(snapshot.error.toString()),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }

                final analyses = snapshot.data ?? [];

                if (analyses.isEmpty) {
                  return _buildEmptyState(brand);
                }

                return _buildAnalysisList(analyses, l10n, brand);
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

  Widget _buildEmptyState(Color brand) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.analytics_outlined,
            size: 80,
            color: brand.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.noAnalysesYet,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: brand,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.goToMainPage,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisList(List<Map<String, dynamic>> analyses, AppLocalizations l10n, Color brand) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: analyses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _buildAnalysisCard(analyses[index], l10n, brand),
    );
  }

  String _formatAnalysisDate(dynamic timestamp) {
    final l10n = AppLocalizations.of(context)!;
    if (timestamp == null) return l10n.unknownDate;
    try {
      if (timestamp is Timestamp) {
        final date = timestamp.toDate();
        final months = [
          l10n.january, l10n.february, l10n.march, l10n.april, l10n.may, l10n.june,
          l10n.july, l10n.august, l10n.september, l10n.october, l10n.november, l10n.december
        ];
        return '${months[date.month - 1]} ${date.day.toString().padLeft(2, '0')}, ${date.year}';
      }
      return l10n.unknownDate;
    } catch (e) {
      return l10n.unknownDate;
    }
  }

  Widget _buildAnalysisCard(Map<String, dynamic> analysis, AppLocalizations l10n, Color brand) {
    final date = _formatAnalysisDate(analysis['createdAt']);
    final summary = (analysis['notes'] ?? analysis['description'] ?? l10n.pastAnalysesDensityModerate).toString();
    final status = (analysis['status'] ?? 'completed').toString();
    final isValid = analysis['isValid'] == true;
    final photos = _extractStagePhotos(analysis);
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: () => _showAnalysisDetail(analysis, l10n, brand),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.getSurfaceColor(context),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: brand.withValues(alpha: 0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: brand),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      date,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                  ),
                  _buildStatusChip(l10n, status, brand),
                ],
              ),
              const SizedBox(height: 16),
              _buildStageStrip(photos, brand),
              const SizedBox(height: 16),
              Text(
                summary,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              _buildValidityRow(l10n, isValid, brand),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStageStrip(List<_StagePhoto> photos, Color brand) {
    return SizedBox(
      height: 88,
      child: Row(
        children: photos
            .map(
              (photo) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _buildStageTile(photo, brand),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildStageTile(_StagePhoto photo, Color brand) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: brand.withValues(alpha: 0.15)),
        color: brand.withValues(alpha: 0.03),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if ((photo.url ?? '').isNotEmpty)
              Image.network(
                photo.url!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildStagePlaceholder(brand),
              )
            else
              _buildStagePlaceholder(brand),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withValues(alpha: 0.35),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Text(
                  _stageLabel(photo.stage),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStagePlaceholder(Color brand) {
    return Container(
      color: brand.withValues(alpha: 0.06),
      child: Icon(Icons.image_outlined, color: brand.withValues(alpha: 0.35)),
    );
  }

  Widget _buildValidityRow(AppLocalizations l10n, bool isValid, Color brand) {
    final color = isValid ? Colors.green : Colors.orange;
    return Row(
      children: [
        Icon(isValid ? Icons.verified_outlined : Icons.error_outline, size: 18, color: color),
        const SizedBox(width: 8),
        Text(
          isValid ? l10n.analysisCompletedShort : l10n.retake,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusChip(AppLocalizations l10n, String status, Color brand) {
    final label = _statusLabel(l10n, status);
    final color = _statusColor(status, brand);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  void _showAnalysisDetail(Map<String, dynamic> analysis, AppLocalizations l10n, Color brand) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.getSurfaceColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        final photos = _extractStagePhotos(analysis);
        final summary = (analysis['notes'] ?? analysis['description'] ?? l10n.pastAnalysesDensityModerate).toString();
        final date = _formatAnalysisDate(analysis['createdAt']);
        final status = (analysis['status'] ?? 'completed').toString();
        final isValid = analysis['isValid'] == true;
        final textPrimary = AppTheme.getTextPrimaryColor(context);
        final textSecondary = AppTheme.getTextSecondaryColor(context);

        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.92,
          maxChildSize: 0.95,
          builder: (context, controller) {
            return SingleChildScrollView(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 48,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppTheme.getBorderColor(context),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: textPrimary,
                          ),
                        ),
                      ),
                      _buildStatusChip(l10n, status, brand),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildValidityRow(l10n, isValid, brand),
                  const SizedBox(height: 24),
                  _buildDetailPhotos(photos, brand),
                  const SizedBox(height: 24),
                  Text(
                    l10n.pastAnalysesDetailedView,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    summary,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: textSecondary,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailPhotos(List<_StagePhoto> photos, Color brand) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final photo = photos[index];
          return Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: brand.withValues(alpha: 0.12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if ((photo.url ?? '').isNotEmpty)
                    Image.network(
                      photo.url!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildStagePlaceholder(brand),
                    )
                  else
                    _buildStagePlaceholder(brand),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        _stageLabel(photo.stage),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<_StagePhoto> _extractStagePhotos(Map<String, dynamic> analysis) {
    final urls = analysis['photoUrls'];
    if (urls is Map<String, dynamic>) {
      return _captureStages
          .map(
            (stage) => _StagePhoto(
              stage: stage,
              url: urls[stage] is String ? urls[stage] as String : null,
            ),
          )
          .toList();
    }

    final fallback = analysis['imageUrl'] as String?;
    return _captureStages.map((stage) => _StagePhoto(stage: stage, url: fallback)).toList();
  }

  String _stageLabel(String stage) {
    final l10n = AppLocalizations.of(context)!;
    switch (stage) {
      case 'front':
        return l10n.frontAngle;
      case 'right45':
        return l10n.right45Angle;
      case 'left45':
        return l10n.left45Angle;
      case 'vertex':
        return l10n.vertexAngle;
      case 'donor':
        return l10n.donorAngle;
      default:
        return stage.toUpperCase();
    }
  }

  String _statusLabel(AppLocalizations l10n, String status) {
    switch (status) {
      case 'completed':
        return l10n.analysisCompletedShort;
      case 'failed':
        return l10n.retake;
      case 'pending':
        return l10n.pendingStatus;
      default:
        return status.replaceAll('_', ' ').toUpperCase();
    }
  }

  Color _statusColor(String status, Color brand) {
    switch (status) {
      case 'completed':
        return Colors.green;
      case 'failed':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return brand;
    }
  }
}

class _StagePhoto {
  final String stage;
  final String? url;

  _StagePhoto({required this.stage, this.url});
}
