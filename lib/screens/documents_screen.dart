import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';

class DocumentsScreen extends StatelessWidget {
  DocumentsScreen({super.key});

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = _authService.currentUser;

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
          l10n.myDocuments,
          style: const TextStyle(
            color: Color(0xFF0D121B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: user == null
          ? _buildAuthRequired(context)
          : StreamBuilder<List<Map<String, dynamic>>>(
              stream: _firestoreService.getUserDocumentsStream(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryGreen,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return _buildError(context, snapshot.error.toString());
                }

                final documents = snapshot.data ?? [];

                if (documents.isEmpty) {
                  return _buildEmptyState(context);
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    return _buildDocumentCard(context, document);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemCount: documents.length,
                );
              },
            ),
    );
  }

  Widget _buildAuthRequired(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Text(
        l10n.loginRequiredForDocuments,
        style: TextStyle(
          fontSize: 14,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.folder_open, size: 56, color: AppTheme.textSecondary),
            const SizedBox(height: 12),
            Text(
              l10n.noDocumentsYet,
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

  Widget _buildError(BuildContext context, String message) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade400, size: 42),
            const SizedBox(height: 12),
            Text(
              l10n.errorOccurredWithNewLine(message),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentCard(BuildContext context, Map<String, dynamic> document) {
    final l10n = AppLocalizations.of(context)!;
    final timestamp = document['date'];
    DateTime? dateTime;
    if (timestamp is DateTime) {
      dateTime = timestamp;
    } else if (timestamp != null) {
      dateTime = timestamp.toDate();
    }

    final formattedDate = dateTime != null
        ? '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}'
        : l10n.datePending;

    final type = (document['type'] ?? 'general') as String;
    final iconData = _getDocumentIcon(type);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(iconData, color: AppTheme.primaryGreen, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document['title'] ?? l10n.document,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D121B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        document['description'] ?? l10n.defaultDocumentDescription,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: document['downloadUrl'] != null
                      ? () => _openLink(document['downloadUrl'])
                      : null,
                  icon: const Icon(Icons.download, size: 18),
                  label: Text(l10n.download),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: document['downloadUrl'] != null
                      ? () => _openLink(document['downloadUrl'])
                      : null,
                  icon: const Icon(Icons.remove_red_eye_outlined, size: 18),
                  label: Text(l10n.viewDocument),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getDocumentIcon(String type) {
    switch (type) {
      case 'prescription':
        return Icons.medical_information_outlined;
      case 'report':
        return Icons.picture_as_pdf_outlined;
      case 'analysis':
        return Icons.analytics_outlined;
      default:
        return Icons.description_outlined;
    }
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}



