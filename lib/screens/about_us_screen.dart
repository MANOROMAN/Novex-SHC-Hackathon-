import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:self_capture/l10n/app_localizations.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
          l10n?.aboutUsTitle ?? 'Hakkımızda',
          style: const TextStyle(
            color: Color(0xFF0D121B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      AppTheme.primaryGreen.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital,
                        size: 60,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Smile Hair Clinic',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Section
                  _buildSectionTitle(Icons.info_outline, l10n?.whoWeAre ?? 'Biz Kimiz?'),
                  const SizedBox(height: 16),
                  _buildContentCard(
                    l10n?.aboutUsDescription ?? 'Smile Hair Clinic, Türkiye\'nin göz bebeği İstanbul\'da, saç ekimi alanında hizmet veren önde gelen kliniklerden biridir. Alanında uluslararası tanınırlığa sahip Dr. Gökay Bilgin ve Dr. Mehmet Erdoğan\'ın liderliğinde faaliyet gösteren Smile Hair Clinic\'te hasta memnuniyeti daima ön planda tutulur.\n\nTüm operasyon süreçleri bizzat doktorlar tarafından takip edilir ve ekipte yer alan her bir üye medikal eğitim almış profesyonellerden oluşur. Bugüne kadar dünyanın dört bir yanından gelen çok sayıda hastaya başarılı saç ekimi uygulamaları gerçekleştirilmiştir.',
                  ),
                  const SizedBox(height: 32),
                  // Our Values
                  _buildSectionTitle(Icons.favorite_outline, l10n?.ourValues ?? 'Değerlerimiz'),
                  const SizedBox(height: 16),
                  _buildValueItem(
                    Icons.verified_outlined,
                    l10n?.professionalism ?? 'Profesyonellik',
                    l10n?.professionalismDescription ?? 'Alanında uzman, uluslararası sertifikalı doktorlarımız',
                  ),
                  const SizedBox(height: 12),
                  _buildValueItem(
                    Icons.groups_outlined,
                    l10n?.patientSatisfaction ?? 'Hasta Memnuniyeti',
                    l10n?.patientSatisfactionDescription ?? 'Her zaman önceliğimiz hastalarımızın mutluluğu',
                  ),
                  const SizedBox(height: 12),
                  _buildValueItem(
                    Icons.medical_services_outlined,
                    l10n?.medicalEducation ?? 'Medikal Eğitim',
                    l10n?.medicalEducationDescription ?? 'Ekibimizdeki her üye medikal eğitim almış profesyonellerden oluşur',
                  ),
                  const SizedBox(height: 12),
                  _buildValueItem(
                    Icons.public_outlined,
                    l10n?.internationalService ?? 'Uluslararası Hizmet',
                    l10n?.internationalServiceDescription ?? 'Dünyanın dört bir yanından hastalarımıza hizmet',
                  ),
                  const SizedBox(height: 32),
                  // Stats
                  _buildSectionTitle(Icons.analytics_outlined, l10n?.byNumbers ?? 'Rakamlarla Biz'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard('15000+', l10n?.successfulOperations ?? 'Başarılı\nOperasyon'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard('100+', l10n?.patientsFromCountries ?? 'Ülkeden\nHasta'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard('5', l10n?.expertDoctors ?? 'Uzman\nDoktor'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard('99%', l10n?.patientSatisfactionRate ?? 'Hasta\nMemnuniyeti'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // CTA Buttons
                  _buildActionButton(
                    context,
                    Icons.people_outline,
                    l10n?.ourDoctors ?? 'Doktorlarımız',
                    () => Navigator.pushNamed(context, '/doctors'),
                  ),
                  const SizedBox(height: 12),
                  _buildActionButton(
                    context,
                    Icons.contact_phone_outlined,
                    l10n?.contact ?? 'İletişim',
                    () => Navigator.pushNamed(context, '/contact'),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryGreen,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D121B),
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(String content) {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Text(
        content,
        style: TextStyle(
          fontSize: 15,
          color: AppTheme.textSecondary,
          height: 1.8,
        ),
      ),
    );
  }

  Widget _buildValueItem(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryGreen,
              size: 28,
            ),
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
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryGreen,
            AppTheme.primaryGreen.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String text,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryGreen, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppTheme.primaryGreen),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



