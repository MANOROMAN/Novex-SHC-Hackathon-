import 'package:flutter/material.dart';
import 'hair_transplant_localized_content.dart';

class HairTransplantContent {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;
  final List<ContentSection> sections;
  final String? videoUrl;

  HairTransplantContent({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.sections,
    this.videoUrl,
  });

  // Get localized title based on current locale
  String getLocalizedTitle(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedContent(id, locale);
    return localizedContent['title'] as String? ?? title;
  }

  // Get localized subtitle based on current locale
  String getLocalizedSubtitle(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedContent(id, locale);
    return localizedContent['subtitle'] as String? ?? subtitle;
  }

  // Get localized sections based on current locale
  List<ContentSection> getLocalizedSections(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedContent(id, locale);
    final sectionsData = localizedContent['sections'];
    
    if (sectionsData != null && sectionsData is List) {
      return sectionsData.map((sectionData) {
        return ContentSection(
          title: sectionData['title'] as String? ?? '',
          content: sectionData['content'] as String? ?? '',
          isList: sectionData['isList'] as bool? ?? false,
        );
      }).toList();
    }
    
    return sections;
  }

  static Map<String, dynamic> _getLocalizedContent(String contentId, String locale) {
    return HairTransplantLocalizedContent.getContent(contentId, locale);
  }

