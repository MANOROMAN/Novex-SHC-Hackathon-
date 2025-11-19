import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/captured_photo.dart';
import '../models/capture_stage.dart';
import '../config/api_keys.dart';

/// AI Analiz Sonucu
class AiAnalysisResult {
  AiAnalysisResult({
    required this.isValid,
    this.invalidStages = const [],
    this.message,
    this.analysisData,
    this.visualAnalysis,
    this.samePerson = true,
    this.detectedAngles,
  });

  /// Tüm açılar geçerli mi?
  final bool isValid;

  /// Geçersiz açılar (tekrar çekilmesi gerekenler)
  final List<CaptureStage> invalidStages;

  /// AI'dan gelen mesaj
  final String? message;

  /// Ek analiz verileri
  final Map<String, dynamic>? analysisData;

  /// Görsel analiz (her fotoğraf için ne görüldüğü)
  final Map<String, String>? visualAnalysis;

  /// Tüm fotoğraflarda aynı kişi var mı?
  final bool samePerson;

  /// Tespit edilen açılar (her fotoğraf için)
  final Map<String, String>? detectedAngles;
}

/// AI Fotoğraf Analiz Servisi
class AiAnalysisService {
  AiAnalysisService({
    http.Client? httpClient,
    String? apiKey,
  })  : _client = httpClient ?? http.Client(),
        _apiKey = apiKey ?? ApiKeys.geminiAnalysisApiKey;

  final http.Client _client;
  final String _apiKey;

  // Gemini 2.5 Flash: En yeni ve hızlı model, görüntü analizi için mükemmel
  static const String _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent';

