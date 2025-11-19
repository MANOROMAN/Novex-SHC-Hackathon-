// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Profil Düzenle';

  @override
  String get save => 'Kaydet';

  @override
  String get cancel => 'İptal';

  @override
  String get close => 'Kapat';

  @override
  String get changePhoto => 'Fotoğrafı Değiştir';

  @override
  String get patientId => 'Hasta ID';

  @override
  String get fullName => 'Ad Soyad';

  @override
  String get email => 'E-posta';

  @override
  String get phone => 'Telefon';

  @override
  String get address => 'Adres';

  @override
  String get birthDate => 'Doğum Tarihi';

  @override
  String get gender => 'Cinsiyet';

  @override
  String get emergencyContact => 'Acil Durum İletişim';

  @override
  String get saveChanges => 'Değişiklikleri Kaydet';

  @override
  String get nameRequired => 'Ad Soyad boş olamaz';

  @override
  String get emailInvalid => 'Geçerli bir e-posta adresi giriniz';

  @override
  String get phoneRequired => 'Telefon numarası boş olamaz';

  @override
  String get addressRequired => 'Adres boş olamaz';

  @override
  String get birthDateRequired => 'Doğum tarihi seçiniz';

  @override
  String get profileUpdatedSuccessfully =>
      'Profil bilgileri başarıyla güncellendi';

  @override
  String get male => 'Erkek';

  @override
  String get female => 'Kadın';

  @override
  String get preferNotToSay => 'Belirtmek İstemiyorum';

  @override
  String get currentPassword => 'Mevcut Şifre';

  @override
  String get newPassword => 'Yeni Şifre';

  @override
  String get confirmNewPassword => 'Yeni Şifre Tekrar';

  @override
  String get change => 'Değiştir';

  @override
  String get passwordsDoNotMatch => 'Yeni şifreler eşleşmiyor';

  @override
  String get passwordTooShort => 'Şifre en az 6 karakter olmalı';

  @override
  String get passwordChangedSuccessfully => 'Şifre başarıyla değiştirildi';

  @override
  String get currentPasswordRequired => 'Mevcut şifrenizi giriniz';

  @override
  String get newPasswordRequired => 'Yeni şifrenizi giriniz';

  @override
  String get photoChangeFeatureComingSoon =>
      'Fotoğraf değiştirme özelliği yakında eklenecek';

  @override
  String get description => 'Açıklama';

  @override
  String version(String version) {
    return 'Versiyon $version';
  }

  @override
  String get viewAndManageNotifications => 'Bildirimleri görüntüle ve yönet';

  @override
  String get privacyPolicyError =>
      'Gizlilik politikası sayfası açılamadı. Lütfen internet bağlantınızı kontrol edin.';

  @override
  String get termsOfServiceError =>
      'Hizmet şartları sayfası açılamadı. Lütfen internet bağlantınızı kontrol edin.';

  @override
  String anErrorOccurred(String error) {
    return 'Bir hata oluştu: $error';
  }

  @override
  String get appDescription =>
      'Saç ekimi ve bakım hizmetleri için tasarlanmış modern bir mobil uygulama. Kendi fotoğraflarınızı çekerek analiz yapabilir, tedavi sürecinizi takip edebilir ve klinik ile iletişime geçebilirsiniz.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. Tüm hakları saklıdır.';

  @override
  String get emergencyContactHint => 'İsim - Telefon';

  @override
  String get appointmentDetails => 'Randevu Detayları';

  @override
  String get dateLabel => 'Tarih';

  @override
  String get timeLabel => 'Saat';

  @override
  String get doctorLabel => 'Doktor';

  @override
  String get appointmentTypeLabel => 'Randevu Türü';

  @override
  String get locationLabel => 'Konum';

  @override
  String get phoneLabel => 'Telefon';

  @override
  String get followUpConsultation => 'Takip Konsültasyonu';

  @override
  String get cancelAppointment => 'Randevuyu İptal Et';

  @override
  String get addReminder => 'Hatırlatıcı Ekle';

  @override
  String get appointmentReminderSet => 'Randevu hatırlatıcısı ayarlandı';

  @override
  String get cameraPermissionRequired =>
      'Kamera izni olmadan devam edemiyoruz. Lütfen ayarlardan izni verin.';

  @override
  String get sensorPermissionRequired =>
      'Tepe ve arka açı çekimleri için hareket sensörü izni gerekli.';

  @override
  String get recoveryProgress => 'İyileşme İlerlemesi';

  @override
  String dayOfTotal(String current, String total) {
    return '$current / $total Gün';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return '$week. Hafta: İyileşme Fazı';
  }

  @override
  String get todaysCareRoutine => 'Bugünün Bakım Rutini';

  @override
  String get takeMedicationMorning => 'İlaç al (Sabah)';

  @override
  String get applyTopicalSolution => 'Topikal solüsyon uygula';

  @override
  String get takeMedicationEvening => 'İlaç al (Akşam)';

  @override
  String get upcomingAppointment => 'Yaklaşan Randevu';

  @override
  String get nextFollowUpConsultation => 'Bir sonraki takip konsültasyonunuz.';

  @override
  String get viewDetails => 'Detayları Gör';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get appointmentReminder => 'Randevu Hatırlatması';

  @override
  String appointmentReminderMessage(String time) {
    return 'Yarın saat $time\'da randevunuz var';
  }

  @override
  String hoursAgo(Object hours) {
    return '$hours saat önce';
  }

  @override
  String get medicationReminder => 'İlaç Hatırlatıcı';

  @override
  String get morningMedicationReminder => 'Sabah ilacınızı almayı unutmayın';

  @override
  String get photoReminder => 'Fotoğraf Hatırlatıcı';

  @override
  String get weeklyProgressPhotoReminder =>
      'Haftalık ilerleme fotoğrafınızı çekmeyi unutmayın';

  @override
  String daysAgo(String days) {
    return '$days gün önce';
  }

  @override
  String weeksAgo(String weeks) {
    return '$weeks weeks ago';
  }

  @override
  String monthsAgo(String months) {
    return '$months months ago';
  }

  @override
  String yearsAgo(String years) {
    return '$years years ago';
  }

  @override
  String notificationOpened(String title) {
    return '$title bildirimi açıldı';
  }

  @override
  String get appointmentCancellation => 'Randevu İptali';

  @override
  String get cancelAppointmentConfirmation =>
      'Bu randevuyu iptal etmek istediğinizden emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get appointmentCancelledSuccessfully =>
      'Randevu başarıyla iptal edildi';

  @override
  String get everyDay => 'Her gün';

  @override
  String get weekends => 'Hafta sonları';

  @override
  String get weekdays => 'Hafta içi';

  @override
  String get mondayShort => 'Pzt';

  @override
  String get tuesdayShort => 'Sal';

  @override
  String get wednesdayShort => 'Çar';

  @override
  String get thursdayShort => 'Per';

  @override
  String get fridayShort => 'Cum';

  @override
  String get saturdayShort => 'Cmt';

  @override
  String get sundayShort => 'Paz';

  @override
  String get titleCannotBeEmpty => 'Başlık boş olamaz';

  @override
  String get messageCannotBeEmpty => 'Mesaj boş olamaz';

  @override
  String get pleaseEnterValidEmail => 'Geçerli bir e-posta adresi giriniz';

  @override
  String get selectAtLeastOneDay => 'En az bir gün seçiniz';

  @override
  String get dailyEmailScheduled => 'Günlük email planlandı';

  @override
  String deleteTaskConfirmation(String title) {
    return '\"$title\" görevini silmek istediğinizden emin misiniz?';
  }

  @override
  String get taskDeleted => 'Görev silindi';

  @override
  String get deleteTask => 'Görevi Sil';

  @override
  String get newScheduledEmail => 'Yeni Email Planla';

  @override
  String get createDailyEmailTasks => 'Günlük email görevleri oluşturun';

  @override
  String get titleLabel => 'Başlık';

  @override
  String get messageLabel => 'Mesaj';

  @override
  String get recipientNameLabel => 'Alıcı İsmi';

  @override
  String get delete => 'Sil';

  @override
  String get daysLabel => 'Günler';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'Türkiye\'nin göz bebeği İstanbul\'da, saç ekimi alanında hizmet veren önde gelen kliniklerden biridir.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic, Türkiye\'nin göz bebeği İstanbul\'da, saç ekimi alanında hizmet veren önde gelen kliniklerden biridir. Alanında uluslararası tanınırlığa sahip Dr. Gökay Bilgin ve Dr. Mehmet Erdoğan\'ın liderliğinde faaliyet gösteren Smile Hair Clinic\'te hasta memnuniyeti daima ön planda tutulur.';

  @override
  String get clinicAboutDescription2 =>
      'Tüm operasyon süreçleri bizzat doktorlar tarafından takip edilir ve ekipte yer alan her bir üye medikal eğitim almış profesyonellerden oluşur. Bugüne kadar dünyanın dört bir yanından gelen çok sayıda hastaya başarılı saç ekimi uygulamaları gerçekleştirilmiştir.';

  @override
  String get clinicEthicsDescription =>
      'Smile Hair Clinic olarak, hasta haklarına saygı, şeffaflık, dürüstlük ve profesyonellik ilkelerimiz doğrultusunda hizmet vermekteyiz. Tüm tedavi süreçlerinde etik kurallara uygun hareket eder, hasta gizliliğini korur ve en yüksek kalitede hizmet sunmayı hedefleriz.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic, başarılı sonuçları ve hasta memnuniyeti ile çeşitli medya organlarında yer almıştır. Uluslararası saç ekimi konferanslarında sunumlar yapmış, alanında öncü çalışmalara imza atmıştır.';

  @override
  String get mediaOutlets => 'Yer Aldığımız Medya Organları:';

  @override
  String get clinicFoundingPartner => 'Smile Hair Clinic\'in kurucu ortağıdır.';

  @override
  String get clinicTeamMember => 'Smile Hair Clinic\'te görev yapmaktadır.';

  @override
  String get clinicExperiencedDoctor =>
      'Smile Hair Clinic\'te görevini yürüten, hasta memnuniyetini ön planda tutan deneyimli hekim.';

  @override
  String get viewFaqPage => 'SSS sayfasını görüntüle';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, İstanbul';

  @override
  String get chatWelcomeMessage =>
      'Hoş geldiniz! Bugün size nasıl yardımcı olabiliriz? Ekibimiz genellikle bir saat içinde yanıt verir.';

  @override
  String get chatSampleMessage =>
      'Merhaba, tedavi planım hakkında soru sormak istiyorum.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'ön';

  @override
  String get backCamera => 'arka';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Zaman Çizelgesi';

  @override
  String get visibleImprovementDescription =>
      'Tepe bölgesinde yoğunlukta görünür iyileşme. Hasta yüksek memnuniyet bildiriyor.';

  @override
  String get procedureDetails => 'Tür: FUE Restorasyonu\nGreft: 2,450';

  @override
  String get scheduledEmails => 'Planlanmış E-postalar';

  @override
  String get noScheduledEmails => 'Planlanmış email yok';

  @override
  String get sampleAppointmentDate => 'Salı, 9 Kasım 2023, 10:30';

  @override
  String get sampleAppointmentDateFull => 'Salı, 9 Kasım 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'İstanbul, Türkiye';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Saç Restorasyonu ve Bakımı';

  @override
  String get welcomeLogin => 'Giriş Yap';

  @override
  String get welcomeRegister => 'Kayıt Ol';

  @override
  String get loginTitle => 'Tekrar Hoş Geldiniz';

  @override
  String get loginSubtitle => 'Hesabınıza giriş yapın';

  @override
  String get loginEmail => 'E-posta';

  @override
  String get loginEmailHint => 'E-posta adresinizi girin';

  @override
  String get loginPassword => 'Şifre';

  @override
  String get loginPasswordHint => 'Şifrenizi girin';

  @override
  String get loginForgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get loginLoginButton => 'Giriş Yap';

  @override
  String get loginOr => 'veya';

  @override
  String get loginGoogleLogin => 'Google ile devam et';

  @override
  String get loginNeedAccount => 'Hesabınız yok mu?';

  @override
  String get forgotPasswordTitle => 'Şifrenizi Sıfırlayın';

  @override
  String get forgotPasswordSubtitle =>
      'Hesabınıza bağlı e-posta adresinizi girin. Şifre sıfırlama bağlantısı gönderilecektir.';

  @override
  String get forgotPasswordSendButton => 'Sıfırlama E-postası Gönder';

  @override
  String get forgotPasswordEmailSent =>
      'Şifre sıfırlama e-postası gönderildi. Gelen kutunuzu kontrol edin.';

  @override
  String get registrationTitle => 'Hesabınızı Oluşturun';

  @override
  String get registrationSubtitle => 'Yeni bir hesap oluşturun';

  @override
  String get registrationName => 'Ad Soyad';

  @override
  String get registrationNameHint => 'Adınızı ve soyadınızı girin';

  @override
  String get registrationEmail => 'E-posta';

  @override
  String get registrationEmailHint => 'E-posta adresinizi girin';

  @override
  String get registrationPassword => 'Şifre';

  @override
  String get registrationPasswordHint => 'Şifrenizi oluşturun';

  @override
  String get registrationConfirmPassword => 'Şifre Tekrarı';

  @override
  String get registrationConfirmPasswordHint => 'Şifrenizi tekrar girin';

  @override
  String get registrationTerms =>
      'Kullanım Koşulları ve Gizlilik Politikasını kabul ediyorum.';

  @override
  String get registrationRegisterButton => 'Hesap Oluştur';

  @override
  String get registrationAlreadyHaveAccount => 'Zaten bir hesabınız var mı?';

  @override
  String get registrationLoginLink => 'Giriş Yap';

  @override
  String dashboardHelloParam(String name) {
    return 'Merhaba, $name';
  }

  @override
  String get dashboardHome => 'Ana Sayfa';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Analiz';

  @override
  String get dashboardMyAppointments => 'Randevularım';

  @override
  String get dashboardResources => 'Kaynaklar';

  @override
  String get dashboardCareGuide => 'Bakım Rehberi';

  @override
  String get dashboardCareGuideSubtitle =>
      'Saç ekimi sonrası bakım talimatları';

  @override
  String get dashboardDefaultUserName => 'Kullanıcı';

  @override
  String get dashboardHairTransplantTitle => 'Saç Ekimi';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Tüm saç ekimi yöntemlerini keşfedin';

  @override
  String get dashboardOnlineConsultationTitle => 'Online Konsültasyon';

  @override
  String get dashboardOnlineConsultationSubtitle => 'Ücretsiz danışmanlık alın';

  @override
  String get dashboardDoctorsTitle => 'Doktorlarımız';

  @override
  String get dashboardDoctorsSubtitle => 'Uzman doktorlarımızı tanıyın';

  @override
  String get dashboardAboutUsTitle => 'Hakkımızda';

  @override
  String get dashboardAboutUsSubtitle => 'Kliniğimiz hakkında bilgi edinin';

  @override
  String get dashboardContactTitle => 'İletişim';

  @override
  String get dashboardContactSubtitle => 'Bizimle iletişime geçin';

  @override
  String get dashboardProgressTracking => 'İlerleme Takibi';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Tedavi sürecinizi takip edin';

  @override
  String get dashboardPastAnalysesSubtitle => 'Önceki fotoğraf analizleriniz';

  @override
  String get settingsProfile => 'Profil';

  @override
  String get settingsPreferences => 'Tercihler';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsLanguageSubtitle => 'Tercih ettiğiniz dili seçin';

  @override
  String get settingsDarkMode => 'Karanlık Mod';

  @override
  String get settingsDarkModeSubtitle => 'Karanlık temayı etkinleştir';

  @override
  String get settingsNotifications => 'Bildirimler';

  @override
  String get settingsNotificationsSubtitle => 'Tüm bildirimleri etkinleştir';

  @override
  String get settingsEmailNotifications => 'E-posta Bildirimleri';

  @override
  String get settingsEmailNotificationsSubtitle => 'E-posta ile bildirim alın';

  @override
  String get settingsPushNotifications => 'Anlık Bildirimler';

  @override
  String get settingsPushNotificationsSubtitle => 'Anlık bildirimler alın';

  @override
  String get settingsAccount => 'Hesap';

  @override
  String get settingsChangePassword => 'Şifre Değiştir';

  @override
  String get settingsChangePasswordSubtitle => 'Şifrenizi güncelleyin';

  @override
  String get settingsPrivacyPolicy => 'Gizlilik Politikası';

  @override
  String get settingsPrivacyPolicySubtitle => 'Gizlilik politikamızı okuyun';

  @override
  String get settingsTermsOfService => 'Hizmet Şartları';

  @override
  String get settingsTermsOfServiceSubtitle => 'Hizmet şartlarımızı okuyun';

  @override
  String get settingsSupport => 'Destek';

  @override
  String get settingsHelpSupport => 'Yardım ve Destek';

  @override
  String get settingsHelpSupportSubtitle =>
      'Yardım alın ve destekle iletişime geçin';

  @override
  String get settingsAddPhone => 'Telefon ekleyin';

  @override
  String get settingsThemeMode => 'Tema Modu';

  @override
  String get settingsThemeDescriptionSystem => 'Sistem ayarlarına göre';

  @override
  String get settingsThemeDescriptionLight => 'Aydınlık tema';

  @override
  String get settingsThemeDescriptionDark => 'Karanlık tema';

  @override
  String get settingsThemeDialogTitle => 'Tema Modunu Seçin';

  @override
  String get settingsThemeOptionSystem => 'Sistem';

  @override
  String get settingsThemeOptionSystemSubtitle => 'Cihaz ayarlarına göre';

  @override
  String get settingsThemeOptionLight => 'Aydınlık';

  @override
  String get settingsThemeOptionLightSubtitle => 'Açık renkli tema';

  @override
  String get settingsThemeOptionDark => 'Karanlık';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Koyu renkli tema';

  @override
  String get settingsKvkkFormTitle => 'KVKK Başvuru Formu';

  @override
  String get settingsKvkkFormSubtitle =>
      'Kişisel verileriniz hakkında başvuru yapın';

  @override
  String get settingsGdprFormTitle => 'GDPR İletişim Formu';

  @override
  String get settingsGdprFormSubtitle => 'KVKK ve GDPR aydınlatma metinleri';

  @override
  String get settingsRecordsTitle => 'Kayıtlarım';

  @override
  String get settingsTreatmentHistoryTitle => 'Tedavi Geçmişi';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Randevu ve operasyon kayıtlarınızı görüntüleyin';

  @override
  String get settingsDocumentsTitle => 'Dokümanlar';

  @override
  String get settingsDocumentsSubtitle =>
      'Raporlar, reçeteler ve paylaşılan dosyalar';

  @override
  String get settingsInvoicesTitle => 'Faturalar';

  @override
  String get settingsInvoicesSubtitle =>
      'Ödemelerinizi ve faturalarınızı yönetin';

  @override
  String get settingsSupportCenterSubtitle =>
      '7/24 destek ve iletişim kanalları';

  @override
  String get settingsContactTitle => 'İletişim';

  @override
  String get settingsContactSubtitle =>
      'Adres, telefon ve iletişim seçenekleri';

  @override
  String get settingsProfileLoginRequired =>
      'Profil fotoğrafını değiştirmek için giriş yapın.';

  @override
  String get settingsProfilePhotoUpdated => 'Profil fotoğrafınız güncellendi.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Fotoğraf güncellenirken hata oluştu: $error';
  }

  @override
  String get supportCenterTitle => 'Destek Merkezi';

  @override
  String get supportCenterHeroTitle => '7/24 Yanınızdayız';

  @override
  String get supportCenterHeroDescription =>
      'Smile Hair Clinic destek ekibimiz, tedavi sürecinizin her adımında yanınızda.';

  @override
  String get supportCenterQuickContact => 'Hızlı İletişim';

  @override
  String get supportCenterWhatsappTitle => 'WhatsApp üzerinden sohbet et';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Canlı destek ekibimizle hemen görüşün';

  @override
  String get supportCenterCallTitle => 'Bizi arayın';

  @override
  String get supportCenterEmailTitle => 'E-posta gönderin';

  @override
  String get supportCenterKnowledgeBase => 'Bilgi Merkezi';

  @override
  String get supportCenterFaqSubtitle =>
      'Operasyon öncesi ve sonrası merak ettikleriniz';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Bilgi Bankası';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Tüm saç ekimi makalelerimiz';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Randevu ve Tedavi Desteği';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Tedavi planınız hakkında bilgi alın';

  @override
  String get supportCenterMessageSectionTitle => 'Bize Mesaj Gönderin';

  @override
  String get supportCenterMessageLabel => 'Mesajınız';

  @override
  String get supportCenterMessageHint => 'Sorununuzu veya talebinizi yazın...';

  @override
  String get supportCenterMessageEmpty => 'Lütfen bir mesaj yazın';

  @override
  String get supportCenterMessageSuccess =>
      'Mesajınız alınmıştır. En kısa sürede dönüş yapacağız.';

  @override
  String get supportCenterSendButton => 'Gönder';

  @override
  String get treatmentHistoryTitle => 'Tedavi Geçmişi';

  @override
  String get treatmentHistoryLoginRequired =>
      'Bu özelliği görmek için giriş yapmanız gerekiyor.';

  @override
  String get treatmentHistoryEmpty =>
      'Henüz kayıtlı bir tedavi geçmişiniz bulunmuyor.';

  @override
  String get treatmentHistoryDatePending => 'Tarih bekleniyor';

  @override
  String get treatmentHistoryDefaultType => 'Kontrol';

  @override
  String get treatmentHistoryDoctorPending => 'Atanacak';

  @override
  String get treatmentHistoryStatusCompleted => 'Tamamlandı';

  @override
  String get treatmentHistoryStatusCancelled => 'İptal';

  @override
  String get treatmentHistoryStatusInProgress => 'Devam ediyor';

  @override
  String get treatmentHistoryStatusScheduled => 'Planlandı';

  @override
  String get settingsAbout => 'Hakkında';

  @override
  String get settingsAboutSubtitle => 'Uygulama sürümü ve bilgileri';

  @override
  String get settingsLogout => 'Çıkış Yap';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'Premium Saç Restorasyonu';

  @override
  String get clinicProfileAbout => 'Hakkında';

  @override
  String get clinicProfileDoctors => 'Doktorlar';

  @override
  String get clinicProfileGallery => 'Galeri';

  @override
  String get clinicProfileTreatments => 'Tedaviler';

  @override
  String get clinicProfileBookConsultation => 'Konsültasyon Randevusu Al';

  @override
  String get clinicProfileAboutTitle => 'Hakkımızda';

  @override
  String get clinicProfileEthicsTitle => 'Etik Kurallarımız';

  @override
  String get clinicProfilePressTitle => 'Basında Biz';

  @override
  String get clinicProfileContactTitle => 'İletişim Bilgileri';

  @override
  String get clinicProfileDoctorsTitle => 'Doktorlarımız';

  @override
  String get clinicProfileGalleryTitle => 'Sonuç Galerisi';

  @override
  String get clinicProfileHairSurgeon => 'Saç Ekimi Cerrahı';

  @override
  String get pastAnalysesTitle => 'Geçmiş Analizler';

  @override
  String get faqTitle => 'Sıkça Sorulan Sorular';

  @override
  String get faqSubtitle => 'Merak ettikleriniz için';

  @override
  String get splashTagline => 'Saç Ekimi ve Estetik Uzmanı';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Saç ve kafa derisi için 5 kritik açıdan otomatik çekim.\nBaşlamadan önce aydınlık bir ortamda olduğunuzdan emin olun.';

  @override
  String get captureFlowStartCapture => 'Çekime Başla';

  @override
  String get captureFlowFaceDetection =>
      'Yüzünüzü kadraja alın ve kameraya bakın.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Konum doğru, sabit kalın ($seconds sn)';
  }

  @override
  String get captureFlowTurnRightMore => 'Başınızı biraz daha sağa çevirin.';

  @override
  String get captureFlowTooMuchRight =>
      'Biraz fazla döndünüz, hafif sola toparlayın.';

  @override
  String get captureFlowKeepHeadStill =>
      'Başınızı sabit tutup omuzlarınızı hareket ettirmeyin.';

  @override
  String get captureFlowTurnLeftMore => 'Başınızı biraz daha sola çevirin.';

  @override
  String get captureFlowTooMuchLeft =>
      'Biraz fazla döndünüz, hafif sağa toparlayın.';

  @override
  String get captureFlowCaptured => 'çekildi';

  @override
  String get captureFlowInitializingCamera => 'Kamera hazırlanıyor...';

  @override
  String get captureFlowCapturedPhotos => 'Çekilen Fotoğraflar';

  @override
  String get captureFlowEndSession => 'Oturumu Sonlandır';

  @override
  String get captureFlowReviewPhotos => 'Fotoğrafları İncele';

  @override
  String get captureFlowPhotosCaptured => 'fotoğraf çekildi';

  @override
  String get captureFlowSelected => 'Seçili';

  @override
  String get captureFlowContinueToAnalysis => 'Analize Devam Et';

  @override
  String get captureFlowNewCapture => 'Yeni Çekim Başlat';

  @override
  String get captureFlowPhotosFrom5Angles => '5 açıdan çekilen fotoğraflar';

  @override
  String get captureStageFrontTitle => 'Ön Görünüm';

  @override
  String get captureStageFrontBaseInstruction =>
      'Kameraya düz bakın ve başınızı sabit tutun.';

  @override
  String get captureStageFrontReminder =>
      'Başınızı düz tutun ve kameraya bakın.';

  @override
  String get captureStageRight45Title => 'Sağ 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Başınızı sağa 45 derece çevirin.';

  @override
  String get captureStageRight45Reminder => 'Başınızı daha fazla sağa çevirin.';

  @override
  String get captureStageLeft45Title => 'Sol 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Başınızı sola 45 derece çevirin.';

  @override
  String get captureStageLeft45Reminder => 'Başınızı daha fazla sola çevirin.';

  @override
  String get captureStageVertexTitle => 'Üst Görünüm';

  @override
  String get captureStageVertexBaseInstruction =>
      'Telefonunuzu başınızın üzerinde yatay tutun.';

  @override
  String get captureStageVertexReminder =>
      'Telefonunuzu başınızın üzerinde düz tutun.';

  @override
  String get captureStageDonorTitle => 'Donör Bölge';

  @override
  String get captureStageDonorBaseInstruction =>
      'Başınızı çevirin ve telefonu başınızın arkasında tutun.';

  @override
  String get captureStageDonorReminder =>
      'Telefonu başınızın arkasında sabit tutun.';

  @override
  String get photoCaptureFrontView => 'Ön Görünüm';

  @override
  String get photoCapturePositionHead => 'Başınızı çerçeve içine yerleştirin';

  @override
  String get photoCaptureFront => 'Ön';

  @override
  String get photoCaptureTop => 'Üst';

  @override
  String get photoCaptureLeft => 'Sol';

  @override
  String get photoCaptureRight => 'Sağ';

  @override
  String get chatOnline => 'Çevrimiçi';

  @override
  String get chatToday => '--- Bugün ---';

  @override
  String get chatMessageHint => 'Mesajınızı yazın...';

  @override
  String get chatQuickRepliesAppointment => 'Randevu al';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Tedavi planım';

  @override
  String get chatQuickRepliesFollowup => 'Takip iste';

  @override
  String get chatQuickRepliesPriceInfo => 'Fiyat bilgisi';

  @override
  String progressPatientIdParam(String id) {
    return 'Hasta ID: $id';
  }

  @override
  String get progressStatistics => 'İstatistikler';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Ay Sonrası';
  }

  @override
  String get progressProcedureDay => 'İşlem Günü';

  @override
  String get progressInitialConsultation => 'İlk Konsültasyon';

  @override
  String get progressUploadPhoto => 'Yeni Fotoğraf Yükle';

  @override
  String get analysisCaptureAndAnalyze => 'Çek ve Analiz Et';

  @override
  String get analysisPastAnalyses => 'Geçmiş Analizler';

  @override
  String get analysisAnalysisDate1 => '15 Ekim 2023';

  @override
  String get analysisAnalysisDesc1 => 'Tepe bölgesinde hafif seyrelme';

  @override
  String get analysisAnalysisDate2 => '12 Temmuz 2023';

  @override
  String get analysisAnalysisDesc2 => 'Saç derisinde iltihaplanma belirtileri';

  @override
  String get analysisAnalysisDate3 => '05 Nisan 2023';

  @override
  String get analysisAnalysisDesc3 => 'Genel saç derisi sağlığı iyi';

  @override
  String get analysisAnalysisDate4 => '20 Ocak 2023';

  @override
  String get analysisAnalysisDesc4 => 'Tedaviye başlangıç analizi';

  @override
  String get faqQuestion1 => 'Saç ekimi işlemi ne kadar sürer?';

  @override
  String get faqAnswer1 =>
      'Saç ekimi işlemi, ekilecek greft sayısına bağlı olarak genellikle 4-8 saat arasında sürmektedir. İşlem sırasında lokal anestezi kullanıldığı için hasta ağrı hissetmez.';

  @override
  String get faqQuestion2 =>
      'Saç ekimi sonrası ne zaman normal hayata dönebilirim?';

  @override
  String get faqAnswer2 =>
      'Saç ekimi sonrası 2-3 gün içinde hafif aktiviteler yapabilirsiniz. Ağır spor ve fiziksel aktiviteler için 2 hafta beklemeniz önerilir. İşe dönüş genellikle 3-5 gün sonra mümkündür.';

  @override
  String get faqQuestion3 =>
      'Saç ekimi sonrası saçlar ne zaman çıkmaya başlar?';

  @override
  String get faqAnswer3 =>
      'Ekilen saçlar ilk 2-3 hafta içinde dökülür (şok dökülme). Yeni saçlar 3-4 ay sonra çıkmaya başlar ve 6-12 ay içinde tam sonuç görülür.';

  @override
  String get faqQuestion4 => 'Saç ekimi işlemi ağrılı mıdır?';

  @override
  String get faqAnswer4 =>
      'İşlem sırasında lokal anestezi kullanıldığı için ağrı hissedilmez. İşlem sonrası hafif bir ağrı olabilir ancak bu ağrı kesicilerle kontrol altına alınabilir.';

  @override
  String get faqQuestion5 => 'Saç ekimi işleminin başarı oranı nedir?';

  @override
  String get faqAnswer5 =>
      'Saç ekimi işleminin başarı oranı çok yüksektir, genellikle %95-98\'dir. Başarı, hastanın sağlığına, donör bölgenin kalitesine ve ameliyat sonrası bakım talimatlarına uyulmasına bağlıdır.';

  @override
  String get faqQuestion6 => 'Kadınlar saç ekimi yaptırabilir mi?';

  @override
  String get faqAnswer6 =>
      'Evet, kadınlar saç ekimi yaptırabilir. Kadın tipi saç dökülmesi yaygındır ve saç ekimi prosedürleri ile tedavi edilebilir. Hastanın uygun bir aday olup olmadığını belirlemek için bir konsültasyon gereklidir.';

  @override
  String get faqQuestion7 => 'Saç ekimi için kaç greft gereklidir?';

  @override
  String get faqAnswer7 =>
      'Gereken greft sayısı saç dökülmesinin kapsamına ve istenen yoğunluğa bağlıdır. Genellikle orta düzeyde saç dökülmesi için 1.500-3.000 greft kullanılırken, kapsamlı saç dökülmesi için 3.000-5.000 greft gerekebilir.';

  @override
  String get faqQuestion8 => 'Saç ekimi için yaş sınırı var mı?';

  @override
  String get faqAnswer8 =>
      'Kesin bir yaş sınırı yoktur, ancak işlem genellikle saç dökülmesi modeli daha stabil olduğu için 25 yaş üstü hastalara önerilir. Her vaka bireysel olarak değerlendirilir.';

  @override
  String get faqQuestion9 => 'Saç ekimi sonrası iyileşme süresi ne kadardır?';

  @override
  String get faqAnswer9 =>
      'Çoğu hasta 3-5 gün içinde işe dönebilir. Kabuklar genellikle 7-10 gün içinde düşer. Tam iyileşme ve normal aktiviteler 2 hafta sonra devam edebilir.';

  @override
  String get faqQuestion10 => 'Saç ekimi sonuçları kalıcı mı?';

  @override
  String get faqAnswer10 =>
      'Evet, ekilen saç kalıcıdır çünkü genetik olarak saç dökülmesine dirençli olan donör bölgeden alınır. Ekilen saç hayatınızın geri kalanında doğal olarak büyümeye devam edecektir.';

  @override
  String get pastAnalysesListView => 'Liste Görünümü';

  @override
  String get pastAnalysesGridView => 'Izgara Görünümü';

  @override
  String get pastAnalysesDetailedView => 'Detaylı Görünüm';

  @override
  String get pastAnalysesDensityModerate => 'Yoğunluk: Orta';

  @override
  String get pastAnalysesDensityLow => 'Yoğunluk: Düşük';

  @override
  String get privacyPolicyTitle =>
      'Kişisel Verilerin İşlenmesi ve Korunması Politikası';

  @override
  String get privacyPolicyDocumentDate => 'Belge Tarihi:';

  @override
  String get privacyPolicyRevisionDate => 'Revizyon Tarihi:';

  @override
  String get privacyPolicyRevisionNumber => 'Revizyon Numarası:';

  @override
  String get privacyPolicySection1 => 'I. GİRİŞ';

  @override
  String get privacyPolicySection1A => 'A. Amaç ve Kapsam';

  @override
  String get privacyPolicySection1AContent =>
      'Bu Politika, Smile Hair Clinic\'in kişisel verilerin korunması ve işlenmesi konusunda benimsediği ilkeleri düzenlemektedir.\n\nBu Politika kapsamında, Smile Hair Clinic, kişisel verilerin işlenmesi faaliyetleri ve kişisel verilerin korunması için benimsenen sistemler hakkında açıklamalar sağlamaktadır. Bu, başta Ürün veya Hizmet Alıcıları, Çalışanlar ve Çalışan Adayları, Potansiyel Müşteriler, Paydaşlar, Ziyaretçiler, Katılımcılar, Tedarikçiler ve Üçüncü Taraflar olmak üzere İlgili Kişilere bilgilendirme ve şeffaflık sağlanmasını; kişisel veri yönetiminde standartların oluşturulması ve sağlanmasını; organizasyonel hedeflerin ve yükümlülüklerin belirlenmesi ve desteklenmesini; kabul edilebilir risk seviyeleriyle uyumlu kontrol mekanizmalarının oluşturulmasını, uluslararası sözleşmeler, Anayasa, yasalar, yönetmelikler, sözleşmeler ve kişisel verilerin korunmasına ilişkin diğer mevzuatın getirdiği ilke ve kurallara uyum sağlanmasını ve İlgili Kişinin temel hak ve özgürlüklerinin en iyi şekilde korunmasını içermektedir. Ayrıca, bu Politika, kişisel ve özel nitelikli kişisel verilerin otomatik olarak veya otomatik olmayan yollarla bir veri kayıt sisteminin parçası olarak işlenmesi için kullanılan tüm fiziksel ve elektronik veri kayıt sistemlerini ve ortamlarını kapsamaktadır.';

  @override
  String get privacyPolicySection1B => 'B. Tanımlar';

  @override
  String get photoAnalysisTitle => 'Fotoğraf Analizi';

  @override
  String photosUploadedCount(String count) {
    return '$count fotoğraf yüklendi';
  }

  @override
  String get autoAnalysisStarting =>
      '5 fotoğraf yüklendi. Otomatik analiz başlatılıyor...';

  @override
  String stageUploaded(String stage) {
    return '$stage açısı yüklendi';
  }

  @override
  String stageCaptured(String stage) {
    return '$stage açısı çekildi';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Fotoğraf yüklenirken hata oluştu: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Çoklu fotoğraf yüklenirken hata oluştu: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Fotoğraf çekilirken hata oluştu: $error';
  }

  @override
  String get imageSourceTitle => 'Fotoğraf Kaynağı';

  @override
  String get imageSourceCamera => 'Kamera';

  @override
  String get imageSourceGallery => 'Galeri';

  @override
  String get imageSourceMultiGallery => 'Çoklu Galeri Seçimi';

  @override
  String get promptNoPhotosForAnalysis =>
      'Lütfen önce fotoğraf yükleyin. Fotoğraf yüklemek için 📷 butonuna tıklayın.';

  @override
  String get analyzingPhotos => 'Fotoğraflarınız analiz ediliyor...';

  @override
  String get visualAnalysisHeader => '📸 Görsel Analiz - Ne Görüyorum:';

  @override
  String get importantWarningHeader => '⚠️ ÖNEMLİ UYARI:';

  @override
  String get differentPersonsDetected =>
      'Fotoğraflarda farklı kişiler tespit edildi! Tüm fotoğraflar aynı kişiye ait olmalıdır.';

  @override
  String get pleaseCaptureSamePerson =>
      'Lütfen aynı kişinin 5 farklı açıdan fotoğraflarını çekin.';

  @override
  String get detectedAnglesHeader => '📐 Tespit Edilen Açılar:';

  @override
  String get analysisCompleted => 'Analiz tamamlandı';

  @override
  String get allPhotosLookGood => 'Tüm fotoğraflar uygun görünüyor.';

  @override
  String get savedToFirebase => '✅ Fotoğraflar Firebase\'e kaydedildi!';

  @override
  String analysisIdLabel(String id) {
    return 'Analiz ID: $id';
  }

  @override
  String get savedLocationLabel => 'Kayıt Yeri: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Analiz Sonucu';

  @override
  String get retakeRequiredAngles => '❌ Tekrar çekilmesi gereken açılar:';

  @override
  String get errorDetailsHeader => 'Hata Detayları:';

  @override
  String get retakeTheseAnglesQuestion =>
      'Bu açıları tekrar çekmek ister misiniz?';

  @override
  String get retakeFirstInvalidQuestion =>
      'İlk hatalı açıyı tekrar çekmek ister misiniz?';

  @override
  String get retake => 'Tekrar Çek';

  @override
  String get aiAnalysisTitle => 'AI Analysis';

  @override
  String get aiAnalysisDescription =>
      'The AI analyzes your photos and provides feedback on your hair transplant progress.';

  @override
  String get aiAnalysisInProgress => 'Yapay zeka analizi yapılıyor...';

  @override
  String get aiAnalysisCompleted =>
      'AI analysis completed. Please check the results.';

  @override
  String aiAnalysisError(String error) {
    return 'Error occurred during AI analysis: $error';
  }

  @override
  String get uploadAndAnalyze => 'Yükle ve Analiz Et';

  @override
  String get captureWithFaceDetection => 'Yüz Tanıma ile Çek';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'Select Time';

  @override
  String get dateNotAvailable => 'Tarih mevcut değil';

  @override
  String get setReminder => 'Hatırlatıcı Ayarla';

  @override
  String get enableDailyMedicationReminder =>
      'Günlük İlaç Hatırlatıcısını Etkinleştir';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Hızlı Erişim';

  @override
  String get quickActions => 'Hızlı İşlemler';

  @override
  String get preparation => 'Preparation';

  @override
  String get uploading => 'Uploading';

  @override
  String get aiAnalysis => 'AI Analysis';

  @override
  String get saving => 'Saving';

  @override
  String get done => 'Done';

  @override
  String get frontAngle => 'Front (Front)';

  @override
  String get right45Angle => 'Right 45° (Right45)';

  @override
  String get left45Angle => 'Left 45° (Left45)';

  @override
  String get vertexAngle => 'Vertex (Vertex)';

  @override
  String get donorAngle => 'Donor (Donor)';

  @override
  String get ok => 'Tamam';

  @override
  String get noUpcomingAppointments => 'Yaklaşan Randevu Yok';

  @override
  String get onlineConsultation => 'Online Konsültasyon';

  @override
  String get freeConsultation => 'Ücretsiz Konsültasyon';

  @override
  String get freeConsultationSubtitle =>
      'Daha fazla bilgi almak için bizimle iletişime geçin';

  @override
  String get fullNameLabel => 'Adınız Soyadınız *';

  @override
  String get fullNameHint => 'Ad Soyad';

  @override
  String get emailExample => 'ornek@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Mesajınızı buraya yazın...';

  @override
  String get or => 'or';

  @override
  String get messageSentSuccessfully => 'Mesajınız başarıyla gönderildi!';

  @override
  String get aboutUsTitle => 'Hakkımızda';

  @override
  String get whoWeAre => 'Biz Kimiz?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic, Türkiye\'nin göz bebeği İstanbul\'da, saç ekimi alanında hizmet veren önde gelen kliniklerden biridir. Alanında uluslararası tanınırlığa sahip Dr. Gökay Bilgin ve Dr. Mehmet Erdoğan\'ın liderliğinde faaliyet gösteren Smile Hair Clinic\'te hasta memnuniyeti daima ön planda tutulur.\n\nTüm operasyon süreçleri bizzat doktorlar tarafından takip edilir ve ekipte yer alan her bir üye medikal eğitim almış profesyonellerden oluşur. Bugüne kadar dünyanın dört bir yanından gelen çok sayıda hastaya başarılı saç ekimi uygulamaları gerçekleştirilmiştir.';

  @override
  String get ourValues => 'Değerlerimiz';

  @override
  String get professionalism => 'Profesyonellik';

  @override
  String get professionalismDescription =>
      'Alanında uzman, uluslararası sertifikalı doktorlarımız';

  @override
  String get patientSatisfaction => 'Hasta Memnuniyeti';

  @override
  String get patientSatisfactionDescription =>
      'Her zaman önceliğimiz hastalarımızın mutluluğu';

  @override
  String get medicalEducation => 'Medikal Eğitim';

  @override
  String get medicalEducationDescription =>
      'Ekibimizdeki her üye medikal eğitim almış profesyonellerden oluşur';

  @override
  String get internationalService => 'Uluslararası Hizmet';

  @override
  String get internationalServiceDescription =>
      'Dünyanın dört bir yanından hastalarımıza hizmet';

  @override
  String get byNumbers => 'Rakamlarla Biz';

  @override
  String get successfulOperations => 'Başarılı\nOperasyon';

  @override
  String get patientsFromCountries => 'Ülkeden\nHasta';

  @override
  String get expertDoctors => 'Uzman\nDoktor';

  @override
  String get patientSatisfactionRate => 'Hasta\nMemnuniyeti';

  @override
  String get experience => 'Experience';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'About';

  @override
  String get expertiseAreas => 'Areas of Expertise';

  @override
  String get interview => 'Interview';

  @override
  String get contactUs => 'Bizimle İletişime Geçin';

  @override
  String get call => 'Call';

  @override
  String get workingHours => 'Çalışma Saatleri';

  @override
  String get mondayFriday => 'Pazartesi - Cuma';

  @override
  String get saturday => 'Cumartesi';

  @override
  String get sunday => 'Pazar';

  @override
  String get closed => 'Kapalı';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'All';

  @override
  String get unread => 'Unread';

  @override
  String get scheduled => 'Scheduled';

  @override
  String get markAllAsRead => 'Mark All as Read';

  @override
  String get noNotificationsYet => 'No notifications yet';

  @override
  String get newNotificationsWillAppearHere =>
      'New notifications will appear here';

  @override
  String get captureAndAnalyze => 'Capture and Analyze';

  @override
  String get captureAndAnalyzeSubtitle =>
      'Capture photos from 5 critical angles and analyze them';

  @override
  String get uploadAndAnalyzeSubtitle =>
      'Upload photos from your gallery and analyze them';

  @override
  String get captureWithFaceDetectionSubtitle =>
      'Automatic capture with face detection technology';

  @override
  String get showFaceToCamera => 'Yüzünüzü kameraya gösterin...';

  @override
  String cameraNotFound(Object type) {
    return 'Kamera bulunamadı';
  }

  @override
  String get phoneAppCannotOpen =>
      'Telefon uygulaması açılamadı. Lütfen cihazınızda telefon uygulamasının yüklü olduğundan emin olun.';

  @override
  String get emailAppCannotOpen =>
      'E-posta uygulaması açılamadı. Lütfen cihazınızda e-posta uygulamasının yüklü olduğundan emin olun.';

  @override
  String get mapCannotOpen =>
      'Harita açılamadı. Lütfen internet bağlantınızı kontrol edin.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Doktorlarımız';

  @override
  String get contact => 'İletişim';

  @override
  String get history => 'Geçmiş';

  @override
  String get timeNotAvailable => 'Saat mevcut değil';

  @override
  String get date => 'Tarih';

  @override
  String get time => 'Saat';

  @override
  String get doctor => 'Doktor';

  @override
  String get doctorNamePlaceholder => 'Dr. Sarah Johnson';

  @override
  String get type => 'Tür';

  @override
  String get consultationTypePlaceholder => 'Takip Konsültasyonu';

  @override
  String get location => 'Konum';

  @override
  String get notes => 'Notlar';

  @override
  String get yourDoctor => 'Doktorunuz';

  @override
  String get appointment => 'Randevu';

  @override
  String get soon => 'Yakında';

  @override
  String get reminderAdded => 'Hatırlatıcı eklendi';

  @override
  String reminderAddError(Object error) {
    return 'Hatırlatıcı eklenemedi: $error';
  }

  @override
  String appointmentWith(Object doctorName, Object type) {
    return '$doctorName ile $type';
  }

  @override
  String cameraInitError(Object error) {
    return 'Kamera başlatılırken hata oluştu: $error';
  }

  @override
  String cameraRefreshError(Object error) {
    return 'Kamera yenilenemedi: $error';
  }

  @override
  String photoCaptureError(Object error) {
    return 'Fotoğraf çekilirken hata oluştu: $error';
  }

  @override
  String get panoramaComplete => 'Panoramik çekim tamamlandı.';

  @override
  String get panoramaVertexInstruction =>
      'Telefonu tepenizin üzerine alın, ekran yere bakacak şekilde yatay tutun.';

  @override
  String get sensorDataWaiting => 'Sensör verisi bekleniyor...';

  @override
  String panoramaContinueToDonor(Object degrees) {
    return 'Enseye doğru devam edin ($degrees derece kaldı).';
  }

  @override
  String get panoramaHoldSteady => 'Telefonu sabit tutun, arka foto çekiliyor.';

  @override
  String get turnHeadRightInstruction =>
      'Başınızı belirgin şekilde SAĞA çevirin (yaklaşık 70–90°). Çene düz, baş dik tutun.';

  @override
  String get turnHeadLeftCorrection =>
      'Fazla çevirdiniz; biraz SOLA geri gelin. Çene düz, baş dik.';

  @override
  String get holdSteadyNearTarget =>
      'Hareket etmeyin, tam hizaya çok yakınsınız. Sabit kalın.';

  @override
  String get turnHeadLeftInstruction =>
      'Başınızı belirgin şekilde SOLA çevirin (yaklaşık 70–90°). Çene düz, baş dik tutun.';

  @override
  String get turnHeadRightCorrection =>
      'Fazla çevirdiniz; biraz SAĞA geri gelin. Çene düz, baş dik.';

  @override
  String get holdPhoneFlatInstruction =>
      'Telefonu TAM YATAY tutun! Ekran yukarı bakmalı, telefon düz olmalı.';

  @override
  String get holdPhoneFlatter =>
      'Telefonu biraz daha düz tutun. Ekran tam yukarı bakmalı.';

  @override
  String get dontTiltForward => 'Telefonu biraz daha düz tutun, öne eğmeyin.';

  @override
  String get dontTiltBackward =>
      'Telefonu biraz daha düz tutun, arkaya eğmeyin.';

  @override
  String get dontTiltRight => 'Telefonu biraz daha düz tutun, sağa yatırmayın.';

  @override
  String get dontTiltLeft => 'Telefonu biraz daha düz tutun, sola yatırmayın.';

  @override
  String perfectHoldStill(Object seconds) {
    return 'Mükemmel! Sabit kalın... ($seconds sn)';
  }

  @override
  String get donorInstruction =>
      'Ense açısını çekmek için telefonu arkaya doğru tutun. Sabit kalın...';

  @override
  String get dontTiltUpOrDown => 'Telefonu düz tutun, yukarı/aşağı eğmeyin.';

  @override
  String get dontTiltSideToSide => 'Telefonu düz tutun, sağa/sola yatırmayın.';

  @override
  String get movePhoneBack => 'Telefonu tam arkaya götürün, ters yönde olmalı.';

  @override
  String positionCorrectHoldStill(Object seconds) {
    return 'Konum doğru, sabit kalın ($seconds sn)';
  }

  @override
  String get holdStill => 'Sabit durun.';

  @override
  String get lookStraight => 'Düz bakın. Başınızı dik tutun.';

  @override
  String get turnHeadRight => 'Başınızı sağa çevirin. Çenenizi düz tutun.';

  @override
  String get turnHeadLeft => 'Başınızı sola çevirin. Çenenizi düz tutun.';

  @override
  String get holdPhoneFlat =>
      'Telefonu başınızın üzerinde düz tutun, ekran yukarı baksın.';

  @override
  String get movePhoneBehind =>
      'Telefonu başınızın arkasına götürün ve sabit tutun.';

  @override
  String get continueButton => 'Devam Et';

  @override
  String get firstPhotoCaptured => '1. Fotoğraf Çekildi';

  @override
  String get turkishTR => 'Türkçe (TR)';

  @override
  String get englishEN => 'English (EN)';

  @override
  String get voiceLanguage => 'Ses dili';

  @override
  String get myMessages => 'Mesajlarım';

  @override
  String get doctorSessionNotFound => 'Doktor oturumu bulunamadı.';

  @override
  String get newMessage => 'New Message';

  @override
  String errorWithDetails(Object error) {
    return 'Error: $error';
  }

  @override
  String get noMessagesYet => 'Henüz mesaj yok.';

  @override
  String get startNewMessageHint => 'Click + button to start a new message';

  @override
  String get doctorInfoNotFoundLoginAgain =>
      'Doctor information not found. Please log in again.';

  @override
  String get noPatientsFound => 'Hasta bulunamadı.';

  @override
  String get selectPatient => 'Select Patient';

  @override
  String get unknown => 'Unknown';

  @override
  String get patientOrDoctorInfoNotFound =>
      'Patient or doctor information not found';

  @override
  String get doctorFallbackName => 'Doctor';

  @override
  String minutesAgo(Object minutes) {
    return '$minutes min ago';
  }

  @override
  String get justNow => 'Just now';

  @override
  String get refresh => 'Refresh';

  @override
  String get refreshingList => 'Refreshing list...';

  @override
  String get todaysAppointments => 'Today\'s Appointments';

  @override
  String get appointmentCount => 'appointment';

  @override
  String get appointmentDataLoadFailed => 'Failed to load appointment data';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get noPendingAppointments => 'No pending appointments';

  @override
  String get appointmentsWillAppearHere =>
      'Appointments will appear here when patients create them';

  @override
  String get noConfirmedAppointments => 'No confirmed appointments';

  @override
  String get confirmedAppointmentsWillAppearHere =>
      'Confirmed appointments will appear here';

  @override
  String get noCompletedAppointments => 'No completed appointments';

  @override
  String get completedAppointmentsWillAppearHere =>
      'Completed appointments will appear here';

  @override
  String get noCancelledAppointments => 'No cancelled appointments';

  @override
  String get cancelledAppointmentsWillAppearHere =>
      'Cancelled appointments will appear here';

  @override
  String photosCount(Object count) {
    return 'Photos ($count)';
  }

  @override
  String get front => 'Front';

  @override
  String get right45 => 'Right 45°';

  @override
  String get left45 => 'Left 45°';

  @override
  String get top => 'Top';

  @override
  String get donorArea => 'Donor Area';

  @override
  String get approve => 'Approve';

  @override
  String get reject => 'Reject';

  @override
  String get markAsCompleted => 'Mark as Completed';

  @override
  String get appointmentApproved => 'Appointment Approved';

  @override
  String appointmentApprovedMessage(Object doctorName, Object date) {
    return 'Your appointment with $doctorName on $date has been approved.';
  }

  @override
  String get appointmentApprovedNotification =>
      'Appointment approved and patient notified';

  @override
  String get appointmentApprovalError => 'Error approving appointment';

  @override
  String get appointmentApprovalPermissionDenied =>
      'Permission denied to approve appointment. Please check Firebase Firestore rules.';

  @override
  String get appointmentNotFound =>
      'Appointment not found. Please refresh the page.';

  @override
  String get firebaseUnavailable =>
      'Firebase service is currently unavailable. Please check your internet connection.';

  @override
  String get rejectAppointment => 'Reject Appointment';

  @override
  String get rejectionReason => 'Rejection Reason';

  @override
  String get rejectionReasonHint => 'Please enter the reason for rejection';

  @override
  String get appointmentRejected => 'Appointment Rejected';

  @override
  String appointmentRejectedMessage(
      Object doctorName, Object date, Object reason) {
    return 'Your appointment with $doctorName on $date has been rejected. Reason: $reason';
  }

  @override
  String get appointmentRejectedNotification =>
      'Appointment rejected and patient notified';

  @override
  String get appointmentRejectionError => 'Error rejecting appointment';

  @override
  String get appointmentRejectionPermissionDenied =>
      'Permission denied to reject appointment. Please check Firebase Firestore rules.';

  @override
  String get completeAppointment => 'Complete Appointment';

  @override
  String get completeAppointmentConfirmation =>
      'Are you sure you want to mark this appointment as completed?';

  @override
  String get completed => 'Completed';

  @override
  String get appointmentCompleted => 'Appointment Completed';

  @override
  String appointmentCompletedMessage(Object doctorName, Object date) {
    return 'Your appointment with $doctorName on $date has been completed.';
  }

  @override
  String get appointmentCompletedNotification =>
      'Appointment completed and patient notified';

  @override
  String get appointmentCompletionError => 'Error completing appointment';

  @override
  String get appointmentCompletionPermissionDenied =>
      'Permission denied to complete appointment. Please check Firebase Firestore rules.';

  @override
  String get appointmentNote => 'Appointment Note';

  @override
  String get noteVisibleToPatient => 'Description / note visible to patient';

  @override
  String appointmentNoteMessage(Object doctorName, Object note) {
    return '$doctorName added a note to your appointment: $note';
  }

  @override
  String get noteSavedNotification => 'Note saved and patient notified';

  @override
  String get noteAddError => 'Error adding note';

  @override
  String get noteAddPermissionDenied =>
      'Permission denied to add note. Please check Firebase Firestore rules.';

  @override
  String get deleteAppointment => 'Delete Appointment';

  @override
  String get deleteAppointmentConfirmation =>
      'Are you sure you want to permanently delete this appointment? This action cannot be undone.';

  @override
  String appointmentCancelledMessage(Object doctorName, Object date) {
    return 'Your appointment with $doctorName on $date has been cancelled.';
  }

  @override
  String get appointmentDeletedNotification =>
      'Appointment deleted and patient notified';

  @override
  String get appointmentDeletionError => 'Error deleting appointment';

  @override
  String get appointmentDeletionPermissionDenied =>
      'Permission denied to delete appointment. Please check Firebase Firestore rules.';

  @override
  String get addNote => 'Add Note';

  @override
  String get emptyNote => '(empty note)';

  @override
  String get doctorUnknown => 'Dr. Unknown';

  @override
  String get loginRequiredToSend =>
      'You must be logged in as a doctor to send messages';

  @override
  String messageSendError(Object error) {
    return 'Mesaj gönderilemedi: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'Hasta';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'Henüz mesaj yok';

  @override
  String get typeMessage => 'Type a message...';

  @override
  String get doctorPanel => 'Doktor Paneli';

  @override
  String get myPatients => 'Hastalarım';

  @override
  String get appointments => 'Randevular';

  @override
  String get approvals => 'Onaylar';

  @override
  String get messages => 'Mesajlar';

  @override
  String get aiAssistant => 'AI Asistan';

  @override
  String get settings => 'Ayarlar';

  @override
  String get sendMessage => 'Mesaj Gönder';

  @override
  String get doctorInfoNotFound => 'Doktor bilgisi bulunamadı.';

  @override
  String get aiAssistantDescription =>
      'Medikal sorularınıza AI destekli cevaplar alın';

  @override
  String get chatWithAI => 'AI ile Sohbet Et';

  @override
  String get logoutDoctor => 'Çıkış Yap (Doktor)';

  @override
  String errorWithDetail(Object error) {
    return 'Hata: $error';
  }

  @override
  String get noDate => 'Tarih yok';

  @override
  String get statusApproved => 'Onaylandı';

  @override
  String get statusRejected => 'Reddedildi';

  @override
  String get statusPending => 'Beklemede';

  @override
  String get photoReview => 'Fotoğraf İnceleme';

  @override
  String get reviewAndApproveAnalyses => 'Analizleri inceleyin ve onaylayın';

  @override
  String get pending => 'Bekleyen';

  @override
  String get noCompletedAnalyses => 'Henüz tamamlanmış analiz yok';

  @override
  String get analysesWillAppearHere =>
      'Hastalar fotoğraf analizi tamamladığında burada görünecek';

  @override
  String get analysisProcess =>
      'Analiz süreci:\n• Hasta fotoğraf çeker\n• AI analizi yapar\n• Geçerli analizler burada listelenir';

  @override
  String get noApprovedPhotos => 'Henüz onaylanmış fotoğraf yok';

  @override
  String get approvedPhotosWillAppearHere =>
      'Onayladığınız fotoğraflar burada görünecek';

  @override
  String get photoCountSuffix => 'fotoğraf';

  @override
  String get processing => 'İşleniyor...';

  @override
  String get photoApproved => '✅ Fotoğraf onaylandı';

  @override
  String get approvalFailed => '❌ Onay başarısız';

  @override
  String get approvalPermissionDenied =>
      'Onay izni reddedildi. Lütfen Firebase kurallarını kontrol edin.';

  @override
  String get networkError =>
      'Ağ hatası. Lütfen internet bağlantınızı kontrol edin.';

  @override
  String get photoRejected =>
      '❌ Fotoğraf reddedildi. Hastaya bildirim gönderildi.';

  @override
  String get rejectionFailed => '❌ Reddetme başarısız';

  @override
  String get rejectionPermissionDenied =>
      'Reddetme izni reddedildi. Lütfen Firebase kurallarını kontrol edin.';

  @override
  String patientAdded(String name) {
    return 'Hasta eklendi: $name';
  }

  @override
  String get allSamplePatientsAdded =>
      'Tüm örnek hastalar ve analizler eklendi!';

  @override
  String patientAddError(String error) {
    return 'Hasta ekleme hatası: $error';
  }

  @override
  String firebasePatientListError(String error) {
    return 'Firebase hasta listesi alınamadı: $error';
  }

  @override
  String get analysisPhoto => 'Analiz Fotoğrafı';

  @override
  String get scalpHealthGood => 'İyi';

  @override
  String get recommendationContinue => 'Mevcut tedaviye devam';

  @override
  String get sampleAnalysisData => 'Örnek analiz verisi';

  @override
  String get errorPrefix => 'Hata: ';

  @override
  String get errorTitle => 'Hata';

  @override
  String get profileLoadError => 'Profil bilgileri yüklenemedi';

  @override
  String get profileReadPermissionDenied =>
      'Profil bilgilerini okuma izni reddedildi';

  @override
  String get firebaseServiceUnavailable => 'Firebase servisi kullanılamıyor';

  @override
  String get profileSaveError => 'Profil bilgileri kaydedilemedi';

  @override
  String get profileSavePermissionDenied =>
      'Profil bilgilerini kaydetme izni reddedildi';

  @override
  String saveError(String error) {
    return 'Kaydetme hatası: $error';
  }

  @override
  String get profileSavedSuccessfully => 'Profil başarıyla kaydedildi';

  @override
  String get photoUploadedSaveRequired =>
      'Fotoğraf yüklendi. Değişiklikleri kalıcı yapmak için Kaydet butonuna tıklayın.';

  @override
  String get photoUploadError => 'Fotoğraf yükleme hatası';

  @override
  String get photoUploadPermissionDenied => 'Fotoğraf yükleme izni reddedildi';

  @override
  String get photoUploadUnauthorized => 'Fotoğraf yükleme yetkisi yok';

  @override
  String get photoUploadCancelled => 'Fotoğraf yükleme iptal edildi';

  @override
  String get doctorLoginNotFound => 'Doktor giriş bilgisi bulunamadı';

  @override
  String doctorIdLabel(String id) {
    return 'Doktor ID: $id';
  }

  @override
  String get patientInfoLoadError => 'Hasta bilgileri yüklenemedi';

  @override
  String get analysesLoadError => 'Analizler yüklenemedi';

  @override
  String get noAnalysesFound => 'Analiz bulunamadı';

  @override
  String get imageNotFound => 'Görüntü bulunamadı';

  @override
  String get tryAgainFromPatientList =>
      'Lütfen hasta listesinden tekrar deneyin';

  @override
  String get rememberMe => 'Oturum açık kalsın';

  @override
  String get doctorLogin => 'Doktor girişi';

  @override
  String get signingIn => 'Giriş yapılıyor...';

  @override
  String get emailAndPasswordRequired =>
      'Email ve şifre alanları doldurulmalıdır.';

  @override
  String googleSignInFailed(String error) {
    return 'Google girişi başarısız: $error';
  }

  @override
  String get invalidEmailFormat => 'Geçersiz email formatı.';

  @override
  String get accountDisabled => 'Bu hesap devre dışı bırakılmış.';

  @override
  String get userNotFound =>
      'Bu email adresi ile kayıtlı kullanıcı bulunamadı.';

  @override
  String get wrongPassword => 'Hatalı şifre.';

  @override
  String get tooManyRequests =>
      'Çok fazla başarısız giriş denemesi. Lütfen daha sonra tekrar deneyin.';

  @override
  String get loginError =>
      'Giriş yapılırken hata oluştu. Lütfen tekrar deneyin.';

  @override
  String get emailAlreadyInUse => 'Bu email adresi daha önce kullanılmış.';

  @override
  String get weakPassword => 'Şifre en az 6 karakter olmalı.';

  @override
  String get registrationError =>
      'Kayıt yapılırken hata oluştu. Lütfen tekrar deneyin.';

  @override
  String get acceptTermsPrefix => 'Kayıt olarak ';

  @override
  String get termsOfServiceLink => 'Kullanım Koşulları';

  @override
  String get and => ' ve ';

  @override
  String get privacyPolicyLink => 'Gizlilik Politikası';

  @override
  String get acceptTermsSuffix => ' metinlerini kabul etmiş olursunuz.';

  @override
  String get loginRequired => 'Giriş yapmanız gerekiyor';

  @override
  String get noAnalysesYet => 'Henüz Analiz Yok';

  @override
  String get goToMainPage => 'İlk analizinizi yapmak için ana sayfaya gidin';

  @override
  String get unknownDate => 'Bilinmeyen Tarih';

  @override
  String get january => 'Ocak';

  @override
  String get february => 'Şubat';

  @override
  String get march => 'Mart';

  @override
  String get april => 'Nisan';

  @override
  String get may => 'Mayıs';

  @override
  String get june => 'Haziran';

  @override
  String get july => 'Temmuz';

  @override
  String get august => 'Ağustos';

  @override
  String get september => 'Eylül';

  @override
  String get october => 'Ekim';

  @override
  String get november => 'Kasım';

  @override
  String get december => 'Aralık';

  @override
  String get analysisCompletedShort => 'Tamamlandı';

  @override
  String get retakeDialogTitle => 'Tekrar Çekim Gerekli';

  @override
  String get retakeDialogBody =>
      'Yapay zeka analizi sonucunda aşağıdaki açıların tekrar çekilmesi gerekiyor:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'İlk hatalı açıyı tekrar çekmek ister misiniz?';

  @override
  String get noExistingPhotosFound => 'Mevcut fotoğraflar bulunamadı';

  @override
  String get noValidPhotosToUpload => 'Yüklenecek geçerli fotoğraf bulunamadı';

  @override
  String errorOccurred(String error) {
    return 'Hata: $error';
  }

  @override
  String get uploadAndAnalyzeTitle => 'Yükle ve Analiz Et';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get okUnderstood => 'Tamam, Anladım';

  @override
  String get pendingStatus => 'Beklemede';

  @override
  String get monday => 'Pazartesi';

  @override
  String get tuesday => 'Salı';

  @override
  String get wednesday => 'Çarşamba';

  @override
  String get thursday => 'Perşembe';

  @override
  String get friday => 'Cuma';

  @override
  String get active => 'Aktif';

  @override
  String get inactive => 'Pasif';

  @override
  String get noTitle => 'Başlık Yok';

  @override
  String photoSelectAngle(String current, String total) {
    return 'Fotoğraf $current/$total - Açı Seçin';
  }

  @override
  String get alreadySelected => 'Zaten seçildi';

  @override
  String get importantWarning => '⚠️ ÖNEMLİ UYARI:';

  @override
  String get somePhotosNeedRetake =>
      'Bazı fotoğraflar tekrar çekilmesi gerekiyor.';

  @override
  String get anglesThatNeedRetake => 'Tekrar çekilmesi gereken açılar:';

  @override
  String userHasPhotosNote(String count) {
    return 'Not: Kullanıcının $count fotoğrafı yüklü. Fotoğraf analizi hakkında sorular sorabilir.';
  }

  @override
  String get userNoPhotosNote =>
      'Not: Kullanıcının henüz fotoğrafı yok. Fotoğraf yükleme konusunda yardımcı olabilirsin.';

  @override
  String get frontShort => 'Ön';

  @override
  String get right45Short => 'Sağ 45°';

  @override
  String get left45Short => 'Sol 45°';

  @override
  String get vertexShort => 'Tepe';

  @override
  String get donorShort => 'Arka';

  @override
  String get retakeRequired => 'Tekrar Çekim Gerekli';

  @override
  String get retakeButton => 'Tekrar Çek';

  @override
  String get analysisWaitingDoctorApproval =>
      'Analiz doktor onayı için bekliyor.';

  @override
  String get orWriteAnalyze =>
      'Veya \"Analiz et\" yazarak manuel analiz başlatın';

  @override
  String get analysisCompletedSuccess => '✅ Analiz Tamamlandı!';

  @override
  String get detectedAnglesLabel => '📐 Tespit Edilen Açılar:';

  @override
  String get pastAnalyses => 'Geçmiş Analizler';

  @override
  String get noSavedAnalyses => 'Henüz kaydedilmiş analiz yok.';

  @override
  String welcomeGreeting(String name) {
    return 'Hoşgeldiniz, $name';
  }

  @override
  String get loginRequiredForMessaging => 'Mesajlaşmak için giriş yapmalısınız';

  @override
  String get chatWithMyDoctor => 'Doktorum ile mesajlaş';

  @override
  String get analysisSavedSuccessfully => 'Analiz başarıyla kaydedildi!';

  @override
  String get allPhotosAnalyzedAndSaved =>
      'Tüm fotoğraflar başarıyla analiz edildi ve kaydedildi.';

  @override
  String get reanalyzing => 'Yeniden analiz yapılıyor...';

  @override
  String get someAnglesNotCapturedCorrectly => 'Bazı açılar doğru çekilmemiş';

  @override
  String get photosUploadingStatus => 'Fotoğraflar yükleniyor...';

  @override
  String get temporaryRecordAndAnalysis => 'Geçici Kayıt ve Analiz';

  @override
  String get capturedPhotos => 'Çekilen Fotoğraflar';

  @override
  String get anglesThatNeedRetakeHeader => 'Tekrar Çekilmesi Gereken Açılar:';

  @override
  String get myAppointments => 'Randevularım';

  @override
  String get faceDetectionCapture => 'Yüz Tanıma ile Çekim';

  @override
  String get showYourFaceToCamera => 'Lütfen yüzünüzü kameraya gösterin';

  @override
  String cameraCouldNotStart(String error) {
    return 'Kamera başlatılamadı: $error';
  }

  @override
  String get faceDetected => 'Yüz algılandı! Sayım başlıyor...';

  @override
  String get photoCapturing => 'Fotoğraf çekiliyor...';

  @override
  String get photoCaptured => 'Fotoğraf çekildi!';

  @override
  String photoCouldNotCapture(String error) {
    return 'Fotoğraf çekilemedi: $error';
  }

  @override
  String get photoPreparing => 'Fotoğraf hazırlanıyor...';

  @override
  String get photoUploading => 'Fotoğraf yükleniyor...';

  @override
  String get aiAnalysisInProgressStatus => 'AI analizi yapılıyor...';

  @override
  String get resultsSaving => 'Sonuçlar kaydediliyor...';

  @override
  String get analysisSuccessful => 'Analiz Başarılı!';

  @override
  String get analyzeButton => 'Analiz Et';

  @override
  String get update => 'Güncelle';

  @override
  String get confirmCancelAppointment =>
      'Bu randevuyu iptal etmek istediğinizden emin misiniz?';

  @override
  String get cancelReasonOptional => 'İptal Nedeni (opsiyonel)';

  @override
  String get cancelReasonExample => 'Örn: Kişisel sebeplerle';

  @override
  String get appointmentCancelled => 'Randevu iptal edildi';

  @override
  String get newAppointment => 'Yeni Randevu';

  @override
  String get notesOptional => 'Notlar (opsiyonel)';

  @override
  String get appointmentNotesHint => 'Randevu hakkında notlar...';

  @override
  String get createAppointment => 'Randevu Oluştur';

  @override
  String get updateAppointment => 'Randevu Güncelle';

  @override
  String get currentDate => 'Mevcut Tarih:';

  @override
  String get appointmentCreatedWaitingApproval =>
      '✅ Randevu oluşturuldu! Onay bekliyor.';

  @override
  String errorSelectingPhoto(String error) {
    return 'Fotoğraf seçilirken hata oluştu: $error';
  }

  @override
  String get pleaseSelectAtLeastOnePhoto => 'Lütfen en az bir fotoğraf seçin';

  @override
  String get noValidPhotoFound => 'Geçerli fotoğraf bulunamadı';

  @override
  String get photosAnalyzedAndSavedSuccessfully =>
      'Fotoğraflar başarıyla analiz edildi ve kaydedildi!';

  @override
  String get allNotificationsMarkedAsRead =>
      'Tüm bildirimler okundu olarak işaretlendi';

  @override
  String get selectNewDate => 'Yeni Tarih Seç';

  @override
  String get document => 'Belge';

  @override
  String get defaultDocumentDescription => 'Açıklama mevcut değil';

  @override
  String get download => 'İndir';

  @override
  String get viewDocument => 'Belgeyi Görüntüle';

  @override
  String get contactAddress => 'Adres';

  @override
  String get contactEmail => 'E-posta';

  @override
  String get contactPhone => 'Telefon';

  @override
  String get contactWhatsApp => 'WhatsApp';

  @override
  String get patientCareGuideTitle => 'Hasta Bakım Rehberi';

  @override
  String get planningTab => 'Planlama';

  @override
  String get operationTab => 'Operasyon';

  @override
  String get recoveryTab => 'İyileşme';

  @override
  String get resourcesTab => 'Kaynaklar';

  @override
  String get personalizedPlanning => 'Kişiselleştirilmiş Planlama';

  @override
  String get contactAndQuickSupport => 'İletişim ve Hızlı Destek';

  @override
  String get preOperationPreparation => 'Operasyon Öncesi Hazırlık';

  @override
  String get operationDayFlow => 'Operasyon Günü Akışı';

  @override
  String get operationDayExperience => 'Operasyon Günü Deneyimi';

  @override
  String get sterilizationAndHygieneStandards =>
      'Sterilizasyon ve Hijyen Standartları';

  @override
  String get recoveryJourney => 'İyileşme Yolculuğu';

  @override
  String get postOperationCare => 'Operasyon Sonrası Bakım';

  @override
  String get hairWashingProtocol => 'Saç Yıkama Protokolü';

  @override
  String get knowledgeBase => 'Bilgi Bankası';

  @override
  String get frequentlyAskedQuestions => 'Sık Sorulan Sorular';

  @override
  String get visualGuide => 'Görsel Rehber';

  @override
  String get tapToSeeDetails => 'Detayları görmek için dokunun';

  @override
  String get connectionCannotOpen => 'Bağlantı açılamıyor';

  @override
  String get pleaseEnterDoctorEmail => 'Lütfen doktor e-postanızı girin';

  @override
  String get emailAndCodeRequired => 'E-posta ve kod zorunludur';

  @override
  String get codeMustBe6Digits => 'Kod 6 haneli olmalıdır';

  @override
  String get codeInvalidOrExpired =>
      'Kod geçersiz veya süresi dolmuş. Lütfen konsol loglarını kontrol edin.';

  @override
  String verificationFailed(String error) {
    return 'Doğrulama başarısız: $error';
  }

  @override
  String get doctorLoginDescription =>
      'Kayıtlı doktor e-postanızı girin, doğrulama kodu isteyin ve giriş yapın.';

  @override
  String get doctorEmail => 'Doktor E-posta';

  @override
  String get doctorEmailHint => 'doktor@example.com';

  @override
  String get verificationCode => '6 Haneli Doğrulama Kodu';

  @override
  String get verificationCodeHint => '000000';

  @override
  String get sending => 'Gönderiliyor...';

  @override
  String get requestCode => 'Kod İste';

  @override
  String get login => 'Giriş Yap';

  @override
  String get message => 'Mesajlar';

  @override
  String get photo => 'Fotoğraflar';

  @override
  String get patientIdNotFound => 'Hasta ID bulunamadı';

  @override
  String get analyses => 'Analizler';

  @override
  String get approved => 'Onaylandı';

  @override
  String get rejected => 'Reddedildi';

  @override
  String get examplePhotoFrontTitle => 'Ön Görünüm Örneği';

  @override
  String get examplePhotoFrontInstructions => 'Kameraya düz bakın';

  @override
  String get examplePhotoRight45Title => 'Sağ 45° Görünüm Örneği';

  @override
  String get examplePhotoRight45Instructions => 'Başınızı 45° sağa çevirin';

  @override
  String get examplePhotoLeft45Title => 'Sol 45° Görünüm Örneği';

  @override
  String get examplePhotoLeft45Instructions => 'Başınızı 45° sola çevirin';

  @override
  String get examplePhotoVertexTitle => 'Üst Görünüm Örneği';

  @override
  String get examplePhotoVertexInstructions =>
      'Telefonu başınızın üstünde tutun';

  @override
  String get examplePhotoDonorTitle => 'Arka Görünüm Örneği';

  @override
  String get examplePhotoDonorInstructions =>
      'Telefonu başınızın arkasına götürün';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galeri';

  @override
  String get deleteForMe => 'Benden Sil';

  @override
  String get messageDeleted => 'Mesaj silindi';

  @override
  String get deleteForEveryone => 'Herkesten Sil';

  @override
  String get deleteMessage => 'Mesajı Sil';

  @override
  String get deleteMessageReadWarning =>
      'Bu mesaj alıcı tarafından okunmuş. Yine de silmek istiyor musunuz?';

  @override
  String get deleteMessageConfirm =>
      'Bu mesaj herkesten silinecek. Emin misiniz?';

  @override
  String get messageDeletedForEveryone => 'Mesaj herkesten silindi';

  @override
  String get userNotLoggedIn => 'Kullanıcı giriş yapmamış';

  @override
  String get messagesLoadingError => 'Mesajlar yüklenirken hata oluştu';

  @override
  String get loadingMessages => 'Mesajlar yükleniyor...';

  @override
  String get startConversation => 'Bir mesaj göndererek sohbet başlatın';

  @override
  String get loadOlderMessages => 'Eski Mesajları Yükle';

  @override
  String get sendPhoto => 'Fotoğraf Gönder';

  @override
  String get appointmentManagement => 'Randevu Yönetimi';

  @override
  String get pendingApproval => 'Onay Bekleyen';

  @override
  String get cancelled => 'İptal';

  @override
  String photos(String count) {
    return 'Fotoğraflar ($count)';
  }

  @override
  String get needLoginForAnalysis => 'Analiz için giriş yapmanız gerekiyor';

  @override
  String openCaptureFlowError(String error) {
    return 'Çekim ekranı açılırken hata oluştu: $error';
  }

  @override
  String get sessionExpired =>
      'Oturum süreniz doldu. Lütfen tekrar giriş yapın.';

  @override
  String get photosAnalyzedAndSaved =>
      'Fotoğraflar başarıyla analiz edildi ve kaydedildi!';

  @override
  String get photoNotFoundForAnalysis => 'Analiz için fotoğraf bulunamadı';

  @override
  String get noValidPhotosFound => 'Geçerli fotoğraf bulunamadı';

  @override
  String get analysisPreparing => 'Fotoğraflar hazırlanıyor...';

  @override
  String get photosUploading => 'Fotoğraflar yükleniyor...';

  @override
  String get errorUploadingPhotos => 'Fotoğraflar yüklenirken hata oluştu';

  @override
  String get geminiChecking => 'Gemini API bağlantısı kontrol ediliyor...';

  @override
  String get geminiFailed =>
      'Gemini API bağlantısı başarısız. Lütfen internet bağlantınızı kontrol edin.';

  @override
  String get aiAnalyzing => 'Yapay zeka analizi yapılıyor...';

  @override
  String get someAnglesNeedRetake =>
      'Bazı açılar tekrar çekilmesi gerekiyor...';

  @override
  String get analysisSaved => 'Analiz başarıyla kaydedildi!';

  @override
  String get analysisCompletedSuccessfully => 'Analiz başarıyla tamamlandı!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count açı tekrar çekilmesi gerekiyor...';
  }

  @override
  String get errorDuringAnalysis => 'Analiz sırasında hata oluştu';

  @override
  String get geminiApiError =>
      'Gemini API bağlantı hatası. Lütfen internet bağlantınızı kontrol edin.';

  @override
  String get firebaseError =>
      'Firebase bağlantı hatası. Lütfen tekrar deneyin.';

  @override
  String get photoProcessingError =>
      'Fotoğraf işleme hatası. Lütfen tekrar deneyin.';

  @override
  String get authErrorLoginAgain => 'Yetki hatası. Lütfen tekrar giriş yapın.';

  @override
  String get analysisSuccessfulTitle => 'Analiz Başarılı';

  @override
  String get analysisResultsTitle => 'Analiz Sonuçları';

  @override
  String get detailedAnalysisHeader => 'Detaylı Analiz:';

  @override
  String get retakeRequiredAnglesHeader => 'Tekrar Çekilmesi Gereken Açılar:';

  @override
  String dialogError(String error) {
    return 'Dialog açılırken hata oluştu: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Baseline fotoğraf bulunamadı';

  @override
  String get noPhotosToUpdate => 'Güncellenecek fotoğraf bulunamadı';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Analiz devam ederken hata oluştu: $error';
  }

  @override
  String retakeError(String error) {
    return 'Tekrar çekim sırasında hata oluştu: $error';
  }

  @override
  String get aiSupport => 'AI Destek';

  @override
  String get myPhotos => 'Fotoğraflarım';

  @override
  String get photoAnalysisChatbot => 'Fotoğraf Analiz Chatbotu';

  @override
  String get disableMedicationReminder =>
      'İlaç Hatırlatıcısını Devre Dışı Bırak';

  @override
  String get medicationReminderDisabled =>
      'Günlük ilaç hatırlatıcısı devre dışı bırakıldı';

  @override
  String get medicationTime => 'İlaç Zamanı';

  @override
  String get selectMedicationReminderTime =>
      'Günlük İlaç Hatırlatıcı Zamanı Seç';

  @override
  String get selectMedicationTime => 'İlaç Zamanı Seç';

  @override
  String medicationReminderSetAt(String time) {
    return 'Günlük ilaç hatırlatıcısı $time için ayarlandı';
  }

  @override
  String get noDateInfo => 'Tarih bilgisi yok';

  @override
  String get invalidDate => 'Geçersiz tarih';

  @override
  String get today => 'Bugün';

  @override
  String get yesterday => 'Dün';

  @override
  String get valid => 'Geçerli';

  @override
  String get samePerson => 'Aynı kişi';

  @override
  String get differentPersonSuspicion => 'Farklı kişi şüphesi';

  @override
  String get logoutConfirmation => 'Çıkış yapmak istediğinizden emin misiniz?';

  @override
  String get profileSettings => 'Profil Ayarları';

  @override
  String get specialty => 'Uzmanlık';

  @override
  String get hairTransplantTitle => 'Saç Ekimi';

  @override
  String get hairTransplantSectionCount => 'Bölüm';

  @override
  String get hairTransplantVideo => 'Video';

  @override
  String get hairTransplantFreeConsultation => 'Ücretsiz Konsültasyon Al';

  @override
  String get hairTransplantWatchVideo => 'Videoyu İzle';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Saç ekimi prosedürü videosunu izleyin';

  @override
  String get photosSavedSuccessfully => 'Fotoğraflar başarıyla kaydedildi!';

  @override
  String errorDuringRetake(String error) {
    return 'Tekrar çekim sırasında hata oluştu: $error';
  }

  @override
  String errorOpeningCaptureScreen(String error) {
    return 'Çekim ekranı açılırken hata oluştu: $error';
  }

  @override
  String errorDuringAnalysisShort(String error) {
    return 'Analiz sırasında hata oluştu: $error';
  }

  @override
  String get myDocuments => 'Belgelerim';

  @override
  String get loginRequiredForDocuments =>
      'Belgeleri görüntülemek için giriş yapmanız gerekiyor';

  @override
  String get noDocumentsYet => 'Henüz belge yok';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Bir hata oluştu:\n$error';
  }

  @override
  String get datePending => 'Beklemede';

  @override
  String get chatSupportWelcomeMessage =>
      'Merhaba! Ben AI asistanınızım. Size nasıl yardımcı olabilirim?';

  @override
  String get newChat => 'Yeni Sohbet';

  @override
  String get chatSupportAiAssistantName => 'AI Asistanı';

  @override
  String get historyTooltip => 'Geçmiş';

  @override
  String get typingIndicator => 'AI yazıyor...';

  @override
  String get chatHistoryTitle => 'Sohbet Geçmişi';

  @override
  String get noSavedChats => 'Kaydedilmiş sohbet yok';

  @override
  String genericErrorTryAgain(String error) {
    return 'Bir hata oluştu. Lütfen tekrar deneyin.\nHata: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp açılamadı. Lütfen WhatsApp uygulamasının yüklü olduğundan emin olun.';

  @override
  String whatsappOpenError(String error) {
    return 'WhatsApp açılırken hata oluştu: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Çekim ekranı açılırken hata oluştu: $error';
  }

  @override
  String get retakeAnalyzing => 'Tekrar çekilen fotoğraf analiz ediliyor...';

  @override
  String get autoAnalysisOn => 'Otomatik Analiz: Açık';

  @override
  String get autoAnalysisOff => 'Otomatik Analiz: Kapalı';

  @override
  String get clearPhotosTooltip => 'Fotoğrafları Temizle';

  @override
  String get messageHintAnalyze =>
      'Mesajınızı yazın veya \"Analiz et\" yazın...';

  @override
  String get send => 'Gönder';

  @override
  String get aiAssistantName => 'AI Analiz Asistanı';

  @override
  String get expertTeam => 'Uzman Ekip';

  @override
  String get expertTeamDescription =>
      'Ekibimiz saç ekimi cerrahisinde deneyimli uzmanlardan oluşmaktadır.';

  @override
  String get comingSoon => 'Yakında';

  @override
  String get loginToSendMessage => 'Mesaj göndermek için lütfen giriş yapın';

  @override
  String get doctorEmailMissing => 'Doktor e-postası eksik';

  @override
  String doctorNotFound(String name) {
    return '$name doktoru bulunamadı';
  }

  @override
  String get messagingComingSoon => 'Mesajlaşma özelliği yakında';

  @override
  String get years => 'yıl';

  @override
  String get watchWashingVideo => 'Yıkama Videosunu İzle';

  @override
  String get preCareTip1Title => 'Doğru cerrahı seçin';

  @override
  String get preCareTip1Body =>
      'Safir FUE işlemi deneyimli bir cerrah ve multidisipliner ekip gerektirir. Beklentilerinizi gerçekçi anlatan ve operasyonu uçtan uca planlayan, Smile Hair protokollerini uygulayan doktorlarla çalışın.';

  @override
  String get preCareTip2Title => 'Tıbbi geçmişinizi paylaşın';

  @override
  String get preCareTip2Body =>
      'Kronik hastalıklarınızı, düzenli aldığınız ilaçları ve alerjilerinizi gizlemeden ekip ile paylaşın. Anestezi ve ameliyat sırasında oluşabilecek riskler böylece en aza iner.';

  @override
  String get preCareTip3Title => 'Kan sulandırıcılar ve onay süreci';

  @override
  String get preCareTip3Body =>
      'Aspirin veya benzeri kan sulandırıcıları operasyon tarihinden en az bir hafta önce, ilacı yazan doktorunuzun onayıyla bırakın. İşlemden iki gün sonra kullanmaya dönebilirsiniz.';

  @override
  String get preCareTip4Title => 'Enfeksiyon taraması';

  @override
  String get preCareTip4Body =>
      'Hepatit B/C ve HIV test sonuçlarınızı güncel tutun. Uygun ameliyathane koşullarına sahip olmayan klinikler bu enfeksiyonlar için operasyon yapamaz, seyahatiniz boşa çıkmasın.';

  @override
  String get preCareTip5Title => 'Takviyeler ve vitaminler';

  @override
  String get preCareTip5Body =>
      'Vitamin B ve E içeren takviyeler kanamayı artırır; işlemeden bir hafta önce bırakın. Gerekiyorsa destek tedavilerini doktorunuz planlar.';

  @override
  String get preCareTip6Title => 'Alkol ve sigara';

  @override
  String get preCareTip6Body =>
      'Alkolü operasyondan en az bir hafta önce bırakın ve işlemden sonra 14 gün tüketmeyin. Sigara, kan dolaşımını bozduğu için operasyondan 12 saat önce ve sonrasındaki iki hafta boyunca uzak durun.';

  @override
  String get preCareTip7Title => 'Valiz ve kıyafet planı';

  @override
  String get preCareTip7Body =>
      'Üst vücudunuz için düğmeli veya fermuarlı giysiler seçin. Dar boğazlı kıyafetler greftlere zarar verebilir. Operasyon sonrası verilen bakım çantasını taşıyabileceğiniz geniş bir çanta hazırlayın.';

  @override
  String get preCareTip8Title => 'Dinlenme ve hijyen';

  @override
  String get preCareTip8Body =>
      'Operasyon günü iyi uyuyun, besleyici bir kahvaltı yapın ve kliniğe gelmeden önce duş alın. Temiz saç derisi enfeksiyon riskini azaltır.';

  @override
  String get postCareTip1Title => 'Greftleri koruyun';

  @override
  String get postCareTip1Body =>
      'İlk 7 gün boyunca başınızı bir yere çarpmamaya dikkat edin. Uykuda boyun yastığı kullanarak sırt üstü yatın ve greftlerin yastığa sürtünmesini önleyin.';

  @override
  String get postCareTip2Title => 'İlk gece ve takip eden günler';

  @override
  String get postCareTip2Body =>
      'Operasyon sonrası ilk geceyi mutlaka dinlenerek geçirin. Dışarı çıkmanız gerekirse güneşten ve yağmurdan koruyan şemsiye kullanın.';

  @override
  String get postCareTip3Title => 'İlaç planına sadık kalın';

  @override
  String get postCareTip3Body =>
      'Antibiyotik, ağrı kesici, antienflamatuar ve Panthenol spreyi tam tarif edildiği şekilde kullanın. Klinik ekibinden ayrılmadan önce reçete ve kullanım talimatlarını anladığınızdan emin olun.';

  @override
  String get postCareTip4Title => 'Nemlendirme ve spreyler';

  @override
  String get postCareTip4Body =>
      'İlk yıkamaya kadar sadece verilen izotonik/Panthenol spreyini kullanın. Donör bölgesine ilk 5-7 gün boyunca antibiyotikli krem sürün.';

  @override
  String get postCareTip5Title => 'Yıkama protokolü';

  @override
  String get postCareTip5Body =>
      'İlk yıkama 48 saat sonra klinikte yapılır. Sonraki her gün köpüğü nazikçe tampon hareketlerle uygulayın, düşük basınçlı ılık su kullanın ve kağıt havluyla kurulayın.';

  @override
  String get postCareTip6Title => 'Kabuk ve şok dökülme';

  @override
  String get postCareTip6Body =>
      '10. günden itibaren kabukları hafif baskıyla yok edin. 2-4. haftalar arasında yaşanan şok dökülme normaldir; yeni saçlar 3. aydan itibaren görünür.';

  @override
  String get postCareTip7Title => 'Aktivite ve spor';

  @override
  String get postCareTip7Body =>
      'İlk iki hafta spor yapmayın, 3-4 günden sonra hafif yürüyüş yapabilirsiniz. Havuz, sauna ve yoğun terlemeyi gerektiren aktivitelerden en az 1 ay kaçının.';

  @override
  String get postCareTip8Title => 'Konfor şikayetleri';

  @override
  String get postCareTip8Body =>
      'Donör bölgede yanma veya ağrı olursa klinikten onay alarak steroid içerikli krem kullanın. Şişlik için soğuk kompresleri kısa süreli uygulayın.';

  @override
  String get operationDayTimeline1Title => 'Konaklama ve transfer';

  @override
  String get operationDayTimeline1Body =>
      'Smile Gentle Care ekibi 4-5 yıldızlı otel konaklamasını ayarlar. Otele gelişten kliniğe transferlere kadar tüm ulaşım planlanır.';

  @override
  String get operationDayTimeline2Title => 'Çok dilli destek';

  @override
  String get operationDayTimeline2Body =>
      'Dünyanın farklı ülkelerinden gelen hastalar için profesyonel tercümanlar sağlanır. Sürecin her adımında kendi dilinizde bilgilendirilirsiniz.';

  @override
  String get operationDayTimeline3Title => 'Operasyon öncesi hazırlık';

  @override
  String get operationDayTimeline3Body =>
      'Bilgilendirme formları imzalanır, saç çizginiz çizilir, fotoğraflar çekilir ve HIV/HBV/HCV testleri ile vital bulgular kontrol edilir.';

  @override
  String get operationDayTimeline4Title => 'Operasyon akışı';

  @override
  String get operationDayTimeline4Body =>
      '6-8 saat süren işlemin adımları: planlama, greft alımı, kanal açma ve implantasyon. Doktorlarınız tüm süreci sizinle paylaşır.';

  @override
  String get operationDayTimeline5Title => 'Öğle yemeği ve özel tercihler';

  @override
  String get operationDayTimeline5Body =>
      'Vejetaryen, helal veya koşer menüler isteğe göre hazırlanır. Operasyon alanlarında akıllı TV ve müzik seçenekleri bulunur.';

  @override
  String get operationDayTimeline6Title => 'Ertesi gün bakım';

  @override
  String get operationDayTimeline6Body =>
      'Bandaj değişimi, yara kontrolü ve ilk yıkama eğitimi için kliniğe gelirsiniz. Sonrasında dijital fotoğraf takibi ile süreç izlenir.';

  @override
  String get sterilizationMeasure1 =>
      'Her gün vakum kaçak testi yapılarak sterilizatörlerin sızdırmazlığı kontrol edilir.';

  @override
  String get sterilizationMeasure2 =>
      'Bowie-Dick testi ile buharın tüm yüzeylere eşit ulaşıp ulaşmadığı günlük doğrulanır.';

  @override
  String get sterilizationMeasure3 =>
      'Ultrasonik yıkama testleri mikro kalıntıları temizlediğimizi belgeler.';

  @override
  String get sterilizationMeasure4 =>
      '15 günde bir biyolojik indikatör testleri yapılır ve üreme olmadığı raporlanır.';

  @override
  String get sterilizationMeasure5 =>
      'Steril ve kullanılmış aletler kilitli kutularda ayrı saklanır; çapraz bulaşma engellenir.';

  @override
  String get sterilizationMeasure6 =>
      'Her set otoklav numarası, tarih ve son kullanım tarihi etiketleriyle takip edilir.';

  @override
  String get sterilizationMeasure7 =>
      'Tüm süreçler Sağlık Bakanlığı DAS Rehberi, WHO ve AAMI ST79 standartlarına göre yürütülür.';

  @override
  String get washStep1 =>
      'Operasyon sonrası ilk 36-48 saat saçınızı yıkamayın; klinikte yapılacak ilk yıkamayı bekleyin.';

  @override
  String get washStep2 =>
      'Losyon veya köpüğü, hem donör hem de alıcı bölgeye parmak uçlarınızla tampon hareketlerle uygulayın.';

  @override
  String get washStep3 =>
      'Şampuanı köpürtüp ekim yapılan alana nazikçe dikey dokunuşlarla yayın; dairesel hareketlerden kaçının.';

  @override
  String get washStep4 =>
      'Ilık ve düşük basınçlı su kullanın. İlk 14 gün duş başlığı yerine kase ile su dökmek daha güvenlidir.';

  @override
  String get washStep5 =>
      'Kağıt havluyla greft bölgesini hafifçe bastırarak kurutun, donör alanı normal havluyla kurulayabilirsiniz.';

  @override
  String get washStep6 =>
      'Saç kurutma makinesi kullanmanız gerekiyorsa yalnızca soğuk modda ve uzak mesafeden kullanın.';

  @override
  String get faq1Question => 'İyileşme ne kadar sürer?';

  @override
  String get faq1Answer =>
      'İlk iki hafta hassas dönemdir; 6-12 ay boyunca saçlar farklı aşamalardan geçer. 6. ayda belirgin sonuçlar, 12-18. aylarda nihai yoğunluk görülür.';

  @override
  String get faq2Question => 'Bandaj ve uyku düzeni nasıl olmalı?';

  @override
  String get faq2Answer =>
      'Alın bölgesindeki şişliği azaltmak için elastik bandaj uygulanabilir. İlk 7-10 gün sırt üstü, boyun yastığıyla hafif yükseltilmiş pozisyonda uyuyun.';

  @override
  String get faq3Question => 'Duş, yıkama ve ürün kullanımı';

  @override
  String get faq3Answer =>
      'İlk iki gün saçınızı ıslatmayın. 48 saat sonra klinikteki ilk yıkamadan sonra günde bir kez medikal şampuanla yıkayın; duş süresi kısa olsun, buharı azaltın.';

  @override
  String get faq4Question =>
      'Saçımı ne zaman kurutabilir, tarayabilir veya boyayabilirim?';

  @override
  String get faq4Answer =>
      'İlk ay içinde sadece doğal kurutma önerilir. Donör alanı tarayabilirsiniz ancak ekim bölgesini 2 hafta dokunmayın. Kimyasal boyalardan 6-8 hafta uzak durun.';

  @override
  String get faq5Question => 'Sigara, alkol ve egzersiz';

  @override
  String get faq5Answer =>
      'Sigara, operasyon öncesi 12 saat ve sonrası 2 hafta boyunca yasak. Alkol, ilk 14 gün kullanılmamalı. Hafif yürüyüşler gün 4\'ten sonra serbest, ağır spor için 1 ay bekleyin.';

  @override
  String get faq6Question => 'Şapka, güneş, seyahat ve işe dönüş';

  @override
  String get faq6Answer =>
      'İlk 10 gün şapka takmayın ya da çok gevşek modeller tercih edin. Doğrudan güneşten kaçının. Ofis işine 3-5 gün içinde dönebilirsiniz; fiziksel işler için 2 hafta bekleyin. Seyahat edebilirsiniz fakat greftleri koruyun.';

  @override
  String get heroCardSubtitle1 =>
      'Smile Hair ekibi, operasyon öncesi değerlendirmeden seyahat planlamasına kadar tüm süreci sizin için yönetir.';

  @override
  String get heroCardSubtitle2 =>
      'Transferler, tercüman desteği ve steril ameliyathanelerle konforlu bir deneyim yaşayın.';

  @override
  String get heroCardSubtitle3 =>
      'Planlı ilaç kullanımı, doğru yıkama ve hareket kısıtlamaları ile greftleri güvenle koruyun.';

  @override
  String get heroCardSubtitle4 =>
      'Sık sorulan sorular, görseller ve dijital rehberlerle sürecin tamamını takip edin.';

  @override
  String get imageBannerCaption1 =>
      'İlk yıkamadan itibaren size verilen şampuan ve losyonlarla nazik bakım uygulayın.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Türkiye';

  @override
  String get emailSubject => 'Smile Hair Clinic İletişim';
}
