import 'package:flutter/material.dart';
import 'doctor_localized_content.dart';

class Doctor {
  final String id;
  final String name;
  final String title;
  final String specialization;
  final String imagePath;
  final String biography;
  final Map<String, String> interview;
  final List<String> expertise;
  final int experienceYears;
  final int completedSurgeries;
  final bool canMessage;
  final String? email; // Doktor giriş email'i

  Doctor({
    required this.id,
    required this.name,
    required this.title,
    required this.specialization,
    required this.imagePath,
    required this.biography,
    required this.interview,
    required this.expertise,
    required this.experienceYears,
    required this.completedSurgeries,
    this.canMessage = false,
    this.email,
  });

  // Get localized biography based on current locale
  String getLocalizedBiography(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedDoctorContent(id, locale);
    return localizedContent['biography'] ?? biography;
  }

  // Get localized interview based on current locale
  Map<String, String> getLocalizedInterview(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedDoctorContent(id, locale);
    final interviewData = localizedContent['interview'];
    if (interviewData is Map<String, String>) {
      return interviewData;
    } else if (interviewData is Map) {
      return interviewData.map((key, value) => MapEntry(key.toString(), value.toString()));
    }
    return interview;
  }

  // Get localized expertise based on current locale
  List<String> getLocalizedExpertise(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedDoctorContent(id, locale);
    return localizedContent['expertise'] as List<String>? ?? expertise;
  }

  // Get localized title based on current locale
  String getLocalizedTitle(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedDoctorContent(id, locale);
    return localizedContent['title'] as String? ?? title;
  }

  // Get localized specialization based on current locale
  String getLocalizedSpecialization(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final localizedContent = _getLocalizedDoctorContent(id, locale);
    return localizedContent['specialization'] as String? ?? specialization;
  }

  static Map<String, dynamic> _getLocalizedDoctorContent(String doctorId, String locale) {
    // Get content from centralized localized content class
    return DoctorLocalizedContent.getContent(doctorId, locale);
  }
  
