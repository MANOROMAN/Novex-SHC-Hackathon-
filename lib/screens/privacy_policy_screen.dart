import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../utils/privacy_policy_content.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.settingsPrivacyPolicy,
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık ve Tarih Bilgileri
            _buildHeader(context),
            const SizedBox(height: 24),
            
            // I. GİRİŞ
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section1'),
              [
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section1A'),
                  PrivacyPolicyContent.getContent(context, 'section1AContent'),
                ),
                _buildSubSectionWithWidget(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section1B'),
                  _buildDefinitionsTable(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // II. KİŞİSEL VERİLERİN İŞLENMESİNE İLİŞKİN GENEL İLKELER ve ŞARTLAR
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section2'),
              [
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section2A'),
                  PrivacyPolicyContent.getContent(context, 'section2AContent'),
                ),
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section2B'),
                  PrivacyPolicyContent.getContent(context, 'section2BContent'),
                ),
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section2C'),
                  PrivacyPolicyContent.getContent(context, 'section2CContent'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // III. SMILE HAIR CLINIC TARAFINDAN İŞLENEN KİŞİSEL VERİ KATEGORİLERİ
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section3'),
              [
                _buildSubSection(
                  context,
                  '',
                  PrivacyPolicyContent.getContent(context, 'section3Content'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // IV. KİŞİSEL VERİLERİN AKTARILMASI
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section4'),
              [
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section4A'),
                  PrivacyPolicyContent.getContent(context, 'section4AContent'),
                ),
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section4B'),
                  PrivacyPolicyContent.getContent(context, 'section4BContent'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // V. KİŞİSEL VERİLERİN KORUNMASINA İLİŞKİN HUSUSLAR
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section5'),
              [
                _buildSubSection(
                  context,
                  '',
                  PrivacyPolicyContent.getContent(context, 'section5Content'),
                ),
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section5A'),
                  PrivacyPolicyContent.getContent(context, 'section5AContent'),
                ),
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section5B'),
                  PrivacyPolicyContent.getContent(context, 'section5BContent'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // VI. KİŞİSEL VERİLERİN SAKLANMASI ve İMHASI
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section6'),
              [
                _buildSubSection(
                  context,
                  '',
                  PrivacyPolicyContent.getContent(context, 'section6Content'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // VII. İLGİLİ KİŞİNİN AYDINLATILMASI ve BİLGİLENDİRİLMESİ
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section7'),
              [
                _buildSubSection(
                  context,
                  '',
                  PrivacyPolicyContent.getContent(context, 'section7Content'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // VIII. İLGİLİ KİŞİNİN HAKLARI ve BU HAKLARIN KULLANILMASI
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section8'),
              [
                _buildSubSection(
                  context,
                  '',
                  PrivacyPolicyContent.getContent(context, 'section8Content'),
                ),
                _buildSubSection(
                  context,
                  PrivacyPolicyContent.getContent(context, 'section9'),
                  PrivacyPolicyContent.getContent(context, 'section9Content'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // X. POLİTİKANIN YÜRÜRLÜĞÜ ve GÜNCELLENME PERİYODU
            _buildSection(
              context,
              PrivacyPolicyContent.getContent(context, 'section10'),
              [
                _buildSubSection(
                  context,
                  '',
                  PrivacyPolicyContent.getContent(context, 'section10Content'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildFooter(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PrivacyPolicyContent.getContent(context, 'title'),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.getPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(context, PrivacyPolicyContent.getContent(context, 'documentDate'), PrivacyPolicyContent.getContent(context, 'docDate')),
          _buildInfoRow(context, PrivacyPolicyContent.getContent(context, 'revisionDate'), PrivacyPolicyContent.getContent(context, 'revDate')),
          _buildInfoRow(context, PrivacyPolicyContent.getContent(context, 'revisionNumber'), PrivacyPolicyContent.getContent(context, 'revNum')),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefinitionsTable(BuildContext context) {
    final definitions = [
      {'term': 'Açık Rıza', 'desc': 'Belirli bir konuya ilişkin, bilgilendirilmeye dayanan ve özgür iradeyle açıklanan rıza'},
      {'term': 'Anayasa', 'desc': '2709 sayılı Türkiye Cumhuriyeti Anayasası'},
      {'term': 'Çalışan', 'desc': 'Smile Hair Clinic\'te çalışanlar ve yöneticiler'},
      {'term': 'Çalışan Adayı', 'desc': 'Smile Hair Clinic\'e herhangi bir yolla iş başvurusunda bulunmuş ya da özgeçmiş ve ilgili bilgilerini Smile Hair Clinic\'in incelemesine açmış olan gerçek kişiler'},
      {'term': 'Hissedar/Ortak', 'desc': 'Smile Hair Clinic\'in hissedarı ve ortağı gerçek kişiler'},
      {'term': 'İlgili Kişi', 'desc': 'Kişisel verisi işlenen gerçek kişi'},
      {'term': 'İmha', 'desc': 'Kişisel verilerin silinmesi veya yok edilmesi'},
      {'term': 'Kişisel Veri', 'desc': 'Kimliği belirli veya belirlenebilir gerçek kişiye ilişkin her türlü bilgi'},
      {'term': 'KVKK', 'desc': '6698 sayılı Kişisel Verilerin Korunması Kanunu'},
      {'term': 'GDPR', 'desc': 'Avrupa Genel Veri Koruma Tüzüğü'},
      {'term': 'Özel Nitelikli Kişisel Veri', 'desc': 'Kişilerin ırkı, etnik kökeni, siyasi düşüncesi, felsefi inancı, dini, mezhebi veya diğer inançları, kılık ve kıyafeti, dernek, vakıf ya da sendika üyeliği, sağlığı, cinsel hayatı, ceza mahkûmiyeti ve güvenlik tedbirleriyle ilgili verileri ile biyometrik ve genetik veriler'},
      {'term': 'Politika', 'desc': 'Smile Hair Clinic Kişisel Verilerin İşlenmesi ve Korunması Politikası'},
      {'term': 'Smile Hair Clinic', 'desc': 'Smile Hair Sağlık Hizmetleri ve Turizm Dan. Tic. Ltd. Şti.'},
      {'term': 'Veri Sorumlusu', 'desc': 'Kişisel verilerin işleme amaçlarını ve vasıtalarını belirleyen, veri kayıt sisteminin kurulmasından ve yönetilmesinden sorumlu olan gerçek veya tüzel kişi'},
      {'term': 'Ziyaretçi', 'desc': 'Smile Hair Clinic\'in sahip olduğu fiziksel yerleşkelere çeşitli amaçlarla girmiş olan veya internet sitelerimizi ziyaret eden gerçek kişiler'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: definitions.map((def) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                def['term']!,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                def['desc']!,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: AppTheme.getTextSecondaryColor(context),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.getPrimaryColor(context),
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildSubSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
        ],
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: AppTheme.getTextSecondaryColor(context),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSubSectionWithWidget(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
        ],
        content,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PrivacyPolicyContent.getContent(context, 'footerCompany'),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            PrivacyPolicyContent.getContent(context, 'footerEmail'),
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            PrivacyPolicyContent.getContent(context, 'footerAddress'),
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            PrivacyPolicyContent.getContent(context, 'footerPhone'),
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            PrivacyPolicyContent.getContent(context, 'footerCopyright'),
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
        ],
      ),
    );
  }
}