  static List<HairTransplantContent> getAllContents() {
    return [
      // 1. Tıraşsız Saç Ekimi
      HairTransplantContent(
        id: 'tirassiz-sac-ekimi',
        title: 'Tıraşsız Saç Ekimi',
        subtitle: 'Senin ve Doktorun Arasında Bir Sır',
        imagePath: 'assets/images/Unshaven-Hair-Transplant-02.webp',
        videoUrl: 'https://www.youtube.com/watch?v=JTFKz6f1OYs',
        sections: [
          ContentSection(
            title: 'Tıraşsız Saç Ekimi: Senin ve Doktorun Arasında Bir Sır',
            content: 'Tıraşsız Saç Ekimi; Saç seyrelmesi ya da kaybı yaşayan birçok insan tıraşsız saç ekimi olabileceğini bilmedikleri için saç ekiminden vazgeçmiştir. Popülerliği gittikçe yaygınlaşan Tıraşsız saç ekimi bu yanlış anlaşılmayı yıkmış ve saç problemi yaşayan birçok insan için mutluluk kaynağı olmuştur.\n\nSaç traşı olmak birçoğumuz için büyük bir sorun haline gelebilir. Estetik kaygılar nedeniyle saçlarınızı traş ettirmek istememeniz ya da saç ekimi yaptırdığınızı ifşa etmemeniz tamamen anlaşılır bir durumdur.\n\nNeyse ki tıraşsız saç ekimi sayesinde hastalar mevcut saçlarını kaybetmeden başarılı bir tıraşsız FUE saç ekimi yaptırabilirler. Smile Hair, saçlarını kestirmek istemeyen ve saç ekimi operasyonunu açığa vurmak istemeyen hastalarımız için güvenli ve başarılı bir tıraşsız saç ekimi sağlıyor.',
          ),
          ContentSection(
            title: 'Herkes Tıraşsız Saç Ekimi Yaptırabilir mi?',
            content: 'Hem erkekler hem de kadınlar saç ekimi için uygundur. Birçok insanın operasyonu gizli tutmak ya da mevcut saçlarını traş etmemek için yaptırma eğiliminde olduğu tıraşsız saç ekimi giderek daha avantajlı hale gelmektedir.\n\nÖzellikle, mevcut saçlarını kaybetmek istemeyen kadınlar arasında tıraşsız saç ekimi popüler bir seçenektir.\n\nDiğer bir yandan tıraşsız saç ekimi ise herkese göre değildir. Şiddetli saç dökülmesi olan hastalar için tıraşsız saç ekimi operasyonu başarılı sonuçlar getirmeyebilir.',
          ),
          ContentSection(
            title: 'Tıraşsız Saç Ekim Operasyonu',
            content: 'Hem erkeklerin hem de kadınların tercihi olan tıraşsız saç ekimi, geleneksel FUE tekniğine oldukça benzemektedir. Tıraşsız saç ekimi ile geleneksel saç ekimi arasındaki tek fark, tıraşsız saç ekiminde hastaların saçlarını kesmek veya tıraş etmek zorunda kalmamasıdır.',
          ),
          ContentSection(
            title: 'Operasyon Sonrası Seçenekler',
            content: '1- Traşlı Donör Bölgesi, Tıraşsız Alıcı Bölgesi\n2- Sınırlı Traşlı Donör Alanı\n3- Tamamen Tıraşsız',
            isList: true,
          ),
          ContentSection(
            title: 'Tıraşsız Saç Ekimi Avantajları',
            content: '• Saçınızı tıraş etmenize gerek yoktur\n• Doğal görünümlü saçlara sahip olmanızı sağlar\n• Ciddi ve gözle görülebilir ameliyat izleri kalmaz\n• Sosyal hayatınızı kesintiye uğratmaz\n• İyileşme süreci kısa sürer',
            isList: true,
          ),
          ContentSection(
            title: 'Tıraşsız Saç Ekimi Dezavantajları',
            content: '• Başarısı doktorunuza bağlıdır\n• Normal FUE ekimine göre çok daha uzun sürer\n• İleri derecede saç dökülmesi yaşayan kişiler için uygun değildir\n• Bakteri üremesi riski olabilir',
            isList: true,
          ),
          ContentSection(
            title: 'İdeal Adaylar',
            content: 'Tıraşsız saç ekimi, özellikle saçlarını tıraş etmek istemeyenler için ideal bir seçenektir. Bu yöntem, iş yaşamında aktif olan ve saç ekimi sonrasında hemen günlük yaşantısına dönmek isteyen profesyoneller, kadınlar ve uzun saçlı erkekler için uygundur.',
          ),
          ContentSection(
            title: 'Kimler İçin Uygun Değildir?',
            content: 'Tıraşsız saç ekimi, geniş alanlarda saç kaybı yaşayan veya donör alanın yoğunluğu düşük olan kişiler için uygun olmayabilir. Çünkü, bu yöntem, genellikle daha küçük alanlara uygulanır ve donör alanın yeterli yoğunluğa sahip olması gereklidir.',
          ),
        ],
      ),
      
      // 2. İğnesiz Anestezi
      HairTransplantContent(
        id: 'ignesiz-anestezi',
        title: 'İğnesiz Anestezi',
        subtitle: 'FUE Saç Ekiminde Konforlu Deneyim',
        imagePath: 'assets/images/Needle-Free-Anesthesia-1.webp',
        sections: [
          ContentSection(
            title: 'FUE Saç Ekiminde İğnesiz Anestezi',
            content: 'İğnesiz anestezi, cerrahi operasyonlarda hastaların endişe duyduğu noktaların en başında anestezi esnasında ağrı ve acı hissetmekten yana duyulan korku gelir.\n\nFUE saç ekimi hakkında araştırma yapan hastalarımızın çoğu tarafından acı hissetme, toplamda kaç kez iğne yapılacağı konularındaki sorular bize sıkça sorulmaktadır. Safir saç ekimi belirli bir bölgenin ciltten verilen ilaçlarla uyuşturulması anlamına gelen lokal anestezi ile iğnesiz anestezi yapılır.',
          ),
          ContentSection(
            title: 'İğnesiz Anestezi Nasıl Çalışır?',
            content: 'Safir saç ekiminde iğnesiz anestezi, ileri teknoloji cihazlarla yapılır. Anestezik ilaçların, baş bölgesine yerleştirilen cihazın uyguladığı yüksek hava basıncı yoluyla cilde püskürtülmesiyle dokuya girişi sağlanır.\n\nDaha sonra ilaç difüzyon mantığı ile dokuya yayılır ve ağrıyı iletilen sinirlerin blokajı sağlanır.',
          ),
          ContentSection(
            title: 'İğnesiz Anestezi, Ağrısız Anestezi Değildir',
            content: 'Unutulmamalıdır ki FUE saç ekiminde lokal anestezi uygulamasında ağrı hissedilmesinin nedeni uygulanan teknikten çok ilacın kendisidir. Bu sebeple iğnesiz anestezi ağrıyı azaltsa dahi kesinlikle tamamen ağrısız değildir.\n\nYapılan bilimsel araştırmalarda iğnelerle uygulanan anestezi ve iğnesiz anestezi yapılan hastalar incelenmiş olup iki yöntem arasında herhangi bir fark tespit edilmemiştir.',
          ),
          ContentSection(
            title: 'Smile Hair ve İğnesiz Anestezi',
            content: 'FUE saç ekiminde, ne yazık ki lokal anestezi uygulanırken bir miktar ağrı hissedileceği bir gerçektir. Önemli olan standart bir şekilde değil de her hastaya uygulama yapılırken bireyin reaksiyonlarını ve ihtiyaçlarını göz önünde bulundurularak kişiye özel uygulamadır.\n\nSmile Hair Klinik\'te, uzman hekimlerimizle, son teknoloji cihazları kullanarak uyguladığımız tüm tedavilerde hastaların psikolojik durumunu göz önünde bulunduruyoruz.',
          ),
        ],
      ),
      
      // 3. Vücut Kılı Saç Ekimi
      HairTransplantContent(
        id: 'vucut-kili-sac-ekimi',
        title: 'Vücut Kılı Saç Ekimi',
        subtitle: 'Alternatif Donör Bölge Çözümü',
        imagePath: 'assets/images/Bodry-Hair-Transplant.webp',
        sections: [
          ContentSection(
            title: 'Vücut Kılı Saç Ekimi Nedir?',
            content: 'Vücut Kılı Saç Ekimi; Saç ekimi, greft olarak adlandırılan ve içinde saç kökleri bulunan yapıların başın arka bölgesinden alınması ve saç ekimi yapılacak bölgeye nakledilmesi yoluyla uygulanır.\n\nSaç kaybının yoğun olduğu bazı kişilerde başın arka bölümünde/donör alanda istenilen kadar greft alımı için yeterli saç yoğunluğu bulunmayabilir. Bu noktada Vücut Kılı saç ekimi yöntemi uygulanır; bu yöntem, naklin kişinin göğüs ya da sırt bölgesinden, sakalından alınan köklerle gerçekleştirilmesini içerir.',
          ),
          ContentSection(
            title: 'Vücut Kılı Saç Ekimi Nasıl Yapılır?',
            content: 'Vücut Kılı saç ekimi tekniği normal Fue saç ekimi ile aynıdır. Alım yapılacak bölgeye lokal anestezi uygulanır. Normal donör bölgeden yapılan alım işlemine göre süre daha kısadır.\n\nEkim işlemi sırasında vücuttan alınan greftlerin donör bölgeden Mikro Fue yöntemi ile alınmış greftlerin arasına dağıtılması önemlidir.',
          ),
          ContentSection(
            title: 'Vücut Kıllarının Özellikleri',
            content: 'Vücudumuzun çeşitli bölgelerinde çok çeşitli yapıda ve dokuda kıllar mevcuttur. Saça en yakın kıllar sakalda bulunur, genelde tekli kök yapısı barındırsalar da çok çabuk ve saç kadar çok uzayabilirler.\n\nBu sebeple vücut kılı saç ekiminde ilk tercih edilen sakaldan alınan kılların naklidir ve düzgün bir planlama ile başarılı sonuçlar alınabilir.',
          ),
          ContentSection(
            title: 'Vücut Kılı Saç Ekimi Kimlere Yapılır?',
            content: '• Başın arka bölümünün donör bölge olarak yetersiz kaldığı kişilerde\n• Vücudun başka bölgelerinden alınan kıllarla yeterli yoğunluğa ulaşılabileceği düşünülen durumlarda\n• Kılların yoğunluğu iyi ve dokusu saç dokusuna yakın olan kişilerde',
            isList: true,
          ),
          ContentSection(
            title: 'Smile Hair\'da Vücut Kılı Saç Ekimi',
            content: 'Smile Hair Klinik, hastaya gerçekçi sonuçlar vadeder. Hastalar greft sayıları ve alınacak sonuç konusunda yanıltılmaz. Saç ekimi operasyonundan önce hekimler tarafından saç ekimi planlaması yapılmaktadır.\n\nSmile Hair Clinic saç ekim cerrahları vücut kılı ekimine karar vermek için normal donör alandan alınan greft sayısını bekler ve tüm operasyona hastanın ihtiyacı olduğu şekilde yön verir.',
          ),
        ],
      ),
      
      // 4. Manuel FUE
      HairTransplantContent(
        id: 'manuel-fue',
        title: 'Manuel FUE Saç Ekimi',
        subtitle: 'Geleneksel ve Kontrollü Yöntem',
        imagePath: 'assets/images/Day-of-procedure-01.webp',
        sections: [
          ContentSection(
            title: 'Manuel FUE Saç Ekimi Nedir?',
            content: 'Manuel Fue Saç Ekimi, greftlerin tek tek çıkarılarak yapıldığı saç ekimlerinde uygulanan ilk tekniktir. Şu anda kullanılan tüm FUE saç ekimi tekniklerinin atası olarak adlandırılabilir.\n\nDonör bölgeden bir miktar cildin çıkartılarak yapıldığı ve donör bölgeyi yatay olarak boydan boya kesen bariz dikiş izi kalan FUT yöntemine alternatif olarak geliştirilmiştir.',
          ),
          ContentSection(
            title: 'Mikro FUE Saç Ekimi',
            content: 'Mikro FUE saç ekimi, özelleşmiş motorlar kullanılarak gerçekleştirilen tekniktir. Bu teknikte punchlar, mikro motora bağlı piyasemenin ucuna yerleştirilir. Dönme hızı ve yönü motor üzerinden ayarlanabilir.\n\nDünyada en sık kullanılan tekniktir, başka bir yöntem tercih etmediğiniz sürece FUE saç ekimi gerçekleştiren klinikler greftlerinizi bu teknikle nakledecektir.',
          ),
          ContentSection(
            title: 'Manuel FUE vs Mikro FUE',
            content: 'Manuel FUE:\n• Daha yavaş ve kontrollü\n• Alınan greftler daha az zarar görür\n• Donör bölgesinin daha az zarar görmesi\n• Daha az sayıda greft nakli\n\nMikro FUE:\n• Daha hızlı işlem\n• Tek seansta yüksek greft sayıları\n• Çok daha az maliyetli\n• Kolay bulunabilir',
            isList: true,
          ),
          ContentSection(
            title: 'En İyi Saç Ekimi',
            content: 'En iyi saç ekimi size özel yöntemin FUE saç ekimi cerrahınız tarafından seçilmesi, olası bütün sonuçların tarafınıza anlatılarak oluşabilecek hayal kırıklığınızın önüne geçilmesi ve bu yönde size özel detaylı planlamanın yapılmasıdır.\n\nFUE saç ekimi aynaya baktığınızda kendinizi mutlu hissetmeniz için yaptırdığınız bir işlemdir.',
          ),
          ContentSection(
            title: 'Smile Hair Klinikte Manuel Fue',
            content: 'Smile Hair Klinik cerrahları tercih etmeniz durumunda ve belirli bir sayıda greftin sizin ihtiyacınızı karşılayabileceğini düşündükleri durumda saç ekim işleminizi manuel FUE ile gerçekleştirebilirler.\n\nKliniğimizde saç ekimi yaptırmak isteyen her bir kişiye göre operasyon öncesi özel planlama yapılır.',
          ),
        ],
      ),
      
      // 5. DHI Saç Ekimi
      HairTransplantContent(
        id: 'dhi-sac-ekimi',
        title: 'DHI Saç Ekimi',
        subtitle: 'Doğrudan Saç İmplantasyonu',
        imagePath: 'assets/images/Dhi-Transplant.webp',
        videoUrl: 'https://www.youtube.com/watch?v=JTFKz6f1OYs',
        sections: [
          ContentSection(
            title: 'DHI Saç Ekimi Nedir?',
            content: 'DHI Saç Ekimi işlemi günümüzde saç ekimi operasyonu olmak isteyen potansiyel hastalar tarafından en çok araştırılan ve ilgi gören ekim yöntemlerinden bir tanesidir.\n\nDonör bölgesinden Mikro FUE saç ekimi yöntemi ile alınan greftler klasik mikro insizyon, kanal açılımı yapılmadan direkt olarak saç ekimi yapılacak bölgeye direkt olarak nakil edilebilmektedir.',
          ),
          ContentSection(
            title: 'DHI Saç Ekimi Nasıl Yapılır?',
            content: 'DHI Saç Ekimi Smile Hair Clinic\'te, follicular unit extraction=FUE tekniği ile alınan greftlerin özellikli bir kalem(implanter pen) kullanılarak ekim yapılmak istenilen alana transferi ile gerçekleştirilir.\n\nDhi saç ekiminde kanal açılmaz, greftin çinde bulunduğu kalemin ucunun cilde penetrasyonundan sonra greftin cildin içine kaydırılması ile ekim işlemi tamamlanmış olur.',
          ),
          ContentSection(
            title: 'DHI Saç Ekimi Operasyonu Kimlere Uygulanır?',
            content: 'DHI saç ekimi saç ektirmek isteyen herkese uygulanabilir. Traş olmadan ekim yaptırmak isteyen hastalar öncelikle Dhi tekniğini düşünebilir.\n\nDiğer teknikler ile yapılan saç ekimlerinde daha yüksek greft sayıları ile çalışılabilir; bu bakımdan hastanın ihtiyacı olacak greft sayısı Dhi düşünülen hastalarda göz önünde bulundurulmalı ve işlemi yapacak cerrah ile birlikte karar verilmelidir.',
          ),
          ContentSection(
            title: 'DHI da kullanılan kalemlerin özellikleri',
            content: 'DHI saç ekiminde kullanılan kalemlerin içi boştur ve bir yaylı mekanizmaya sahiptir. Bu yaylı mekanizma, gerildikten sonra basıldığında ucu iter ve cildi delerek grefti içine bırakır.\n\nBu kalemler ilk önce ince telli saçlar için geliştirilmiş olsa da daha sonra kalın telli saçlar için de özelleştirilmiş kalemler piyasaya sürülmüştür.',
          ),
          ContentSection(
            title: 'DHI Saç Ekiminin Artıları ve Eksileri',
            content: 'Artıları:\n• Daha az kanama olur\n• Traşsız ekim mümkün\n• Yara iyileşmesi birkaç gün daha erken\n• Saçlara açı ve yön vermek daha kolay\n\nEksileri:\n• 3000\'den fazla greft için diğer yöntemler daha başarılı\n• Özellikli materyaller kullanıldığı için daha maliyetli',
            isList: true,
          ),
          ContentSection(
            title: 'DHI mi daha iyi FUE mi?',
            content: 'Hangi yöntemin daha iyi olduğu, kişinin ihtiyaçlarına, saç dökülmesinin derecesine ve beklediği sonuçlara bağlıdır. Her iki yöntem de etkili sonuçlar sağlar, ancak farklı avantajlar sunar.\n\nEn iyi sonuçlar için, bir saç ekim uzmanına danışılması ve kişisel ihtiyaçlara uygun en uygun yöntemin seçilmesi önerilir.',
          ),
        ],
      ),
      
      // 6. Safir Saç Ekimi
      HairTransplantContent(
        id: 'safir-sac-ekimi',
        title: 'Safir Saç Ekimi',
        subtitle: 'En Gelişmiş FUE Tekniği',
        imagePath: 'assets/images/Sapphire-Hair-Transplant-1.webp',
        videoUrl: 'https://www.youtube.com/watch?v=z84pwEK-XH0',
        sections: [
          ContentSection(
            title: 'Safir Saç Ekimi Nedir?',
            content: 'Safir saç ekimi, kanallar açılırken son teknoloji safir bıçakların kullanıldığı fue saç ekimine verilen isimdir.',
          ),
          ContentSection(
            title: 'Safir Bıçak Nedir?',
            content: 'Yaygın kanının aksine safir bıçaklar doğada bulunan mavi renkli safir taşından üretilmez. Safir bıçaklar, sentetik safirden (Al2O3 = alüminyum oksitten üretilir) olan tek bir kristalden yapılır; bu madde normal çelikten yüzlerce kat daha serttir, bu sebeple keskinliklerini uzun süre muhafaza ederler.\n\nSafir kristaller özel makinalarda üretimin her aşaması kontrol edilerek kusursuz bıçaklar haline getirilir.',
          ),
          ContentSection(
            title: 'Safir Saç Ekimi Nasıl Uygulanır?',
            content: 'Safir saç ekiminde transfer edilecek saçlar öncelikle mikro fue yöntemi ile kişinin donör bölgesinden mikromotor kullanılarak alınır.\n\nMikromotorların kullanımı, manuel punch kullanılarak yapılan alıma göre donör alandan daha fazla sayıda greftin daha kısa sürede alınmasına imkan tanıyarak safir saç ekimi sonuçlarının daha sık ve daha doğal olmasını mümkün kılar.',
          ),
          ContentSection(
            title: 'Safir Saç Ekimi Avantajları',
            content: '• Safir bıçakların yüzeyi sert ve pürüzsüzdür\n• Doku zedelenmesi daha azdır\n• Hızlı iyileşme sağlar\n• Daha sık insizyon yapma olanağı verir\n• Doğal sonuç alınmasını sağlar\n• Metal alerjisi riski yoktur\n• Enfeksiyon riski azalır',
            isList: true,
          ),
          ContentSection(
            title: 'Safir Saç Ekimi Öncesi Neler Yapılmalıdır?',
            content: 'Varsa en ufak bir sağlık sorunu ya da kullanılan ilaçlar belirtilmelidir. Doktorun önerisi dahilinde kişiye göre sigara ve alkol alımını bir hafta öncesinden bırakması gerekebilir.\n\nKan sulandırıcı kullanılıyorsa bir hafta öncesinde bırakılması gerekir. Minoxidil kullanıyorsanız bir hafta öncesinden bırakılmalıdır.',
          ),
          ContentSection(
            title: 'Safir Saç Ekimi Sonrası Neler Yapılmalıdır?',
            content: 'Her ne kadar bahsedilmesi gereksiz gibi gelse de hastaların 10 gün boyunca kafalarını çarpmaktan veya bir yüzeye sürtmekten kaçınmaları gerekmektedir.\n\n15 gün boyunca aşırı terlemeyi önlemek gerekir. Kliniğimiz safir fue saç ekimi sonrası bir ay boyunca ağır kardiyak egzersizlerin, sauna ve hamam gibi ıslak alanların kullanımının ve yüzme aktivitelerinin kısıtlanmasını önermektedir.',
          ),
          ContentSection(
            title: 'Safir Saç Ekimi Neden Önemlidir?',
            content: 'Safir saç ekimi kullanılan bıçakların son teknoloji olup, daha sık, daha sabit insizyonlar (kanallar) yapılmasına olanak verir. Bu sebeple safir saç ekimi ile alınabilecek sonuç diğer tüm faktörler aynı olduğunda hasta için olabilecek en iyi sonuçtur.\n\nİyileşme sürecinin hızlı olması, ödemin az olması, iyileşme döneminde ağrı ve acının az olması hasta konforuna inanılmaz katkılar sağlar.',
          ),
          ContentSection(
            title: '4000 Greft Kaç TL?',
            content: 'Fiyatlandırma, her müşterinin ihtiyaçlarına ve seçtiği pakete bağlı olarak değişir. Smile Hair Clinic, her müşteriye özel bir yaklaşım benimser ve saç ekimi sürecini herkes için olabildiğince kolay ve konforlu hale getirir.\n\nDetaylı bir değerlendirme ve kişiselleştirilmiş bir tedavi planı için Smile Hair Clinic ile iletişime geçin.',
          ),
        ],
      ),
    ];
  }

  static HairTransplantContent? getContentById(String id) {
    try {
      return getAllContents().firstWhere((content) => content.id == id);
    } catch (e) {
      return null;
    }
  }
}

class ContentSection {
  final String title;
  final String content;
  final bool isList;

  ContentSection({
    required this.title,
    required this.content,
    this.isList = false,
  });
}



