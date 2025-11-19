import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';

class InvoicesScreen extends StatelessWidget {
  InvoicesScreen({super.key});

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Faturalarım',
          style: TextStyle(
            color: Color(0xFF0D121B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: user == null
          ? _buildAuthRequired(context)
          : StreamBuilder<List<Map<String, dynamic>>>(
              stream: _firestoreService.getUserInvoicesStream(user.uid),
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

                final invoices = snapshot.data ?? [];

                if (invoices.isEmpty) {
                  return _buildEmptyState(context);
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final invoice = invoices[index];
                    return _buildInvoiceCard(context, invoice);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemCount: invoices.length,
                );
              },
            ),
    );
  }

  Widget _buildAuthRequired(BuildContext context) {
    return Center(
      child: Text(
        'Faturalarınızı görmek için giriş yapmanız gerekiyor.',
        style: TextStyle(
          fontSize: 14,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long, size: 56, color: AppTheme.textSecondary),
            const SizedBox(height: 12),
            Text(
              'Henüz oluşturulmuş bir faturanız yok.',
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade400, size: 42),
            const SizedBox(height: 12),
            Text(
              'Bir hata oluştu\n$message',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceCard(BuildContext context, Map<String, dynamic> invoice) {
    final issuedAt = invoice['issuedAt'];
    final dueDate = invoice['dueDate'];

    DateTime? issuedDate;
    DateTime? dueDateTime;
    if (issuedAt is DateTime) {
      issuedDate = issuedAt;
    } else if (issuedAt != null) {
      issuedDate = issuedAt.toDate();
    }
    if (dueDate is DateTime) {
      dueDateTime = dueDate;
    } else if (dueDate != null) {
      dueDateTime = dueDate.toDate();
    }

    final formattedIssue = issuedDate != null
        ? '${issuedDate.day.toString().padLeft(2, '0')}.${issuedDate.month.toString().padLeft(2, '0')}.${issuedDate.year}'
        : 'Tarih bekleniyor';

    final formattedDue = dueDateTime != null
        ? '${dueDateTime.day.toString().padLeft(2, '0')}.${dueDateTime.month.toString().padLeft(2, '0')}.${dueDateTime.year}'
        : 'Belirlenmedi';

    final status = (invoice['status'] ?? 'pending') as String;
    final statusConfig = _getStatusConfig(status);

    final amount = invoice['amount'] ?? 0;
    final currency = invoice['currency'] ?? 'EUR';

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
                Text(
                  '#${invoice['invoiceNumber'] ?? 'INV'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D121B),
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
            Row(
              children: [
                Text(
                  '${amount.toStringAsFixed(2)} $currency',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(Icons.access_time, size: 18, color: AppTheme.textSecondary),
                const SizedBox(width: 6),
                Text(
                  'Son Tarih: $formattedDue',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildDetailRow(Icons.event, 'Kesim Tarihi', formattedIssue),
            _buildDetailRow(Icons.medical_services_outlined, 'Hizmet', invoice['service'] ?? 'Saç Ekimi'),
            if (invoice['notes'] != null && (invoice['notes'] as String).isNotEmpty)
              _buildDetailRow(Icons.notes, 'Not', invoice['notes']),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: invoice['paymentUrl'] != null ? () => _openLink(invoice['paymentUrl']) : null,
                  icon: const Icon(Icons.payment, size: 18),
                  label: const Text('Ödeme Yap'),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: invoice['pdfUrl'] != null ? () => _openLink(invoice['pdfUrl']) : null,
                  icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
                  label: const Text('PDF İndir'),
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppTheme.textSecondary),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _StatusConfig _getStatusConfig(String status) {
    switch (status) {
      case 'paid':
        return _StatusConfig('Ödendi', Colors.green);
      case 'overdue':
        return _StatusConfig('Gecikmiş', Colors.red);
      default:
        return _StatusConfig('Bekliyor', Colors.orange);
    }
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _StatusConfig {
  final String label;
  final Color color;
  _StatusConfig(this.label, this.color);
}



