import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GdprConsentScreen extends StatelessWidget {
  const GdprConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'GDPR İletişim Formu Aydınlatma Metni',
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.surface,
              child: TabBar(
                labelColor: AppTheme.getBrandPrimaryColor(context),
                unselectedLabelColor: AppTheme.getTextSecondaryColor(context),
                indicatorColor: AppTheme.getBrandPrimaryColor(context),
                tabs: const [
                  Tab(text: 'KVKK Versiyonu'),
                  Tab(text: 'GDPR Versiyonu'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildKvkkVersion(context),
                  _buildGdprVersion(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKvkkVersion(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, 'KVKK'),
          const SizedBox(height: 24),
          _buildDataProcessingSection(context, 'KVKK'),
          const SizedBox(height: 24),
          _buildStorageSection(context, 'KVKK'),
          const SizedBox(height: 24),
          _buildTransferSection(context, 'KVKK'),
          const SizedBox(height: 24),
          _buildRightsSection(context, 'KVKK'),
          const SizedBox(height: 24),
          _buildConsentSection(context, 'KVKK'),
          const SizedBox(height: 24),
          _buildFooter(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildGdprVersion(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, 'GDPR'),
          const SizedBox(height: 24),
          _buildDataProcessingSection(context, 'GDPR'),
          const SizedBox(height: 24),
          _buildStorageSection(context, 'GDPR'),
          const SizedBox(height: 24),
          _buildTransferSection(context, 'GDPR'),
          const SizedBox(height: 24),
          _buildRightsSection(context, 'GDPR'),
          const SizedBox(height: 24),
          _buildConsentSection(context, 'GDPR'),
          const SizedBox(height: 24),
          _buildFooter(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String version) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SMILE HAIR CLINIC İLETİŞİM FORMU AYDINLATMA METNİ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(context, 'Veri Sorumlusu', 'Smile Hair Sağlık Hizmetleri ve Turizm Dan. Tic. Ltd. Şti. (Smile Hair Clinic)'),
          _buildInfoRow(context, 'Adres', 'Tatlısu Mahallesi Arif Ay Sokak No: 3B İç Kapı No: 2 Ümraniye/İstanbul'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataProcessingSection(BuildContext context, String version) {
    final isKvkk = version == 'KVKK';
    final introText = isKvkk
        ? 'İnternet sitemizdeki iletişim formu aracılığıyla paylaştığınız kişisel verileriniz, Kişisel Verilerin Korunması Kanunu (KVKK) ve ikincil düzenlemelere uygun olarak şirketimiz tarafından sunulan ürün ve hizmetlerden ilgili kişileri faydalandırmak için gerekli çalışmaların yapılması, iş süreçlerinin yürütülmesi ve başvuruda bulunduğunuz konu hakkında sizinle iletişim kurulabilmesi amaçlarıyla sınırlı olmak üzere işlenebilecektir.'
        : 'İnternet sitemizdeki iletişim formu aracılığıyla paylaştığınız kişisel verileriniz, Genel Veri Koruma Tüzüğü (General Data Protection Regulation EU GDPR and UK GDPR) ve ilgili diğer düzenlemeler uyarınca şirketimiz tarafından sunulan ürün ve hizmetlerden ilgili kişileri faydalandırmak için gerekli çalışmaların yapılması, iş süreçlerinin yürütülmesi ve başvuruda bulunduğunuz konu hakkında sizinle iletişim kurulabilmesi amaçlarıyla sınırlı olmak üzere işlenebilecektir.';

    return _buildSection(
      context,
      'İŞLENEN KİŞİSEL VERİLER, İŞLENME AMACI, HUKUKİ SEBEPLER ve TOPLANMA YÖNTEMİ',
      [
        _buildParagraph(context, introText),
        const SizedBox(height: 16),
        _buildParagraph(
          context,
          'Sizlere hizmet vermemizi istediğiniz andan itibaren bazı kişisel verileriniz hizmetin ifası, ulaşım ve konaklama işlemlerinin takibi amacıyla işlenecek ve gerektiğinde tedarikçilerimizle paylaşılabilecektir. Bilmemizi istemediğiniz kişisel verilerinizi ve özel nitelikli kişisel verilerinizi tarafımızla paylaşmamanızı rica ederiz.',
        ),
        const SizedBox(height: 24),
        _buildDataTable(context, isKvkk),
      ],
    );
  }

  Widget _buildDataTable(BuildContext context, bool isKvkk) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.getBorderColor(context)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildDataTableRow(
            context,
            'KİMLİK\n(Ad Soyad, Pasaport No, Doğum Tarihi-Yeri, Uyruğu)',
            '• Müşteri İlişkileri Yönetimi Süreçlerinin Yürütülmesi\n• Talep/ Şikâyet Yönetimi Süreçlerinin Yürütülmesi\n• Ürün/Hizmet Satış Süreçlerinin Yürütülmesi kapsamında;\n• İlgili Kişi\'yle iletişime geçilmesi durumunda kişiye özel hitapta kullanılabilmesi ve sunulan hizmetlere ilişkin toplanan şikâyet, öneri, soru ve taleplere yönelik çözüm ve yanıtların İlgili Kişi\'ye iletilebilmesi, hizmetin ifası, ulaşım ve konaklama işlemlerinin takibi',
            'Bir sözleşmenin kurulması veya ifasıyla doğrudan doğruya ilgili olması kaydıyla, sözleşmenin tarafı olarak sizlere ait kişisel verilerin işlenmesinin gerekli olması ve bir hakkın tesisi, kullanılması veya korunması için veri işlemenin zorunlu olması hukuki sebeplerine dayanarak çevrim içi elektronik formlar üzerinden otomatik yolla toplanmaktadır.',
            'Tedarikçiler (Konaklama ve ulaşım hizmetlerinin yerine getirilmesi)\nYetkili Kamu Kurum ve Kuruluşları',
            isHeader: true,
          ),
          _buildDataTableRow(
            context,
            'İLETİŞİM\n(Elektronik Posta, Telefon Numarası)',
            '• İletişim Faaliyetlerinin Yürütülmesi,\n• Müşteri İlişkileri Yönetimi Süreçlerinin Yürütülmesi\n• Talep/ Şikâyet Yönetimi Süreçlerinin Yürütülmesi kapsamında;\n• Ürün/Hizmet Satış Süreçlerinin Yürütülmesi kapsamında;\nİlgili Kişi\'nin başvuruda bulunduğu konu hakkında iletişim kurulabilmesi, hizmetin ifası, ulaşım ve konaklama işlemlerinin takibi maksadıyla',
            'Bir sözleşmenin kurulması veya ifasıyla doğrudan doğruya ilgili olması kaydıyla, sözleşmenin tarafı olarak sizlere ait kişisel verilerin işlenmesinin gerekli olması ve bir hakkın tesisi, kullanılması veya korunması için veri işlemenin zorunlu olması hukuki sebeplerine dayanarak çevrim içi elektronik formlar üzerinden otomatik yolla toplanmaktadır.',
            'Tedarikçiler (Konaklama ve ulaşım hizmetlerinin yerine getirilmesi)\nYetkili Kamu Kurum ve Kuruluşları',
          ),
          _buildDataTableRow(
            context,
            'GÖRSEL VE İŞİTSEL VERİLER\n(Fotoğraf ve Sesli Video Kayıtları)',
            '• İletişim Faaliyetlerinin Yürütülmesi,\n• Müşteri İlişkileri Yönetimi Süreçlerinin Yürütülmesi\n• Ürün/Hizmet Satış Süreçlerinin Yürütülmesi kapsamında; hizmetin ifası, hizmetin kapsamının belirlenmesi maksadıyla',
            'Bir sözleşmenin kurulması veya ifasıyla doğrudan doğruya ilgili olması kaydıyla, sözleşmenin tarafı olarak sizlere ait kişisel verilerin işlenmesinin gerekli olması ve bir hakkın tesisi, kullanılması veya korunması için veri işlemenin zorunlu olması hukuki sebeplerine dayanarak çevrim içi elektronik formlar üzerinden otomatik yolla toplanmaktadır.',
            'Aktarılmıyor',
          ),
          _buildDataTableRow(
            context,
            'DİĞER\n(Uçuş-Bilet-Seyahat-Konaklama Bilgisi)',
            '• Müşteri İlişkileri Yönetimi Süreçlerinin Yürütülmesi\n• Ürün/Hizmet Satış Süreçlerinin Yürütülmesi kapsamında; hizmetin ifası, ulaşım ve konaklama işlemlerinin takibi maksadıyla',
            'Bir sözleşmenin kurulması veya ifasıyla doğrudan doğruya ilgili olması kaydıyla, sözleşmenin tarafı olarak sizlere ait kişisel verilerin işlenmesinin gerekli olması ve bir hakkın tesisi, kullanılması veya korunması için veri işlemenin zorunlu olması hukuki sebeplerine dayanarak çevrim içi elektronik formlar üzerinden otomatik yolla toplanmaktadır.',
            'Tedarikçiler (Konaklama ve ulaşım hizmetlerinin yerine getirilmesi)',
          ),
          _buildDataTableRow(
            context,
            'İŞLEM GÜVENLİĞİ BİLGİSİ\n(IP Adresi, Çevrimiçi Belirleyiciler)',
            '• Faaliyetlerin mevzuata uygun yürütülmesi\n• Müşteri İlişkileri Yönetimi Süreçlerinin Yürütülmesi\n• Bilgi Güvenliği Süreçlerinin Yürütülmesi',
            'İlgili kişi olarak sizlerin temel hak ve özgürlüklerine zarar vermemek kaydıyla, veri sorumlusunun meşru menfaatleri için veri işlenmesinin zorunlu olması\nElektronik Sistemler ve Çevrim İçi Elektronik Formlar üzerinden otomatik yolla',
            'Yetkili Kamu Kurum ve Kuruluşları',
          ),
        ],
      ),
    );
  }

  Widget _buildDataTableRow(BuildContext context, String dataType, String purpose, String legalBasis, String transfer, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isHeader
            ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.1)
            : AppTheme.getElevatedSurfaceColor(context),
        border: Border(
          bottom: BorderSide(color: AppTheme.getBorderColor(context)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dataType,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isHeader ? AppTheme.getBrandPrimaryColor(context) : AppTheme.getTextPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
          _buildTableField(context, 'İşlenme Amacı', purpose),
          const SizedBox(height: 8),
          _buildTableField(context, 'Hukuki Sebep ve Toplanma Yöntemi', legalBasis),
          const SizedBox(height: 8),
          _buildTableField(context, 'Aktarım', transfer),
        ],
      ),
    );
  }

  Widget _buildTableField(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppTheme.getTextSecondaryColor(context),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 11,
            color: AppTheme.getTextSecondaryColor(context),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildStorageSection(BuildContext context, String version) {
    final isKvkk = version == 'KVKK';
    final title = isKvkk ? 'II. KİŞİSEL VERİLERİN SAKLANMASI' : 'VI. KİŞİSEL VERİLERİN SAKLANMASI';
    final content = isKvkk
        ? 'Kişisel Verileriniz KVKK\'nın 5. maddesinin 2. fıkrasındaki kanuni istisnalar kapsamında Veri Sorumlusunun Saklama ve İmha Politikasına uygun süreler boyunca işlenecek ve sınırlı süre muhafaza edilecektir. Verileriniz, veri işlemeyi gerektirecek hukuki sebeplerin ortadan kalkması hâlinde, resen veya sizin talebiniz ile silinir, yok edilir veya anonim hâle getirilir.'
        : 'Kişisel Verileriniz GDPR\'ın 6.maddesinin b bendi ve devamındaki kanuni istisnalar kapsamında Veri Sorumlusunun Saklama ve İmha Politikasına uygun süreler boyunca işlenecek ve sınırlı süre muhafaza edilecektir. Verileriniz, veri işlemeyi gerektirecek hukuki sebeplerin ortadan kalkması hâlinde, resen veya sizin talebiniz ile silinir, yok edilir veya anonim hâle getirilir.';

    return _buildSection(context, title, [_buildParagraph(context, content)]);
  }

  Widget _buildTransferSection(BuildContext context, String version) {
    final isKvkk = version == 'KVKK';
    final title = isKvkk ? 'III. KİŞİSEL VERİLERİN YURTDIŞINA AKTARILMASI' : 'VII. KİŞİSEL VERİLERİN YURT DIŞINA AKTARILMASI';
    final phoneNumber = isKvkk ? '+90 542 236 58 50' : '905422365850';
    final content = 'İletişim formları üzerinden bildirdiğiniz verileriniz, yukarıda belirtilen yurt içi aktarımlarının dışında, şirketimiz tarafından sağlanan hizmetin ifası amacıyla sunucuları yurtdışında bulunan mesajlaşma ve sohbet uygulamalarının kullanılması ile açık rızanıza istinaden yurt dışına aktarılabilecektir. Görüşmeyi bu uygulamalar üzerinden yerine getirmek istememeniz halinde, tarafınızla telefonla arama veya elektronik posta yöntemiyle iletişime geçilecek olup; dilerseniz $phoneNumber numaralı telefonları arayarak da görüşmelerinizi sürdürebilir ya da elektronik posta ile iletişime geçebilirsiniz.';

    return _buildSection(context, title, [_buildParagraph(context, content)]);
  }

  Widget _buildRightsSection(BuildContext context, String version) {
    final isKvkk = version == 'KVKK';
    final title = isKvkk ? 'IV. KİŞİSEL VERİLERİNİZE İLİŞKİN HAKLARINIZ' : 'VIII. KİŞİSEL VERİLERİNİZE İLİŞKİN HAKLARINIZ';
    
    final content = isKvkk
        ? 'İlgili Kişi olarak Veri Sorumlusu\'na başvurarak; KVKK\'nın İlgili Kişi\'nin haklarını düzenleyen 11. maddesindeki taleplerinizi Veri Sorumlusuna Başvuru Usul ve Esasları Hakkında Tebliğ\'de öngörülen haklarınız için ıslak imzanız ve kimliğinizi tevsik edici bir belge Tatlısu Mahallesi Arif Ay Sokak No: 3B İç Kapı No: 2 Ümraniye/İstanbul adresinde mukim Veri Sorumlusu adresimize yazılı yahut Kurulun belirlediği diğer başvuru usullerine uygun olarak iletmeniz durumunda talebinizin niteliğine göre en kısa sürede ve en geç 30 (otuz) gün içinde sonuçlandıracaktır.\n\nKonu hakkındaki detaylı bilgileri www.smilehairclinic.com adresindeki Kişisel Verilerin İşlenmesi ve Korunması Politikamızda bulabilirsiniz.'
        : 'İlgili Kişi olarak Veri Sorumlusu\'na başvurarak GDPR kapsamında https://ec.europa.eu/info/law/law-topic/data-protection/reform/rights-citizens/my-rights_en belirtilen haklarınızı kullanabilirsiniz:\n\n• Rızayı geri çekme hakkı (Madde 7 GDPR)\n• Erişim hakkı (Madde 15 GDPR)\n• Düzeltme hakkı (Madde 16 GDPR)\n• Silme hakkı (Madde 17 GDPR)\n• İşleme kısıtlama hakkı (Madde 18 GDPR)\n• Veri taşınabilirliği hakkı (Madde 20 GDPR)\n• İtiraz hakkı (Madde 21 GDPR)\n\nGDPR kapsamında sayılan yukarıdaki haklarınızı, ıslak imzanız ve kimliğinizi tevsik edici bir belge ile Tatlısu Mahallesi Arif Ay Sokak No: 3B İç Kapı No: 2 Ümraniye/İstanbul posta adresimize veya info@smilehair.com elektronik posta adresimize başvuru ve taleplerinizi iletmek suretiyle kullanabilirsiniz.\n\nKonu hakkındaki detaylı bilgileri www.smilehairclinic.com adresindeki Kişisel Verilerin İşlenmesi ve Korunması Politikamızda bulabilirsiniz.';

    return _buildSection(context, title, [_buildParagraph(context, content)]);
  }

  Widget _buildConsentSection(BuildContext context, String version) {
    final isKvkk = version == 'KVKK';
    final title = 'YURT DIŞI AKTARIM AÇIK RIZA BEYANI';
    final regulation = isKvkk
        ? 'Kişisel Verilerin Korunması Kanunu (KVKK)'
        : 'Genel Veri Koruma Tüzüğü (General Data Protection Regulation EU GDPR and UK GDPR)';
    final framework = isKvkk
        ? 'KVKK ve bağlı mevzuatlar'
        : 'GDPR ve ona bağlı mevzuatlar';

    final content = 'Veri sorumlusu sıfatına sahip Smile Hair Sağlık Hizmetleri ve Turizm Dan. Tic. Ltd. Şti. (Smile Hair Clinic) tarafından $regulation kapsamında hazırlanan; kişisel verilerimin işlenmesine yönelik haklarım ve işleme faaliyetleriyle ilgili ayrıntılı bilgilerin yer aldığı Smile Hair Clinic İletişim Formu Aydınlatma Metnini okuduğumu ve anladığımı, iletişim formları üzerinden bildirdiğim ve hizmet almak istediğimde işlenmesi için bildireceğim Kimlik (Ad Soyad) İletişim (Elektronik Posta, Telefon Numarası), Görsel ve İşitsel Veriler (Fotoğraf ve Sesli Video Kayıtları), Diğer (Uçuş-Bilet-Seyahat-Konaklama Bilgisi) verilerimin, aydınlatma metninde belirtilen amaçlar ve işleme faaliyetleriyle sınırlı olmak üzere Anayasal güvenceler, $framework kapsamında belirlenen ilke ve güvenceler çerçevesinde;\n\nSmile Hair Clinic tarafından sağlanan hizmetin ifası kapsamında sunucuları yurtdışında bulunan mesajlaşma ve sohbet uygulamalarının kullanılması ile yurt dışına aktarılabileceği konusunda bilgilendirildiğimi kabul ve beyan ederim.';

    return _buildSection(context, title, [_buildParagraph(context, content)]);
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.getBrandPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildParagraph(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        height: 1.6,
        color: AppTheme.getTextSecondaryColor(context),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getElevatedSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.getBorderColor(context)),
      ),
      child: Text(
        'Son Güncelleme: 3 Nisan 2025',
        style: TextStyle(
          fontSize: 12,
          color: AppTheme.getTextSecondaryColor(context),
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