  /// API bağlantısını test et
  Future<bool> testConnection() async {
    try {
      // Basit bir test isteği gönder
      final testRequestBody = {
        'contents': [
          {
            'parts': [
              {'text': 'Test - sadece "OK" yaz'},
            ],
          },
        ],
        'generationConfig': {
          'maxOutputTokens': 10,
        },
      };

      final response = await _client.post(
        Uri.parse('$_endpoint?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(testRequestBody),
      ).timeout(const Duration(seconds: 15)); // Timeout eklendi

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final text = responseData['candidates']?[0]?['content']?['parts']?[0]?['text'] ?? '';
        return text.isNotEmpty;
      } else {
        print('Gemini API test hatası: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Gemini API bağlantı hatası: $e');
      return false;
    }
  }

  /// Fotoğrafları analiz et ve hangi açıların yanlış olduğunu belirle
  /// Chatbot yaklaşımı: Fotoğrafları adım adım, konuşur gibi gönderir
  Future<AiAnalysisResult> analyzePhotos(List<CapturedPhoto> photos) async {
    // Retry mekanizması ekle
    bool compactMode = false;
    for (int attempt = 1; attempt <= 3; attempt++) {
      try {
        // Chatbot yaklaşımı: Fotoğrafları konuşur gibi, adım adım gönder
        // Önce sistem mesajı ve fotoğrafları birleştir
        final systemMessage = _buildSystemMessage();
        
        // Tüm parçaları birleştir (chatbot gibi)
        final List<Map<String, dynamic>> allParts = [
          {'text': systemMessage},
        ];

        // Fotoğrafları sırayla ekle (chatbot gibi - her fotoğraf için açıklama)
        for (int i = 0; i < photos.length; i++) {
          final photo = photos[i];
          final imageBytes = await photo.file.readAsBytes();
          final base64Image = base64Encode(imageBytes);
          final mimeType = 'image/jpeg';
          
          final photoDescription = _getPhotoDescription(photo.stage, i + 1, photos.length);
          
          // Önce açıklama, sonra fotoğraf
          allParts.add({'text': photoDescription});
          allParts.add({
            'inline_data': {
              'mime_type': mimeType,
              'data': base64Image,
            },
          });
        }

        // Son mesaj: Analiz isteği
        allParts.add({'text': _buildAnalysisRequest(photos, compactMode: compactMode)});

        // API isteği oluştur (chatbot formatında - tek bir mesaj içinde tüm fotoğraflar)
        final requestBody = {
          'contents': [
            {
              'parts': allParts,
            },
          ],
          'generationConfig': {
            'temperature': compactMode ? 0.2 : 0.3,
            'topK': 40,
            'topP': 0.95,
            'maxOutputTokens': compactMode ? 2048 : 8192, // MAX_TOKENS hatasını önlemek için artırıldı
            'responseMimeType': 'application/json', // JSON formatında yanıt zorunlu
          },
        };

        // API'ye istek gönder - timeout eklendi
        final response = await _client.post(
          Uri.parse('$_endpoint?key=$_apiKey'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(requestBody),
        ).timeout(const Duration(seconds: 30)); // Timeout 30 saniye

        if (response.statusCode != 200) {
          // Rate limiting kontrolü
          if (response.statusCode == 429) {
            print('Rate limit aşıldı, bekleniyor... (Attempt $attempt/3)');
            await Future.delayed(Duration(seconds: attempt * 2)); // 2, 4, 6 saniye bekle
            continue;
          }
          throw Exception('AI analiz hatası: ${response.statusCode} - ${response.body}');
        }

        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        final promptFeedback = responseData['promptFeedback'] as Map<String, dynamic>?;
        final candidates = responseData['candidates'] as List<dynamic>?;
        Map<String, dynamic>? firstCandidate;

        String combinedText = '';
        if (candidates != null && candidates.isNotEmpty) {
          firstCandidate = candidates.first as Map<String, dynamic>;
          final content = firstCandidate['content'] as Map<String, dynamic>?;
          final parts = content?['parts'] as List<dynamic>?;
          if (parts != null && parts.isNotEmpty) {
            final buffer = StringBuffer();
            var hasAnyText = false;
            for (final part in parts) {
              if (part is Map<String, dynamic>) {
                final textPart = part['text'];
                if (textPart is String && textPart.trim().isNotEmpty) {
                  if (hasAnyText) {
                    buffer.writeln();
                  }
                  buffer.write(textPart.trim());
                  hasAnyText = true;
                }
              }
            }
            combinedText = buffer.toString().trim();
          }
        }

        if (combinedText.isEmpty) {
          final finishReason = firstCandidate?['finishReason'];
          final blockReason = promptFeedback?['blockReason'];

          final shouldRetryCompact =
              !compactMode && finishReason == 'MAX_TOKENS';

          if (shouldRetryCompact) {
            compactMode = true;
            print('Gemini yanıtı MAX_TOKENS ile kesildi, compact moda geçiliyor');
            attempt--;
            await Future.delayed(const Duration(milliseconds: 300));
            continue;
          }

          final buffer = StringBuffer('Analiz yanıtı alınamadı.');
          if (finishReason is String && finishReason.isNotEmpty) {
            buffer.write(' Model yanıtı "$finishReason" ile sonlandırdı.');
          }
          if (blockReason is String &&
              blockReason.isNotEmpty &&
              blockReason != 'BLOCK_REASON_UNSPECIFIED') {
            buffer.write(
                ' Güvenlik filtresi "$blockReason" nedeniyle yanıt engellendi. Fotoğrafların yalnızca saç ve kafa derisi içerdiğinden emin olun.');
          }
          return AiAnalysisResult(
            isValid: false,
            invalidStages: photos.map((p) => p.stage).toList(),
            message: buffer.toString().trim(),
          );
        }

        // AI yanıtını parse et
        return _parseAnalysisResponse(combinedText, photos);
        
      } catch (e) {
        print('AI analiz denemesi $attempt/3 başarısız: $e');
        if (attempt == 3) {
          // Son denemede de başarısız
          return AiAnalysisResult(
            isValid: false,
            message: 'Analiz sırasında hata oluştu (3 deneme sonrası): $e\n\nİnternet bağlantınızı kontrol edin ve tekrar deneyin.',
            invalidStages: photos.map((p) => p.stage).toList(),
          );
        }
        // Bir sonraki deneme için kısa bekle
        await Future.delayed(Duration(seconds: attempt));
        // Eğer hata MAX_TOKENS kaynaklı ise ve hâlâ compact moda geçilmediyse geç
        if (!compactMode) {
          compactMode = true;
        }
      }
    }

    // Bu noktaya asla ulaşmamalı, ama güvenlik için
    return AiAnalysisResult(
      isValid: false,
      message: 'Beklenmedik hata oluştu',
      invalidStages: photos.map((p) => p.stage).toList(),
    );
  }

  /// Sistem mesajı - chatbot'un rolünü belirler
  String _buildSystemMessage() {
    return '''Merhaba! Sen bir saç analiz uzmanısın. Kullanıcı 5 farklı açıdan kafa derisi fotoğrafları çekmiş. Görevin:
1) Her fotoğrafta açının doğruluğunu değerlendirmek
2) Netlik, aydınlatma, kadraj ve duruş hatalarını tespit etmek
3) Gerekirse kullanıcının nasıl tekrar çekmesi gerektiğini açık ve uygulanabilir biçimde söylemek

ÖNEMLİ: ANA KOŞUL - Her açıda istenen bölgenin net bir şekilde görünmesi gerekiyor. Açı toleransları esnek olabilir, ancak istenen bölge (ense, tepe, yan yüzler) net ve görünür olmalı.

SAÇ BÖLGESİ GÖRÜNÜRLÜK KONTROLÜ - KRİTİK KURAL:
Her fotoğrafta saç bölgesinin görünürlük oranını mutlaka değerlendir:
- Saç bölgesinin %25'inden azı (4'te 1'inden azı) görünüyorsa → GEÇERSİZ (HATA VER)
- Saç bölgesinin %50'sinden azı (yarısından azı) görünüyorsa → GEÇERSİZ (ONAYLAMA)
- Saç bölgesinin %50 veya daha fazlası görünüyorsa → GEÇERLİ (ONAYLANABİLİR)

Her açı için saç bölgesi tanımı:
- Front: Ön saç çizgisi, alın üstü saç bölgesi, tepe ön kısmı
- Right45: Sağ taraf saç çizgisi, sağ yan saç bölgesi, sağ şakak bölgesi
- Left45: Sol taraf saç çizgisi, sol yan saç bölgesi, sol şakak bölgesi
- Vertex: Tepe saç bölgesi, üst kafa derisi, saç çizgisinin üst kısmı
- Donor: Arka saç bölgesi, ense üstü saç, donör alan saç bölgesi

KADRAJ KONTROLÜ - SADECE AŞIRI HATALAR İÇİN:
Aşağıdaki durumlar GEÇERSİZDİR (çok belirgin kadraj hataları):
- Vertex (Üst): Kafanın üstünün yarısından fazlası kesilmişse veya ekrandan çıkmışsa
- Donor (Arka): Arka tarafın yarısından fazlası kesilmişse veya ekrandan çıkmışsa
- Front, Right45, Left45: Kafanın büyük bir kısmı (saç çizgisinin üstü, çene altı gibi önemli bölgeler) kesilmişse veya ekrandan çıkmışsa

NOT: Küçük kesilmeler veya hafif kadraj hataları kabul edilebilir. Sadece çok belirgin ve aşırı hatalar geçersiz sayılmalı.

Açılar ve Beklentiler:
1. Front (Ön): Yüz karşıya bakmalı; yaw≈0°. ANA KOŞUL: Yüzün ön kısmı, saç çizgisi ve alın bölgesi net görünmeli. Biraz uzaktan çekim kabul edilebilir. SAÇ BÖLGESİ: Ön saç çizgisi, alın üstü saç bölgesi, tepe ön kısmının %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. KADRAJ KONTROLÜ: Kafanın büyük bir kısmı (saç çizgisinin üstü, çene altı gibi önemli bölgeler) kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.
2. Right45 (45° Sağ): Baş SAĞA dönük olmalı. ANA KOŞUL: Sağ yan yüz, sağ yanak ve sağ taraf saç çizgisi net görünmeli. Açı 30-90° arası kabul edilebilir, önemli olan sağ yan bölgenin net görünmesi. SAÇ BÖLGESİ: Sağ taraf saç çizgisi, sağ yan saç bölgesi, sağ şakak bölgesinin %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. KADRAJ KONTROLÜ: Kafanın büyük bir kısmı (saç çizgisinin üstü, çene altı gibi önemli bölgeler) kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.
3. Left45 (45° Sol): Baş SOLA dönük olmalı. ANA KOŞUL: Sol yan yüz, sol yanak ve sol taraf saç çizgisi net görünmeli. Açı 30-90° arası kabul edilebilir, önemli olan sol yan bölgenin net görünmesi. SAÇ BÖLGESİ: Sol taraf saç çizgisi, sol yan saç bölgesi, sol şakak bölgesinin %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. KADRAJ KONTROLÜ: Kafanın büyük bir kısmı (saç çizgisinin üstü, çene altı gibi önemli bölgeler) kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.
4. Vertex (Tepe): Kafanın tepesi görünmeli. ANA KOŞUL: Başın üst kısmı, tepe bölgesi ve saç derisi net görünmeli. 
   - Vertex açısı için: Fotoğraf kafanın ÜSTÜNDEN çekilmeli, telefon yatay veya hafif açılı olabilir
   - Tepe bölgesi (kafanın en üst kısmı, saç derisi) net ve tam görünmeli
   - Biraz uzaktan çekim kabul edilebilir, hatta tercih edilir - önemli olan tepe bölgesinin tam ve net görünmesi
   - Yüz görünmese bile sorun değil, önemli olan tepe bölgesinin net görünmesi
   - SAÇ BÖLGESİ: Tepe saç bölgesi, üst kafa derisi, saç çizgisinin üst kısmının %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ.
   - Saç çizgisi, tepe saç derisi, kafanın üst kısmı net görünüyorsa GEÇERLİDİR
   - Eğer tepe bölgesi net görünüyorsa, açı biraz farklı olsa bile (telefon biraz öne/arkaya eğik olsa bile) KABUL EDİLEBİLİR
   - KADRAJ KONTROLÜ: Üst bölgenin yarısından fazlası kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR

5. Donor (Arka/Ense): Ense ve arka kafa derisi görünmeli. ANA KOŞUL: Ense bölgesi, arka kafa derisi ve donör alan net görünmeli.
   - Donor açısı için: Fotoğraf kafanın ARKASINDAN çekilmeli, ense bölgesi net görünmeli
   - Ense derisi, arka kafa derisi, donör alan (saç ekimi için kullanılan arka bölge) net ve tam görünmeli
   - Biraz uzaktan çekim kabul edilebilir, hatta tercih edilir - önemli olan ense/arka bölgenin tam ve net görünmesi
   - Yüz görünmese bile sorun değil, önemli olan ense/arka bölgenin net görünmesi
   - SAÇ BÖLGESİ: Arka saç bölgesi, ense üstü saç, donör alan saç bölgesinin %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ.
   - Ense bölgesi, arka kafa derisi, donör alan net görünüyorsa GEÇERLİDİR
   - Eğer ense/arka bölge net görünüyorsa, açı biraz farklı olsa bile (telefon biraz yukarı/aşağı veya sağa/sola eğik olsa bile) KABUL EDİLEBİLİR
   - KADRAJ KONTROLÜ: Arka bölgenin yarısından fazlası kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR

KRİTİK KURAL: Açı toleransları esnek olabilir, ancak her açıda istenen bölgenin (ön yüz, sağ yan, sol yan, tepe, ense) net ve tam görünmesi ANA KOŞULDUR. Eğer istenen bölge net görünüyorsa, açı biraz farklı olsa bile kabul edilebilir.

SAÇ BÖLGESİ GÖRÜNÜRLÜK KURALI - MUTLAKA UYGULA:
Her fotoğrafta saç bölgesinin görünürlük oranını değerlendir ve şu kurallara göre karar ver:
- Saç bölgesinin %25'inden azı görünüyorsa → GEÇERSİZ (HATA VER, "Saç bölgesinin çok azı görünüyor" gibi bir mesaj ekle)
- Saç bölgesinin %50'sinden azı görünüyorsa → GEÇERSİZ (ONAYLAMA, "Saç bölgesinin yarısından azı görünüyor" gibi bir mesaj ekle)
- Saç bölgesinin %50 veya daha fazlası görünüyorsa → GEÇERLİ (ONAYLANABİLİR)

Şimdi fotoğrafları sırayla göndereceğim. Her fotoğraf için önce istenen bölgenin net görünüp görünmediğini kontrol et, sonra açıyı değerlendir.''';
  }

  /// Her fotoğraf için açıklama (chatbot gibi)
  String _getPhotoDescription(CaptureStage stage, int photoNumber, int totalPhotos) {
    final stageName = _getStageName(stage);
    final strictHint = () {
      switch (stage) {
        case CaptureStage.front:
          return 'ANA KOŞUL: Yüzün ön kısmı, saç çizgisi ve alın bölgesi net görünmeli. Açı toleransı esnek, önemli olan ön bölgenin net görünmesi. SAÇ BÖLGESİ: Ön saç çizgisi, alın üstü saç bölgesi, tepe ön kısmının %50 veya daha fazlası görünmeli. %25\'ten az görünüyorsa HATA, %50\'den az görünüyorsa ONAYLANMAZ. KADRAJ KONTROLÜ: Kafanın büyük bir kısmı (saç çizgisinin üstü, çene altı gibi önemli bölgeler) kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.';
        case CaptureStage.right45:
          return 'ANA KOŞUL: Sağ yan yüz, sağ yanak ve sağ taraf saç çizgisi net görünmeli. Açı 30-90° arası kabul edilebilir, önemli olan sağ yan bölgenin net görünmesi. SAÇ BÖLGESİ: Sağ taraf saç çizgisi, sağ yan saç bölgesi, sağ şakak bölgesinin %50 veya daha fazlası görünmeli. %25\'ten az görünüyorsa HATA, %50\'den az görünüyorsa ONAYLANMAZ. KADRAJ KONTROLÜ: Kafanın büyük bir kısmı (saç çizgisinin üstü, çene altı gibi önemli bölgeler) kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.';
        case CaptureStage.left45:
          return 'ANA KOŞUL: Sol yan yüz, sol yanak ve sol taraf saç çizgisi net görünmeli. Açı 30-90° arası kabul edilebilir, önemli olan sol yan bölgenin net görünmesi. SAÇ BÖLGESİ: Sol taraf saç çizgisi, sol yan saç bölgesi, sol şakak bölgesinin %50 veya daha fazlası görünmeli. %25\'ten az görünüyorsa HATA, %50\'den az görünüyorsa ONAYLANMAZ. KADRAJ KONTROLÜ: Kafanın büyük bir kısmı (saç çizgisinin üstü, çene altı gibi önemli bölgeler) kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.';
        case CaptureStage.vertex:
          return 'ANA KOŞUL: Başın üst kısmı, tepe bölgesi ve saç derisi net görünmeli. Fotoğraf kafanın ÜSTÜNDEN çekilmeli. Tepe bölgesi (kafanın en üst kısmı, saç derisi) net ve tam görünmeli. Biraz uzaktan çekim kabul edilebilir, hatta tercih edilir. Yüz görünmese bile sorun değil, önemli olan tepe bölgesinin net görünmesi. SAÇ BÖLGESİ: Tepe saç bölgesi, üst kafa derisi, saç çizgisinin üst kısmının %50 veya daha fazlası görünmeli. %25\'ten az görünüyorsa HATA, %50\'den az görünüyorsa ONAYLANMAZ. Eğer tepe bölgesi net görünüyorsa, açı biraz farklı olsa bile KABUL EDİLEBİLİR. KADRAJ KONTROLÜ: Üst bölgenin yarısından fazlası kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.';
        case CaptureStage.donor:
          return 'ANA KOŞUL: Ense bölgesi, arka kafa derisi ve donör alan net görünmeli. Fotoğraf kafanın ARKASINDAN çekilmeli. Ense derisi, arka kafa derisi, donör alan net ve tam görünmeli. Biraz uzaktan çekim kabul edilebilir, hatta tercih edilir. Yüz görünmese bile sorun değil, önemli olan ense/arka bölgenin net görünmesi. SAÇ BÖLGESİ: Arka saç bölgesi, ense üstü saç, donör alan saç bölgesinin %50 veya daha fazlası görünmeli. %25\'ten az görünüyorsa HATA, %50\'den az görünüyorsa ONAYLANMAZ. Eğer ense/arka bölge net görünüyorsa, açı biraz farklı olsa bile KABUL EDİLEBİLİR. KADRAJ KONTROLÜ: Arka bölgenin yarısından fazlası kesilmişse veya ekrandan çıkmışsa GEÇERSİZDİR.';
      }
    }();
    return '''Fotoğraf $photoNumber/$totalPhotos: $stageName açısı. $strictHint Lütfen önce istenen bölgenin net görünüp görünmediğini kontrol et, sonra açıyı değerlendir.''';
  }

  /// Fotoğraf açısını tespit et (tek fotoğraf için)
  Future<CaptureStage?> detectPhotoAngle(File photoFile) async {
    // Retry mekanizması ile açı tespiti
    for (int attempt = 1; attempt <= 2; attempt++) {
      try {
        final imageBytes = await photoFile.readAsBytes();
        final base64Image = base64Encode(imageBytes);
        final mimeType = 'image/jpeg';

        final requestBody = {
          'contents': [
            {
              'parts': [
                {
                  'text': '''Bu fotoğraf hangi açıdan çekilmiş? SADECE şu açılardan biri olmalı:
- front: Tam karşıdan yüz fotoğrafı (yaw≈0°)
- right45: Yüz 45-70° sağa dönük 
- left45: Yüz 45-70° sola dönük
- vertex: Kafanın tepesinden çekilmiş (tepe görünüyor)
- donor: Ense/arka kafa derisi

SADECE JSON formatında yanıt ver:
{"detectedAngle": "front"} // veya right45, left45, vertex, donor

ÖNEMLİ: Eğer emin değilsen "front" dön.''',
                },
                {
                  'inline_data': {
                    'mime_type': mimeType,
                    'data': base64Image,
                  },
                },
              ],
            },
          ],
          'generationConfig': {
            'temperature': 0.1,
            'maxOutputTokens': 50,
            'responseMimeType': 'application/json',
          },
        };

        final response = await _client.post(
          Uri.parse('$_endpoint?key=$_apiKey'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        ).timeout(const Duration(seconds: 15));

        if (response.statusCode != 200) {
          if (attempt == 1 && response.statusCode == 429) {
            // Rate limit, kısa bekle ve tekrar dene
            await Future.delayed(const Duration(seconds: 2));
            continue;
          }
          print('Açı tespit hatası: ${response.statusCode} - ${response.body}');
          return null;
        }

        final responseData = jsonDecode(response.body);
        final text = responseData['candidates']?[0]?['content']?['parts']?[0]?['text'] ?? '';
        
        // JSON parse et - daha sağlam parse
        String jsonText = text.trim();
        final jsonMatch = RegExp(r'\{[^}]*\}').firstMatch(jsonText);
        if (jsonMatch != null) {
          jsonText = jsonMatch.group(0)!;
          try {
            final jsonData = jsonDecode(jsonText) as Map<String, dynamic>;
            final angle = jsonData['detectedAngle'] as String?;
            
            switch (angle?.toLowerCase()) {
              case 'front':
                return CaptureStage.front;
              case 'right45':
                return CaptureStage.right45;
              case 'left45':
                return CaptureStage.left45;
              case 'vertex':
                return CaptureStage.vertex;
              case 'donor':
                return CaptureStage.donor;
              default:
                print('Bilinmeyen açı: $angle, front varsayıyor');
                return CaptureStage.front; // Bilinmeyeni front yap
            }
          } catch (e) {
            print('JSON parse hatası (açı tespiti): $e');
            return CaptureStage.front; // Parse hatası varsa front
          }
        }
        return CaptureStage.front; // JSON bulunamazsa front
        
      } catch (e) {
        print('Açı tespit hatası (attempt $attempt/2): $e');
        if (attempt == 2) return CaptureStage.front; // Son denemede bile hata varsa front
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    return CaptureStage.front; // Fallback
  }

  /// Analiz isteği (chatbot gibi)
  String _buildAnalysisRequest(List<CapturedPhoto> photos, {bool compactMode = false}) {
    final stageNames = photos.map((p) => _getStageName(p.stage)).join(', ');
    final lengthHint = compactMode
        ? '\nYANIT KISITLAMASI: Her string alanı en fazla 1-2 kısa cümle (≤160 karakter) olsun; gereksiz tekrar veya süslü anlatım ekleme.'
        : '';
    final templateHint = compactMode
        ? '\nTüm alanları doldur fakat metinleri kısa tut. visualAnalysis ve details alanlarında yalnızca temel tespitleri yaz.'
        : '';
    
    return '''Tüm fotoğrafları inceledim. Şimdi detaylı analiz sonuçlarını istiyorum.

Çekilen fotoğraflar: $stageNames

ÖNEMLİ KONTROLLER:
1) TÜM FOTOĞRAFLARDA AYNI KİŞİ olmalı (farklıysa belirt ve geçersiz say)
2) ANA KOŞUL - İSTENEN BÖLGE NET GÖRÜNMELİ:
   - Front: Ön yüz, saç çizgisi, alın bölgesi net görünmeli. SAÇ BÖLGESİ: Ön saç çizgisi, alın üstü saç bölgesi, tepe ön kısmının %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. KADRAJ: Kafanın büyük bir kısmı kesilmişse GEÇERSİZDİR.
   - Right45: Sağ yan yüz, sağ yanak, sağ taraf saç çizgisi net görünmeli. SAÇ BÖLGESİ: Sağ taraf saç çizgisi, sağ yan saç bölgesi, sağ şakak bölgesinin %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. KADRAJ: Kafanın büyük bir kısmı kesilmişse GEÇERSİZDİR.
   - Left45: Sol yan yüz, sol yanak, sol taraf saç çizgisi net görünmeli. SAÇ BÖLGESİ: Sol taraf saç çizgisi, sol yan saç bölgesi, sol şakak bölgesinin %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. KADRAJ: Kafanın büyük bir kısmı kesilmişse GEÇERSİZDİR.
   - Vertex: Tepe bölgesi, üst kafa derisi net görünmeli. Fotoğraf kafanın ÜSTÜNDEN çekilmeli. Tepe bölgesi (kafanın en üst kısmı) net ve tam görünmeli. Biraz uzaktan çekim kabul edilebilir, hatta tercih edilir. Yüz görünmese bile sorun değil. SAÇ BÖLGESİ: Tepe saç bölgesi, üst kafa derisi, saç çizgisinin üst kısmının %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. Eğer tepe bölgesi net görünüyorsa GEÇERLİDİR. KADRAJ: Üst bölgenin yarısından fazlası kesilmişse GEÇERSİZDİR.
   - Donor: Ense bölgesi, arka kafa derisi net görünmeli. Fotoğraf kafanın ARKASINDAN çekilmeli. Ense derisi, arka kafa derisi, donör alan net ve tam görünmeli. Biraz uzaktan çekim kabul edilebilir, hatta tercih edilir. Yüz görünmese bile sorun değil. SAÇ BÖLGESİ: Arka saç bölgesi, ense üstü saç, donör alan saç bölgesinin %50 veya daha fazlası görünmeli. %25'ten az görünüyorsa HATA, %50'den az görünüyorsa ONAYLANMAZ. Eğer ense/arka bölge net görünüyorsa GEÇERLİDİR. KADRAJ: Arka bölgenin yarısından fazlası kesilmişse GEÇERSİZDİR.
3) SAÇ BÖLGESİ GÖRÜNÜRLÜK KONTROLÜ - MUTLAKA UYGULA:
   Her fotoğrafta saç bölgesinin görünürlük oranını değerlendir:
   - Saç bölgesinin %25'inden azı görünüyorsa → GEÇERSİZ (HATA VER, "Saç bölgesinin çok azı görünüyor" gibi bir mesaj ekle)
   - Saç bölgesinin %50'sinden azı görünüyorsa → GEÇERSİZ (ONAYLAMA, "Saç bölgesinin yarısından azı görünüyor" gibi bir mesaj ekle)
   - Saç bölgesinin %50 veya daha fazlası görünüyorsa → GEÇERLİ (ONAYLANABİLİR)
4) AÇI TOLERANSI: Açılar esnek olabilir (30-90° arası yan açılar kabul edilebilir), önemli olan istenen bölgenin net görünmesi
5) KALİTE: Netlik, aydınlatma, kadraj (istenen bölge merkezde veya net görünür), hareket bulanıklığı
6) KADRAJ KONTROLÜ - SADECE AŞIRI HATALAR: Küçük kesilmeler kabul edilebilir. Sadece çok belirgin hatalar (yarıdan fazla kesilme, önemli bölgelerin kaybı) geçersiz sayılmalı.

UYARI: Kesinlikle **markdown formatı kullanma**! Kalın yazı (**), italik (*), başlık (#) formatları YASAK.$lengthHint

Lütfen her fotoğrafı DETAYLI olarak analiz et ve şunları belirt:

1. **Görsel İçerik Analizi:**
   - Fotoğrafta ne görüyorsun? (saç durumu, kafa derisi, saç çizgisi, vb.)
   - Çekilen kişinin duruş açısı doğru mu?
   - Fotoğraf net mi, bulanık mı?
   - Aydınlatma yeterli mi?

2. **Açı Kontrolü:**
   - Her fotoğraf doğru açıdan çekilmiş mi?
   - Hangi açılar yanlış ve neden?

3. **Hata Analizi:**
   - Eğer bir açı yanlışsa, tam olarak nerede hata yapıldığını belirt
   - ÖNEMLİ: Önce istenen bölgenin net görünüp görünmediğini kontrol et
   - Örnek: "Front: Ön yüz net görünüyor, ancak saç çizgisi kısmen kesilmiş; biraz daha geri çekilmeli"
   - Örnek: "Right45: Sağ yan bölge net görünüyor, açı uygun (yaklaşık 45°). Geçerli."
   - Örnek: "Vertex: Tepe bölgesi net görünüyor, kafanın üst kısmı tam görünür. Geçerli."
   - Örnek: "Vertex: Tepe bölgesi net görünüyor ancak çok yakından çekilmiş; biraz uzaktan çekilmeli (ama eğer tepe bölgesi net görünüyorsa yine de geçerli olabilir)"
   - Örnek: "Donor: Ense bölgesi net görünüyor, arka kafa derisi tam görünür. Geçerli."
   - Örnek: "Donor: Ense bölgesi net görünüyor ancak aydınlatma yetersiz; daha iyi aydınlatma gerekli (ama eğer ense bölgesi net görünüyorsa yine de geçerli olabilir)"
   - ÖNEMLİ: Vertex ve Donor için: Eğer istenen bölge (tepe veya ense) net görünüyorsa, diğer faktörler (yakınlık, aydınlatma, açı) ikincil öneme sahiptir. İstenen bölge net görünüyorsa GEÇERLİDİR.

4. **İçerik Doğruluğu:**
   - Fotoğraf saç/kafa derisiyle ilgili değilse (manzara, araba, selfie, obje vb.) geçersiz say ve nedenini açıkla

Yanıtını MUTLAKA ŞU JSON FORMATINDA ver (SADECE JSON, başka metin ekleme):$templateHint

{
  "isValid": true,
  "invalidStages": [],
  "samePerson": true,
  "detectedAngles": {
    "front": "front",
    "right45": "right45",
    "left45": "left45",
    "vertex": "vertex",
    "donor": "donor"
  },
  "message": "Genel analiz özeti - ne görüldüğü, saç durumu, duruş açıları hakkında detaylı bilgi",
  "visualAnalysis": {
    "front": "Bu fotoğrafta ne görüyorum: [saç durumu, kafa derisi, açı, netlik, aydınlatma]",
    "right45": "...",
    "left45": "...",
    "vertex": "...",
    "donor": "..."
  },
  "details": {
    "front": {"valid": true, "issue": "Hata varsa detaylı açıklama, yoksa 'Doğru çekilmiş'"},
    "right45": {"valid": true, "issue": "..."},
    "left45": {"valid": true, "issue": "..."},
    "vertex": {"valid": true, "issue": "..."},
    "donor": {"valid": true, "issue": "..."}
  }
}

KRİTİK KURALLAR:
1. YANITIN SADECE JSON OLMALI - Markdown code block, açıklama veya başka metin EKLEME
2. JSON geçerli olmalı - tırnak işaretleri, virgüller doğru olmalı
3. "samePerson": true/false - Tüm fotoğraflarda aynı kişi var mı kontrol et. Farklı kişiler varsa false ve message'da belirt
4. "detectedAngles": Her fotoğrafın gerçek açısını tespit et (front, right45, left45, vertex, donor)
5. Her fotoğraf için "visualAnalysis" alanında DETAYLI olarak ne gördüğünü yaz
6. Hata varsa "details" içinde tam olarak nerede hata yapıldığını belirt
7. Eğer bir açı yanlışsa, sadece o açının adını invalidStages listesine ekle (örn: ["front"])
8. Eğer tüm açılar doğruysa, isValid: true ve invalidStages: [] döndür
9. MARKDOWNSIZ YAZI: Kalın yazı, italik, başlık formatı KULLANMA - sadece düz metin
10. ÖRNEK: Eğer front açısı yanlışsa: {"isValid": false, "invalidStages": ["front"], "samePerson": true, ...}
11. ÖRNEK: Eğer farklı kişiler varsa: {"isValid": false, "samePerson": false, "message": "Fotoğraflarda farklı kişiler tespit edildi", ...}

ŞİMDİ YANIT VER (SADECE JSON):''';
  }

  String _getStageName(CaptureStage stage) {
    switch (stage) {
      case CaptureStage.front:
        return 'Front (Ön)';
      case CaptureStage.right45:
        return 'Right45 (45° Sağ)';
      case CaptureStage.left45:
        return 'Left45 (45° Sol)';
      case CaptureStage.vertex:
        return 'Vertex (Tepe)';
      case CaptureStage.donor:
        return 'Donor (Arka)';
    }
  }

  AiAnalysisResult _parseAnalysisResponse(String responseText, List<CapturedPhoto> photos) {
    try {
      // Debug: AI yanıtını logla
      print('AI Raw Response: $responseText');
      
      // JSON'u extract et (markdown code block içinde olabilir)
      String jsonText = responseText.trim();
      
      // Önce markdown code block'ları temizle
      if (jsonText.contains('```json')) {
        final parts = jsonText.split('```json');
        if (parts.length > 1) {
          jsonText = parts[1].split('```')[0].trim();
        }
      } else if (jsonText.contains('```')) {
        final parts = jsonText.split('```');
        if (parts.length > 1) {
          // İlk code block'u al
          jsonText = parts[1].split('```')[0].trim();
        }
      }
      
      // JSON başlangıç ve bitiş karakterlerini bul
      int jsonStart = jsonText.indexOf('{');
      int jsonEnd = jsonText.lastIndexOf('}');
      
      if (jsonStart == -1 || jsonEnd == -1 || jsonEnd <= jsonStart) {
        // JSON bulunamadı, regex ile dene
        final jsonMatch = RegExp(r'\{[\s\S]*\}').firstMatch(jsonText);
        if (jsonMatch != null) {
          jsonText = jsonMatch.group(0) ?? jsonText;
          jsonStart = 0;
          jsonEnd = jsonText.length - 1;
        } else {
          throw Exception('JSON formatı bulunamadı. Yanıt: ${responseText.substring(0, responseText.length > 200 ? 200 : responseText.length)}...');
        }
      } else {
        jsonText = jsonText.substring(jsonStart, jsonEnd + 1);
      }
      
      // JSON'u düzelt - eksik kapanış parantezleri ekle
      int openBraces = jsonText.split('{').length - 1;
      int closeBraces = jsonText.split('}').length - 1;
      
      // Eğer kapanış parantezleri eksikse ekle
      if (openBraces > closeBraces) {
        jsonText += '}' * (openBraces - closeBraces);
      }
      
      // Eksik tırnak işaretlerini ve virgülleri düzelt
      jsonText = _fixIncompleteJson(jsonText);

      // JSON parse et
      final jsonData = jsonDecode(jsonText) as Map<String, dynamic>;
      
      final isValid = jsonData['isValid'] as bool? ?? false;
      final invalidStagesList = jsonData['invalidStages'] as List<dynamic>? ?? [];
      final message = jsonData['message'] as String? ?? 'Analiz tamamlandı';
      final details = jsonData['details'] as Map<String, dynamic>?;
      final visualAnalysis = jsonData['visualAnalysis'] as Map<String, dynamic>?;
      final samePerson = jsonData['samePerson'] as bool? ?? true;
      final detectedAngles = jsonData['detectedAngles'] as Map<String, dynamic>?;
      
      // Detected angles'i String map'e çevir
      Map<String, String>? detectedAnglesMap;
      if (detectedAngles != null) {
        detectedAnglesMap = {};
        detectedAngles.forEach((key, value) {
          if (value is String) {
            detectedAnglesMap![key] = value;
          } else if (value != null) {
            detectedAnglesMap![key] = value.toString();
          }
        });
      }
      
      // Visual analysis'i String map'e çevir
      Map<String, String>? visualAnalysisMap;
      if (visualAnalysis != null) {
        visualAnalysisMap = {};
        visualAnalysis.forEach((key, value) {
          if (value is String) {
            visualAnalysisMap![key] = value;
          } else if (value != null) {
            visualAnalysisMap![key] = value.toString();
          }
        });
      }

      // String stage isimlerini CaptureStage enum'a çevir
      final invalidStages = invalidStagesList
          .map((stageName) {
            switch (stageName.toString().toLowerCase()) {
              case 'front':
                return CaptureStage.front;
              case 'right45':
                return CaptureStage.right45;
              case 'left45':
                return CaptureStage.left45;
              case 'vertex':
                return CaptureStage.vertex;
              case 'donor':
                return CaptureStage.donor;
              default:
                return null;
            }
          })
          .whereType<CaptureStage>()
          .toList();

      return AiAnalysisResult(
        isValid: isValid && samePerson, // Aynı kişi değilse geçersiz say
        invalidStages: invalidStages,
        message: message,
        analysisData: details,
        visualAnalysis: visualAnalysisMap,
        samePerson: samePerson,
        detectedAngles: detectedAnglesMap,
      );
    } catch (e, stackTrace) {
      // JSON parse hatası - detaylı log ve fallback
      print('JSON Parse Error: $e');
      print('Stack Trace: $stackTrace');
      print('Response Text: ${responseText.substring(0, responseText.length > 500 ? 500 : responseText.length)}');
      
      // Eğer yanıt boş değilse ve JSON içermiyorsa, AI'dan gelen mesajı göster
      if (responseText.isNotEmpty && !responseText.contains('{')) {
        return AiAnalysisResult(
          isValid: false,
          message: 'AI yanıtı JSON formatında değil. AI yanıtı: ${responseText.substring(0, responseText.length > 200 ? 200 : responseText.length)}...',
          invalidStages: [],
        );
      }
      
      // Fallback: Tüm fotoğrafları geçersiz say ama detaylı hata mesajı ver
      return AiAnalysisResult(
        isValid: false,
        message: 'AI yanıtı parse edilemedi: $e\n\nLütfen tekrar deneyin. Eğer sorun devam ederse, fotoğrafların net ve doğru açıdan çekildiğinden emin olun.',
        invalidStages: photos.map((p) => p.stage).toList(),
      );
    }
  }

  /// Eksik JSON'u düzelt
  String _fixIncompleteJson(String jsonText) {
    try {
      // Önce normal parse dene
      jsonDecode(jsonText);
      return jsonText; // Geçerliyse olduğu gibi döndür
    } catch (e) {
      // Parse edilemezse düzeltmeye çalış
      String fixed = jsonText;
      
      // Son karakter kontrolü
      if (!fixed.trim().endsWith('}')) {
        // Son kapanış parantezini bul ve eksikleri ekle
        int lastBrace = fixed.lastIndexOf('}');
        if (lastBrace != -1) {
          // Son brace'den sonraki kısmı temizle ve kapat
          String beforeLastBrace = fixed.substring(0, lastBrace + 1);
          
          // Eksik kapanışları say
          int openCount = beforeLastBrace.split('{').length - 1;
          int closeCount = beforeLastBrace.split('}').length - 1;
          
          if (openCount > closeCount) {
            fixed = beforeLastBrace + ('}' * (openCount - closeCount));
          } else {
            fixed = beforeLastBrace;
          }
        }
      }
      
      // Eksik string kapanışlarını düzelt (basit yaklaşım)
      // Son tırnak işareti eksikse ekle
      if (fixed.contains('"') && !fixed.trim().endsWith('"') && !fixed.trim().endsWith('}')) {
        // Son " karakterinden sonra ne var kontrol et
        int lastQuote = fixed.lastIndexOf('"');
        if (lastQuote != -1 && lastQuote < fixed.length - 1) {
          String afterLastQuote = fixed.substring(lastQuote + 1).trim();
          // Eğer son karakter " değilse ve string devam ediyorsa kapat
          if (afterLastQuote.isNotEmpty && !afterLastQuote.startsWith('"') && !afterLastQuote.startsWith('}')) {
            // Basit düzeltme: son kısmı temizle
            fixed = fixed.substring(0, lastQuote + 1);
          }
        }
      }
      
      return fixed;
    }
  }
}