  static Map<String, dynamic> _getLocalizedDoctorContentOld(String doctorId, String locale) {
    // All doctors content in TR and EN
    final Map<String, Map<String, Map<String, dynamic>>> allDoctorsContent = {
      'dr_gokay_bilgin': {
        'tr': {
          'biography': 'Dr. Gökay Bilgin, Smile Hair Clinic\'in kurucu ortağıdır. Kariyerinin ilk yıllarına Medical Park Sağlık Grubu\'nda başladı. Medicana Sağlık Grubunda Başhekim Yardımcılığına atandı ve Smile Hair Clinic\'in kurucu ortağı oldu. 4000\'den fazla saç ekimi işlemini tamamladı.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Medikal Estetik Hekimi',
          'expertise': ['Mikromotor Greft Ekstraksiyonu', 'Safir FUE Saç Ekimi', 'TrueTM Philosophy'],
          'interview': {
            'Temel değerleriniz nelerdir?': 'Hem iş hayatımda hem de özel hayatımda öğrenme kültürüne önem veririm. İş yerinde ilerlemek, gelişmek ve asla durmamak benim için çok önemli.',
            'Klinikte çalışma tarzınız nasıldır?': 'Yaptığınız işten keyif alırsanız başarılı ve tatmin olacağınıza inanıyorum. Tüm dönüşüm sürecini, bir erkeğin nasıl True Gentlemen\'a dönüştüğünü gözlemlemekten keyif alıyorum.',
            'Burcunuz Nedir?': 'Kova',
            'Favori Parfümünüz Hangisidir?': 'Louis Vuitton – Au Hasard. Ahşap karakteri dünyaya bağlı olduğumu hissettiriyor.',
            'Başucu kitabınız nedir?': 'Yüzüklerin Efendisi Serisi. Fantastik evreninde kaybolmayı seviyorum.',
            'İlham verici şehirler': 'Berlin, Paris ve Amsterdam. Batı Avrupa kültürünün gerçek bir hayranıyım.',
          },
        },
        'en': {
          'biography': 'Dr. Gökay Bilgin is a co-founder of Smile Hair Clinic. He started his career at Medical Park Health Group. He was appointed as Assistant Chief Physician at Medicana Health Group and became a co-founder of Smile Hair Clinic. He has completed over 4000 hair transplant procedures.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Medical Aesthetic Physician',
          'expertise': ['Micromotor Graft Extraction', 'Sapphire FUE Hair Transplant', 'TrueTM Philosophy'],
          'interview': {
            'What are your core values?': 'I value learning culture both in my professional and personal life. Progressing, developing and never stopping at work is very important to me.',
            'How do you work at the clinic?': 'I believe that if you enjoy what you do, you will be successful and satisfied. I enjoy observing the entire transformation process, how a man transforms into a True Gentleman.',
            'What is your zodiac sign?': 'Aquarius',
            'What is your favorite perfume?': 'Louis Vuitton – Au Hasard. The woody character makes me feel connected to the world.',
            'What is your bedside book?': 'The Lord of the Rings Series. I love getting lost in the fantasy universe.',
            'Inspiring cities': 'Berlin, Paris and Amsterdam. I am a true fan of Western European culture.',
          },
        },
      },
      'dr_mehmet_erdogan': {
        'tr': {
          'biography': 'Dr. Mehmet Erdoğan, Smile Hair Clinic\'in kurucu ortağıdır. Acıbadem Sağlık Grubu\'nda tıp doktoru olarak kariyerine başladı. Medicana Sağlık Grubunda Başhekim Yardımcısı ve Uluslararası Hasta Merkezi Direktörü olarak görev yaptı. 4000\'den fazla operasyon gerçekleştirdi.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Medikal Estetik Hekimi',
          'expertise': ['Micromotor Greft', 'Sapphire FUE', 'Donör Bölge Planlaması', 'Saç Çizgisi Tasarımı'],
          'interview': {
            'Temel değerleriniz nelerdir?': 'Hayatın hemen her alanında estetiğe ve mükemmelliğe değer veririm. Sanatsal yaratıcılığımızı yönlendirdiğine inanıyorum.',
            'Klinikte çalışma tarzınız nasıldır?': 'Her gün yaptığım işten zevk alıyorum, bu benim tutkum. Tekniklerimizi geliştirmek ve yenilikleri tanıtmak için elimden gelenin en iyisini yapıyorum.',
            'Burcunuz Nedir?': 'Yengeç',
            'Favori Parfümünüz Hangisidir?': 'Aventus of Creed. Sofistike bir karışım ve iyi yaşanmış bir hayatın tadını ifade ediyor.',
            'Başucu kitabınız nedir?': 'Temel, Marcus Aurelius.',
            'İlham verici şehirler': 'Havana (Küba), Siam Reap (Kamboçya), Hanoi (Vietnam). El değmemiş kültürler benim için daha büyüleyici.',
          },
        },
        'en': {
          'biography': 'Dr. Mehmet Erdoğan is a co-founder of Smile Hair Clinic. He started his career as a medical doctor at Acıbadem Health Group. He served as Assistant Chief Physician and International Patient Center Director at Medicana Health Group. He has performed over 4000 operations.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Medical Aesthetic Physician',
          'expertise': ['Micromotor Graft', 'Sapphire FUE', 'Donor Area Planning', 'Hairline Design'],
          'interview': {
            'What are your core values?': 'I value aesthetics and excellence in almost every aspect of life. I believe it guides our artistic creativity.',
            'How do you work at the clinic?': 'I enjoy what I do every day, this is my passion. I do my best to improve our techniques and introduce innovations.',
            'What is your zodiac sign?': 'Cancer',
            'What is your favorite perfume?': 'Aventus of Creed. A sophisticated blend that expresses the taste of a well-lived life.',
            'What is your bedside book?': 'Meditations, Marcus Aurelius.',
            'Inspiring cities': 'Havana (Cuba), Siem Reap (Cambodia), Hanoi (Vietnam). Untouched cultures are more fascinating to me.',
          },
        },
      },
      'dr_firdavs_ahmedov': {
        'tr': {
          'biography': 'Dr. Firdavs Ahmedov, Smile Hair Clinic\'te Saç Ekimi Cerrahıdır. Ege Üniversitesi\'nden onur derecesi ile mezun oldu. Mount Sinai Hastanesi ve New York\'taki Askeri Hastanede eğitim aldı. 3500\'den fazla saç ekimi işlemini tamamladı.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Medikal Estetik Hekimi',
          'expertise': ['FUE', 'DHI', 'Revizyon Saç Ekimi', 'Safir Bıçaklar', 'Manuel ve Mikromotor'],
          'interview': {
            'Temel değerleriniz nelerdir?': 'Aidiyet duygusu yüksek bir ekiple çalışmaya ve aynı amaç için birlikte ilerlemeye değer veririm.',
            'Klinikte çalışma tarzınız nasıldır?': 'Bilgiye dayalı, farkındalığı yüksek, sürekli gelişimin sorumluluğunu üstlenen, dürüst profesyoneller ile çalışmak başarımızın temelidir.',
            'Burcunuz Nedir?': 'Aslan',
            'Favori Parfümünüz Hangisidir?': 'Dior Sauvage. Bu parfüm yüzleşmenin kokusudur. Her yeni gün içinizdeki vahşiyle uyanır ve onu bir beyefendiye dönüştürmeye çalışırsınız.',
            'Başucu kitabınız nedir?': 'Köpek Kalbi, Mihail Bulgakov. Hayat değiştiren operasyonlar yaptığımızı düşünürsek beni çok etkiliyor.',
            'İlham verici şehirler': 'New York, Boston, Seattle, İstanbul, Hong Kong ve Moskova. Ben gerçek bir dünya vatandaşıyım.',
          },
        },
        'en': {
          'biography': 'Dr. Firdavs Ahmedov is a Hair Transplant Surgeon at Smile Hair Clinic. He graduated with honors from Ege University. He received training at Mount Sinai Hospital and the Military Hospital in New York. He has completed over 3500 hair transplant procedures.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Medical Aesthetic Physician',
          'expertise': ['FUE', 'DHI', 'Revision Hair Transplant', 'Sapphire Blades', 'Manual and Micromotor'],
          'interview': {
            'What are your core values?': 'I value working with a team with a strong sense of belonging and moving forward together for the same purpose.',
            'How do you work at the clinic?': 'Working with knowledgeable, highly aware, honest professionals who take responsibility for continuous development is the foundation of our success.',
            'What is your zodiac sign?': 'Leo',
            'What is your favorite perfume?': 'Dior Sauvage. This perfume is the scent of confrontation. Every new day you wake up with the wild inside you and try to turn it into a gentleman.',
            'What is your bedside book?': 'Heart of a Dog, Mikhail Bulgakov. Considering that we perform life-changing operations, it affects me deeply.',
            'Inspiring cities': 'New York, Boston, Seattle, Istanbul, Hong Kong and Moscow. I am a true citizen of the world.',
          },
        },
      },
      'dr_ali_osman_soluk': {
        'tr': {
          'biography': 'Dr. Ali Osman Soluk, İstanbul Tıp Fakültesi\'nden mezun oldu. İstanbul Büyükşehir Belediyesi\'nde üst düzey yönetici olarak görev yaptı. Hastane ve Sağlık Kurumları Yönetimi alanında yüksek lisans yaptı. Ozon tedavisi konusunda eğitim aldı.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Medikal Estetik Hekimi',
          'expertise': ['Saç Ekimi', 'Saç Tedavileri', 'Ozon Tedavisi', 'Medikal Estetik'],
          'interview': {
            'Temel değerleriniz nelerdir?': 'Yaptığım işte en iyi olmaya çalışmak. İşim ile ilgili güncel bilgilere sahip olmak için araştırmak.',
            'Klinikte çalışma tarzınız nasıldır?': 'Mükemmeli yakalamaya çalışmak. Hasta memnuniyetini ilk hedef olarak koymak.',
            'Burcunuz Nedir?': 'Aslan',
            'Favori Parfümünüz Hangisidir?': 'Kirke. Kokunun kalıcılığı ve notaları çok etkileyici.',
            'Başucu kitabınız nedir?': 'Da Vinci Şifresi. Tarihi yer tasvirleri ve anlatım stili çok başarılı. Yüzüklerin Efendisi ve Sherlock Holmes da sevdiğim kitaplardır.',
            'İlham verici şehirler': 'Barcelona ve Dubai. Birinin geçmiş ve günümüzü birleştirmesi, diğerinin çölden bir cazibe merkezi haline dönüşmesi beni etkiliyor.',
          },
        },
        'en': {
          'biography': 'Dr. Ali Osman Soluk graduated from Istanbul Medical Faculty. He served as a senior executive at Istanbul Metropolitan Municipality. He has a master\'s degree in Hospital and Health Institutions Management. He received training in ozone therapy.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Medical Aesthetic Physician',
          'expertise': ['Hair Transplant', 'Hair Treatments', 'Ozone Therapy', 'Medical Aesthetics'],
          'interview': {
            'What are your core values?': 'Trying to be the best at what I do. Researching to stay current with information related to my work.',
            'How do you work at the clinic?': 'Trying to achieve perfection. Making patient satisfaction the primary goal.',
            'What is your zodiac sign?': 'Leo',
            'What is your favorite perfume?': 'Circe. The persistence and notes of the scent are very impressive.',
            'What is your bedside book?': 'The Da Vinci Code. The historical place descriptions and narrative style are very successful. The Lord of the Rings and Sherlock Holmes are also books I love.',
            'Inspiring cities': 'Barcelona and Dubai. One combining the past and present, the other transforming from a desert into a center of attraction affects me.',
          },
        },
      },
      'dr_resat_arpaci': {
        'tr': {
          'biography': 'Dr. M. Reşat Arpacı, 2000 yılında Dokuz Eylül Üniversitesi\'nden mezun oldu. Milano Saç Ekimi Enstitüsü\'nden Biofibre Sertifikası aldı. 2007\'de gelişmiş FUE mikromotor tekniğini icat etti ve patentini aldı. 2010\'dan beri İstanbul\'da üst düzey kurumlarda görev yapıyor.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Medikal Estetik Hekimi',
          'expertise': ['FUE Mikromotor', 'Biofibre Sentetik Saç Ekimi', 'Saç Restorasyonu'],
          'interview': {
            'Temel değerleriniz nelerdir?': 'Temel prensibim adil olmaktır. Adaletin yaşamın temel felsefesi olduğunu düşünüyorum.',
            'Klinikte çalışma tarzınız nasıldır?': 'Ekibimdeki kişileri dinleyip onların fikirlerini değerlendirir, son kararı kendim vermeyi tercih ederim.',
            'Burcunuz Nedir?': 'Oğlak',
            'Favori Parfümünüz Hangisidir?': 'Sauvage. Kokusunu seviyorum.',
            'Başucu kitabınız nedir?': 'Homo Deus. İnsanın evriminin sonunda ortaya çıkan yarı tanrının yüksek egosu beni dehşete düşürüp hayran bırakmıştı.',
            'İlham verici şehirler': 'Barcelona, yaşanabilecek en güzel şehir. İstanbul ise tarihi dokusu ve kültürel çeşitliliğiyle yaşamayı sevdiğim şehir.',
          },
        },
        'en': {
          'biography': 'Dr. M. Reşat Arpacı graduated from Dokuz Eylül University in 2000. He received Biofibre Certification from the Milan Hair Transplant Institute. In 2007, he invented and patented the advanced FUE micromotor technique. He has been working at top institutions in Istanbul since 2010.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Medical Aesthetic Physician',
          'expertise': ['FUE Micromotor', 'Biofibre Synthetic Hair Transplant', 'Hair Restoration'],
          'interview': {
            'What are your core values?': 'My fundamental principle is to be fair. I think justice is the fundamental philosophy of life.',
            'How do you work at the clinic?': 'I listen to the people in my team, evaluate their ideas, and prefer to make the final decision myself.',
            'What is your zodiac sign?': 'Capricorn',
            'What is your favorite perfume?': 'Sauvage. I love its scent.',
            'What is your bedside book?': 'Homo Deus. The high ego of the demigod that emerged at the end of human evolution both terrified and amazed me.',
            'Inspiring cities': 'Barcelona, the most beautiful city to live in. Istanbul is the city I love to live in with its historical texture and cultural diversity.',
          },
        },
      },
      'dr_tarik_sarici': {
        'tr': {
          'biography': 'Dr. Tarık Sarıcı, saç ekimi ve saç restorasyonu alanında uzmanlaşmıştır.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Saç Ekimi ve Restorasyonu',
          'expertise': ['FUE', 'Sapphire FUE', 'Saç Çizgisi Tasarımı'],
          'interview': {
            'Motivasyonunuz nedir?': 'Hastalarımın özgüven kazanmasına katkı sağlamak.',
          },
        },
        'en': {
          'biography': 'Dr. Tarık Sarıcı specializes in hair transplant and hair restoration.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Hair Transplant and Restoration',
          'expertise': ['FUE', 'Sapphire FUE', 'Hairline Design'],
          'interview': {
            'What is your motivation?': 'To contribute to my patients gaining self-confidence.',
          },
        },
      },
      'dr_atalare': {
        'tr': {
          'biography': 'Dr. Erhan Atalar, Smile Hair Clinic ekibine katılan yeni hekimlerimizden biridir. Saç sağlığı ve modern FUE tekniklerinde deneyimlidir.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Saç Ekimi ve Saç Sağlığı',
          'expertise': ['FUE', 'DHI', 'Saç Sağlığı Danışmanlığı'],
          'interview': {
            'Motivasyonunuz nedir?': 'Hastaların doğal görünümlerini yeniden kazanmalarına yardımcı olmak.',
          },
        },
        'en': {
          'biography': 'Dr. Erhan Atalar is one of our new doctors who joined the Smile Hair Clinic team. He is experienced in hair health and modern FUE techniques.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Hair Transplant and Hair Health',
          'expertise': ['FUE', 'DHI', 'Hair Health Consulting'],
          'interview': {
            'What is your motivation?': 'To help patients regain their natural appearance.',
          },
        },
      },
      'dr_yusuf_gunel': {
        'tr': {
          'biography': 'Dr. Yusuf Günel, saç ekimi ve revizyon operasyonlarında deneyimlidir.',
          'title': 'Saç Ekimi Cerrahı, M.D.',
          'specialization': 'Saç Ekimi ve Revizyon Operasyonları',
          'expertise': ['DHI', 'FUE', 'Revizyon Saç Ekimi'],
          'interview': {
            'Motivasyonunuz nedir?': 'Doğal ve kalıcı sonuçlar elde etmek.',
          },
        },
        'en': {
          'biography': 'Dr. Yusuf Günel is experienced in hair transplant and revision operations.',
          'title': 'Hair Transplant Surgeon, M.D.',
          'specialization': 'Hair Transplant and Revision Operations',
          'expertise': ['DHI', 'FUE', 'Revision Hair Transplant'],
          'interview': {
            'What is your motivation?': 'To achieve natural and permanent results.',
          },
        },
      },
    };
    
    return allDoctorsContent[doctorId]?[locale] ?? allDoctorsContent[doctorId]?['tr'] ?? {};
  }

