# Novex-SHC-Hackathon-
# Smile Hair Clinic - Mobil Uygulama

Saç ekimi kliniği yönetimi, hasta bakımı ve AI destekli fotoğraf analizi için kapsamlı bir mobil uygulama.

## 🚀 Teknolojiler

- **Flutter** - Çapraz platform mobil geliştirme framework'ü
- **Firebase** - Backend servisleri (Kimlik Doğrulama, Firestore, Depolama, Cloud Functions)
- **Google ML Kit** - Yüz tespiti ve görüntü analizi
- **AI Analiz Servisi** - Saç ekimi prosedürleri için özel fotoğraf analizi
- **Çoklu Dil Desteği** - 12 dil (Türkçe, İngilizce, Arapça, Almanca, İspanyolca, Fransızca, İtalyanca, Portekizce, Rusça, İbranice, Arnavutça ve daha fazlası)

## ✨ Temel Özellikler

### Hasta Özellikleri
- **AI Destekli Fotoğraf Analizi**: 5 kritik açıdan fotoğraf çekin ve anında AI analizi alın
- **Yüz Tespiti ile Çekim**: Rehberli fotoğraf çekimi için otomatik yüz tespiti
- **Yükle ve Analiz Et**: Galeriden mevcut fotoğrafları yükleyip analiz edin
- **Geçmiş Analiz Geçmişi**: Analiz geçmişini görüntüleyin ve takip edin
- **Doktor Mesajlaşma**: Atanan doktorlarla doğrudan iletişim
- **Randevu Yönetimi**: Randevu planlayın ve yönetin
- **Bildirimler**: Randevular, ilaçlar ve güncellemeler için gerçek zamanlı bildirimler
- **Çoklu Dil Desteği**: 12 dilde tam yerelleştirme

### Doktor Özellikleri
- **Hasta Yönetimi**: Hasta profillerini görüntüleyin ve yönetin
- **Fotoğraf Analizi İnceleme**: Hasta fotoğraf analizlerini inceleyin ve onaylayın/reddedin
- **Mesajlaşma Sistemi**: Hastalarla iletişim kurun
- **Randevu Yönetimi**: Hasta randevularını yönetin
- **Dashboard**: Klinik operasyonlarının kapsamlı genel bakışı

### Teknik Özellikler
- **Çevrimdışı Destek**: Temel özellikler çevrimdışı çalışır
- **Gerçek Zamanlı Senkronizasyon**: Gerçek zamanlı veri senkronizasyonu için Firebase Firestore
- **Güvenli Kimlik Doğrulama**: E-posta/şifre ve Google Giriş ile Firebase Auth
- **Push Bildirimleri**: Bildirimler için Firebase Cloud Messaging
- **Görüntü İşleme**: AI/ML kullanarak gelişmiş görüntü analizi
- **Sesli Rehberlik**: Fotoğraf çekimi rehberliği için metinden sese

## 📱 Ekran Görüntüleri

Uygulama şunlar için modern, kullanıcı dostu arayüzler içerir:
- Hızlı işlemlerle hasta dashboard'u
- Yüz tespiti ile fotoğraf çekimi
- AI analiz sonuçları
- Doktor profilleri ve detayları
- Saç ekimi prosedür bilgileri
- Randevu planlama
- Mesajlaşma arayüzü

## 🛠️ Kurulum

1. Depoyu klonlayın
2. Flutter bağımlılıklarını yükleyin: `flutter pub get`
3. API Key'leri yapılandırın (2 yöntem):
   
   **Yöntem 1: Environment Variable (Önerilen - Production için)**
   ```bash
   flutter run --dart-define=GEMINI_ANALYSIS_API_KEY=your_key_here --dart-define=GEMINI_CHAT_API_KEY=your_key_here --dart-define=FIREBASE_API_KEY=your_key_here
   ```
   
   **Yöntem 2: Dosyada Değiştirme (Local Development için)**
   - `lib/config/api_keys.dart` dosyasını açın
   - `YOUR_GEMINI_ANALYSIS_API_KEY_HERE`, `YOUR_GEMINI_CHAT_API_KEY_HERE`, `YOUR_FIREBASE_API_KEY_HERE` değerlerini gerçek API key'lerinizle değiştirin
   - **Not:** GitHub'a push etmeden önce gerçek key'leri tekrar placeholder'larla değiştirin
4. Firebase'i yapılandırın:
   - `google-services.json` (Android) ve `GoogleService-Info.plist` (iOS) dosyalarını ekleyin
   - Firebase Authentication'ı ayarlayın
   - Firestore veritabanını yapılandırın
5. Uygulamayı çalıştırın: `flutter run`

## 📦 Bağımlılıklar

Temel bağımlılıklar şunları içerir:
- `firebase_core`, `firebase_auth`, `cloud_firestore`
- `google_mlkit_face_detection`
- `camera`, `image_picker`
- `flutter_localizations`
- `shared_preferences`
- `url_launcher`

## 🎯 Kullanım Senaryoları

- **Hastalar**: Saç ekimi ilerlemesini takip edin, doktorlarla iletişim kurun, randevu planlayın
- **Doktorlar**: Hastaları yönetin, analizleri inceleyin, danışmanlık sağlayın
- **Klinikler**: Operasyonları kolaylaştırın, hasta bakımını iyileştirin, iletişimi güçlendirin

## 🌍 Yerelleştirme

Uygulama şunların tam yerelleştirmesi ile 12 dili destekler:
- UI öğeleri ve navigasyon
- İçerik sayfaları (Hakkımızda, İletişim, Saç Ekimi prosedürleri)
- Doktor profilleri ve bilgileri
- Analiz sonuçları ve rehberlik
- Bildirimler ve mesajlar

## 📄 Lisans

Bu proje Smile Hair Clinic için geliştirilmiştir.
