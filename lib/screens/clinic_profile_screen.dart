import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../models/doctor_model.dart';
import 'doctor_detail_screen.dart';
import 'treatment_detail_screen.dart';

class ClinicProfileScreen extends StatefulWidget {
  const ClinicProfileScreen({super.key});

  @override
  State<ClinicProfileScreen> createState() => _ClinicProfileScreenState();
}

class _ClinicProfileScreenState extends State<ClinicProfileScreen> {
  int _selectedTabIndex = 0; // 0: About, 1: Doctors, 2: Gallery, 3: Treatments


  final Map<String, String> _treatmentArticles = {
    'Saç Ekimi': '''
Smile Hair Clinic'te saç ekimi; donör bölgeden alınan sağlıklı greftlerin seyrelmiş ya da tamamen açık olan alanlara mikro cerrahi tekniklerle nakledilmesini kapsayan kişiye özel bir tedavidir. Operasyon öncesinde saç analiziniz yapılır, saç çizginiz belirlenir ve kaç greftin hangi bölgelere transfer edileceği üç boyutlu çizimlerle planlanır.

Kliniğimizde FUE ve DHI teknikleri, yüksek büyütmeli görüntüleme ve safir uçlu mikro motorlarla uygulanır. Greftler tek tek alınır, kökler zarar görmesin diye soğuk solüsyonlarda korunur ve ardından doğal açıya uygun mikro kanallara yerleştirilir. Cerrahi ekip, tüm süreci Prof. Dr. Gökay Bilgin ve Dr. Mehmet Erdoğan'ın protokollerine göre yürütür.

İşlem sonrasında ilk yıkama, kabuklanma yönetimi, ilaç planı ve PRP destekli bakım programı detaylı şekilde anlatılır. Şok dökülme döneminin ardından 3. aydan itibaren yeni saçlar görünür; 12. aya kadar yoğunluk artmaya devam eder. Smile Hair Clinic'in fotoğraf takip sistemi sayesinde gelişiminizi her ay dijital ortamda izleyebilirsiniz.
''',
    'Sakal Ekimi': '''
Sakal ekimi; hormonel nedenlerle veya travma sonrası sakal ve favori bölgelerinde görülen boşlukları kalıcı olarak kapatmak için kullanılan bir mikro cerrahi uygulamadır. Smile Hair Clinic'te sakal çizgisi yüz hatlarına göre yeniden çizilir, greftler ense bölgesinden alınır ve çıkış yönü yüz kıllarının doğrusuna göre belirlenir.

Operasyon lokal anestezi altında ortalama 3-5 saat sürer. Hedef, simetrik, doğal ve yoğunluğu dengeli bir sakal görünümü elde etmektir. İlk 10 gün içinde kabuklar dökülür, 2-3 hafta sonra şok dökülme gerçekleşir ve 3. aydan itibaren yeni sakal telleri çıkmaya başlar.

Smile Hair Clinic, sakal ekiminden sonra özel bakım kitleri, hassas ciltler için yıkama protokolü ve kontrol randevuları ile süreci yakından takip eder. Kliniğin dijital takip sistemi sayesinde her ay fotoğraf yükleyerek doktorunuzdan geri bildirim alabilirsiniz.
''',
    'Kaş Ekimi': '''
Kaş ekimi; travma, aşırı epilasyon veya genetik nedenlerle seyrelmiş kaşları güçlendirmek için kullanılan yüksek hassasiyetli bir işlemdir. Smile Hair Clinic'te kaş kıllarının doğal açısı, yönü ve yoğunluğu analiz edilir, ardından tekli greftler donör bölgeden alınarak mikro kanallara 15-20 derecelik açıyla yerleştirilir.

İşlem sonrası ilk hafta boyunca özel losyonlarla bakım yapılır, hastaya kaş bölgesini nasıl koruması gerektiği ayrıntılı olarak anlatılır. Kaş kılları ilk aylarda ince ve kısa çıkar, 6. aydan itibaren kalınlaşır ve doğal forma ulaşır.

Kliniğin sanat odaklı yaklaşımı, kaşların yüz ifadesiyle uyumlu olmasını sağlar. Ölçümler altın oran prensiplerine göre yapılır; bu sayede kaş ekimi sonrasında doğal, ifade güçlendiren sonuçlar elde edilir.
''',
    'Kadın Saç Ekimi': '''
Kadınlarda saç dökülmesi çoğunlukla yaygın seyrelme veya çizgi gerilemesi şeklinde görülür. Smile Hair Clinic, kadın saç ekimi için medikal tedavilerle kombine edilen hibrit planlar uygular. PRP, mezoterapi ve saç ekimi aynı takvim içinde planlanarak hem yoğunluk hem de saç sağlığı desteklenir.

Operasyon öncesinde hormonal tetkikler ve dermoskopik analiz yapılır. Greft toplama işlemi, saçların uzun kalmasını sağlayan Long Hair FUE tekniğiyle gerçekleştirilebilir; böylece kadın hastalar sosyal hayatlarına hızlı döner.

Operasyon sonrası kontrollü yıkama, düşük ısıda kurutma, vitamin desteği, stres yönetimi ve diyet programı gibi çok yönlü öneriler sunulur. Kliniğin kadın danışman ekibi tüm süreç boyunca iletişimde kalarak konforu artırır.
''',
    'Afro Saç Ekimi': '''
Afro saç yapısı kıvrımlı folikülleri nedeniyle özel teknikler gerektirir. Smile Hair Clinic ekibi, mikroskop altında greftlerin yönünü takip ederek kıvırcık yapıya zarar vermeden toplar. Kanal açma aşamasında saçın doğal çıkış açısı dikkate alınarak özel safir uçlar kullanılır.

Operasyon öncesi saç ve saç derisinin elastikiyeti ölçülür, gerekiyorsa nemlendirme protokolü uygulanır. İşlem sonrasında kabuklanma süreci biraz daha uzun sürebileceği için hastaya günlük kontrol çağrıları yapılır ve özel bakım ürünleri verilir.

Afro saç ekimi sonuçları 4. aydan itibaren belirginleşir, 12. ayda doğal kıvrımlı yapı tamamen geri kazanılır. Smile Hair Clinic, bu tedaviyi uluslararası hastalar için VIP transfer ve tercüman desteğiyle sunar.
''',
    'Bıyık Ekimi': '''
Bıyık ekimi; üst dudak bölgesinde seyrelme yaşayan veya istediği yoğunluğu elde edemeyen kişiler için kalıcı bir çözümdür. Smile Hair Clinic'te bıyık çizgisi yüzün altın oranına göre belirlenir, greftler genellikle çene altından alınarak yön ve açı korunacak şekilde ekilir.

İşlem yaklaşık 2-3 saat sürer ve lokal anestezi altında yapılır. İlk 7 gün boyunca bıyık bölgesi su ile temas ettirilmez, kıllar kabuklar düştükten sonra kısaltılabilir. 3. aydan itibaren yeni bıyık telleri çıkmaya başlar ve 8-10 ay içinde tam yoğunluk kazanır.

Smile Hair Clinic, bıyık ekimini sakal veya favori operasyonlarıyla kombine edebilir. Kişiye özel bakım kitleri ve online kontrol randevuları ile iyileşme süreci desteklenir.
''',
    'Favori Ekimi': '''
Favori ekimi, yüz hatlarını belirginleştirmek ve saç-sakal geçişini güçlendirmek için tercih edilen bir uygulamadır. Smile Hair Clinic'te favori çizgisi kulak ön kısmı ve elmacık kemikleri ile uyumlu olacak şekilde yeniden tasarlanır.

Operasyon mikro motor ile greft toplanması ve safir uçlu kanal açma aşamalarından oluşur. Greftler yerleştirilirken çıkış yönüne çok dikkat edilir, böylece yeni kıllar mevcut saç ile aynı doğrultuda uzar.

İşlem sonrası ilk 10 gün içinde kabuklanma çözülür, 4. aydan itibaren sonuçlar görülmeye başlar. Favori ekimi, saç ekimi sonrası geçişleri yumuşatmak isteyen hastalar için ideal bir tamamlayıcıdır.
''',
    'Mezoterapi': '''
Mezoterapi; saç derisine vitamin, mineral, aminoasit ve dolaşım düzenleyici ilaç karışımlarının mikro iğnelerle verilmesi esasına dayanır. Smile Hair Clinic'te mezoterapi, saç ekiminden önce donör bölgeyi güçlendirmek veya operasyon sonrası yeni saçların kalitesini artırmak amacıyla uygulanır.

Seanslar genellikle 15-20 dakika sürer, haftalık veya iki haftalık aralıklarla 4-6 seanslık kürler planlanır. İçerikler kişiye özel hazırlanır; biotin, çinko, hyalüronik asit ve büyüme faktörleri kombinasyonları kullanılır.

Mezoterapi sonrasında hastaya masaj teknikleri, evde kullanabileceği serumlar ve beslenme önerileri verilir. Tedavi saç derisinin kan dolaşımını artırır, saç tellerinin daha dolgun ve parlak görünmesini sağlar.
''',
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(

      backgroundColor: AppTheme.getBackgroundColor(context),
      body: CustomScrollView(
        slivers: [
          // Enhanced App Bar with Gradient
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(

                icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: const SizedBox.shrink(),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(

                  icon: Icon(Icons.more_vert, color: AppTheme.getTextPrimaryColor(context)),
                  onPressed: () {},
                ),
              ),
            ],
            pinned: true,
            expandedHeight: 320,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDAGw-jxb-gH1R3MNKfDhsnhegeqlt7b0Fkr4ANV1AtgegKd8c3U5w1w20h8tkkvSAD_rV2fiGD8wFCEl4a1Uf2ta1vAPZZSIFudOmzW7vozi5oxk12WRycXwo2zJWQ-PKkxEDOdPJfX7e2tEC3C6j0TM7-FpIzyhiiUBbXAZhLFy2nMFlbC0eqkRi0skql124gArRXR1vDkCgXjCoJzBXtJEVjp6ZZQv5H2jkwqUz1aZ1EcBXNkWl4N1RvrMGcH-qsfHd-KttlSQ',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Enhanced Header Card
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(

                    gradient: AppTheme.buildHeroGradient(context),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.getShadowColor(context),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.health_and_safety,
                              color: Theme.of(context).colorScheme.surface,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.clinicProfileTitle,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.surface,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.clinicProfilePremiumRestoration,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.getTextSecondaryColor(context),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        l10n.clinicShortDescription,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.surface,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                // Enhanced Rating Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(

                    gradient: LinearGradient(
                    colors: AppTheme.getBrandGradientColors(context),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, color: Theme.of(context).colorScheme.surface, size: 16),
                                Icon(Icons.star, color: Theme.of(context).colorScheme.surface, size: 16),
                                Icon(Icons.star, color: Theme.of(context).colorScheme.surface, size: 16),
                                Icon(Icons.star, color: Theme.of(context).colorScheme.surface, size: 16),
                                Icon(Icons.star_half, color: Theme.of(context).colorScheme.surface, size: 16),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mükemmel',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                                color: AppTheme.getTextPrimaryColor(context),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '125 değerlendirme',
                              style: TextStyle(
                                fontSize: 14,

                                color: AppTheme.getTextSecondaryColor(context),
                              ),
                            ),
                            SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 0.96,

                              backgroundColor: AppTheme.getBorderColor(context).withOpacity(0.3),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.getBrandPrimaryColor(context),
                              ),
                              minHeight: 6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Enhanced Tabs
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      _buildTab(0, l10n.clinicProfileAbout),
                      _buildTab(1, l10n.clinicProfileDoctors),
                      _buildTab(2, l10n.clinicProfileGallery),
                      _buildTab(3, l10n.clinicProfileTreatments),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Tab Content
                if (_selectedTabIndex == 0) _buildAboutContent(),
                if (_selectedTabIndex == 1) _buildDoctorsContent(),
                if (_selectedTabIndex == 2) _buildGalleryContent(),
                if (_selectedTabIndex == 3) _buildTreatmentsContent(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 20 + MediaQuery.of(context).padding.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(

                gradient: LinearGradient(
                  colors: AppTheme.getBrandGradientColors(context),
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(

                    color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.surface, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.clinicProfileBookConsultation,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int index, String tabLabel) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected

                ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            tabLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              color: isSelected

                  ? AppTheme.getPrimaryColor(context)
                  : AppTheme.getTextSecondaryColor(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutContent() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionCard(
            icon: Icons.info_outline,
            title: l10n.clinicProfileAboutTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.clinicAboutDescription,
                  style: TextStyle(
                    fontSize: 15,

                    color: AppTheme.getTextSecondaryColor(context),
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.clinicAboutDescription2,
                  style: TextStyle(
                    fontSize: 15,

                    color: AppTheme.getTextSecondaryColor(context),
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionCard(
            icon: Icons.verified_user,
            title: l10n.clinicProfileEthicsTitle,
            child: Text(
              l10n.clinicEthicsDescription,
              style: TextStyle(
                fontSize: 15,

                color: AppTheme.getTextSecondaryColor(context),
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionCard(
            icon: Icons.newspaper,
            title: l10n.clinicProfilePressTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.clinicPressDescription,
                  style: TextStyle(
                    fontSize: 15,

                    color: AppTheme.getTextSecondaryColor(context),
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.mediaOutlets,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                    color: AppTheme.getTextPrimaryColor(context),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [

                    _buildMediaChip(context, 'Forbes, 2022'),
                    _buildMediaChip(context, 'BBC News, 2018'),
                    _buildMediaChip(context, 'The Times, 2020'),
                    _buildMediaChip(context, 'GQ Magazine, 2022'),
                    _buildMediaChip(context, 'Sabah Gazetesi'),
                    _buildMediaChip(context, 'Takvim Gazetesi'),
                    _buildMediaChip(context, 'T24'),
                    _buildMediaChip(context, 'Klass Magazine'),
                    _buildMediaChip(context, 'VIP Turkey'),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Uluslararası Medya:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                    color: AppTheme.getTextPrimaryColor(context),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [

                    _buildMediaChip(context, 'WalesOnline'),
                    _buildMediaChip(context, 'BirminghamLive'),
                    _buildMediaChip(context, 'Berliner Zeitung'),
                    _buildMediaChip(context, 'Der Tagesspiegel'),
                    _buildMediaChip(context, 'The Jerusalem'),
                    _buildMediaChip(context, 'PR Newswire'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionCard(
            icon: Icons.contact_mail,
            title: l10n.clinicProfileContactTitle,
            child: Column(
              children: [
                _buildInfoRow(Icons.location_on, 'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Türkiye'),
                const SizedBox(height: 16),
                _buildInfoRow(Icons.phone, '+90 549 149 24 00'),
                const SizedBox(height: 16),
                _buildInfoRow(Icons.email, 'info@smilehairclinic.com'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionCard(
            icon: Icons.help_outline,
            title: l10n.faqTitle,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/faq');
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(

                    gradient: LinearGradient(
                      colors: AppTheme.getBrandGradientColors(context),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.viewFaqPage,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.surface),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsContent() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              l10n.clinicProfileDoctorsTitle,

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
          ),
          _buildDoctorCardFromModel(Doctor.getDoctorById('dr_gokay_bilgin')!),
          const SizedBox(height: 16),
          _buildDoctorCardFromModel(Doctor.getDoctorById('dr_mehmet_erdogan')!),
          const SizedBox(height: 16),
          _buildDoctorCardFromModel(Doctor.getDoctorById('dr_firdavs_ahmedov')!),
          const SizedBox(height: 16),
          _buildDoctorCardFromModel(Doctor.getDoctorById('dr_ali_osman_soluk')!),
          const SizedBox(height: 16),
          _buildDoctorCardFromModel(Doctor.getDoctorById('dr_resat_arpaci')!),
        ],
      ),
    );
  }

  Widget _buildGalleryContent() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              l10n.clinicProfileGalleryTitle,

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
          ),
          // Galeri boşsa mesaj göster
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
            children: [
                  Icon(
                    Icons.photo_library_outlined,
                    size: 64,
                    color: AppTheme.getTextSecondaryColor(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Henüz fotoğraf yüklenmedi',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
              ),
            ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreatmentsContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Tedaviler',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
          ),
          _buildTreatmentItem(
            Icons.content_cut,
            'Saç Ekimi',
            'Saç ekimi, kellik veya saç kaybı yaşayan kişilere daha fazla saç yoğunluğu ve dolgunluğu sağlamak için kafa derisine saç foliküllerinin cerrahi olarak nakledilmesidir.',
            _treatmentArticles['Saç Ekimi'] ?? '',
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem(
            Icons.face,
            'Sakal Ekimi',
            'Sakal ekimi, sakal her zaman erkekler için önemli olmuştur. Belirli bir dönem gözden düşmüş olsa da, sakal günümüzde erkeklerin güven ve karizma sembolü haline gelmiştir.',
            _treatmentArticles['Sakal Ekimi'] ?? '',
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem(
            Icons.visibility,
            'Kaş Ekimi',
            'Kaş Ekimi, kadınlar kaşlarına binlerce yıldır özen göstermekte ve ilgilenmektedir. Kaşların şekli ve yoğunluğu yüz ifadesini ve güzelliği önemli ölçüde etkiler.',
            _treatmentArticles['Kaş Ekimi'] ?? '',
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem(
            Icons.person_outline,
            'Kadın Saç Ekimi',
            'Kadın Saç Ekimi; Saç kaybı, pek çok kadının hayatının bazı dönemlerinde karşılaştığı bir sorundur. Kadınlarda saç kaybının çeşitli nedenleri olabilir.',
            _treatmentArticles['Kadın Saç Ekimi'] ?? '',
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem(
            Icons.face_outlined,
            'Afro Saç Ekimi',
            'Afro saç ekimi, kıvırcık ve dalgalı saç yapısına sahip kişiler için özel olarak tasarlanmış bir saç ekimi yöntemidir.',
            _treatmentArticles['Afro Saç Ekimi'] ?? '',
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem(
            Icons.face_retouching_natural,
            'Bıyık Ekimi',
            'Bıyık ekimi, son zamanların en trend konuları haline gelmiştir. Bıyık, tarih boyunca centilmenliğin ve zarafetin sembolü olmuştur.',
            _treatmentArticles['Bıyık Ekimi'] ?? '',
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem(
            Icons.face_3,
            'Favori Ekimi',
            'Favori Ekimi, saç dökülmesi de erkekler ve kadınlar arasında yaygın bir sorundur. Favori ekimi ile yüz hatlarınızı belirginleştirebilirsiniz.',
            _treatmentArticles['Favori Ekimi'] ?? '',
          ),
          const SizedBox(height: 12),
          _buildTreatmentItem(
            Icons.healing,
            'Mezoterapi',
            'Mezoterapi 1952 yılında Fransız doktor Michel Pistor tarafından ağrı tedavisi için geliştirilmiş bir tedavi yöntemidir. Saç sağlığı için de kullanılmaktadır.',
            _treatmentArticles['Mezoterapi'] ?? '',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required IconData icon, required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    colors: AppTheme.getBrandGradientColors(context),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Theme.of(context).colorScheme.surface, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,

              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(

        color: AppTheme.getMutedSurfaceColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(

              color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.getBrandPrimaryColor(context), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,

              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDoctorCardFromModel(Doctor doctor) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailScreen(doctor: doctor),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,

                  gradient: LinearGradient(
                    colors: AppTheme.getBrandGradientColors(context),
              ),
              boxShadow: [
                BoxShadow(
                      color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(3),
            child: CircleAvatar(
              radius: 42,

                  backgroundColor: Theme.of(context).colorScheme.surface,
              child: CircleAvatar(
                radius: 40,
                    backgroundImage: AssetImage(doctor.imagePath),
                    onBackgroundImageError: (_, __) {},
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(

                      doctor.name,
              style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                color: AppTheme.getTextPrimaryColor(context),
                  ),
                ),
                const SizedBox(height: 6),
                Text(

                      doctor.getLocalizedSpecialization(context),
                      style: TextStyle(
                    fontSize: 14,
                        color: AppTheme.getBrandPrimaryColor(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(

                      doctor.biography.length > 80 
                          ? '${doctor.biography.substring(0, 80)}...'
                          : doctor.biography,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.getTextSecondaryColor(context),
                    height: 1.4,
                  ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.getBrandPrimaryColor(context),
                  size: 16,
                ),
            ),
        ],
      ),
        ),
      ),
    );
  }


  Widget _buildTreatmentItem(IconData icon, String title, String description, String content) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TreatmentDetailScreen(
                title: title,
                description: description,
                icon: icon,
                content: content,
              ),
          ),
          );
        },
        borderRadius: BorderRadius.circular(20),
              child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(

                      gradient: LinearGradient(
                        colors: [
                          AppTheme.getPrimaryColor(context),
                          AppTheme.getPrimaryColor(context).withOpacity(0.8),
                        ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.surface, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,

                      style: TextStyle(
                        fontSize: 18,
                fontWeight: FontWeight.bold,
                        color: AppTheme.getTextPrimaryColor(context),
              ),
            ),
          ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppTheme.getTextSecondaryColor(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.getTextSecondaryColor(context),
                  height: 1.6,
            ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
          ),
        ],
          ),
        ),
      ),
    );
  }


  Widget _buildMediaChip(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: AppTheme.buildBrandGradient(
          context,
          subtle: true,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.2),
          width: 1.2,
        ),
      ),
      child: Text(
        text,

        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