  static List<Doctor> getAllDoctors() {
    return [
      Doctor(
        id: 'dr_gokay_bilgin',
        name: 'Dr. Gökay Bilgin',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Medikal Estetik Hekimi',
        imagePath: 'assets/images/DR.-GOKAY-BILGIN.webp',
        biography: 'Dr. Gökay Bilgin, Smile Hair Clinic\'in kurucu ortağıdır. Kariyerinin ilk yıllarına Medical Park Sağlık Grubu\'nda başladı. Medicana Sağlık Grubunda Başhekim Yardımcılığına atandı ve Smile Hair Clinic\'in kurucu ortağı oldu. 4000\'den fazla saç ekimi işlemini tamamladı.',
        interview: {
          'Temel değerleriniz nelerdir?': 'Hem iş hayatımda hem de özel hayatımda öğrenme kültürüne önem veririm. İş yerinde ilerlemek, gelişmek ve asla durmamak benim için çok önemli.',
          'Klinikte çalışma tarzınız nasıldır?': 'Yaptığınız işten keyif alırsanız başarılı ve tatmin olacağınıza inanıyorum. Tüm dönüşüm sürecini, bir erkeğin nasıl True Gentlemen\'a dönüştüğünü gözlemlemekten keyif alıyorum.',
          'Burcunuz Nedir?': 'Kova',
          'Favori Parfümünüz Hangisidir?': 'Louis Vuitton – Au Hasard. Ahşap karakteri dünyaya bağlı olduğumu hissettiriyor.',
          'Başucu kitabınız nedir?': 'Yüzüklerin Efendisi Serisi. Fantastik evreninde kaybolmayı seviyorum.',
          'İlham verici şehirler': 'Berlin, Paris ve Amsterdam. Batı Avrupa kültürünün gerçek bir hayranıyım.',
        },
        expertise: ['Mikromotor Greft Ekstraksiyonu', 'Safir FUE Saç Ekimi', 'TrueTM Philosophy'],
        experienceYears: 15,
        completedSurgeries: 4000,
      ),
      Doctor(
        id: 'dr_mehmet_erdogan',
        name: 'Dr. Mehmet Erdoğan',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Medikal Estetik Hekimi',
        imagePath: 'assets/images/DR.-MEHMET-ERDOGAN.webp',
        biography: 'Dr. Mehmet Erdoğan, Smile Hair Clinic\'in kurucu ortağıdır. Acıbadem Sağlık Grubu\'nda tıp doktoru olarak kariyerine başladı. Medicana Sağlık Grubunda Başhekim Yardımcısı ve Uluslararası Hasta Merkezi Direktörü olarak görev yaptı. 4000\'den fazla operasyon gerçekleştirdi.',
        interview: {
          'Temel değerleriniz nelerdir?': 'Hayatın hemen her alanında estetiğe ve mükemmelliğe değer veririm. Sanatsal yaratıcılığımızı yönlendirdiğine inanıyorum.',
          'Klinikte çalışma tarzınız nasıldır?': 'Her gün yaptığım işten zevk alıyorum, bu benim tutkum. Tekniklerimizi geliştirmek ve yenilikleri tanıtmak için elimden gelenin en iyisini yapıyorum.',
          'Burcunuz Nedir?': 'Yengeç',
          'Favori Parfümünüz Hangisidir?': 'Aventus of Creed. Sofistike bir karışım ve iyi yaşanmış bir hayatın tadını ifade ediyor.',
          'Başucu kitabınız nedir?': 'Temel, Marcus Aurelius.',
          'İlham verici şehirler': 'Havana (Küba), Siam Reap (Kamboçya), Hanoi (Vietnam). El değmemiş kültürler benim için daha büyüleyici.',
        },
        expertise: ['Micromotor Greft', 'Sapphire FUE', 'Donör Bölge Planlaması', 'Saç Çizgisi Tasarımı'],
        experienceYears: 12,
        completedSurgeries: 4000,
      ),
      Doctor(
        id: 'dr_firdavs_ahmedov',
        name: 'Dr. Firdavs Ahmedov',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Medikal Estetik Hekimi',
        imagePath: 'assets/images/DR.-FIRDAVS-AHMEDOV.webp',
        biography: 'Dr. Firdavs Ahmedov, Smile Hair Clinic\'te Saç Ekimi Cerrahıdır. Ege Üniversitesi\'nden onur derecesi ile mezun oldu. Mount Sinai Hastanesi ve New York\'taki Askeri Hastanede eğitim aldı. 3500\'den fazla saç ekimi işlemini tamamladı.',
        interview: {
          'Temel değerleriniz nelerdir?': 'Aidiyet duygusu yüksek bir ekiple çalışmaya ve aynı amaç için birlikte ilerlemeye değer veririm.',
          'Klinikte çalışma tarzınız nasıldır?': 'Bilgiye dayalı, farkındalığı yüksek, sürekli gelişimin sorumluluğunu üstlenen, dürüst profesyoneller ile çalışmak başarımızın temelidir.',
          'Burcunuz Nedir?': 'Aslan',
          'Favori Parfümünüz Hangisidir?': 'Dior Sauvage. Bu parfüm yüzleşmenin kokusudur. Her yeni gün içinizdeki vahşiyle uyanır ve onu bir beyefendiye dönüştürmeye çalışırsınız.',
          'Başucu kitabınız nedir?': 'Köpek Kalbi, Mihail Bulgakov. Hayat değiştiren operasyonlar yaptığımızı düşünürsek beni çok etkiliyor.',
          'İlham verici şehirler': 'New York, Boston, Seattle, İstanbul, Hong Kong ve Moskova. Ben gerçek bir dünya vatandaşıyım.',
        },
        expertise: ['FUE', 'DHI', 'Revizyon Saç Ekimi', 'Safir Bıçaklar', 'Manuel ve Mikromotor'],
        experienceYears: 10,
        completedSurgeries: 3500,
      ),
      Doctor(
        id: 'dr_ali_osman_soluk',
        name: 'Dr. Ali Osman Soluk',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Medikal Estetik Hekimi',
        imagePath: 'assets/images/DR.-ALI-OSMAN-SOLUK.webp',
        biography: 'Dr. Ali Osman Soluk, İstanbul Tıp Fakültesi\'nden mezun oldu. İstanbul Büyükşehir Belediyesi\'nde üst düzey yönetici olarak görev yaptı. Hastane ve Sağlık Kurumları Yönetimi alanında yüksek lisans yaptı. Ozon tedavisi konusunda eğitim aldı.',
        interview: {
          'Temel değerleriniz nelerdir?': 'Yaptığım işte en iyi olmaya çalışmak. İşim ile ilgili güncel bilgilere sahip olmak için araştırmak.',
          'Klinikte çalışma tarzınız nasıldır?': 'Mükemmeli yakalamaya çalışmak. Hasta memnuniyetini ilk hedef olarak koymak.',
          'Burcunuz Nedir?': 'Aslan',
          'Favori Parfümünüz Hangisidir?': 'Kirke. Kokunun kalıcılığı ve notaları çok etkileyici.',
          'Başucu kitabınız nedir?': 'Da Vinci Şifresi. Tarihi yer tasvirleri ve anlatım stili çok başarılı. Yüzüklerin Efendisi ve Sherlock Holmes da sevdiğim kitaplardır.',
          'İlham verici şehirler': 'Barcelona ve Dubai. Birinin geçmiş ve günümüzü birleştirmesi, diğerinin çölden bir cazibe merkezi haline dönüşmesi beni etkiliyor.',
        },
        expertise: ['Saç Ekimi', 'Saç Tedavileri', 'Ozon Tedavisi', 'Medikal Estetik'],
        experienceYears: 8,
        completedSurgeries: 2500,
      ),
      Doctor(
        id: 'dr_resat_arpaci',
        name: 'Dr. M. Reşat Arpacı',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Medikal Estetik Hekimi',
        imagePath: 'assets/images/DR.-RESAT-ARPACI.webp',
        biography: 'Dr. M. Reşat Arpacı, 2000 yılında Dokuz Eylül Üniversitesi\'nden mezun oldu. Milano Saç Ekimi Enstitüsü\'nden Biofibre Sertifikası aldı. 2007\'de gelişmiş FUE mikromotor tekniğini icat etti ve patentini aldı. 2010\'dan beri İstanbul\'da üst düzey kurumlarda görev yapıyor.',
        interview: {
          'Temel değerleriniz nelerdir?': 'Temel prensibim adil olmaktır. Adaletin yaşamın temel felsefesi olduğunu düşünüyorum.',
          'Klinikte çalışma tarzınız nasıldır?': 'Ekibimdeki kişileri dinleyip onların fikirlerini değerlendirir, son kararı kendim vermeyi tercih ederim.',
          'Burcunuz Nedir?': 'Oğlak',
          'Favori Parfümünüz Hangisidir?': 'Sauvage. Kokusunu seviyorum.',
          'Başucu kitabınız nedir?': 'Homo Deus. İnsanın evriminin sonunda ortaya çıkan yarı tanrının yüksek egosu beni dehşete düşürüp hayran bırakmıştı.',
          'İlham verici şehirler': 'Barcelona, yaşanabilecek en güzel şehir. İstanbul ise tarihi dokusu ve kültürel çeşitliliğiyle yaşamayı sevdiğim şehir.',
        },
        expertise: ['FUE Mikromotor', 'Biofibre Sentetik Saç Ekimi', 'Saç Restorasyonu'],
        experienceYears: 20,
        completedSurgeries: 5000,
      ),
      // Aktif: Mesajlaşma açık
      Doctor(
        id: 'dr_tarik_sarici',
        name: 'Dr. Tarık Sarıcı',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Saç Ekimi ve Restorasyonu',
        imagePath: 'assets/images/DR.-TARIK-SARICI.webp',
        biography: 'Dr. Tarık Sarıcı, saç ekimi ve saç restorasyonu alanında uzmanlaşmıştır.',
        interview: {
          'Motivasyonunuz nedir?': 'Hastalarımın özgüven kazanmasına katkı sağlamak.',
        },
        expertise: ['FUE', 'Sapphire FUE', 'Saç Çizgisi Tasarımı'],
        experienceYears: 9,
        completedSurgeries: 2200,
        canMessage: true,
        email: 'saricitarik@gmail.com',
      ),
      Doctor(
        id: 'dr_atalare',
        name: 'Dr. Erhan Atalar',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Saç Ekimi ve Saç Sağlığı',
        imagePath: 'assets/images/erhanatalar.webp',
        biography: 'Dr. Erhan Atalar, Smile Hair Clinic ekibine katılan yeni hekimlerimizden biridir. Saç sağlığı ve modern FUE tekniklerinde deneyimlidir.',
        interview: {
          'Motivasyonunuz nedir?': 'Hastaların doğal görünümlerini yeniden kazanmalarına yardımcı olmak.',
        },
        expertise: ['FUE', 'DHI', 'Saç Sağlığı Danışmanlığı'],
        experienceYears: 7,
        completedSurgeries: 1800,
        canMessage: true,
        email: 'atalare@itu.edu.tr',
      ),
      Doctor(
        id: 'dr_yusuf_gunel',
        name: 'Dr. Yusuf Günel',
        title: 'Saç Ekimi Cerrahı, M.D.',
        specialization: 'Saç Ekimi ve Revizyon Operasyonları',
        imagePath: 'assets/images/DR.-YUSUF-GUNEL.webp',
        biography: 'Dr. Yusuf Günel, saç ekimi ve revizyon operasyonlarında deneyimlidir.',
        interview: {
          'Motivasyonunuz nedir?': 'Doğal ve kalıcı sonuçlar elde etmek.',
        },
        expertise: ['DHI', 'FUE', 'Revizyon Saç Ekimi'],
        experienceYears: 8,
        completedSurgeries: 2000,
        canMessage: true,
        email: 'yusufgunel71@hotmail.com',
      ),
    ];
  }

  static Doctor? getDoctorById(String id) {
    try {
      return getAllDoctors().firstWhere((doctor) => doctor.id == id);
    } catch (e) {
      return null;
    }
  }

  static Doctor? getDoctorByEmail(String email) {
    try {
      return getAllDoctors().firstWhere(
        (doctor) => doctor.email != null && doctor.email!.toLowerCase() == email.toLowerCase()
      );
    } catch (e) {
      return null;
    }
  }
}



