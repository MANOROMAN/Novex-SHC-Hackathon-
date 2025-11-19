import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class KvkkApplicationScreen extends StatelessWidget {
  const KvkkApplicationScreen({super.key});

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
          'KVKK Başvuru Formu',
          style: TextStyle(
            color: AppTheme.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildSection(context, 'I. Genel Bilgilendirme', _buildGeneralInfo(context)),
            const SizedBox(height: 24),
            _buildSection(context, 'II. Başvuru Hakkının İçeriği', _buildApplicationRights(context)),
            const SizedBox(height: 24),
            _buildSection(context, 'III. Başvuru Sahibi İletişim Bilgileri', _buildContactInfo(context)),
            const SizedBox(height: 24),
            _buildSection(context, 'VII. Başvurulara Cevap Verme Usulü ve Süresi', _buildResponseProcedure(context)),
            const SizedBox(height: 24),
            _buildSection(context, 'VIII. Başvuru Sahibinin KVK Kuruluna ve ilgili Veri Koruma Otoritesine Şikâyette Bulunma Hakkı', _buildComplaintRight(context)),
            const SizedBox(height: 24),
            _buildSection(context, 'IX. Başvuru Sahibinin Beyanı', _buildDeclaration(context)),
            const SizedBox(height: 24),
            _buildFooter(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
            'İçindekiler Tablosu',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 12),
          _buildTableOfContents(context),
        ],
      ),
    );
  }

  Widget _buildTableOfContents(BuildContext context) {
    final items = [
      'I. Genel Bilgilendirme',
      'II. Başvuru Hakkının İçeriği',
      'III. Başvuru Sahibi İletişim Bilgileri',
      'VII. Başvurulara Cevap Verme Usulü ve Süresi',
      'VIII. Başvuru Sahibinin KVK Kuruluna ve ilgili Veri Koruma Otoritesine Şikâyette Bulunma Hakkı',
      'IX. Başvuru Sahibinin Beyanı',
    ];

    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Icon(Icons.arrow_forward_ios, size: 12, color: AppTheme.getTextSecondaryColor(context)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.getTextSecondaryColor(context),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.getBrandPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }

  Widget _buildGeneralInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildParagraph(
          context,
          '6698 Sayılı Kişisel Verilerin Korunması Kanunu\'nda ("KVKK") ve Avrupa Genel Veri Koruma Tüzüğü ("GDPR") ilgili kişi olarak tanımlanan kişisel veri sahiplerine ("Başvuru Sahibi"), KVKK\'nın 11. maddesinde ve GDPR\'ın üçüncü kısmında yer alan madde 12 ve devamında kişisel verilerinin işlenmesine ilişkin birtakım taleplerde bulunma hakkı tanınmıştır.',
        ),
        const SizedBox(height: 16),
        _buildParagraph(
          context,
          'İşbu başvuru formu, Smile Hair Sağlık Hizmetleri ve Turizm Dan. Tic. Ltd. Şti ("Smile Hair Clinic") ile olan ilişkinizi tespit ederek, varsa, Smile Hair Clinic tarafından işlenen kişisel verilerinizi eksiksiz olarak belirlenmesi ve ilgili başvurunuzu etkin, hukuka ve dürüstlük kuralına uygun olarak sonuçlandırmak üzere gerekli her türlü idari ve teknik tedbirin alınması, başvuruya doğru ve kanuni süresinde cevap verilebilmesi için tanzim edilmiştir.',
        ),
        const SizedBox(height: 16),
        _buildParagraph(
          context,
          'Hukuka aykırı ve haksız bir şekilde veri paylaşımından kaynaklanabilecek hukuki risklerin bertaraf edilmesi ve özellikle kişisel verilerinizin güvenliğinin sağlanması amacıyla, kimlik ve yetki tespiti için ilave evrak ve malumat (nüfus cüzdanı veya sürücü belgesinin yalnızca zorunlu kısımlarının sureti vb.) talep etme hakkı saklı tutulmaktadır.',
        ),
        const SizedBox(height: 16),
        _buildParagraph(
          context,
          'Başvuru Formu kapsamında iletmekte olduğunuz taleplerinize ilişkin bilgilerin doğru ve güncel olmaması ya da KVKK ve GDPR\'a uygun olmayan bir başvuru yapılması halinde Smile Hair Clinic, söz konusu yanlış bilgi ya da uygunsuz başvuru kaynaklı taleplerden dolayı mesuliyet kabul etmemektedir.',
        ),
        const SizedBox(height: 16),
        _buildParagraph(
          context,
          'KVKK\'nın 13. maddesinin 1. Fıkrası, Tebliğ ve GDPR uyarınca; veri sorumlusu olan Smile Hair Clinic\'e bu haklara ilişkin yapılacak başvuruların Tebliğ uyarınca Türkçe, GDPR kapsamında ise İngilizce iletilmesi gerekmektedir.',
        ),
        const SizedBox(height: 16),
        _buildSubtitle(context, 'Başvuru Yöntemleri:'),
        const SizedBox(height: 8),
        _buildBulletPoint(context, 'Yazılı olarak'),
        _buildBulletPoint(context, 'Kayıtlı elektronik posta (KEP) adresi'),
        _buildBulletPoint(context, 'Güvenli elektronik imza'),
        _buildBulletPoint(context, 'Mobil imza'),
        _buildBulletPoint(context, 'Başvuru Sahibi tarafından veri sorumlusuna daha önce bildirilen ve veri sorumlusunun sisteminde kayıtlı bulunan elektronik posta adresini kullanmak suretiyle'),
        const SizedBox(height: 16),
        _buildTable(context),
      ],
    );
  }

  Widget _buildTable(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.getBorderColor(context)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        border: TableBorder.all(color: AppTheme.getBorderColor(context)),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
            ),
            children: [
              _buildTableCell(context, 'Başvuru Yöntemi', isHeader: true),
              _buildTableCell(context, 'Başvurunun Yapılacağı Adres', isHeader: true),
              _buildTableCell(context, 'Başvuru Gönderiminde Belirtilecek Bilgi', isHeader: true),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(context, 'Şahsen Başvuru'),
              _buildTableCell(context, 'Tatlısu Mahallesi Arif Ay Sokak No: 3B İç Kapı No: 2 Ümraniye/İstanbul'),
              _buildTableCell(context, 'Lütfen zarfın üzerine "Kişisel Verilerin Korunması Kanunu Kapsamında Bilgi Talebi" yazınız.'),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(context, 'Noter vasıtasıyla'),
              _buildTableCell(context, 'Tatlısu Mahallesi Arif Ay Sokak No: 3B İç Kapı No: 2 Ümraniye/İstanbul'),
              _buildTableCell(context, 'Lütfen tebligat zarfına "Kişisel Verilerin Korunması Kanunu Kapsamında Bilgi Talebi" yazınız.'),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(context, '"Güvenli elektronik imza" ile imzalanarak Kayıtlı Elektronik Posta (KEP) Yoluyla'),
              _buildTableCell(context, 'smilehair@hs01.kep.tr'),
              _buildTableCell(context, 'Lütfen e-posta\'nın konu kısmına "Kişisel Verilerin Korunması Kanunu Bilgi Talebi" yazınız.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(BuildContext context, String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isHeader ? 12 : 11,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? AppTheme.getBrandPrimaryColor(context) : AppTheme.getTextSecondaryColor(context),
        ),
      ),
    );
  }

  Widget _buildApplicationRights(BuildContext context) {
    return _buildParagraph(
      context,
      'KVKK\'nın 11. maddesi uyarınca, herkes KVKK ve diğer mevzuatın öngördüğü ve yukarıda bahsedilen yöntemlerle Smile Hair Clinic\'e başvurarak, KVKK\'nın 28. Maddesinde ve GDPR\'da gösterilen istisna haller dışında, V. maddede detaylı şekilde belirtilen taleplerde bulunma hakkına sahiptir.',
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildParagraph(
          context,
          'Başvuru sahibinin iletişim bilgileri ve Smile Hair Clinic ile olan ilişkisi hakkında detaylı bilgiler başvuru formunda yer almaktadır. Başvuru formunu doldururken aşağıdaki bilgileri sağlamanız gerekmektedir:',
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(context, 'Ad (*)'),
        _buildBulletPoint(context, 'Soyad (*)'),
        _buildBulletPoint(context, 'T.C. Kimlik / Pasaport No (*)'),
        _buildBulletPoint(context, 'Telefon Numarası'),
        _buildBulletPoint(context, 'E-posta'),
        _buildBulletPoint(context, 'Tebligata Esas Yerleşim Yeri veya İş Yeri Adresi (*)'),
        const SizedBox(height: 8),
        _buildParagraph(
          context,
          '(*: Doldurulması zorunlu alanlar.)',
          isSmall: true,
        ),
      ],
    );
  }

  Widget _buildResponseProcedure(BuildContext context) {
    return _buildParagraph(
      context,
      'KVKK ve GDPR\'a uygun olarak, Smile Hair Clinic, Başvuru Sahibi\'nin usulüne uygun yapmış olduğu başvuru taleplerini, talebin niteliğine göre en geç 30 (otuz) gün içinde ücretsiz olarak sonuçlandıracaktır. Ancak, işlemin ayrıca bir maliyeti gerektirmesi ve KVK Kurulunca ve ilgili Veri Koruma Otoritesince belirlenen koşulların sağlanması halinde tarifedeki ücreti veri sorumlusu talep edebilecektir. Smile Hair Clinic, başvuruyu kabul edebileceği gibi, gerekçesini açıklayarak aşağıda sayılı nedenlerle reddedebilir ve cevabını ilgili kişiye yazılı olarak veya elektronik ortamda bildirebilir.',
    );
  }

  Widget _buildComplaintRight(BuildContext context) {
    return _buildParagraph(
      context,
      'KVKK ve GDPR uyarınca, kişisel veri sahibi, başvurusunun reddedilmesi, verilen cevabı yetersiz bulması veya süresinde başvurusuna cevap verilmemesi hallerinde, veri sorumlusunun cevabını öğrendiği tarihten itibaren otuz ve her halde başvuru tarihinden itibaren altmış gün içinde KVK Kurulu\'na veya ilgili Veri Koruma Otoritesine şikâyette bulunabilir. Başvuru yolu tüketilmeden şikâyet yoluna başvurulamaz.',
    );
  }

  Widget _buildDeclaration(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildParagraph(
          context,
          'Yukarıda belirttiğim talepler doğrultusunda, yapmış olduğum başvurum esnasında tarafınıza sağlamış olduğum bilgi ve belgelerin doğru, güncel ve şahsıma ait olduğunu kabul, beyan ve taahhüt ederim.',
        ),
        const SizedBox(height: 16),
        _buildParagraph(
          context,
          'Başvuru Sahibinin;',
        ),
        const SizedBox(height: 8),
        _buildBulletPoint(context, 'Adı Soyadı (*)'),
        _buildBulletPoint(context, 'T.C. Kimlik / Pasaport No (*)'),
        _buildBulletPoint(context, 'Tebligata Esas Yerleşim Yeri veya İş Yeri Adresi (*)'),
        _buildBulletPoint(context, 'Başvuru Tarihi'),
        _buildBulletPoint(context, 'İmza (*)'),
        const SizedBox(height: 16),
        _buildParagraph(
          context,
          '(NOT: Metin içinde (*) işaretinin bulunduğu alanlar, KVKK-GDPR ve ilgili mevzuat çerçevesinde başvuruda bulunması ve metinde doldurulması zorunlu unsurlardır.)',
          isSmall: true,
        ),
      ],
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

  Widget _buildParagraph(BuildContext context, String text, {bool isSmall = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isSmall ? 12 : 14,
        height: 1.6,
        color: AppTheme.getTextSecondaryColor(context),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppTheme.getTextPrimaryColor(context),
      ),
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.getTextSecondaryColor(context))),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.getTextSecondaryColor(context),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

