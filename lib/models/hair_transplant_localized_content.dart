import 'package:flutter/material.dart';

/// Localized content for all hair transplant procedures in all supported languages
class HairTransplantLocalizedContent {
  static Map<String, dynamic> getContent(String contentId, String locale) {
    final allContent = _getAllHairTransplantContent();
    return allContent[contentId]?[locale] ?? allContent[contentId]?['tr'] ?? {};
  }

  static Map<String, Map<String, Map<String, dynamic>>> _getAllHairTransplantContent() {
    return {
      'tirassiz-sac-ekimi': {
        'tr': {
          'title': 'Tıraşsız Saç Ekimi',
          'subtitle': 'Senin ve Doktorun Arasında Bir Sır',
          'sections': [
            {
              'title': 'Tıraşsız Saç Ekimi: Senin ve Doktorun Arasında Bir Sır',
              'content': 'Tıraşsız Saç Ekimi; Saç seyrelmesi ya da kaybı yaşayan birçok insan tıraşsız saç ekimi olabileceğini bilmedikleri için saç ekiminden vazgeçmiştir. Popülerliği gittikçe yaygınlaşan Tıraşsız saç ekimi bu yanlış anlaşılmayı yıkmış ve saç problemi yaşayan birçok insan için mutluluk kaynağı olmuştur.\n\nSaç traşı olmak birçoğumuz için büyük bir sorun haline gelebilir. Estetik kaygılar nedeniyle saçlarınızı traş ettirmek istememeniz ya da saç ekimi yaptırdığınızı ifşa etmemeniz tamamen anlaşılır bir durumdur.\n\nNeyse ki tıraşsız saç ekimi sayesinde hastalar mevcut saçlarını kaybetmeden başarılı bir tıraşsız FUE saç ekimi yaptırabilirler. Smile Hair, saçlarını kestirmek istemeyen ve saç ekimi operasyonunu açığa vurmak istemeyen hastalarımız için güvenli ve başarılı bir tıraşsız saç ekimi sağlıyor.',
              'isList': false,
            },
            {
              'title': 'Herkes Tıraşsız Saç Ekimi Yaptırabilir mi?',
              'content': 'Hem erkekler hem de kadınlar saç ekimi için uygundur. Birçok insanın operasyonu gizli tutmak ya da mevcut saçlarını traş etmemek için yaptırma eğiliminde olduğu tıraşsız saç ekimi giderek daha avantajlı hale gelmektedir.\n\nÖzellikle, mevcut saçlarını kaybetmek istemeyen kadınlar arasında tıraşsız saç ekimi popüler bir seçenektir.\n\nDiğer bir yandan tıraşsız saç ekimi ise herkese göre değildir. Şiddetli saç dökülmesi olan hastalar için tıraşsız saç ekimi operasyonu başarılı sonuçlar getirmeyebilir.',
              'isList': false,
            },
            {
              'title': 'Tıraşsız Saç Ekim Operasyonu',
              'content': 'Hem erkeklerin hem de kadınların tercihi olan tıraşsız saç ekimi, geleneksel FUE tekniğine oldukça benzemektedir. Tıraşsız saç ekimi ile geleneksel saç ekimi arasındaki tek fark, tıraşsız saç ekiminde hastaların saçlarını kesmek veya tıraş etmek zorunda kalmamasıdır.',
              'isList': false,
            },
            {
              'title': 'Operasyon Sonrası Seçenekler',
              'content': '1- Traşlı Donör Bölgesi, Tıraşsız Alıcı Bölgesi\n2- Sınırlı Traşlı Donör Alanı\n3- Tamamen Tıraşsız',
              'isList': true,
            },
            {
              'title': 'Tıraşsız Saç Ekimi Avantajları',
              'content': '• Saçınızı tıraş etmenize gerek yoktur\n• Doğal görünümlü saçlara sahip olmanızı sağlar\n• Ciddi ve gözle görülebilir ameliyat izleri kalmaz\n• Sosyal hayatınızı kesintiye uğratmaz\n• İyileşme süreci kısa sürer',
              'isList': true,
            },
            {
              'title': 'Tıraşsız Saç Ekimi Dezavantajları',
              'content': '• Başarısı doktorunuza bağlıdır\n• Normal FUE ekimine göre çok daha uzun sürer\n• İleri derecede saç dökülmesi yaşayan kişiler için uygun değildir\n• Bakteri üremesi riski olabilir',
              'isList': true,
            },
            {
              'title': 'İdeal Adaylar',
              'content': 'Tıraşsız saç ekimi, özellikle saçlarını tıraş etmek istemeyenler için ideal bir seçenektir. Bu yöntem, iş yaşamında aktif olan ve saç ekimi sonrasında hemen günlük yaşantısına dönmek isteyen profesyoneller, kadınlar ve uzun saçlı erkekler için uygundur.',
              'isList': false,
            },
            {
              'title': 'Kimler İçin Uygun Değildir?',
              'content': 'Tıraşsız saç ekimi, geniş alanlarda saç kaybı yaşayan veya donör alanın yoğunluğu düşük olan kişiler için uygun olmayabilir. Çünkü, bu yöntem, genellikle daha küçük alanlara uygulanır ve donör alanın yeterli yoğunluğa sahip olması gereklidir.',
              'isList': false,
            },
          ],
        },
        'en': {
          'title': 'Unshaven Hair Transplant',
          'subtitle': 'A Secret Between You and Your Doctor',
          'sections': [
            {
              'title': 'Unshaven Hair Transplant: A Secret Between You and Your Doctor',
              'content': 'Unshaven Hair Transplant; Many people experiencing hair thinning or loss have given up on hair transplantation because they did not know that unshaven hair transplantation was possible. Unshaven hair transplantation, which is becoming increasingly popular, has broken this misconception and has become a source of happiness for many people experiencing hair problems.\n\nGetting a haircut can become a major problem for many of us. It is completely understandable that you do not want to shave your hair due to aesthetic concerns or that you do not want to reveal that you have had a hair transplant.\n\nFortunately, thanks to unshaven hair transplantation, patients can have a successful unshaven FUE hair transplant without losing their existing hair. Smile Hair provides safe and successful unshaven hair transplantation for our patients who do not want to cut their hair and do not want to reveal the hair transplant operation.',
              'isList': false,
            },
            {
              'title': 'Can Everyone Have an Unshaven Hair Transplant?',
              'content': 'Both men and women are suitable for hair transplantation. Unshaven hair transplantation, which many people tend to have to keep the operation secret or not to shave their existing hair, is becoming increasingly advantageous.\n\nEspecially among women who do not want to lose their existing hair, unshaven hair transplantation is a popular option.\n\nOn the other hand, unshaven hair transplantation is not for everyone. Unshaven hair transplantation surgery may not bring successful results for patients with severe hair loss.',
              'isList': false,
            },
            {
              'title': 'Unshaven Hair Transplant Operation',
              'content': 'Unshaven hair transplantation, which is preferred by both men and women, is quite similar to the traditional FUE technique. The only difference between unshaven hair transplantation and traditional hair transplantation is that in unshaven hair transplantation, patients do not have to cut or shave their hair.',
              'isList': false,
            },
            {
              'title': 'Post-Operation Options',
              'content': '1- Shaved Donor Area, Unshaven Recipient Area\n2- Limited Shaved Donor Area\n3- Completely Unshaven',
              'isList': true,
            },
            {
              'title': 'Advantages of Unshaven Hair Transplant',
              'content': '• You don\'t need to shave your hair\n• Provides you with natural-looking hair\n• No serious and visible surgical scars\n• Does not interrupt your social life\n• Recovery process is short',
              'isList': true,
            },
            {
              'title': 'Disadvantages of Unshaven Hair Transplant',
              'content': '• Success depends on your doctor\n• Takes much longer than normal FUE transplantation\n• Not suitable for people experiencing advanced hair loss\n• There may be a risk of bacterial growth',
              'isList': true,
            },
            {
              'title': 'Ideal Candidates',
              'content': 'Unshaven hair transplantation is an ideal option, especially for those who do not want to shave their hair. This method is suitable for professionals, women, and long-haired men who are active in business life and want to return to their daily lives immediately after hair transplantation.',
              'isList': false,
            },
            {
              'title': 'Who Is It Not Suitable For?',
              'content': 'Unshaven hair transplantation may not be suitable for people experiencing hair loss in large areas or those with low donor area density. Because this method is usually applied to smaller areas and the donor area must have sufficient density.',
              'isList': false,
            },
          ],
        },
        'ar': {
          'title': 'زراعة الشعر بدون حلاقة',
          'subtitle': 'سر بينك وبين طبيبك',
          'sections': [
            {
              'title': 'زراعة الشعر بدون حلاقة: سر بينك وبين طبيبك',
              'content': 'زراعة الشعر بدون حلاقة؛ تخلّى الكثير من الأشخاص الذين يعانون من ترقق الشعر أو تساقطه عن زراعة الشعر لأنهم لم يعرفوا أن زراعة الشعر بدون حلاقة ممكنة. زراعة الشعر بدون حلاقة، التي تزداد شعبية، حطمت هذا سوء الفهم وأصبحت مصدر سعادة للكثير من الأشخاص الذين يعانون من مشاكل الشعر.\n\nقد تصبح حلاقة الشعر مشكلة كبيرة للكثير منا. من المفهوم تمامًا أنك لا تريد حلاقة شعرك بسبب المخاوف الجمالية أو أنك لا تريد الكشف عن أنك أجريت زراعة شعر.\n\nلحسن الحظ، بفضل زراعة الشعر بدون حلاقة، يمكن للمرضى إجراء زراعة شعر FUE ناجحة بدون حلاقة دون فقدان شعرهم الموجود. توفر Smile Hair زراعة شعر آمنة وناجحة بدون حلاقة لمرضانا الذين لا يريدون قص شعرهم ولا يريدون الكشف عن عملية زراعة الشعر.',
              'isList': false,
            },
            {
              'title': 'هل يمكن للجميع إجراء زراعة شعر بدون حلاقة؟',
              'content': 'كل من الرجال والنساء مناسبون لزراعة الشعر. زراعة الشعر بدون حلاقة، التي يميل الكثير من الأشخاص لإجرائها لإبقاء العملية سرية أو عدم حلاقة شعرهم الموجود، تصبح أكثر فائدة.\n\nخاصة بين النساء اللواتي لا يردن فقدان شعرهن الموجود، تعد زراعة الشعر بدون حلاقة خيارًا شائعًا.\n\nمن ناحية أخرى، زراعة الشعر بدون حلاقة ليست للجميع. قد لا تجلب جراحة زراعة الشعر بدون حلاقة نتائج ناجحة للمرضى الذين يعانون من تساقط شعر شديد.',
              'isList': false,
            },
            {
              'title': 'عملية زراعة الشعر بدون حلاقة',
              'content': 'زراعة الشعر بدون حلاقة، التي يفضلها كل من الرجال والنساء، تشبه إلى حد كبير تقنية FUE التقليدية. الفرق الوحيد بين زراعة الشعر بدون حلاقة وزراعة الشعر التقليدية هو أنه في زراعة الشعر بدون حلاقة، لا يتعين على المرضى قص أو حلاقة شعرهم.',
              'isList': false,
            },
            {
              'title': 'خيارات ما بعد العملية',
              'content': '1- منطقة المتبرع المحلوقة، منطقة المتلقي غير المحلوقة\n2- منطقة المتبرع المحلوقة المحدودة\n3- بدون حلاقة تمامًا',
              'isList': true,
            },
            {
              'title': 'مزايا زراعة الشعر بدون حلاقة',
              'content': '• لا تحتاج إلى حلاقة شعرك\n• يوفر لك شعرًا ذا مظهر طبيعي\n• لا توجد ندبات جراحية خطيرة ومرئية\n• لا يقاطع حياتك الاجتماعية\n• عملية الشفاء قصيرة',
              'isList': true,
            },
            {
              'title': 'عيوب زراعة الشعر بدون حلاقة',
              'content': '• النجاح يعتمد على طبيبك\n• يستغرق وقتًا أطول بكثير من زراعة FUE العادية\n• غير مناسب للأشخاص الذين يعانون من تساقط شعر متقدم\n• قد يكون هناك خطر من نمو البكتيريا',
              'isList': true,
            },
            {
              'title': 'المرشحون المثاليون',
              'content': 'زراعة الشعر بدون حلاقة هي خيار مثالي، خاصة لأولئك الذين لا يريدون حلاقة شعرهم. هذه الطريقة مناسبة للمهنيين والنساء والرجال ذوي الشعر الطويل الذين هم نشطون في الحياة العملية ويريدون العودة إلى حياتهم اليومية فورًا بعد زراعة الشعر.',
              'isList': false,
            },
            {
              'title': 'من غير مناسب لهم؟',
              'content': 'قد لا تكون زراعة الشعر بدون حلاقة مناسبة للأشخاص الذين يعانون من تساقط الشعر في مناطق كبيرة أو أولئك الذين لديهم كثافة منخفضة في منطقة المتبرع. لأن هذه الطريقة تُطبق عادة على مناطق أصغر ويجب أن يكون لمنطقة المتبرع كثافة كافية.',
              'isList': false,
            },
          ],
        },
        'de': {
          'title': 'Unrasierte Haartransplantation',
          'subtitle': 'Ein Geheimnis zwischen Ihnen und Ihrem Arzt',
          'sections': [
            {
              'title': 'Unrasierte Haartransplantation: Ein Geheimnis zwischen Ihnen und Ihrem Arzt',
              'content': 'Unrasierte Haartransplantation; Viele Menschen, die unter Haarausfall oder Haarausfall leiden, haben die Haartransplantation aufgegeben, weil sie nicht wussten, dass eine unrasierte Haartransplantation möglich ist. Die unrasierte Haartransplantation, die immer beliebter wird, hat dieses Missverständnis zerstört und ist zu einer Quelle des Glücks für viele Menschen geworden, die unter Haarproblemen leiden.\n\nEin Haarschnitt kann für viele von uns zu einem großen Problem werden. Es ist völlig verständlich, dass Sie Ihre Haare aufgrund ästhetischer Bedenken nicht rasieren möchten oder dass Sie nicht preisgeben möchten, dass Sie eine Haartransplantation durchgeführt haben.\n\nGlücklicherweise können Patienten dank der unrasierten Haartransplantation eine erfolgreiche unrasierte FUE-Haartransplantation durchführen, ohne ihre vorhandenen Haare zu verlieren. Smile Hair bietet sichere und erfolgreiche unrasierte Haartransplantationen für unsere Patienten, die ihre Haare nicht schneiden möchten und die Haartransplantationsoperation nicht preisgeben möchten.',
              'isList': false,
            },
            {
              'title': 'Kann jeder eine unrasierte Haartransplantation durchführen?',
              'content': 'Sowohl Männer als auch Frauen sind für eine Haartransplantation geeignet. Die unrasierte Haartransplantation, die viele Menschen dazu neigen, die Operation geheim zu halten oder ihre vorhandenen Haare nicht zu rasieren, wird zunehmend vorteilhafter.\n\nBesonders bei Frauen, die ihre vorhandenen Haare nicht verlieren möchten, ist die unrasierte Haartransplantation eine beliebte Option.\n\nAndererseits ist die unrasierte Haartransplantation nicht für jeden geeignet. Eine unrasierte Haartransplantationsoperation kann für Patienten mit schwerem Haarausfall möglicherweise keine erfolgreichen Ergebnisse bringen.',
              'isList': false,
            },
            {
              'title': 'Unrasierte Haartransplantationsoperation',
              'content': 'Die unrasierte Haartransplantation, die sowohl von Männern als auch von Frauen bevorzugt wird, ähnelt der traditionellen FUE-Technik sehr. Der einzige Unterschied zwischen der unrasierten Haartransplantation und der traditionellen Haartransplantation besteht darin, dass Patienten bei der unrasierten Haartransplantation ihre Haare nicht schneiden oder rasieren müssen.',
              'isList': false,
            },
            {
              'title': 'Optionen nach der Operation',
              'content': '1- Rasierter Spenderbereich, unrasierter Empfängerbereich\n2- Begrenzter rasierter Spenderbereich\n3- Vollständig unrasiert',
              'isList': true,
            },
            {
              'title': 'Vorteile der unrasierten Haartransplantation',
              'content': '• Sie müssen Ihre Haare nicht rasieren\n• Gibt Ihnen natürlich aussehende Haare\n• Keine schwerwiegenden und sichtbaren chirurgischen Narben\n• Unterbricht Ihr soziales Leben nicht\n• Der Genesungsprozess ist kurz',
              'isList': true,
            },
            {
              'title': 'Nachteile der unrasierten Haartransplantation',
              'content': '• Der Erfolg hängt von Ihrem Arzt ab\n• Dauert viel länger als eine normale FUE-Transplantation\n• Nicht geeignet für Menschen mit fortgeschrittenem Haarausfall\n• Es kann ein Risiko für Bakterienwachstum bestehen',
              'isList': true,
            },
            {
              'title': 'Ideale Kandidaten',
              'content': 'Die unrasierte Haartransplantation ist eine ideale Option, insbesondere für diejenigen, die ihre Haare nicht rasieren möchten. Diese Methode ist geeignet für Fachkräfte, Frauen und langhaarige Männer, die im Berufsleben aktiv sind und sofort nach der Haartransplantation zu ihrem täglichen Leben zurückkehren möchten.',
              'isList': false,
            },
            {
              'title': 'Für wen ist es nicht geeignet?',
              'content': 'Die unrasierte Haartransplantation ist möglicherweise nicht für Menschen geeignet, die in großen Bereichen Haarausfall haben oder eine niedrige Spenderbereichsdichte haben. Denn diese Methode wird normalerweise auf kleinere Bereiche angewendet und der Spenderbereich muss eine ausreichende Dichte haben.',
              'isList': false,
            },
          ],
        },
        'es': {
          'title': 'Trasplante de Cabello sin Afeitar',
          'subtitle': 'Un Secreto Entre Tú y Tu Médico',
          'sections': [
            {
              'title': 'Trasplante de Cabello sin Afeitar: Un Secreto Entre Tú y Tu Médico',
              'content': 'Trasplante de Cabello sin Afeitar; Muchas personas que experimentan adelgazamiento o pérdida de cabello han renunciado al trasplante de cabello porque no sabían que era posible un trasplante de cabello sin afeitar. El trasplante de cabello sin afeitar, que se está volviendo cada vez más popular, ha roto este malentendido y se ha convertido en una fuente de felicidad para muchas personas que experimentan problemas de cabello.\n\nCortarse el cabello puede convertirse en un gran problema para muchos de nosotros. Es completamente comprensible que no quieras afeitarte el cabello debido a preocupaciones estéticas o que no quieras revelar que te has sometido a un trasplante de cabello.\n\nAfortunadamente, gracias al trasplante de cabello sin afeitar, los pacientes pueden someterse a un trasplante de cabello FUE sin afeitar exitoso sin perder su cabello existente. Smile Hair proporciona trasplantes de cabello seguros y exitosos sin afeitar para nuestros pacientes que no quieren cortarse el cabello y no quieren revelar la operación de trasplante de cabello.',
              'isList': false,
            },
            {
              'title': '¿Puede todo el mundo someterse a un trasplante de cabello sin afeitar?',
              'content': 'Tanto hombres como mujeres son adecuados para el trasplante de cabello. El trasplante de cabello sin afeitar, que muchas personas tienden a realizarse para mantener la operación en secreto o no afeitarse el cabello existente, se está volviendo cada vez más ventajoso.\n\nEspecialmente entre las mujeres que no quieren perder su cabello existente, el trasplante de cabello sin afeitar es una opción popular.\n\nPor otro lado, el trasplante de cabello sin afeitar no es para todos. La cirugía de trasplante de cabello sin afeitar puede no traer resultados exitosos para pacientes con pérdida de cabello severa.',
              'isList': false,
            },
            {
              'title': 'Operación de Trasplante de Cabello sin Afeitar',
              'content': 'El trasplante de cabello sin afeitar, que es preferido tanto por hombres como por mujeres, es bastante similar a la técnica FUE tradicional. La única diferencia entre el trasplante de cabello sin afeitar y el trasplante de cabello tradicional es que en el trasplante de cabello sin afeitar, los pacientes no tienen que cortar o afeitarse el cabello.',
              'isList': false,
            },
            {
              'title': 'Opciones Post-Operación',
              'content': '1- Área Donante Afeitada, Área Receptora sin Afeitar\n2- Área Donante Afeitada Limitada\n3- Completamente sin Afeitar',
              'isList': true,
            },
            {
              'title': 'Ventajas del Trasplante de Cabello sin Afeitar',
              'content': '• No necesitas afeitarte el cabello\n• Te proporciona cabello de aspecto natural\n• No hay cicatrices quirúrgicas serias y visibles\n• No interrumpe tu vida social\n• El proceso de recuperación es corto',
              'isList': true,
            },
            {
              'title': 'Desventajas del Trasplante de Cabello sin Afeitar',
              'content': '• El éxito depende de tu médico\n• Toma mucho más tiempo que el trasplante FUE normal\n• No es adecuado para personas con pérdida de cabello avanzada\n• Puede haber un riesgo de crecimiento bacteriano',
              'isList': true,
            },
            {
              'title': 'Candidatos Ideales',
              'content': 'El trasplante de cabello sin afeitar es una opción ideal, especialmente para aquellos que no quieren afeitarse el cabello. Este método es adecuado para profesionales, mujeres y hombres de cabello largo que están activos en la vida laboral y quieren volver a su vida diaria inmediatamente después del trasplante de cabello.',
              'isList': false,
            },
            {
              'title': '¿Para Quién No Es Adecuado?',
              'content': 'El trasplante de cabello sin afeitar puede no ser adecuado para personas que experimentan pérdida de cabello en áreas grandes o aquellas con baja densidad del área donante. Porque este método generalmente se aplica a áreas más pequeñas y el área donante debe tener suficiente densidad.',
              'isList': false,
            },
          ],
        },
        'fr': {
          'title': 'Greffe de cheveux sans rasage',
          'subtitle': 'Un secret entre vous et votre médecin',
          'sections': [
            {
              'title': 'Greffe de cheveux sans rasage: Un secret entre vous et votre médecin',
              'content': 'Greffe de cheveux sans rasage; De nombreuses personnes souffrant d\'amincissement ou de perte de cheveux ont renoncé à la greffe de cheveux parce qu\'elles ne savaient pas qu\'une greffe de cheveux sans rasage était possible. La greffe de cheveux sans rasage, qui devient de plus en plus populaire, a brisé ce malentendu et est devenue une source de bonheur pour de nombreuses personnes souffrant de problèmes de cheveux.\n\nSe faire couper les cheveux peut devenir un problème majeur pour beaucoup d\'entre nous. Il est tout à fait compréhensible que vous ne souhaitiez pas vous raser les cheveux en raison de préoccupations esthétiques ou que vous ne souhaitiez pas révéler que vous avez subi une greffe de cheveux.\n\nHeureusement, grâce à la greffe de cheveux sans rasage, les patients peuvent subir une greffe de cheveux FUE sans rasage réussie sans perdre leurs cheveux existants. Smile Hair offre des greffes de cheveux sûres et réussies sans rasage pour nos patients qui ne veulent pas se couper les cheveux et ne veulent pas révéler l\'opération de greffe de cheveux.',
              'isList': false,
            },
            {
              'title': 'Tout le monde peut-il subir une greffe de cheveux sans rasage?',
              'content': 'Les hommes et les femmes conviennent à la greffe de cheveux. La greffe de cheveux sans rasage, que beaucoup de gens ont tendance à subir pour garder l\'opération secrète ou ne pas se raser les cheveux existants, devient de plus en plus avantageuse.\n\nSurtout parmi les femmes qui ne veulent pas perdre leurs cheveux existants, la greffe de cheveux sans rasage est une option populaire.\n\nD\'un autre côté, la greffe de cheveux sans rasage n\'est pas pour tout le monde. La chirurgie de greffe de cheveux sans rasage peut ne pas apporter de résultats réussis pour les patients souffrant de perte de cheveux sévère.',
              'isList': false,
            },
            {
              'title': 'Opération de greffe de cheveux sans rasage',
              'content': 'La greffe de cheveux sans rasage, qui est préférée à la fois par les hommes et les femmes, est assez similaire à la technique FUE traditionnelle. La seule différence entre la greffe de cheveux sans rasage et la greffe de cheveux traditionnelle est que dans la greffe de cheveux sans rasage, les patients n\'ont pas à couper ou se raser les cheveux.',
              'isList': false,
            },
            {
              'title': 'Options post-opération',
              'content': '1- Zone donneuse rasée, zone receveuse non rasée\n2- Zone donneuse rasée limitée\n3- Complètement non rasé',
              'isList': true,
            },
            {
              'title': 'Avantages de la greffe de cheveux sans rasage',
              'content': '• Vous n\'avez pas besoin de vous raser les cheveux\n• Vous donne des cheveux d\'apparence naturelle\n• Pas de cicatrices chirurgicales graves et visibles\n• N\'interrompt pas votre vie sociale\n• Le processus de récupération est court',
              'isList': true,
            },
            {
              'title': 'Inconvénients de la greffe de cheveux sans rasage',
              'content': '• Le succès dépend de votre médecin\n• Prend beaucoup plus de temps que la greffe FUE normale\n• Pas adapté aux personnes souffrant de perte de cheveux avancée\n• Il peut y avoir un risque de croissance bactérienne',
              'isList': true,
            },
            {
              'title': 'Candidats idéaux',
              'content': 'La greffe de cheveux sans rasage est une option idéale, surtout pour ceux qui ne veulent pas se raser les cheveux. Cette méthode convient aux professionnels, aux femmes et aux hommes aux cheveux longs qui sont actifs dans la vie professionnelle et veulent retourner à leur vie quotidienne immédiatement après la greffe de cheveux.',
              'isList': false,
            },
            {
              'title': 'Pour qui n\'est-ce pas adapté?',
              'content': 'La greffe de cheveux sans rasage peut ne pas être adaptée aux personnes souffrant de perte de cheveux dans de grandes zones ou celles ayant une faible densité de la zone donneuse. Parce que cette méthode est généralement appliquée à des zones plus petites et que la zone donneuse doit avoir une densité suffisante.',
              'isList': false,
            },
          ],
        },
        'it': {
          'title': 'Trapianto di capelli senza rasatura',
          'subtitle': 'Un segreto tra te e il tuo medico',
          'sections': [
            {
              'title': 'Trapianto di capelli senza rasatura: Un segreto tra te e il tuo medico',
              'content': 'Trapianto di capelli senza rasatura; Molte persone che soffrono di diradamento o perdita di capelli hanno rinunciato al trapianto di capelli perché non sapevano che era possibile un trapianto di capelli senza rasatura. Il trapianto di capelli senza rasatura, che sta diventando sempre più popolare, ha rotto questo malinteso ed è diventato una fonte di felicità per molte persone che soffrono di problemi ai capelli.\n\nFarsi tagliare i capelli può diventare un grosso problema per molti di noi. È del tutto comprensibile che non si voglia radere i capelli a causa di preoccupazioni estetiche o che non si voglia rivelare di aver subito un trapianto di capelli.\n\nFortunatamente, grazie al trapianto di capelli senza rasatura, i pazienti possono sottoporsi a un trapianto di capelli FUE senza rasatura di successo senza perdere i capelli esistenti. Smile Hair fornisce trapianti di capelli sicuri e di successo senza rasatura per i nostri pazienti che non vogliono tagliarsi i capelli e non vogliono rivelare l\'operazione di trapianto di capelli.',
              'isList': false,
            },
            {
              'title': 'Tutti possono sottoporsi a un trapianto di capelli senza rasatura?',
              'content': 'Sia gli uomini che le donne sono adatti per il trapianto di capelli. Il trapianto di capelli senza rasatura, che molte persone tendono a subire per mantenere segreta l\'operazione o non radere i capelli esistenti, sta diventando sempre più vantaggioso.\n\nSpecialmente tra le donne che non vogliono perdere i capelli esistenti, il trapianto di capelli senza rasatura è un\'opzione popolare.\n\nD\'altra parte, il trapianto di capelli senza rasatura non è per tutti. La chirurgia del trapianto di capelli senza rasatura potrebbe non portare risultati di successo per i pazienti con grave perdita di capelli.',
              'isList': false,
            },
            {
              'title': 'Operazione di trapianto di capelli senza rasatura',
              'content': 'Il trapianto di capelli senza rasatura, che è preferito sia da uomini che da donne, è abbastanza simile alla tecnica FUE tradizionale. L\'unica differenza tra il trapianto di capelli senza rasatura e il trapianto di capelli tradizionale è che nel trapianto di capelli senza rasatura, i pazienti non devono tagliare o radere i capelli.',
              'isList': false,
            },
            {
              'title': 'Opzioni post-operatorie',
              'content': '1- Area donatrice rasata, area ricevente non rasata\n2- Area donatrice rasata limitata\n3- Completamente non rasato',
              'isList': true,
            },
            {
              'title': 'Vantaggi del trapianto di capelli senza rasatura',
              'content': '• Non è necessario radere i capelli\n• Ti dà capelli dall\'aspetto naturale\n• Nessuna cicatrice chirurgica seria e visibile\n• Non interrompe la tua vita sociale\n• Il processo di recupero è breve',
              'isList': true,
            },
            {
              'title': 'Svantaggi del trapianto di capelli senza rasatura',
              'content': '• Il successo dipende dal tuo medico\n• Richiede molto più tempo rispetto al trapianto FUE normale\n• Non adatto a persone con perdita di capelli avanzata\n• Potrebbe esserci un rischio di crescita batterica',
              'isList': true,
            },
            {
              'title': 'Candidati ideali',
              'content': 'Il trapianto di capelli senza rasatura è un\'opzione ideale, soprattutto per coloro che non vogliono radere i capelli. Questo metodo è adatto a professionisti, donne e uomini dai capelli lunghi che sono attivi nella vita lavorativa e vogliono tornare alla loro vita quotidiana immediatamente dopo il trapianto di capelli.',
              'isList': false,
            },
            {
              'title': 'Per chi non è adatto?',
              'content': 'Il trapianto di capelli senza rasatura potrebbe non essere adatto a persone che soffrono di perdita di capelli in aree estese o quelle con bassa densità dell\'area donatrice. Perché questo metodo viene solitamente applicato ad aree più piccole e l\'area donatrice deve avere una densità sufficiente.',
              'isList': false,
            },
          ],
        },
        'pt': {
          'title': 'Transplante de Cabelo sem Barbear',
          'subtitle': 'Um Segredo Entre Você e Seu Médico',
          'sections': [
            {
              'title': 'Transplante de Cabelo sem Barbear: Um Segredo Entre Você e Seu Médico',
              'content': 'Transplante de Cabelo sem Barbear; Muitas pessoas que sofrem de afinamento ou perda de cabelo desistiram do transplante de cabelo porque não sabiam que era possível um transplante de cabelo sem barbear. O transplante de cabelo sem barbear, que está se tornando cada vez mais popular, quebrou esse mal-entendido e se tornou uma fonte de felicidade para muitas pessoas que sofrem de problemas capilares.\n\nCortar o cabelo pode se tornar um grande problema para muitos de nós. É totalmente compreensível que você não queira raspar o cabelo devido a preocupações estéticas ou que não queira revelar que fez um transplante de cabelo.\n\nFelizmente, graças ao transplante de cabelo sem barbear, os pacientes podem se submeter a um transplante de cabelo FUE sem barbear bem-sucedido sem perder o cabelo existente. Smile Hair fornece transplantes de cabelo seguros e bem-sucedidos sem barbear para nossos pacientes que não querem cortar o cabelo e não querem revelar a operação de transplante de cabelo.',
              'isList': false,
            },
            {
              'title': 'Todos podem se submeter a um transplante de cabelo sem barbear?',
              'content': 'Tanto homens quanto mulheres são adequados para transplante de cabelo. O transplante de cabelo sem barbear, que muitas pessoas tendem a fazer para manter a operação em segredo ou não raspar o cabelo existente, está se tornando cada vez mais vantajoso.\n\nEspecialmente entre as mulheres que não querem perder o cabelo existente, o transplante de cabelo sem barbear é uma opção popular.\n\nPor outro lado, o transplante de cabelo sem barbear não é para todos. A cirurgia de transplante de cabelo sem barbear pode não trazer resultados bem-sucedidos para pacientes com perda de cabelo severa.',
              'isList': false,
            },
            {
              'title': 'Operação de Transplante de Cabelo sem Barbear',
              'content': 'O transplante de cabelo sem barbear, que é preferido tanto por homens quanto por mulheres, é bastante semelhante à técnica FUE tradicional. A única diferença entre o transplante de cabelo sem barbear e o transplante de cabelo tradicional é que no transplante de cabelo sem barbear, os pacientes não precisam cortar ou raspar o cabelo.',
              'isList': false,
            },
            {
              'title': 'Opções Pós-Operação',
              'content': '1- Área Doadora Barbeada, Área Receptora sem Barbear\n2- Área Doadora Barbeada Limitada\n3- Completamente sem Barbear',
              'isList': true,
            },
            {
              'title': 'Vantagens do Transplante de Cabelo sem Barbear',
              'content': '• Você não precisa raspar o cabelo\n• Fornece cabelo de aparência natural\n• Sem cicatrizes cirúrgicas sérias e visíveis\n• Não interrompe sua vida social\n• O processo de recuperação é curto',
              'isList': true,
            },
            {
              'title': 'Desvantagens do Transplante de Cabelo sem Barbear',
              'content': '• O sucesso depende do seu médico\n• Leva muito mais tempo do que o transplante FUE normal\n• Não é adequado para pessoas com perda de cabelo avançada\n• Pode haver risco de crescimento bacteriano',
              'isList': true,
            },
            {
              'title': 'Candidatos Ideais',
              'content': 'O transplante de cabelo sem barbear é uma opção ideal, especialmente para aqueles que não querem raspar o cabelo. Este método é adequado para profissionais, mulheres e homens de cabelo comprido que estão ativos na vida profissional e querem retornar à sua vida diária imediatamente após o transplante de cabelo.',
              'isList': false,
            },
            {
              'title': 'Para Quem Não É Adequado?',
              'content': 'O transplante de cabelo sem barbear pode não ser adequado para pessoas que sofrem de perda de cabelo em grandes áreas ou aquelas com baixa densidade da área doadora. Porque este método geralmente é aplicado a áreas menores e a área doadora deve ter densidade suficiente.',
              'isList': false,
            },
          ],
        },
        'ru': {
          'title': 'Пересадка волос без бритья',
          'subtitle': 'Секрет между вами и вашим врачом',
          'sections': [
            {
              'title': 'Пересадка волос без бритья: Секрет между вами и вашим врачом',
              'content': 'Пересадка волос без бритья; Многие люди, страдающие от истончения или выпадения волос, отказались от пересадки волос, потому что не знали, что возможна пересадка волос без бритья. Пересадка волос без бритья, которая становится все более популярной, разрушила это недоразумение и стала источником счастья для многих людей, страдающих проблемами волос.\n\nСтрижка волос может стать большой проблемой для многих из нас. Вполне понятно, что вы не хотите брить волосы из-за эстетических соображений или не хотите раскрывать, что вам сделали пересадку волос.\n\nК счастью, благодаря пересадке волос без бритья пациенты могут пройти успешную пересадку волос FUE без бритья, не теряя существующие волосы. Smile Hair предоставляет безопасную и успешную пересадку волос без бритья для наших пациентов, которые не хотят стричь волосы и не хотят раскрывать операцию по пересадке волос.',
              'isList': false,
            },
            {
              'title': 'Может ли каждый пройти пересадку волос без бритья?',
              'content': 'Как мужчины, так и женщины подходят для пересадки волос. Пересадка волос без бритья, которую многие люди склонны делать, чтобы сохранить операцию в секрете или не брить существующие волосы, становится все более выгодной.\n\nОсобенно среди женщин, которые не хотят терять существующие волосы, пересадка волос без бритья является популярным вариантом.\n\nС другой стороны, пересадка волос без бритья не для всех. Операция по пересадке волос без бритья может не принести успешных результатов для пациентов с сильным выпадением волос.',
              'isList': false,
            },
            {
              'title': 'Операция по пересадке волос без бритья',
              'content': 'Пересадка волос без бритья, которую предпочитают как мужчины, так и женщины, довольно похожа на традиционную технику FUE. Единственная разница между пересадкой волос без бритья и традиционной пересадкой волос заключается в том, что при пересадке волос без бритья пациентам не нужно стричь или брить волосы.',
              'isList': false,
            },
            {
              'title': 'Варианты после операции',
              'content': '1- Побритая область донора, небритая область реципиента\n2- Ограниченная побритая область донора\n3- Полностью небритая',
              'isList': true,
            },
            {
              'title': 'Преимущества пересадки волос без бритья',
              'content': '• Вам не нужно брить волосы\n• Дает вам естественно выглядящие волосы\n• Нет серьезных и видимых хирургических шрамов\n• Не прерывает вашу социальную жизнь\n• Процесс восстановления короткий',
              'isList': true,
            },
            {
              'title': 'Недостатки пересадки волос без бритья',
              'content': '• Успех зависит от вашего врача\n• Занимает намного больше времени, чем обычная пересадка FUE\n• Не подходит для людей с продвинутым выпадением волос\n• Может быть риск роста бактерий',
              'isList': true,
            },
            {
              'title': 'Идеальные кандидаты',
              'content': 'Пересадка волос без бритья - идеальный вариант, особенно для тех, кто не хочет брить волосы. Этот метод подходит для профессионалов, женщин и длинноволосых мужчин, которые активны в деловой жизни и хотят вернуться к своей повседневной жизни сразу после пересадки волос.',
              'isList': false,
            },
            {
              'title': 'Для кого это не подходит?',
              'content': 'Пересадка волос без бритья может не подходить для людей, страдающих выпадением волос на больших участках, или тех, у кого низкая плотность области донора. Потому что этот метод обычно применяется к меньшим областям, и область донора должна иметь достаточную плотность.',
              'isList': false,
            },
          ],
        },
        'he': {
          'title': 'השתלת שיער ללא גילוח',
          'subtitle': 'סוד בינך לבין הרופא שלך',
          'sections': [
            {
              'title': 'השתלת שיער ללא גילוח: סוד בינך לבין הרופא שלך',
              'content': 'השתלת שיער ללא גילוח; אנשים רבים החווים דילול שיער או נשירה ויתרו על השתלת שיער כי לא ידעו שהשתלת שיער ללא גילוח אפשרית. השתלת שיער ללא גילוח, שהופכת פופולרית יותר ויותר, שברה את אי ההבנה הזה והפכה למקור אושר עבור אנשים רבים החווים בעיות שיער.\n\nגזיזת שיער יכולה להפוך לבעיה גדולה עבור רבים מאיתנו. זה מובן לחלוטין שאתה לא רוצה לגלח את השיער שלך בגלל חששות אסתטיים או שאתה לא רוצה לחשוף שעברת השתלת שיער.\n\nלמרבה המזל, בזכות השתלת שיער ללא גילוח, מטופלים יכולים לעבור השתלת שיער FUE מוצלחת ללא גילוח ללא איבוד השיער הקיים שלהם. Smile Hair מספקת השתלת שיער בטוחה ומוצלחת ללא גילוח עבור המטופלים שלנו שלא רוצים לגזוז את השיער ולא רוצים לחשוף את ניתוח השתלת השיער.',
              'isList': false,
            },
            {
              'title': 'האם כולם יכולים לעבור השתלת שיער ללא גילוח?',
              'content': 'גם גברים וגם נשים מתאימים להשתלת שיער. השתלת שיער ללא גילוח, שאנשים רבים נוטים לעבור כדי לשמור על הניתוח בסוד או לא לגלח את השיער הקיים, הופכת ליותר ויותר מועילה.\n\nבמיוחד בקרב נשים שלא רוצות לאבד את השיער הקיים שלהן, השתלת שיער ללא גילוח היא אפשרות פופולרית.\n\nמצד שני, השתלת שיער ללא גילוח אינה מתאימה לכולם. ניתוח השתלת שיער ללא גילוח עלול לא להביא לתוצאות מוצלחות עבור מטופלים עם נשירת שיער חמורה.',
              'isList': false,
            },
            {
              'title': 'ניתוח השתלת שיער ללא גילוח',
              'content': 'השתלת שיער ללא גילוח, המועדפת על ידי גברים ונשים כאחד, די דומה לטכניקת FUE המסורתית. ההבדל היחיד בין השתלת שיער ללא גילוח להשתלת שיער מסורתית הוא שבהשתלת שיער ללא גילוח, מטופלים לא צריכים לגזוז או לגלח את השיער.',
              'isList': false,
            },
            {
              'title': 'אפשרויות לאחר הניתוח',
              'content': '1- אזור תורם מגולח, אזור מקבל לא מגולח\n2- אזור תורם מגולח מוגבל\n3- לא מגולח לחלוטין',
              'isList': true,
            },
            {
              'title': 'יתרונות השתלת שיער ללא גילוח',
              'content': '• אתה לא צריך לגלח את השיער שלך\n• נותן לך שיער שנראה טבעי\n• אין צלקות כירורגיות חמורות ונראות\n• לא מפריע לחיים החברתיים שלך\n• תהליך ההחלמה קצר',
              'isList': true,
            },
            {
              'title': 'חסרונות השתלת שיער ללא גילוח',
              'content': '• ההצלחה תלויה ברופא שלך\n• לוקח הרבה יותר זמן מהשתלת FUE רגילה\n• לא מתאים לאנשים עם נשירת שיער מתקדמת\n• עלול להיות סיכון לצמיחת חיידקים',
              'isList': true,
            },
            {
              'title': 'מועמדים אידיאליים',
              'content': 'השתלת שיער ללא גילוח היא אפשרות אידיאלית, במיוחד עבור אלה שלא רוצים לגלח את השיער. שיטה זו מתאימה למקצוענים, נשים וגברים ארוכי שיער הפעילים בחיי העסקים ורוצים לחזור לחיי היומיום שלהם מיד לאחר השתלת השיער.',
              'isList': false,
            },
            {
              'title': 'למי זה לא מתאים?',
              'content': 'השתלת שיער ללא גילוח עלולה לא להתאים לאנשים החווים נשירת שיער באזורים גדולים או אלה עם צפיפות נמוכה של אזור התורם. כי שיטה זו מיושמת בדרך כלל על אזורים קטנים יותר ואזור התורם חייב להיות בעל צפיפות מספקת.',
              'isList': false,
            },
          ],
        },
        'sq': {
          'title': 'Transplantimi i Flokëve pa Rruajtje',
          'subtitle': 'Një sekret midis jush dhe mjekut tuaj',
          'sections': [
            {
              'title': 'Transplantimi i Flokëve pa Rruajtje: Një sekret midis jush dhe mjekut tuaj',
              'content': 'Transplantimi i Flokëve pa Rruajtje; Shumë njerëz që përjetojnë hollim ose humbje flokësh kanë hequr dorë nga transplantimi i flokëve sepse nuk dinin se transplantimi i flokëve pa rruajtje ishte i mundur. Transplantimi i flokëve pa rruajtje, i cili po bëhet gjithnjë e më popullor, ka thyer këtë keqkuptim dhe është bërë burim gëzimi për shumë njerëz që përjetojnë probleme me flokët.\n\nPrerja e flokëve mund të bëhet një problem i madh për shumë prej nesh. Është plotësisht e kuptueshme që ju nuk dëshironi të rruani flokët tuaj për shkak të shqetësimeve estetike ose që nuk dëshironi të zbuloni se keni bërë një transplantim flokësh.\n\nPër fat të mirë, falë transplantimit të flokëve pa rruajtje, pacientët mund të pësojnë një transplantim të suksesshëm të flokëve FUE pa rruajtje pa humbur flokët ekzistues. Smile Hair ofron transplantime të sigurta dhe të suksesshme të flokëve pa rruajtje për pacientët tanë që nuk duan të presin flokët dhe nuk duan të zbulojnë operacionin e transplantimit të flokëve.',
              'isList': false,
            },
            {
              'title': 'A mund të pësojë të gjithë një transplantim flokësh pa rruajtje?',
              'content': 'Si burrat ashtu edhe gratë janë të përshtatshëm për transplantimin e flokëve. Transplantimi i flokëve pa rruajtje, që shumë njerëz priren të pësojnë për të mbajtur operacionin sekret ose për të mos rruar flokët ekzistues, po bëhet gjithnjë e më i avantazhshëm.\n\nSidomos midis grave që nuk duan të humbasin flokët ekzistues, transplantimi i flokëve pa rruajtje është një opsion popullor.\n\nNga ana tjetër, transplantimi i flokëve pa rruajtje nuk është për të gjithë. Operacioni i transplantimit të flokëve pa rruajtje mund të mos sjellë rezultate të suksesshme për pacientët me humbje të rëndë të flokëve.',
              'isList': false,
            },
            {
              'title': 'Operacioni i Transplantimit të Flokëve pa Rruajtje',
              'content': 'Transplantimi i flokëve pa rruajtje, i cili preferohet si nga burrat ashtu edhe nga gratë, është mjaft i ngjashëm me teknikën tradicionale FUE. Diferenca e vetme midis transplantimit të flokëve pa rruajtje dhe transplantimit tradicional të flokëve është se në transplantimin e flokëve pa rruajtje, pacientët nuk duhet të presin ose të rruajnë flokët.',
              'isList': false,
            },
            {
              'title': 'Opsionet Pas Operacionit',
              'content': '1- Zona Dhuruese e Rruar, Zona Marrëse pa Rruajtje\n2- Zona Dhuruese e Rruar e Kufizuar\n3- Plotësisht pa Rruajtje',
              'isList': true,
            },
            {
              'title': 'Avantazhet e Transplantimit të Flokëve pa Rruajtje',
              'content': '• Nuk keni nevojë të rruani flokët tuaj\n• Ju jep flokë me pamje natyrore\n• Nuk ka mbresa kirurgjikale serioze dhe të dukshme\n• Nuk ndërpret jetën tuaj sociale\n• Procesi i shërimit është i shkurtër',
              'isList': true,
            },
            {
              'title': 'Disavantazhet e Transplantimit të Flokëve pa Rruajtje',
              'content': '• Suksesi varet nga mjeku juaj\n• Zë shumë më shumë kohë sesa transplantimi normal FUE\n• Nuk është i përshtatshëm për njerëz me humbje të avancuar të flokëve\n• Mund të ketë rrezik rritjeje bakteriale',
              'isList': true,
            },
            {
              'title': 'Kandidatët Idealë',
              'content': 'Transplantimi i flokëve pa rruajtje është një opsion ideal, veçanërisht për ata që nuk duan të rruajnë flokët. Kjo metodë është e përshtatshme për profesionistë, gra dhe burra me flokë të gjatë që janë aktivë në jetën e biznesit dhe duan të kthehen në jetën e tyre të përditshme menjëherë pas transplantimit të flokëve.',
              'isList': false,
            },
            {
              'title': 'Për kë nuk është i përshtatshëm?',
              'content': 'Transplantimi i flokëve pa rruajtje mund të mos jetë i përshtatshëm për njerëz që përjetojnë humbje flokësh në zona të mëdha ose ata me dendësi të ulët të zonës së dhuruesit. Sepse kjo metodë zakonisht zbatohet në zona më të vogla dhe zona e dhuruesit duhet të ketë dendësi të mjaftueshme.',
              'isList': false,
            },
          ],
        },
      },
      'ignesiz-anestezi': {
        'tr': {
          'title': 'İğnesiz Anestezi',
          'subtitle': 'FUE Saç Ekiminde Konforlu Deneyim',
          'sections': [
            {
              'title': 'FUE Saç Ekiminde İğnesiz Anestezi',
              'content': 'İğnesiz anestezi, cerrahi operasyonlarda hastaların endişe duyduğu noktaların en başında anestezi esnasında ağrı ve acı hissetmekten yana duyulan korku gelir.\n\nFUE saç ekimi hakkında araştırma yapan hastalarımızın çoğu tarafından acı hissetme, toplamda kaç kez iğne yapılacağı konularındaki sorular bize sıkça sorulmaktadır. Safir saç ekimi belirli bir bölgenin ciltten verilen ilaçlarla uyuşturulması anlamına gelen lokal anestezi ile iğnesiz anestezi yapılır.',
              'isList': false,
            },
            {
              'title': 'İğnesiz Anestezi Nasıl Çalışır?',
              'content': 'Safir saç ekiminde iğnesiz anestezi, ileri teknoloji cihazlarla yapılır. Anestezik ilaçların, baş bölgesine yerleştirilen cihazın uyguladığı yüksek hava basıncı yoluyla cilde püskürtülmesiyle dokuya girişi sağlanır.\n\nDaha sonra ilaç difüzyon mantığı ile dokuya yayılır ve ağrıyı iletilen sinirlerin blokajı sağlanır.',
              'isList': false,
            },
            {
              'title': 'İğnesiz Anestezi, Ağrısız Anestezi Değildir',
              'content': 'Unutulmamalıdır ki FUE saç ekiminde lokal anestezi uygulamasında ağrı hissedilmesinin nedeni uygulanan teknikten çok ilacın kendisidir. Bu sebeple iğnesiz anestezi ağrıyı azaltsa dahi kesinlikle tamamen ağrısız değildir.\n\nYapılan bilimsel araştırmalarda iğnelerle uygulanan anestezi ve iğnesiz anestezi yapılan hastalar incelenmiş olup iki yöntem arasında herhangi bir fark tespit edilmemiştir.',
              'isList': false,
            },
            {
              'title': 'Smile Hair ve İğnesiz Anestezi',
              'content': 'FUE saç ekiminde, ne yazık ki lokal anestezi uygulanırken bir miktar ağrı hissedileceği bir gerçektir. Önemli olan standart bir şekilde değil de her hastaya uygulama yapılırken bireyin reaksiyonlarını ve ihtiyaçlarını göz önünde bulundurularak kişiye özel uygulamadır.\n\nSmile Hair Klinik\'te, uzman hekimlerimizle, son teknoloji cihazları kullanarak uyguladığımız tüm tedavilerde hastaların psikolojik durumunu göz önünde bulunduruyoruz.',
              'isList': false,
            },
          ],
        },
        'en': {
          'title': 'Needle-Free Anesthesia',
          'subtitle': 'Comfortable Experience in FUE Hair Transplant',
          'sections': [
            {
              'title': 'Needle-Free Anesthesia in FUE Hair Transplant',
              'content': 'Needle-free anesthesia, the fear of feeling pain and discomfort during anesthesia comes first among the concerns of patients in surgical operations.\n\nQuestions about feeling pain and how many times needles will be applied in total are frequently asked by most of our patients researching FUE hair transplantation. Sapphire hair transplantation is performed with needle-free anesthesia using local anesthesia, which means numbing a certain area with medications given through the skin.',
              'isList': false,
            },
            {
              'title': 'How Does Needle-Free Anesthesia Work?',
              'content': 'In sapphire hair transplantation, needle-free anesthesia is performed with advanced technology devices. The entry of anesthetic medications into the tissue is provided by spraying them onto the skin through high air pressure applied by a device placed on the head area.\n\nThen the medication spreads to the tissue through diffusion logic and the blockage of nerves that transmit pain is provided.',
              'isList': false,
            },
            {
              'title': 'Needle-Free Anesthesia is Not Pain-Free Anesthesia',
              'content': 'It should not be forgotten that the reason for feeling pain in local anesthesia application in FUE hair transplantation is the medication itself rather than the applied technique. Therefore, although needle-free anesthesia reduces pain, it is definitely not completely pain-free.\n\nIn scientific studies, patients who received anesthesia with needles and needle-free anesthesia were examined and no difference was detected between the two methods.',
              'isList': false,
            },
            {
              'title': 'Smile Hair and Needle-Free Anesthesia',
              'content': 'In FUE hair transplantation, it is a fact that some pain will be felt when applying local anesthesia. What is important is not a standard application, but a personalized application that takes into account the individual\'s reactions and needs when applying to each patient.\n\nAt Smile Hair Clinic, we take into account the psychological state of patients in all treatments we apply with our expert physicians using the latest technology devices.',
              'isList': false,
            },
          ],
        },
        'ar': {
          'title': 'التخدير بدون إبر',
          'subtitle': 'تجربة مريحة في زراعة الشعر FUE',
          'sections': [
            {
              'title': 'التخدير بدون إبر في زراعة الشعر FUE',
              'content': 'التخدير بدون إبر، يأتي الخوف من الشعور بالألم وعدم الراحة أثناء التخدير في المقام الأول بين مخاوف المرضى في العمليات الجراحية.\n\nالأسئلة حول الشعور بالألم وكم مرة سيتم تطبيق الإبر في المجموع تُطرح علينا بشكل متكرر من قبل معظم مرضانا الذين يبحثون عن زراعة الشعر FUE. يتم إجراء زراعة الشعر بالياقوت مع تخدير بدون إبر باستخدام التخدير الموضعي، مما يعني تخدير منطقة معينة بالأدوية المعطاة من خلال الجلد.',
              'isList': false,
            },
            {
              'title': 'كيف يعمل التخدير بدون إبر؟',
              'content': 'في زراعة الشعر بالياقوت، يتم إجراء التخدير بدون إبر بأجهزة تقنية متقدمة. يتم توفير دخول الأدوية المخدرة إلى الأنسجة عن طريق رشها على الجلد من خلال ضغط الهواء العالي المطبق بواسطة جهاز موضع على منطقة الرأس.\n\nثم ينتشر الدواء إلى الأنسجة من خلال منطق الانتشار ويتم توفير انسداد الأعصاب التي تنقل الألم.',
              'isList': false,
            },
            {
              'title': 'التخدير بدون إبر ليس تخديرًا بدون ألم',
              'content': 'يجب ألا ننسى أن سبب الشعور بالألم في تطبيق التخدير الموضعي في زراعة الشعر FUE هو الدواء نفسه وليس التقنية المطبقة. لذلك، على الرغم من أن التخدير بدون إبر يقلل الألم، إلا أنه بالتأكيد ليس خاليًا تمامًا من الألم.\n\nفي الدراسات العلمية، تم فحص المرضى الذين تلقوا تخديرًا بالإبر وتخديرًا بدون إبر ولم يتم اكتشاف أي فرق بين الطريقتين.',
              'isList': false,
            },
            {
              'title': 'Smile Hair والتخدير بدون إبر',
              'content': 'في زراعة الشعر FUE، من الحقيقة أن بعض الألم سيُشعر به عند تطبيق التخدير الموضعي. المهم ليس التطبيق القياسي، بل التطبيق المخصص الذي يأخذ في الاعتبار ردود فعل الفرد واحتياجاته عند التطبيق على كل مريض.\n\nفي عيادة Smile Hair، نأخذ في الاعتبار الحالة النفسية للمرضى في جميع العلاجات التي نطبقها مع أطبائنا الخبراء باستخدام أحدث الأجهزة التقنية.',
              'isList': false,
            },
          ],
        },
        'de': {
          'title': 'Nadelfreie Anästhesie',
          'subtitle': 'Komfortable Erfahrung bei FUE-Haartransplantation',
          'sections': [
            {
              'title': 'Nadelfreie Anästhesie bei FUE-Haartransplantation',
              'content': 'Nadelfreie Anästhesie, die Angst vor Schmerzen und Unbehagen während der Anästhesie steht bei chirurgischen Eingriffen an erster Stelle der Bedenken der Patienten.\n\nFragen zum Schmerzempfinden und wie oft Nadeln insgesamt angewendet werden, werden uns häufig von den meisten unserer Patienten gestellt, die sich über FUE-Haartransplantation informieren. Die Saphir-Haartransplantation wird mit nadelfreier Anästhesie unter Verwendung einer Lokalanästhesie durchgeführt, was bedeutet, dass ein bestimmter Bereich mit Medikamenten betäubt wird, die durch die Haut verabreicht werden.',
              'isList': false,
            },
            {
              'title': 'Wie funktioniert nadelfreie Anästhesie?',
              'content': 'Bei der Saphir-Haartransplantation wird die nadelfreie Anästhesie mit fortschrittlichen Technologiegeräten durchgeführt. Der Eintritt von Anästhesiemedikamenten in das Gewebe wird durch Besprühen auf die Haut mit hohem Luftdruck gewährleistet, der von einem auf den Kopfbereich platzierten Gerät ausgeübt wird.\n\nDann breitet sich das Medikament durch Diffusionslogik im Gewebe aus und die Blockade der Nerven, die Schmerzen übertragen, wird gewährleistet.',
              'isList': false,
            },
            {
              'title': 'Nadelfreie Anästhesie ist keine schmerzfreie Anästhesie',
              'content': 'Es sollte nicht vergessen werden, dass der Grund für das Schmerzempfinden bei der Lokalanästhesie-Anwendung bei der FUE-Haartransplantation das Medikament selbst und nicht die angewandte Technik ist. Daher ist die nadelfreie Anästhesie zwar schmerzreduzierend, aber definitiv nicht vollständig schmerzfrei.\n\nIn wissenschaftlichen Studien wurden Patienten untersucht, die Anästhesie mit Nadeln und nadelfreie Anästhesie erhielten, und es wurde kein Unterschied zwischen den beiden Methoden festgestellt.',
              'isList': false,
            },
            {
              'title': 'Smile Hair und nadelfreie Anästhesie',
              'content': 'Bei der FUE-Haartransplantation ist es eine Tatsache, dass beim Anwenden der Lokalanästhesie einige Schmerzen zu spüren sein werden. Wichtig ist nicht eine Standardanwendung, sondern eine personalisierte Anwendung, die die Reaktionen und Bedürfnisse des Einzelnen bei der Anwendung auf jeden Patienten berücksichtigt.\n\nIn der Smile Hair Clinic berücksichtigen wir den psychologischen Zustand der Patienten bei allen Behandlungen, die wir mit unseren Expertenärzten unter Verwendung der neuesten Technologiegeräte durchführen.',
              'isList': false,
            },
          ],
        },
        'es': {
          'title': 'Anestesia sin Agujas',
          'subtitle': 'Experiencia Cómoda en Trasplante de Cabello FUE',
          'sections': [
            {
              'title': 'Anestesia sin Agujas en Trasplante de Cabello FUE',
              'content': 'Anestesia sin agujas, el miedo a sentir dolor y malestar durante la anestesia viene primero entre las preocupaciones de los pacientes en operaciones quirúrgicas.\n\nLas preguntas sobre sentir dolor y cuántas veces se aplicarán agujas en total son frecuentemente preguntadas por la mayoría de nuestros pacientes que investigan sobre trasplante de cabello FUE. El trasplante de cabello con zafiro se realiza con anestesia sin agujas usando anestesia local, lo que significa adormecer un área determinada con medicamentos administrados a través de la piel.',
              'isList': false,
            },
            {
              'title': '¿Cómo Funciona la Anestesia sin Agujas?',
              'content': 'En el trasplante de cabello con zafiro, la anestesia sin agujas se realiza con dispositivos de tecnología avanzada. La entrada de medicamentos anestésicos al tejido se proporciona rociándolos sobre la piel a través de alta presión de aire aplicada por un dispositivo colocado en el área de la cabeza.\n\nLuego el medicamento se extiende al tejido a través de la lógica de difusión y se proporciona el bloqueo de los nervios que transmiten el dolor.',
              'isList': false,
            },
            {
              'title': 'Anestesia sin Agujas No Es Anestesia sin Dolor',
              'content': 'No se debe olvidar que la razón de sentir dolor en la aplicación de anestesia local en el trasplante de cabello FUE es el medicamento en sí más que la técnica aplicada. Por lo tanto, aunque la anestesia sin agujas reduce el dolor, definitivamente no es completamente libre de dolor.\n\nEn estudios científicos, se examinaron pacientes que recibieron anestesia con agujas y anestesia sin agujas y no se detectó ninguna diferencia entre los dos métodos.',
              'isList': false,
            },
            {
              'title': 'Smile Hair y Anestesia sin Agujas',
              'content': 'En el trasplante de cabello FUE, es un hecho que se sentirá algo de dolor al aplicar la anestesia local. Lo importante no es una aplicación estándar, sino una aplicación personalizada que tenga en cuenta las reacciones y necesidades del individuo al aplicar a cada paciente.\n\nEn Smile Hair Clinic, tenemos en cuenta el estado psicológico de los pacientes en todos los tratamientos que aplicamos con nuestros médicos expertos utilizando los últimos dispositivos tecnológicos.',
              'isList': false,
            },
          ],
        },
        'fr': {
          'title': 'Anesthésie sans aiguille',
          'subtitle': 'Expérience confortable dans la greffe de cheveux FUE',
          'sections': [
            {
              'title': 'Anesthésie sans aiguille dans la greffe de cheveux FUE',
              'content': 'Anesthésie sans aiguille, la peur de ressentir de la douleur et de l\'inconfort pendant l\'anesthésie vient en premier parmi les préoccupations des patients lors des opérations chirurgicales.\n\nLes questions sur la sensation de douleur et combien de fois les aiguilles seront appliquées au total sont fréquemment posées par la plupart de nos patients qui recherchent la greffe de cheveux FUE. La greffe de cheveux saphir est effectuée avec une anesthésie sans aiguille en utilisant une anesthésie locale, ce qui signifie engourdir une certaine zone avec des médicaments administrés à travers la peau.',
              'isList': false,
            },
            {
              'title': 'Comment fonctionne l\'anesthésie sans aiguille?',
              'content': 'Dans la greffe de cheveux saphir, l\'anesthésie sans aiguille est effectuée avec des dispositifs de technologie avancée. L\'entrée des médicaments anesthésiques dans les tissus est fournie en les pulvérisant sur la peau à travers une haute pression d\'air appliquée par un dispositif placé sur la zone de la tête.\n\nEnsuite, le médicament se propage aux tissus à travers la logique de diffusion et le blocage des nerfs qui transmettent la douleur est fourni.',
              'isList': false,
            },
            {
              'title': 'L\'anesthésie sans aiguille n\'est pas une anesthésie sans douleur',
              'content': 'Il ne faut pas oublier que la raison de ressentir de la douleur dans l\'application de l\'anesthésie locale dans la greffe de cheveux FUE est le médicament lui-même plutôt que la technique appliquée. Par conséquent, bien que l\'anesthésie sans aiguille réduise la douleur, elle n\'est définitivement pas complètement sans douleur.\n\nDans les études scientifiques, les patients qui ont reçu une anesthésie avec des aiguilles et une anesthésie sans aiguille ont été examinés et aucune différence n\'a été détectée entre les deux méthodes.',
              'isList': false,
            },
            {
              'title': 'Smile Hair et anesthésie sans aiguille',
              'content': 'Dans la greffe de cheveux FUE, c\'est un fait qu\'une certaine douleur sera ressentie lors de l\'application de l\'anesthésie locale. Ce qui est important n\'est pas une application standard, mais une application personnalisée qui prend en compte les réactions et les besoins de l\'individu lors de l\'application à chaque patient.\n\nÀ la clinique Smile Hair, nous tenons compte de l\'état psychologique des patients dans tous les traitements que nous appliquons avec nos médecins experts en utilisant les derniers dispositifs technologiques.',
              'isList': false,
            },
          ],
        },
        'it': {
          'title': 'Anestesia senza aghi',
          'subtitle': 'Esperienza confortevole nel trapianto di capelli FUE',
          'sections': [
            {
              'title': 'Anestesia senza aghi nel trapianto di capelli FUE',
              'content': 'Anestesia senza aghi, la paura di provare dolore e disagio durante l\'anestesia viene prima tra le preoccupazioni dei pazienti nelle operazioni chirurgiche.\n\nLe domande sul provare dolore e quante volte verranno applicati gli aghi in totale ci vengono poste frequentemente dalla maggior parte dei nostri pazienti che ricercano il trapianto di capelli FUE. Il trapianto di capelli zaffiro viene eseguito con anestesia senza aghi utilizzando anestesia locale, il che significa intorpidire una certa area con farmaci somministrati attraverso la pelle.',
              'isList': false,
            },
            {
              'title': 'Come funziona l\'anestesia senza aghi?',
              'content': 'Nel trapianto di capelli zaffiro, l\'anestesia senza aghi viene eseguita con dispositivi tecnologici avanzati. L\'ingresso dei farmaci anestetici nel tessuto viene fornito spruzzandoli sulla pelle attraverso alta pressione dell\'aria applicata da un dispositivo posizionato sull\'area della testa.\n\nQuindi il farmaco si diffonde al tessuto attraverso la logica di diffusione e viene fornito il blocco dei nervi che trasmettono il dolore.',
              'isList': false,
            },
            {
              'title': 'L\'anestesia senza aghi non è anestesia senza dolore',
              'content': 'Non bisogna dimenticare che la ragione per provare dolore nell\'applicazione dell\'anestesia locale nel trapianto di capelli FUE è il farmaco stesso piuttosto che la tecnica applicata. Pertanto, sebbene l\'anestesia senza aghi riduca il dolore, non è assolutamente completamente senza dolore.\n\nNegli studi scientifici, i pazienti che hanno ricevuto anestesia con aghi e anestesia senza aghi sono stati esaminati e non è stata rilevata alcuna differenza tra i due metodi.',
              'isList': false,
            },
            {
              'title': 'Smile Hair e anestesia senza aghi',
              'content': 'Nel trapianto di capelli FUE, è un fatto che si sentirà un certo dolore quando si applica l\'anestesia locale. Ciò che è importante non è un\'applicazione standard, ma un\'applicazione personalizzata che tenga conto delle reazioni e delle esigenze dell\'individuo quando si applica a ogni paziente.\n\nPresso la Smile Hair Clinic, teniamo conto dello stato psicologico dei pazienti in tutti i trattamenti che applichiamo con i nostri medici esperti utilizzando i più recenti dispositivi tecnologici.',
              'isList': false,
            },
          ],
        },
        'pt': {
          'title': 'Anestesia sem Agulhas',
          'subtitle': 'Experiência Confortável no Transplante de Cabelo FUE',
          'sections': [
            {
              'title': 'Anestesia sem Agulhas no Transplante de Cabelo FUE',
              'content': 'Anestesia sem agulhas, o medo de sentir dor e desconforto durante a anestesia vem em primeiro lugar entre as preocupações dos pacientes em operações cirúrgicas.\n\nPerguntas sobre sentir dor e quantas vezes as agulhas serão aplicadas no total são frequentemente feitas pela maioria de nossos pacientes que pesquisam sobre transplante de cabelo FUE. O transplante de cabelo safira é realizado com anestesia sem agulhas usando anestesia local, o que significa entorpecer uma certa área com medicamentos administrados através da pele.',
              'isList': false,
            },
            {
              'title': 'Como Funciona a Anestesia sem Agulhas?',
              'content': 'No transplante de cabelo safira, a anestesia sem agulhas é realizada com dispositivos de tecnologia avançada. A entrada de medicamentos anestésicos no tecido é fornecida pulverizando-os na pele através de alta pressão de ar aplicada por um dispositivo colocado na área da cabeça.\n\nEm seguida, o medicamento se espalha para o tecido através da lógica de difusão e o bloqueio dos nervos que transmitem a dor é fornecido.',
              'isList': false,
            },
            {
              'title': 'Anestesia sem Agulhas Não É Anestesia sem Dor',
              'content': 'Não se deve esquecer que a razão para sentir dor na aplicação de anestesia local no transplante de cabelo FUE é o medicamento em si, em vez da técnica aplicada. Portanto, embora a anestesia sem agulhas reduza a dor, definitivamente não é completamente livre de dor.\n\nEm estudos científicos, pacientes que receberam anestesia com agulhas e anestesia sem agulhas foram examinados e nenhuma diferença foi detectada entre os dois métodos.',
              'isList': false,
            },
            {
              'title': 'Smile Hair e Anestesia sem Agulhas',
              'content': 'No transplante de cabelo FUE, é um fato que alguma dor será sentida ao aplicar anestesia local. O importante não é uma aplicação padrão, mas uma aplicação personalizada que leve em conta as reações e necessidades do indivíduo ao aplicar a cada paciente.\n\nNa Smile Hair Clinic, levamos em conta o estado psicológico dos pacientes em todos os tratamentos que aplicamos com nossos médicos especialistas usando os mais recentes dispositivos tecnológicos.',
              'isList': false,
            },
          ],
        },
        'ru': {
          'title': 'Анестезия без игл',
          'subtitle': 'Комфортный опыт при пересадке волос FUE',
          'sections': [
            {
              'title': 'Анестезия без игл при пересадке волос FUE',
              'content': 'Анестезия без игл, страх почувствовать боль и дискомфорт во время анестезии стоит на первом месте среди опасений пациентов при хирургических операциях.\n\nВопросы о чувстве боли и сколько раз будут применены иглы в общей сложности часто задаются большинством наших пациентов, исследующих пересадку волос FUE. Пересадка волос сапфиром выполняется с анестезией без игл с использованием местной анестезии, что означает онемение определенной области лекарствами, вводимыми через кожу.',
              'isList': false,
            },
            {
              'title': 'Как работает анестезия без игл?',
              'content': 'При пересадке волос сапфиром анестезия без игл выполняется с помощью передовых технологических устройств. Поступление анестезирующих препаратов в ткани обеспечивается распылением их на кожу через высокое давление воздуха, прикладываемое устройством, размещенным на области головы.\n\nЗатем препарат распространяется в ткани через логику диффузии и обеспечивается блокировка нервов, передающих боль.',
              'isList': false,
            },
            {
              'title': 'Анестезия без игл - это не анестезия без боли',
              'content': 'Не следует забывать, что причина чувства боли при применении местной анестезии при пересадке волос FUE - это само лекарство, а не применяемая техника. Поэтому, хотя анестезия без игл уменьшает боль, она определенно не полностью безболезненна.\n\nВ научных исследованиях были изучены пациенты, получившие анестезию с иглами и анестезию без игл, и не было обнаружено различий между двумя методами.',
              'isList': false,
            },
            {
              'title': 'Smile Hair и анестезия без игл',
              'content': 'При пересадке волос FUE это факт, что некоторая боль будет ощущаться при применении местной анестезии. Важно не стандартное применение, а персонализированное применение, которое учитывает реакции и потребности человека при применении к каждому пациенту.\n\nВ клинике Smile Hair мы учитываем психологическое состояние пациентов во всех процедурах, которые мы применяем с нашими опытными врачами, используя новейшие технологические устройства.',
              'isList': false,
            },
          ],
        },
        'he': {
          'title': 'הרדמה ללא מחטים',
          'subtitle': 'חוויה נוחה בהשתלת שיער FUE',
          'sections': [
            {
              'title': 'הרדמה ללא מחטים בהשתלת שיער FUE',
              'content': 'הרדמה ללא מחטים, הפחד להרגיש כאב ואי נוחות במהלך ההרדמה מגיע ראשון בין החששות של מטופלים בניתוחים כירורגיים.\n\nשאלות על הרגשת כאב וכמה פעמים יוחלו מחטים בסך הכל נשאלות לעתים קרובות על ידי רוב המטופלים שלנו החוקרים השתלת שיער FUE. השתלת שיער ספיר מבוצעת עם הרדמה ללא מחטים באמצעות הרדמה מקומית, מה שאומר הרדמת אזור מסוים עם תרופות הניתנות דרך העור.',
              'isList': false,
            },
            {
              'title': 'איך עובדת הרדמה ללא מחטים?',
              'content': 'בהשתלת שיער ספיר, הרדמה ללא מחטים מבוצעת עם מכשירי טכנולוגיה מתקדמים. הכניסה של תרופות הרדמה לרקמה מסופקת על ידי ריסוס על העור דרך לחץ אוויר גבוה המוחל על ידי מכשיר המוצב על אזור הראש.\n\nאז התרופה מתפשטת לרקמה דרך לוגיקת דיפוזיה וחסימת העצבים המעבירים כאב מסופקת.',
              'isList': false,
            },
            {
              'title': 'הרדמה ללא מחטים אינה הרדמה ללא כאב',
              'content': 'לא צריך לשכוח שהסיבה להרגשת כאב ביישום הרדמה מקומית בהשתלת שיער FUE היא התרופה עצמה ולא הטכניקה המוחלת. לכן, למרות שהרדמה ללא מחטים מפחיתה כאב, היא בהחלט לא לחלוטין ללא כאב.\n\nבמחקרים מדעיים, מטופלים שקיבלו הרדמה עם מחטים והרדמה ללא מחטים נבדקו ולא נמצא הבדל בין שתי השיטות.',
              'isList': false,
            },
            {
              'title': 'Smile Hair והרדמה ללא מחטים',
              'content': 'בהשתלת שיער FUE, זו עובדה שכאב מסוים יורגש בעת החלת הרדמה מקומית. מה שחשוב הוא לא יישום סטנדרטי, אלא יישום מותאם אישית שלוקח בחשבון את התגובות והצרכים של הפרט בעת החלה על כל מטופל.\n\nבמרפאת Smile Hair, אנו לוקחים בחשבון את המצב הפסיכולוגי של המטופלים בכל הטיפולים שאנו מיישמים עם הרופאים המומחים שלנו באמצעות מכשירי הטכנולוגיה האחרונים.',
              'isList': false,
            },
          ],
        },
        'sq': {
          'title': 'Anestezi pa Gjilpëra',
          'subtitle': 'Përvojë e Rehatshme në Transplantimin e Flokëve FUE',
          'sections': [
            {
              'title': 'Anestezi pa Gjilpëra në Transplantimin e Flokëve FUE',
              'content': 'Anestezi pa gjilpëra, frika për të ndjerë dhimbje dhe shqetësim gjatë anestezisë vjen e para midis shqetësimeve të pacientëve në operacionet kirurgjikale.\n\nPyetjet për të ndjerë dhimbje dhe sa herë do të aplikohen gjilpërat në total na bëhen shpesh nga shumica e pacientëve tanë që kërkojnë transplantimin e flokëve FUE. Transplantimi i flokëve safir kryhet me anestezi pa gjilpëra duke përdorur anestezi lokale, që do të thotë të mpirë një zonë të caktuar me ilaçe të dhëna përmes lëkurës.',
              'isList': false,
            },
            {
              'title': 'Si Funksionon Anestezi pa Gjilpëra?',
              'content': 'Në transplantimin e flokëve safir, anestezi pa gjilpëra kryhet me pajisje teknologjike të avancuara. Hyrja e ilaçeve anestezikë në ind sigurohet duke i spërkatur në lëkurë përmes presionit të lartë të ajrit të aplikuar nga një pajisje e vendosur në zonën e kokës.\n\nPastaj ilaçi përhapet në ind përmes logjikës së difuzionit dhe bllokimi i nervave që transmetojnë dhimbje sigurohet.',
              'isList': false,
            },
            {
              'title': 'Anestezi pa Gjilpëra Nuk Është Anestezi pa Dhimbje',
              'content': 'Nuk duhet harruar se arsyeja për të ndjerë dhimbje në aplikimin e anestezisë lokale në transplantimin e flokëve FUE është vetë ilaçi dhe jo teknika e aplikuar. Prandaj, megjithëse anestezi pa gjilpëra zvogëlon dhimbjen, definitivisht nuk është plotësisht pa dhimbje.\n\nNë studimet shkencore, pacientët që morën anestezi me gjilpëra dhe anestezi pa gjilpëra u ekzaminuan dhe nuk u zbulua ndonjë ndryshim midis dy metodave.',
              'isList': false,
            },
            {
              'title': 'Smile Hair dhe Anestezi pa Gjilpëra',
              'content': 'Në transplantimin e flokëve FUE, është një fakt që do të ndihet një dhimbje e caktuar kur aplikoni anestezi lokale. Ajo që është e rëndësishme nuk është një aplikim standard, por një aplikim i personalizuar që merr parasysh reagimet dhe nevojat e individit kur aplikon për çdo pacient.\n\nNë Klinikën Smile Hair, marrim parasysh gjendjen psikologjike të pacientëve në të gjitha trajtimet që aplikojmë me mjekët tanë ekspertë duke përdorur pajisjet më të fundit teknologjike.',
              'isList': false,
            },
          ],
        },
      },
      'vucut-kili-sac-ekimi': {
        'tr': {
          'title': 'Vücut Kılı Saç Ekimi',
          'subtitle': 'Alternatif Donör Bölge Çözümü',
          'sections': [
            {
              'title': 'Vücut Kılı Saç Ekimi Nedir?',
              'content': 'Vücut Kılı Saç Ekimi; Saç ekimi, greft olarak adlandırılan ve içinde saç kökleri bulunan yapıların başın arka bölgesinden alınması ve saç ekimi yapılacak bölgeye nakledilmesi yoluyla uygulanır.\n\nSaç kaybının yoğun olduğu bazı kişilerde başın arka bölümünde/donör alanda istenilen kadar greft alımı için yeterli saç yoğunluğu bulunmayabilir. Bu noktada Vücut Kılı saç ekimi yöntemi uygulanır; bu yöntem, naklin kişinin göğüs ya da sırt bölgesinden, sakalından alınan köklerle gerçekleştirilmesini içerir.',
              'isList': false,
            },
            {
              'title': 'Vücut Kılı Saç Ekimi Nasıl Yapılır?',
              'content': 'Vücut Kılı saç ekimi tekniği normal Fue saç ekimi ile aynıdır. Alım yapılacak bölgeye lokal anestezi uygulanır. Normal donör bölgeden yapılan alım işlemine göre süre daha kısadır.\n\nEkim işlemi sırasında vücuttan alınan greftlerin donör bölgeden Mikro Fue yöntemi ile alınmış greftlerin arasına dağıtılması önemlidir.',
              'isList': false,
            },
            {
              'title': 'Vücut Kıllarının Özellikleri',
              'content': 'Vücudumuzun çeşitli bölgelerinde çok çeşitli yapıda ve dokuda kıllar mevcuttur. Saça en yakın kıllar sakalda bulunur, genelde tekli kök yapısı barındırsalar da çok çabuk ve saç kadar çok uzayabilirler.\n\nBu sebeple vücut kılı saç ekiminde ilk tercih edilen sakaldan alınan kılların naklidir ve düzgün bir planlama ile başarılı sonuçlar alınabilir.',
              'isList': false,
            },
            {
              'title': 'Vücut Kılı Saç Ekimi Kimlere Yapılır?',
              'content': '• Başın arka bölümünün donör bölge olarak yetersiz kaldığı kişilerde\n• Vücudun başka bölgelerinden alınan kıllarla yeterli yoğunluğa ulaşılabileceği düşünülen durumlarda\n• Kılların yoğunluğu iyi ve dokusu saç dokusuna yakın olan kişilerde',
              'isList': true,
            },
            {
              'title': 'Smile Hair\'da Vücut Kılı Saç Ekimi',
              'content': 'Smile Hair Klinik, hastaya gerçekçi sonuçlar vadeder. Hastalar greft sayıları ve alınacak sonuç konusunda yanıltılmaz. Saç ekimi operasyonundan önce hekimler tarafından saç ekimi planlaması yapılmaktadır.\n\nSmile Hair Clinic saç ekim cerrahları vücut kılı ekimine karar vermek için normal donör alandan alınan greft sayısını bekler ve tüm operasyona hastanın ihtiyacı olduğu şekilde yön verir.',
              'isList': false,
            },
          ],
        },
        'en': {
          'title': 'Body Hair Transplant',
          'subtitle': 'Alternative Donor Area Solution',
          'sections': [
            {
              'title': 'What is Body Hair Transplant?',
              'content': 'Body Hair Transplant; Hair transplantation is performed by taking structures called grafts containing hair follicles from the back of the head and transplanting them to the area where hair transplantation will be performed.\n\nIn some people with intense hair loss, there may not be sufficient hair density in the back of the head/donor area to obtain the desired number of grafts. At this point, the Body Hair transplantation method is applied; this method involves performing the transplant with roots taken from the person\'s chest or back area, or beard.',
              'isList': false,
            },
            {
              'title': 'How is Body Hair Transplant Performed?',
              'content': 'Body Hair hair transplantation technique is the same as normal FUE hair transplantation. Local anesthesia is applied to the area where extraction will be performed. The duration is shorter compared to the extraction process from the normal donor area.\n\nDuring the transplantation process, it is important to distribute the grafts taken from the body among the grafts taken from the donor area by the Micro FUE method.',
              'isList': false,
            },
            {
              'title': 'Characteristics of Body Hair',
              'content': 'There are hairs of very different structures and textures in various parts of our body. The hairs closest to hair are found in the beard, and although they usually contain a single root structure, they can grow very quickly and as long as hair.\n\nFor this reason, the first choice in body hair transplantation is the transplantation of hairs taken from the beard, and successful results can be achieved with proper planning.',
              'isList': false,
            },
            {
              'title': 'Who is Body Hair Transplant Performed For?',
              'content': '• People whose back of the head is insufficient as a donor area\n• Situations where sufficient density can be achieved with hairs taken from other parts of the body\n• People whose hair density is good and texture is close to hair texture',
              'isList': true,
            },
            {
              'title': 'Body Hair Transplant at Smile Hair',
              'content': 'Smile Hair Clinic promises realistic results to the patient. Patients are not misled about the number of grafts and the results to be obtained. Hair transplantation planning is done by physicians before the hair transplantation operation.\n\nSmile Hair Clinic hair transplant surgeons wait for the number of grafts taken from the normal donor area to decide on body hair transplantation and direct the entire operation according to the patient\'s needs.',
              'isList': false,
            },
          ],
        },
      },
      'manuel-fue': {
        'tr': {
          'title': 'Manuel FUE Saç Ekimi',
          'subtitle': 'Geleneksel ve Kontrollü Yöntem',
          'sections': [
            {
              'title': 'Manuel FUE Saç Ekimi Nedir?',
              'content': 'Manuel Fue Saç Ekimi, greftlerin tek tek çıkarılarak yapıldığı saç ekimlerinde uygulanan ilk tekniktir. Şu anda kullanılan tüm FUE saç ekimi tekniklerinin atası olarak adlandırılabilir.\n\nDonör bölgeden bir miktar cildin çıkartılarak yapıldığı ve donör bölgeyi yatay olarak boydan boya kesen bariz dikiş izi kalan FUT yöntemine alternatif olarak geliştirilmiştir.',
              'isList': false,
            },
            {
              'title': 'Mikro FUE Saç Ekimi',
              'content': 'Mikro FUE saç ekimi, özelleşmiş motorlar kullanılarak gerçekleştirilen tekniktir. Bu teknikte punchlar, mikro motora bağlı piyasemenin ucuna yerleştirilir. Dönme hızı ve yönü motor üzerinden ayarlanabilir.\n\nDünyada en sık kullanılan tekniktir, başka bir yöntem tercih etmediğiniz sürece FUE saç ekimi gerçekleştiren klinikler greftlerinizi bu teknikle nakledecektir.',
              'isList': false,
            },
            {
              'title': 'Manuel FUE vs Mikro FUE',
              'content': 'Manuel FUE:\n• Daha yavaş ve kontrollü\n• Alınan greftler daha az zarar görür\n• Donör bölgesinin daha az zarar görmesi\n• Daha az sayıda greft nakli\n\nMikro FUE:\n• Daha hızlı işlem\n• Tek seansta yüksek greft sayıları\n• Çok daha az maliyetli\n• Kolay bulunabilir',
              'isList': true,
            },
            {
              'title': 'En İyi Saç Ekimi',
              'content': 'En iyi saç ekimi size özel yöntemin FUE saç ekimi cerrahınız tarafından seçilmesi, olası bütün sonuçların tarafınıza anlatılarak oluşabilecek hayal kırıklığınızın önüne geçilmesi ve bu yönde size özel detaylı planlamanın yapılmasıdır.\n\nFUE saç ekimi aynaya baktığınızda kendinizi mutlu hissetmeniz için yaptırdığınız bir işlemdir.',
              'isList': false,
            },
            {
              'title': 'Smile Hair Klinikte Manuel Fue',
              'content': 'Smile Hair Klinik cerrahları tercih etmeniz durumunda ve belirli bir sayıda greftin sizin ihtiyacınızı karşılayabileceğini düşündükleri durumda saç ekim işleminizi manuel FUE ile gerçekleştirebilirler.\n\nKliniğimizde saç ekimi yaptırmak isteyen her bir kişiye göre operasyon öncesi özel planlama yapılır.',
              'isList': false,
            },
          ],
        },
        'en': {
          'title': 'Manual FUE Hair Transplant',
          'subtitle': 'Traditional and Controlled Method',
          'sections': [
            {
              'title': 'What is Manual FUE Hair Transplant?',
              'content': 'Manual FUE Hair Transplant is the first technique applied in hair transplants performed by extracting grafts one by one. It can be called the ancestor of all FUE hair transplantation techniques currently used.\n\nIt was developed as an alternative to the FUT method, in which a piece of skin is removed from the donor area and leaves an obvious stitch mark that cuts the donor area horizontally from end to end.',
              'isList': false,
            },
            {
              'title': 'Micro FUE Hair Transplant',
              'content': 'Micro FUE hair transplantation is a technique performed using specialized motors. In this technique, punches are placed at the tip of the punch connected to the micro motor. Rotation speed and direction can be adjusted from the motor.\n\nIt is the most commonly used technique in the world, and clinics that perform FUE hair transplantation will transplant your grafts with this technique unless you prefer another method.',
              'isList': false,
            },
            {
              'title': 'Manual FUE vs Micro FUE',
              'content': 'Manual FUE:\n• Slower and controlled\n• Extracted grafts suffer less damage\n• Less damage to the donor area\n• Fewer graft transplants\n\nMicro FUE:\n• Faster process\n• High graft numbers in a single session\n• Much less costly\n• Easily available',
              'isList': true,
            },
            {
              'title': 'Best Hair Transplant',
              'content': 'The best hair transplantation is the selection of the method specific to you by your FUE hair transplant surgeon, explaining all possible results to prevent possible disappointment, and making detailed planning specific to you in this direction.\n\nFUE hair transplantation is a procedure you have done to feel happy when you look in the mirror.',
              'isList': false,
            },
            {
              'title': 'Manual FUE at Smile Hair Clinic',
              'content': 'Smile Hair Clinic surgeons can perform your hair transplantation procedure with manual FUE if you prefer and if they think a certain number of grafts can meet your needs.\n\nIn our clinic, special pre-operation planning is made for each person who wants to have a hair transplant.',
              'isList': false,
            },
          ],
        },
      },
      'dhi-sac-ekimi': {
        'tr': {
          'title': 'DHI Saç Ekimi',
          'subtitle': 'Doğrudan Saç İmplantasyonu',
          'sections': [
            {
              'title': 'DHI Saç Ekimi Nedir?',
              'content': 'DHI Saç Ekimi işlemi günümüzde saç ekimi operasyonu olmak isteyen potansiyel hastalar tarafından en çok araştırılan ve ilgi gören ekim yöntemlerinden bir tanesidir.\n\nDonör bölgesinden Mikro FUE saç ekimi yöntemi ile alınan greftler klasik mikro insizyon, kanal açılımı yapılmadan direkt olarak saç ekimi yapılacak bölgeye direkt olarak nakil edilebilmektedir.',
              'isList': false,
            },
            {
              'title': 'DHI Saç Ekimi Nasıl Yapılır?',
              'content': 'DHI Saç Ekimi Smile Hair Clinic\'te, follicular unit extraction=FUE tekniği ile alınan greftlerin özellikli bir kalem(implanter pen) kullanılarak ekim yapılmak istenilen alana transferi ile gerçekleştirilir.\n\nDhi saç ekiminde kanal açılmaz, greftin çinde bulunduğu kalemin ucunun cilde penetrasyonundan sonra greftin cildin içine kaydırılması ile ekim işlemi tamamlanmış olur.',
              'isList': false,
            },
            {
              'title': 'DHI Saç Ekimi Operasyonu Kimlere Uygulanır?',
              'content': 'DHI saç ekimi saç ektirmek isteyen herkese uygulanabilir. Traş olmadan ekim yaptırmak isteyen hastalar öncelikle Dhi tekniğini düşünebilir.\n\nDiğer teknikler ile yapılan saç ekimlerinde daha yüksek greft sayıları ile çalışılabilir; bu bakımdan hastanın ihtiyacı olacak greft sayısı Dhi düşünülen hastalarda göz önünde bulundurulmalı ve işlemi yapacak cerrah ile birlikte karar verilmelidir.',
              'isList': false,
            },
            {
              'title': 'DHI da kullanılan kalemlerin özellikleri',
              'content': 'DHI saç ekiminde kullanılan kalemlerin içi boştur ve bir yaylı mekanizmaya sahiptir. Bu yaylı mekanizma, gerildikten sonra basıldığında ucu iter ve cildi delerek grefti içine bırakır.\n\nBu kalemler ilk önce ince telli saçlar için geliştirilmiş olsa da daha sonra kalın telli saçlar için de özelleştirilmiş kalemler piyasaya sürülmüştür.',
              'isList': false,
            },
            {
              'title': 'DHI Saç Ekiminin Artıları ve Eksileri',
              'content': 'Artıları:\n• Daha az kanama olur\n• Traşsız ekim mümkün\n• Yara iyileşmesi birkaç gün daha erken\n• Saçlara açı ve yön vermek daha kolay\n\nEksileri:\n• 3000\'den fazla greft için diğer yöntemler daha başarılı\n• Özellikli materyaller kullanıldığı için daha maliyetli',
              'isList': true,
            },
            {
              'title': 'DHI mi daha iyi FUE mi?',
              'content': 'Hangi yöntemin daha iyi olduğu, kişinin ihtiyaçlarına, saç dökülmesinin derecesine ve beklediği sonuçlara bağlıdır. Her iki yöntem de etkili sonuçlar sağlar, ancak farklı avantajlar sunar.\n\nEn iyi sonuçlar için, bir saç ekim uzmanına danışılması ve kişisel ihtiyaçlara uygun en uygun yöntemin seçilmesi önerilir.',
              'isList': false,
            },
          ],
        },
        'en': {
          'title': 'DHI Hair Transplant',
          'subtitle': 'Direct Hair Implantation',
          'sections': [
            {
              'title': 'What is DHI Hair Transplant?',
              'content': 'DHI Hair Transplant procedure is one of the most researched and popular transplantation methods by potential patients who want to have a hair transplant operation today.\n\nGrafts taken from the donor area by the Micro FUE hair transplantation method can be directly transplanted to the area where hair transplantation will be performed without making classic micro incisions or opening channels.',
              'isList': false,
            },
            {
              'title': 'How is DHI Hair Transplant Performed?',
              'content': 'DHI Hair Transplant is performed at Smile Hair Clinic by transferring grafts taken with the follicular unit extraction=FUE technique to the area where transplantation is desired using a special pen (implanter pen).\n\nIn DHI hair transplantation, no channel is opened, and the transplantation process is completed by sliding the graft into the skin after the tip of the pen containing the graft penetrates the skin.',
              'isList': false,
            },
            {
              'title': 'Who is DHI Hair Transplant Operation Applied To?',
              'content': 'DHI hair transplantation can be applied to anyone who wants to have a hair transplant. Patients who want to have a transplant without shaving can primarily consider the DHI technique.\n\nIn hair transplants performed with other techniques, higher graft numbers can be worked with; in this respect, the number of grafts the patient will need should be considered in patients considering DHI and should be decided together with the surgeon who will perform the procedure.',
              'isList': false,
            },
            {
              'title': 'Characteristics of Pens Used in DHI',
              'content': 'The pens used in DHI hair transplantation are hollow and have a spring mechanism. This spring mechanism, when pressed after being stretched, pushes the tip and pierces the skin, leaving the graft inside.\n\nAlthough these pens were first developed for fine-haired hair, specialized pens for thick-haired hair have also been released to the market.',
              'isList': false,
            },
            {
              'title': 'Advantages and Disadvantages of DHI Hair Transplant',
              'content': 'Advantages:\n• Less bleeding occurs\n• Unshaven transplantation is possible\n• Wound healing is a few days earlier\n• It is easier to give angle and direction to hair\n\nDisadvantages:\n• Other methods are more successful for more than 3000 grafts\n• More costly because special materials are used',
              'isList': true,
            },
            {
              'title': 'Is DHI Better or FUE?',
              'content': 'Which method is better depends on the person\'s needs, the degree of hair loss, and the expected results. Both methods provide effective results but offer different advantages.\n\nFor the best results, it is recommended to consult a hair transplant specialist and choose the most suitable method according to personal needs.',
              'isList': false,
            },
          ],
        },
      },
      'safir-sac-ekimi': {
        'tr': {
          'title': 'Safir Saç Ekimi',
          'subtitle': 'En Gelişmiş FUE Tekniği',
          'sections': [
            {
              'title': 'Safir Saç Ekimi Nedir?',
              'content': 'Safir saç ekimi, kanallar açılırken son teknoloji safir bıçakların kullanıldığı fue saç ekimine verilen isimdir.',
              'isList': false,
            },
            {
              'title': 'Safir Bıçak Nedir?',
              'content': 'Yaygın kanının aksine safir bıçaklar doğada bulunan mavi renkli safir taşından üretilmez. Safir bıçaklar, sentetik safirden (Al2O3 = alüminyum oksitten üretilir) olan tek bir kristalden yapılır; bu madde normal çelikten yüzlerce kat daha serttir, bu sebeple keskinliklerini uzun süre muhafaza ederler.\n\nSafir kristaller özel makinalarda üretimin her aşaması kontrol edilerek kusursuz bıçaklar haline getirilir.',
              'isList': false,
            },
            {
              'title': 'Safir Saç Ekimi Nasıl Uygulanır?',
              'content': 'Safir saç ekiminde transfer edilecek saçlar öncelikle mikro fue yöntemi ile kişinin donör bölgesinden mikromotor kullanılarak alınır.\n\nMikromotorların kullanımı, manuel punch kullanılarak yapılan alıma göre donör alandan daha fazla sayıda greftin daha kısa sürede alınmasına imkan tanıyarak safir saç ekimi sonuçlarının daha sık ve daha doğal olmasını mümkün kılar.',
              'isList': false,
            },
            {
              'title': 'Safir Saç Ekimi Avantajları',
              'content': '• Safir bıçakların yüzeyi sert ve pürüzsüzdür\n• Doku zedelenmesi daha azdır\n• Hızlı iyileşme sağlar\n• Daha sık insizyon yapma olanağı verir\n• Doğal sonuç alınmasını sağlar\n• Metal alerjisi riski yoktur\n• Enfeksiyon riski azalır',
              'isList': true,
            },
            {
              'title': 'Safir Saç Ekimi Öncesi Neler Yapılmalıdır?',
              'content': 'Varsa en ufak bir sağlık sorunu ya da kullanılan ilaçlar belirtilmelidir. Doktorun önerisi dahilinde kişiye göre sigara ve alkol alımını bir hafta öncesinden bırakması gerekebilir.\n\nKan sulandırıcı kullanılıyorsa bir hafta öncesinde bırakılması gerekir. Minoxidil kullanıyorsanız bir hafta öncesinden bırakılmalıdır.',
              'isList': false,
            },
            {
              'title': 'Safir Saç Ekimi Sonrası Neler Yapılmalıdır?',
              'content': 'Her ne kadar bahsedilmesi gereksiz gibi gelse de hastaların 10 gün boyunca kafalarını çarpmaktan veya bir yüzeye sürtmekten kaçınmaları gerekmektedir.\n\n15 gün boyunca aşırı terlemeyi önlemek gerekir. Kliniğimiz safir fue saç ekimi sonrası bir ay boyunca ağır kardiyak egzersizlerin, sauna ve hamam gibi ıslak alanların kullanımının ve yüzme aktivitelerinin kısıtlanmasını önermektedir.',
              'isList': false,
            },
            {
              'title': 'Safir Saç Ekimi Neden Önemlidir?',
              'content': 'Safir saç ekimi kullanılan bıçakların son teknoloji olup, daha sık, daha sabit insizyonlar (kanallar) yapılmasına olanak verir. Bu sebeple safir saç ekimi ile alınabilecek sonuç diğer tüm faktörler aynı olduğunda hasta için olabilecek en iyi sonuçtur.\n\nİyileşme sürecinin hızlı olması, ödemin az olması, iyileşme döneminde ağrı ve acının az olması hasta konforuna inanılmaz katkılar sağlar.',
              'isList': false,
            },
            {
              'title': '4000 Greft Kaç TL?',
              'content': 'Fiyatlandırma, her müşterinin ihtiyaçlarına ve seçtiği pakete bağlı olarak değişir. Smile Hair Clinic, her müşteriye özel bir yaklaşım benimser ve saç ekimi sürecini herkes için olabildiğince kolay ve konforlu hale getirir.\n\nDetaylı bir değerlendirme ve kişiselleştirilmiş bir tedavi planı için Smile Hair Clinic ile iletişime geçin.',
              'isList': false,
            },
          ],
        },
        'en': {
          'title': 'Sapphire Hair Transplant',
          'subtitle': 'Most Advanced FUE Technique',
          'sections': [
            {
              'title': 'What is Sapphire Hair Transplant?',
              'content': 'Sapphire hair transplantation is the name given to FUE hair transplantation in which state-of-the-art sapphire blades are used when opening channels.',
              'isList': false,
            },
            {
              'title': 'What is a Sapphire Blade?',
              'content': 'Contrary to popular belief, sapphire blades are not made from the blue sapphire stone found in nature. Sapphire blades are made from a single crystal of synthetic sapphire (made from Al2O3 = aluminum oxide); this material is hundreds of times harder than normal steel, so they maintain their sharpness for a long time.\n\nSapphire crystals are turned into perfect blades by controlling every stage of production in special machines.',
              'isList': false,
            },
            {
              'title': 'How is Sapphire Hair Transplant Applied?',
              'content': 'In sapphire hair transplantation, the hair to be transferred is first taken from the person\'s donor area using a micromotor with the micro FUE method.\n\nThe use of micromotors allows more grafts to be taken from the donor area in a shorter time compared to extraction performed with manual punch, making sapphire hair transplantation results denser and more natural.',
              'isList': false,
            },
            {
              'title': 'Advantages of Sapphire Hair Transplant',
              'content': '• The surface of sapphire blades is hard and smooth\n• Less tissue damage\n• Provides fast healing\n• Allows making more frequent incisions\n• Provides natural results\n• No risk of metal allergy\n• Infection risk is reduced',
              'isList': true,
            },
            {
              'title': 'What Should Be Done Before Sapphire Hair Transplant?',
              'content': 'If there is any health problem or medications used, they should be stated. Depending on the doctor\'s recommendation, the person may need to stop smoking and alcohol intake one week in advance.\n\nIf blood thinners are used, they should be stopped one week in advance. If you are using minoxidil, it should be stopped one week in advance.',
              'isList': false,
            },
            {
              'title': 'What Should Be Done After Sapphire Hair Transplant?',
              'content': 'Although it may seem unnecessary to mention, patients should avoid hitting their heads or rubbing against a surface for 10 days.\n\nExcessive sweating should be prevented for 15 days. Our clinic recommends restricting heavy cardiac exercises, use of wet areas such as sauna and Turkish bath, and swimming activities for one month after sapphire FUE hair transplantation.',
              'isList': false,
            },
            {
              'title': 'Why is Sapphire Hair Transplant Important?',
              'content': 'Sapphire hair transplantation uses state-of-the-art blades, allowing denser and more stable incisions (channels) to be made. Therefore, the result that can be achieved with sapphire hair transplantation is the best possible result for the patient when all other factors are the same.\n\nThe fast healing process, low edema, and less pain and discomfort during the healing period provide incredible contributions to patient comfort.',
              'isList': false,
            },
            {
              'title': 'How Much is 4000 Grafts?',
              'content': 'Pricing varies depending on each customer\'s needs and the package they choose. Smile Hair Clinic adopts a personalized approach for each customer and makes the hair transplantation process as easy and comfortable as possible for everyone.\n\nContact Smile Hair Clinic for a detailed evaluation and personalized treatment plan.',
              'isList': false,
            },
          ],
        },
      },
    };
  }
}

