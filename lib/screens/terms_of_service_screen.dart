import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanım Koşulları'),
        backgroundColor: AppTheme.getSurfaceColor(context),
        foregroundColor: AppTheme.getTextPrimaryColor(context),
        elevation: 0,
      ),
      backgroundColor: AppTheme.getBackgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _SectionTitle('1. Amaç ve Kapsam'),
              _SectionBody(
                'Bu uygulama; saç ve saç derisi analizi, randevu ve klinik hizmetlerine erişim sağlamak amacıyla sunulmaktadır. '
                'Uygulamayı kullanarak bu koşulları ve güncellemelerini kabul etmiş sayılırsınız.',
              ),
              _SectionTitle('2. Hesap Oluşturma ve Doğrulama'),
              _SectionBody(
                'Kayıt için doğru ve güncel bilgiler vermekle yükümlüsünüz. Güvenlik amacıyla e‑posta doğrulaması yapılabilir. '
                'Hesabınızın güvenliği size aittir; şifrenizi üçüncü kişilerle paylaşmayınız.',
              ),
              _SectionTitle('3. Kullanım Kuralları'),
              _SectionBody(
                'Uygulama şu amaçlarla kullanılamaz: (i) Yürürlükteki mevzuata aykırı faaliyetler, (ii) Başkalarının haklarını ihlal eden, '
                'yanıltıcı veya zararlı içerikler paylaşmak, (iii) Sistemlere veya verilere yetkisiz erişim girişimleri.',
              ),
              _SectionTitle('4. Sağlık Beyanı'),
              _SectionBody(
                'Uygulama, sağlık hizmeti sunumu için destekleyici bir araçtır; tek başına tıbbi teşhis yerine geçmez. '
                'Tüm değerlendirmeler, yetkili sağlık profesyonellerinin onayı ve yönlendirmesi ile anlam kazanır.',
              ),
              _SectionTitle('5. Ücretlendirme ve Hizmet Değişiklikleri'),
              _SectionBody(
                'Ücretli hizmetler ve kampanyalar ayrıca duyurulur. Uygulamanın özellikleri, kapsamı ve fiyatlandırması önceden bildirimle değiştirilebilir.',
              ),
              _SectionTitle('6. Fikri Mülkiyet Hakları'),
              _SectionBody(
                'Uygulama ve içeriği üzerindeki tüm fikri ve sınai mülkiyet hakları ilgili hak sahiplerine aittir. '
                'İçerikler, izinsiz kopyalanamaz, dağıtılamaz veya türev çalışmalar oluşturulamaz.',
              ),
              _SectionTitle('7. Veri Koruma ve Gizlilik'),
              _SectionBody(
                'Kişisel verileriniz; Aydınlatma Metni, Gizlilik Politikası ve ilgili mevzuat (KVKK, GDPR) kapsamında işlenir. '
                'Detaylar için Gizlilik Politikası’nı inceleyiniz.',
              ),
              _SectionTitle('8. Üçüncü Taraf Servisleri'),
              _SectionBody(
                'Uygulama; kimlik doğrulama, depolama veya analiz amaçlı üçüncü taraf servisler kullanabilir. '
                'Bu servislerin şart ve politikaları ayrıca geçerlidir.',
              ),
              _SectionTitle('9. Sorumluluk Sınırlaması'),
              _SectionBody(
                'Uygulama “olduğu gibi” sunulur. Doğrudan veya dolaylı zararlar dâhil olmak üzere, makul kontrolümüz dışındaki '
                'nedenlerle ortaya çıkan kayıplardan sorumlu değiliz.',
              ),
              _SectionTitle('10. Fesih'),
              _SectionBody(
                'Koşulların ihlali hâlinde hesabınız askıya alınabilir veya sonlandırılabilir. Mevzuat gereği verileriniz belirli sürelerde saklanabilir.',
              ),
              _SectionTitle('11. Değişiklikler ve Yürürlük'),
              _SectionBody(
                'Koşullar güncellenebilir. Güncel metin uygulama içinde veya resmî kanallar üzerinden yayınlandığı anda yürürlüğe girer.',
              ),
              _SectionTitle('12. İletişim'),
              _SectionBody(
                'Her türlü soru ve talep için uygulama içindeki iletişim kanallarını kullanabilirsiniz.',
              ),
              SizedBox(height: 24),
              _LastUpdated('Son Güncelleme: 24 Temmuz 2025'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppTheme.getTextPrimaryColor(context),
        ),
      ),
    );
  }
}

class _SectionBody extends StatelessWidget {
  final String text;
  const _SectionBody(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: AppTheme.getTextSecondaryColor(context),
      ),
    );
  }
}

class _LastUpdated extends StatelessWidget {
  final String text;
  const _LastUpdated(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: AppTheme.getTextSecondaryColor(context),
      ),
    );
  }
}


