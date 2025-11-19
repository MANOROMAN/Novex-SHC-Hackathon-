import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';
import 'package:self_capture/l10n/app_localizations.dart';

class PatientCareScreen extends StatelessWidget {
  const PatientCareScreen({super.key});

  static List<Map<String, dynamic>> _getContactMethods(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      {
        'title': l10n.contactAddress,
        'value': 'Tatlısu, Alptekin Cd. No:15\n34774 Ümraniye / İstanbul / Türkiye',
        'icon': Icons.location_on,
        'url': 'https://www.google.com/maps/search/?api=1&query=Tatlısu,+Alptekin+Cd.+No:15,+34774+Ümraniye/İstanbul',
        'type': 'address',
      },
      {
        'title': l10n.contactEmail,
        'value': 'info@smilehairclinic.com',
        'icon': Icons.email_outlined,
        'url': 'mailto:info@smilehairclinic.com?subject=Smile%20Hair%20Clinic%20İletişim',
        'type': 'email',
      },
      {
        'title': l10n.contactPhone,
        'value': '+90 549 149 24 00',
        'icon': Icons.phone_in_talk,
        'url': 'tel:+905491492400',
        'type': 'phone',
      },
      {
        'title': l10n.contactWhatsApp,
        'value': '+90 549 149 24 00',
        'icon': Icons.chat,
        'url': 'https://api.whatsapp.com/send/?phone=905491492400&text&type=phone_number&app_absent=0',
        'type': 'whatsapp',
      },
    ];
  }

  static List<Map<String, String>> _getPreCareTips(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      {'title': l10n.preCareTip1Title, 'body': l10n.preCareTip1Body},
      {'title': l10n.preCareTip2Title, 'body': l10n.preCareTip2Body},
      {'title': l10n.preCareTip3Title, 'body': l10n.preCareTip3Body},
      {'title': l10n.preCareTip4Title, 'body': l10n.preCareTip4Body},
      {'title': l10n.preCareTip5Title, 'body': l10n.preCareTip5Body},
      {'title': l10n.preCareTip6Title, 'body': l10n.preCareTip6Body},
      {'title': l10n.preCareTip7Title, 'body': l10n.preCareTip7Body},
      {'title': l10n.preCareTip8Title, 'body': l10n.preCareTip8Body},
    ];
  }

  static List<Map<String, String>> _getPostCareTips(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      {'title': l10n.postCareTip1Title, 'body': l10n.postCareTip1Body},
      {'title': l10n.postCareTip2Title, 'body': l10n.postCareTip2Body},
      {'title': l10n.postCareTip3Title, 'body': l10n.postCareTip3Body},
      {'title': l10n.postCareTip4Title, 'body': l10n.postCareTip4Body},
      {'title': l10n.postCareTip5Title, 'body': l10n.postCareTip5Body},
      {'title': l10n.postCareTip6Title, 'body': l10n.postCareTip6Body},
      {'title': l10n.postCareTip7Title, 'body': l10n.postCareTip7Body},
      {'title': l10n.postCareTip8Title, 'body': l10n.postCareTip8Body},
    ];
  }

  static List<Map<String, String>> _getOperationDayTimeline(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      {'title': l10n.operationDayTimeline1Title, 'body': l10n.operationDayTimeline1Body},
      {'title': l10n.operationDayTimeline2Title, 'body': l10n.operationDayTimeline2Body},
      {'title': l10n.operationDayTimeline3Title, 'body': l10n.operationDayTimeline3Body},
      {'title': l10n.operationDayTimeline4Title, 'body': l10n.operationDayTimeline4Body},
      {'title': l10n.operationDayTimeline5Title, 'body': l10n.operationDayTimeline5Body},
      {'title': l10n.operationDayTimeline6Title, 'body': l10n.operationDayTimeline6Body},
    ];
  }

  static List<String> _getSterilizationMeasures(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.sterilizationMeasure1,
      l10n.sterilizationMeasure2,
      l10n.sterilizationMeasure3,
      l10n.sterilizationMeasure4,
      l10n.sterilizationMeasure5,
      l10n.sterilizationMeasure6,
      l10n.sterilizationMeasure7,
    ];
  }

  static List<String> _getWashSteps(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.washStep1,
      l10n.washStep2,
      l10n.washStep3,
      l10n.washStep4,
      l10n.washStep5,
      l10n.washStep6,
    ];
  }

  static List<Map<String, String>> _getAfterCareFaqs(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      {'q': l10n.faq1Question, 'a': l10n.faq1Answer},
      {'q': l10n.faq2Question, 'a': l10n.faq2Answer},
      {'q': l10n.faq3Question, 'a': l10n.faq3Answer},
      {'q': l10n.faq4Question, 'a': l10n.faq4Answer},
      {'q': l10n.faq5Question, 'a': l10n.faq5Answer},
      {'q': l10n.faq6Question, 'a': l10n.faq6Answer},
    ];
  }

  static final _galleryImages = [
    'assets/images/Day-of-procedure-01.webp',
    'assets/images/After-Procedure-1.webp',
    'assets/images/Hair-Washing-2-1.webp',
    'assets/images/Hair-Growth-Process-1-768x341-2.webp',
  ];

  static const String _washVideoUrl =
      'https://www.youtube.com/watch?time_continue=2&v=YnmWzxqVQNA&embeds_referring_euri=https%3A%2F%2Fwww.smilehairclinic.com%2F&source_ve_path=MjM4NTE';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppTheme.getBackgroundColor(context),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            AppLocalizations.of(context)!.patientCareGuideTitle,
            style: TextStyle(
              color: AppTheme.getTextPrimaryColor(context),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          bottom: TabBar(
            labelColor: AppTheme.getBrandPrimaryColor(context),
            unselectedLabelColor: AppTheme.getTextSecondaryColor(context),
            indicatorColor: AppTheme.getBrandPrimaryColor(context),
            isScrollable: true,
            tabs: [
              Tab(text: AppLocalizations.of(context)!.planningTab),
              Tab(text: AppLocalizations.of(context)!.operationTab),
              Tab(text: AppLocalizations.of(context)!.recoveryTab),
              Tab(text: AppLocalizations.of(context)!.resourcesTab),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              _buildPlanningPage(context),
              _buildOperationPage(context),
              _buildRecoveryPage(context),
              _buildResourcePage(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanningPage(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCard(
          context,
          'assets/images/Sapphire-Hair-Transplant-1.webp',
          AppLocalizations.of(context)!.personalizedPlanning,
          AppLocalizations.of(context)!.heroCardSubtitle1,
        ),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.headset_mic, AppLocalizations.of(context)!.contactAndQuickSupport),
        const SizedBox(height: 12),
        _buildContactActions(context),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.assignment_turned_in, AppLocalizations.of(context)!.preOperationPreparation),
        const SizedBox(height: 12),
        _buildTipList(context, _getPreCareTips(context)),
      ],
    );
  }

  Widget _buildOperationPage(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCard(
          context,
          'assets/images/Day-of-procedure-01.webp',
          AppLocalizations.of(context)!.operationDayFlow,
          AppLocalizations.of(context)!.heroCardSubtitle2,
        ),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.event_note, AppLocalizations.of(context)!.operationDayExperience),
        const SizedBox(height: 12),
        _buildTimeline(context, _getOperationDayTimeline(context)),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.shield, AppLocalizations.of(context)!.sterilizationAndHygieneStandards),
        const SizedBox(height: 12),
        _buildBulletCard(context, _getSterilizationMeasures(context)),
      ],
    );
  }

  Widget _buildRecoveryPage(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCard(
          context,
          'assets/images/After-Procedure-1.webp',
          AppLocalizations.of(context)!.recoveryJourney,
          AppLocalizations.of(context)!.heroCardSubtitle3,
        ),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.favorite, AppLocalizations.of(context)!.postOperationCare),
        const SizedBox(height: 12),
        _buildTipList(context, _getPostCareTips(context), highlight: true),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.water_drop, AppLocalizations.of(context)!.hairWashingProtocol),
        const SizedBox(height: 12),
        _buildImageBanner('assets/images/Hair-Washing-2-1.webp',
            AppLocalizations.of(context)!.imageBannerCaption1),
        const SizedBox(height: 12),
        _buildBulletCard(context, _getWashSteps(context)),
        const SizedBox(height: 24),
        // Video kutusu
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => _launchUrl(context, _washVideoUrl),
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.play_circle_outline,
                      color: AppTheme.primaryGreen,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.watchWashingVideo,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLocalizations.of(context)!.hairWashingProtocol,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppTheme.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResourcePage(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCard(
          context,
          'assets/images/Hair-Growth-Process-1-768x341-2.webp',
          AppLocalizations.of(context)!.knowledgeBase,
          AppLocalizations.of(context)!.heroCardSubtitle4,
        ),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.question_answer, AppLocalizations.of(context)!.frequentlyAskedQuestions),
        const SizedBox(height: 12),
        _buildFaqList(context),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.collections_bookmark, AppLocalizations.of(context)!.visualGuide),
        const SizedBox(height: 12),
        _buildGallery(context),
        const SizedBox(height: 24),
        _buildSectionHeader(context, Icons.info_outline, AppLocalizations.of(context)!.dashboardAboutUsTitle),
        const SizedBox(height: 12),
        _buildLinkCard(
          context,
          Icons.info_outline,
          AppLocalizations.of(context)!.dashboardAboutUsTitle,
          AppLocalizations.of(context)!.dashboardAboutUsSubtitle,
          () => Navigator.pushNamed(context, '/about-us'),
        ),
        const SizedBox(height: 12),
        _buildSectionHeader(context, Icons.contact_phone, AppLocalizations.of(context)!.contact),
        const SizedBox(height: 12),
        _buildLinkCard(
          context,
          Icons.contact_phone_outlined,
          AppLocalizations.of(context)!.dashboardContactTitle,
          AppLocalizations.of(context)!.dashboardContactSubtitle,
          () => Navigator.pushNamed(context, '/contact'),
        ),
      ],
    );
  }

  Widget _buildLinkCard(BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap) {
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppTheme.primaryGreen, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D121B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.textSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context, String assetPath, String title, String subtitle) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(assetPath, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.65),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, IconData icon, String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppTheme.getBrandPrimaryColor(context)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactActions(BuildContext context) {
    // Tüm kontakları aynı tasarımda göster
    final contactMethods = _getContactMethods(context);
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: contactMethods.length,
      itemBuilder: (context, index) {
        final contact = contactMethods[index];
        final icon = contact['icon'] as IconData;
        final title = contact['title'] as String;
        final value = contact['value'] as String;
        
        // Her buton için farklı renk tonları
        final colors = [
          [Colors.orange.shade50, Colors.orange.shade600],
          [Colors.purple.shade50, Colors.purple.shade600],
          [Colors.green.shade50, Colors.green.shade600],
          [Colors.blue.shade50, Colors.blue.shade600],
        ];
        final colorPair = colors[index % colors.length];
        
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _launchUrl(context, contact['url'] as String),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                color: colorPair[0],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colorPair[1].withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorPair[1].withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorPair[1].withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: colorPair[1],
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: colorPair[1],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value.split('\n').first,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageBanner(String assetPath, String caption) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.45),
              child: Text(
                caption,
                style: const TextStyle(color: Colors.white, height: 1.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipList(BuildContext context, List<Map<String, String>> tips, {bool highlight = false}) {
    return Column(
      children: tips.asMap().entries.map((entry) {
        final index = entry.key;
        final tip = entry.value;
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: highlight
                ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.08)
                : AppTheme.getElevatedSurfaceColor(context),
            border: Border.all(
              color: highlight
                  ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.3)
                  : AppTheme.getBorderColor(context),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.getShadowColor(context),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              expansionTileTheme: ExpansionTileThemeData(
                iconColor: highlight
                    ? AppTheme.getBrandPrimaryColor(context)
                    : AppTheme.getTextPrimaryColor(context),
                collapsedIconColor: highlight
                    ? AppTheme.getBrandPrimaryColor(context)
                    : AppTheme.getTextSecondaryColor(context),
              ),
            ),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: highlight
                      ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.15)
                      : AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: highlight
                          ? AppTheme.getBrandPrimaryColor(context)
                          : AppTheme.getTextPrimaryColor(context),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              title: Text(
                tip['title']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  AppLocalizations.of(context)!.tapToSeeDetails,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.getTextSecondaryColor(context),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: highlight
                        ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.05)
                        : AppTheme.getBackgroundColor(context),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tip['body']!,
                    style: TextStyle(
                      color: AppTheme.getTextSecondaryColor(context),
                      height: 1.6,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeline(BuildContext context, List<Map<String, String>> items) {
    return Column(
      children: items.asMap().entries.map((entry) {
        final index = entry.key + 1;
        final item = entry.value;
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.getElevatedSurfaceColor(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.getBorderColor(context)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppTheme.getBrandPrimaryColor(context).withOpacity(0.12),
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: TextStyle(color: AppTheme.getBrandPrimaryColor(context), fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['body']!,
                      style: TextStyle(color: AppTheme.getTextSecondaryColor(context), height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBulletCard(BuildContext context, List<String> bullets) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: bullets
            .map(
              (text) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(color: AppTheme.getTextSecondaryColor(context), height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildFaqList(BuildContext context) {
    return Column(
      children: _getAfterCareFaqs(context).map((faq) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: AppTheme.getElevatedSurfaceColor(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.getBorderColor(context)),
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            iconColor: AppTheme.getBrandPrimaryColor(context),
            collapsedIconColor: AppTheme.getBrandPrimaryColor(context),
            title: Text(
              faq['q']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Text(
                faq['a']!,
                style: TextStyle(color: AppTheme.getTextSecondaryColor(context), height: 1.5),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGallery(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 4 / 3,
      ),
      itemCount: _galleryImages.length,
      itemBuilder: (context, index) {
        final path = _galleryImages[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    try {
      Uri uri;
      String normalizedUrl = url;
      
      // YouTube URL'lerini normalize et
      if (url.contains('youtube.com') || url.contains('youtu.be')) {
        // Extract video ID from various YouTube URL formats
        String? videoId;
        
        if (url.contains('youtube.com/watch')) {
          final parsedUri = Uri.parse(url);
          videoId = parsedUri.queryParameters['v'];
        } else if (url.contains('youtu.be/')) {
          final parts = url.split('youtu.be/');
          if (parts.length > 1) {
            videoId = parts[1].split('?')[0].split('&')[0];
          }
        }
        
        // If we found a video ID, create a clean YouTube URL
        if (videoId != null) {
          normalizedUrl = 'https://www.youtube.com/watch?v=$videoId';
        }
      }
      
      // URL tipine göre Uri oluştur
      if (normalizedUrl.startsWith('tel:')) {
        // Telefon için
        final phoneNumber = normalizedUrl.replaceFirst('tel:', '').replaceAll('+', '').replaceAll(' ', '');
        uri = Uri(scheme: 'tel', path: phoneNumber);
      } else if (normalizedUrl.startsWith('mailto:')) {
        // Email için
        final emailParts = normalizedUrl.replaceFirst('mailto:', '').split('?');
        final email = emailParts[0];
        final query = emailParts.length > 1 ? emailParts[1] : 'subject=Smile Hair Clinic İletişim';
        uri = Uri(scheme: 'mailto', path: email, query: query);
      } else {
        // Diğer URL'ler için (https, http, vb.)
        uri = Uri.parse(normalizedUrl);
      }
      
      // Önce canLaunchUrl kontrolü yap
      bool canLaunch = await canLaunchUrl(uri);
      
      if (canLaunch) {
        // Eğer açılabilirse direkt aç
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // canLaunchUrl false dönerse bile denemeyi yap (bazı durumlarda çalışabilir)
        try {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } catch (launchError) {
          // Eğer hata alırsak kullanıcıya bilgi ver
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.connectionCannotOpen,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      }
    } catch (e) {
      // Genel hata durumu
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.errorOccurred(e.toString().length > 100 ? "${e.toString().substring(0, 100)}..." : e.toString()),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
