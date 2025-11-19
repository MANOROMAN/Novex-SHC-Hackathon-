// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Redakto Profilin';

  @override
  String get save => 'Ruaj';

  @override
  String get cancel => 'Anulo';

  @override
  String get close => 'Mbyll';

  @override
  String get changePhoto => 'Ndrysho Foton';

  @override
  String get patientId => 'ID e Pacientit';

  @override
  String get fullName => 'Emri i Plotë';

  @override
  String get email => 'E-mail';

  @override
  String get phone => 'Telefoni';

  @override
  String get address => 'Adresa';

  @override
  String get birthDate => 'Data e Lindjes';

  @override
  String get gender => 'Gjinia';

  @override
  String get emergencyContact => 'Kontakti i Emergjencës';

  @override
  String get saveChanges => 'Ruaj Ndryshimet';

  @override
  String get nameRequired => 'Emri i plotë nuk mund të jetë bosh';

  @override
  String get emailInvalid => 'Ju lutem shkruani një adresë e-mail të vlefshme';

  @override
  String get phoneRequired => 'Numri i telefonit nuk mund të jetë bosh';

  @override
  String get addressRequired => 'Adresa nuk mund të jetë bosh';

  @override
  String get birthDateRequired => 'Ju lutem zgjidhni datën e lindjes';

  @override
  String get profileUpdatedSuccessfully =>
      'Informacionet e profilit u përditësuan me sukses';

  @override
  String get male => 'Mashkull';

  @override
  String get female => 'Femër';

  @override
  String get preferNotToSay => 'Preferoj të mos e them';

  @override
  String get currentPassword => 'Fjalëkalimi Aktual';

  @override
  String get newPassword => 'Fjalëkalim i Ri';

  @override
  String get confirmNewPassword => 'Konfirmo Fjalëkalimin e Ri';

  @override
  String get change => 'Ndrysho';

  @override
  String get passwordsDoNotMatch => 'Fjalëkalimet e reja nuk përputhen';

  @override
  String get passwordTooShort =>
      'Fjalëkalimi duhet të jetë të paktën 6 karaktere';

  @override
  String get passwordChangedSuccessfully => 'Fjalëkalimi u ndryshua me sukses';

  @override
  String get currentPasswordRequired =>
      'Ju lutem shkruani fjalëkalimin tuaj aktual';

  @override
  String get newPasswordRequired => 'Ju lutem shkruani fjalëkalimin tuaj të ri';

  @override
  String get photoChangeFeatureComingSoon =>
      'Funksionaliteti i ndryshimit të fotos do të vijë së shpejti';

  @override
  String get description => 'Përshkrim';

  @override
  String version(String version) {
    return 'Versioni $version';
  }

  @override
  String get viewAndManageNotifications => 'Shiko dhe menaxho njoftimet';

  @override
  String get privacyPolicyError =>
      'Faqja e politikës së privatësisë nuk mund të hapej. Ju lutem kontrolloni lidhjen tuaj me internetin.';

  @override
  String get termsOfServiceError =>
      'Faqja e kushteve të shërbimit nuk mund të hapej. Ju lutem kontrolloni lidhjen tuaj me internetin.';

  @override
  String anErrorOccurred(String error) {
    return 'Ndodhi një gabim: $error';
  }

  @override
  String get appDescription =>
      'Një aplikacion modern mobil i projektuar për shërbime transplantimi flokësh dhe kujdesi. Mund të analizoni duke bërë fotot tuaja, të ndiqni procesin tuaj të trajtimit dhe të kontaktoni klinikën.';

  @override
  String get appCopyright =>
      '© 2024 Hair Clinic. Të gjitha të drejtat e rezervuara.';

  @override
  String get emergencyContactHint => 'Emri - Telefoni';

  @override
  String get appointmentDetails => 'Detajet e Takimit';

  @override
  String get dateLabel => 'Data';

  @override
  String get timeLabel => 'Ora';

  @override
  String get doctorLabel => 'Doktori';

  @override
  String get appointmentTypeLabel => 'Lloji i Takimit';

  @override
  String get locationLabel => 'Vendndodhja';

  @override
  String get phoneLabel => 'Telefoni';

  @override
  String get followUpConsultation => 'Konsultim Ndjekjeje';

  @override
  String get cancelAppointment => 'Anulo Takimin';

  @override
  String get addReminder => 'Shto kujtues';

  @override
  String get appointmentReminderSet => 'Kujtesa e takimit është vendosur';

  @override
  String get cameraPermissionRequired =>
      'Nuk mundemi të vazhdojmë pa leje kamere. Ju lutem jepni lejen nga cilësimet.';

  @override
  String get sensorPermissionRequired =>
      'Leja e sensorit të lëvizjes kërkohet për fotografitë nga lart dhe prapa.';

  @override
  String get recoveryProgress => 'Progresi i Rikthimit';

  @override
  String dayOfTotal(String current, String total) {
    return 'Dita $current nga $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Java $week: Faza e Shërimit';
  }

  @override
  String get todaysCareRoutine => 'Rutina e Kujdesit për Sot';

  @override
  String get takeMedicationMorning => 'Merrni ilaçin (Mëngjes)';

  @override
  String get applyTopicalSolution => 'Aplikoni zgjidhje topike';

  @override
  String get takeMedicationEvening => 'Merrni ilaçin (Mbrëmje)';

  @override
  String get upcomingAppointment => 'Takimi i Ardhshëm';

  @override
  String get nextFollowUpConsultation =>
      'Konsultimi juaj i ardhshëm i ndjekjes.';

  @override
  String get viewDetails => 'Shiko Detajet';

  @override
  String get notifications => 'Njoftimet';

  @override
  String get appointmentReminder => 'Kujtesë Takimi';

  @override
  String appointmentReminderMessage(String time) {
    return 'Keni një takim nesër në $time';
  }

  @override
  String hoursAgo(Object hours) {
    return '$hours orë më parë';
  }

  @override
  String get medicationReminder => 'Kujtesë Ilaçi';

  @override
  String get morningMedicationReminder =>
      'Mos harroni të merrni ilaçin tuaj të mëngjesit';

  @override
  String get photoReminder => 'Kujtesë Foto';

  @override
  String get weeklyProgressPhotoReminder =>
      'Mos harroni të bëni fotografi të progresit tuaj javor';

  @override
  String daysAgo(String days) {
    return '$days ditë më parë';
  }

  @override
  String weeksAgo(String weeks) {
    return '$weeks javë më parë';
  }

  @override
  String monthsAgo(String months) {
    return '$months muaj më parë';
  }

  @override
  String yearsAgo(String years) {
    return '$years vjet më parë';
  }

  @override
  String notificationOpened(String title) {
    return 'Njoftimi $title u hap';
  }

  @override
  String get appointmentCancellation => 'Anulimi i Takimit';

  @override
  String get cancelAppointmentConfirmation =>
      'Jeni të sigurt që dëshironi të anuloni këtë takim? Ky veprim nuk mund të zhbëhet.';

  @override
  String get appointmentCancelledSuccessfully => 'Takimi u anulua me sukses';

  @override
  String get everyDay => 'Çdo ditë';

  @override
  String get weekends => 'Fundjavat';

  @override
  String get weekdays => 'Ditët e javës';

  @override
  String get mondayShort => 'Hën';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mër';

  @override
  String get thursdayShort => 'Enj';

  @override
  String get fridayShort => 'Pre';

  @override
  String get saturdayShort => 'Sht';

  @override
  String get sundayShort => 'Die';

  @override
  String get titleCannotBeEmpty => 'Titulli nuk mund të jetë bosh';

  @override
  String get messageCannotBeEmpty => 'Mesazhi nuk mund të jetë bosh';

  @override
  String get pleaseEnterValidEmail =>
      'Ju lutem shkruani një adresë email të vlefshme';

  @override
  String get selectAtLeastOneDay => 'Ju lutem zgjidhni të paktën një ditë';

  @override
  String get dailyEmailScheduled => 'Emaili ditor u planifikua';

  @override
  String deleteTaskConfirmation(String title) {
    return 'Jeni të sigurt që dëshironi të fshini detyrën \"$title\"?';
  }

  @override
  String get taskDeleted => 'Detyra u fshi';

  @override
  String get deleteTask => 'Fshi Detyrën';

  @override
  String get newScheduledEmail => 'Email i Ri i Planifikuar';

  @override
  String get createDailyEmailTasks => 'Krijo detyra email ditore';

  @override
  String get titleLabel => 'Titulli';

  @override
  String get messageLabel => 'Mesazhi Juaj';

  @override
  String get recipientNameLabel => 'Emri i marrësit';

  @override
  String get delete => 'Fshi';

  @override
  String get daysLabel => 'Ditë';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'Një nga klinikat kryesore në Stamboll, e specializuar në transplantim flokësh.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic është një nga klinikat kryesore në Stamboll, e specializuar në transplantim flokësh. E udhëhequr nga të njohurit ndërkombëtarë Dr. Gökay Bilgin dhe Dr. Mehmet Erdoğan, kënaqësia e pacientit është gjithmonë prioritet në Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'Të gjitha proceset operative ndiqen personalisht nga mjekët, dhe çdo anëtar i ekipit përbëhet nga profesionistë me trajnim mjekësor. Deri më tani, janë kryer procedura të suksesshme transplantimi flokësh për pacientë të shumtë nga gjithë bota.';

  @override
  String get clinicEthicsDescription =>
      'Si Smile Hair Clinic, ne shërbejmë në përputhje me parimet tona të respektit për të drejtat e pacientit, transparencës, ndershmërisë dhe profesionalizmit. Ne veprojmë në përputhje me rregullat etike në të gjitha proceset e trajtimit, mbrojmë privatësinë e pacientit dhe synojmë të ofrojmë shërbimin e cilësisë më të lartë.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic është paraqitur në media të ndryshme për rezultatet e saj të suksesshme dhe kënaqësinë e pacientit. Ajo ka paraqitur në konferenca ndërkombëtare të transplantimit të flokëve dhe ka qenë pionier në fushë.';

  @override
  String get mediaOutlets => 'Media ku kemi qenë paraqitur:';

  @override
  String get clinicFoundingPartner =>
      'është partner themelues i Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'punon në Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'është një mjek i përvojshëm që punon në Smile Hair Clinic, duke prioritizuar kënaqësinë e pacientit.';

  @override
  String get viewFaqPage => 'Shiko faqen e pyetjeve të shpeshta';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Stamboll';

  @override
  String get chatWelcomeMessage =>
      'Mirë se vini! Si mund t\'ju ndihmojmë sot? Ekipi ynë zakonisht përgjigjet brenda një ore.';

  @override
  String get chatSampleMessage =>
      'Përshëndetje, do të doja të pyes për planin tim të trajtimit.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'përpara';

  @override
  String get backCamera => 'prapa';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Linja kohore';

  @override
  String get visibleImprovementDescription =>
      'Përmirësim i dukshëm në dendësi në të gjithë kurorën. Pacienti raporton kënaqësi të lartë.';

  @override
  String get procedureDetails => 'Lloji: Restaurim FUE\nGreftë: 2,450';

  @override
  String get scheduledEmails => 'Email të planifikuar';

  @override
  String get noScheduledEmails => 'Nuk ka email të planifikuar';

  @override
  String get sampleAppointmentDate => 'Mar, 9 Nën, 10:30';

  @override
  String get sampleAppointmentDateFull => 'E martë, 9 nëntor 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'Stamboll, Turqi';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Rikthim dhe Kujdes i Flokëve';

  @override
  String get welcomeLogin => 'Hyrje';

  @override
  String get welcomeRegister => 'Regjistrohu';

  @override
  String get loginTitle => 'Mirë se u kthyet';

  @override
  String get loginSubtitle => 'Hyni në llogarinë tuaj';

  @override
  String get loginEmail => 'E-mail';

  @override
  String get loginEmailHint => 'Shkruani adresën tuaj të e-mailit';

  @override
  String get loginPassword => 'Fjalëkalimi';

  @override
  String get loginPasswordHint => 'Shkruani fjalëkalimin tuaj';

  @override
  String get loginForgotPassword => 'Harruat fjalëkalimin?';

  @override
  String get loginLoginButton => 'Hyrje';

  @override
  String get loginOr => 'ose';

  @override
  String get loginGoogleLogin => 'Vazhdo me Google';

  @override
  String get loginNeedAccount => 'Keni nevojë për një llogari?';

  @override
  String get forgotPasswordTitle => 'Rivendosni fjalëkalimin tuaj';

  @override
  String get forgotPasswordSubtitle =>
      'Shkruani email-in tuaj të regjistruar dhe ne do t\'ju dërgojmë një lidhje për të rivendosur fjalëkalimin tuaj.';

  @override
  String get forgotPasswordSendButton => 'Dërgo email për rivendosje';

  @override
  String get forgotPasswordEmailSent =>
      'Email për rivendosjen e fjalëkalimit është dërguar. Ju lutemi kontrolloni kutinë tuaj të postës.';

  @override
  String get registrationTitle => 'Krijoni Llogarinë Tuaj';

  @override
  String get registrationSubtitle => 'Krijo një llogari të re';

  @override
  String get registrationName => 'Emri i Plotë';

  @override
  String get registrationNameHint => 'Shkruani emrin dhe mbiemrin tuaj';

  @override
  String get registrationEmail => 'E-mail';

  @override
  String get registrationEmailHint => 'Shkruani adresën tuaj të e-mailit';

  @override
  String get registrationPassword => 'Fjalëkalimi';

  @override
  String get registrationPasswordHint => 'Krijoni fjalëkalimin tuaj';

  @override
  String get registrationConfirmPassword => 'Konfirmo Fjalëkalimin';

  @override
  String get registrationConfirmPasswordHint =>
      'Shkruani përsëri fjalëkalimin tuaj';

  @override
  String get registrationTerms =>
      'Unë pranoj Kushtet e Përdorimit dhe Politikën e Privatësisë.';

  @override
  String get registrationRegisterButton => 'Krijo Llogari';

  @override
  String get registrationAlreadyHaveAccount => 'Keni tashmë një llogari?';

  @override
  String get registrationLoginLink => 'Hyrje';

  @override
  String dashboardHelloParam(String name) {
    return 'Përshëndetje, $name';
  }

  @override
  String get dashboardHome => 'Shtëpia';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Analizë';

  @override
  String get dashboardMyAppointments => 'Takimet e Mia';

  @override
  String get dashboardResources => 'Burime';

  @override
  String get dashboardCareGuide => 'Udhëzues Kujdesi';

  @override
  String get dashboardCareGuideSubtitle =>
      'Udhëzime për kujdes pas transplantimit';

  @override
  String get dashboardDefaultUserName => 'Përdorues i ftuar';

  @override
  String get dashboardHairTransplantTitle => 'Transplantim Flokësh';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Eksploroni çdo teknikë transplantimi';

  @override
  String get dashboardOnlineConsultationTitle => 'Konsultim Online';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'Merrni këshillë eksperte falas';

  @override
  String get dashboardDoctorsTitle => 'Doktorët Tanë';

  @override
  String get dashboardDoctorsSubtitle => 'Njihni kirurgët tanë specialistë';

  @override
  String get dashboardAboutUsTitle => 'Rreth Nesh';

  @override
  String get dashboardAboutUsSubtitle => 'Mësoni rreth klinikës sonë';

  @override
  String get dashboardContactTitle => 'Kontakt';

  @override
  String get dashboardContactSubtitle => 'Lidhuni me ne';

  @override
  String get dashboardProgressTracking => 'Ndjekje e Progresit';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Ndiqni progresin tuaj të trajtimit';

  @override
  String get dashboardPastAnalysesSubtitle =>
      'Analizat tuaja të mëparshme të fotove';

  @override
  String get settingsProfile => 'Profili';

  @override
  String get settingsPreferences => 'Preferencat';

  @override
  String get settingsLanguage => 'Gjuha';

  @override
  String get settingsLanguageSubtitle => 'Zgjidhni gjuhën tuaj të preferuar';

  @override
  String get settingsDarkMode => 'Modaliteti i Errët';

  @override
  String get settingsDarkModeSubtitle => 'Aktivizo temën e errët';

  @override
  String get settingsNotifications => 'Njoftimet';

  @override
  String get settingsNotificationsSubtitle => 'Aktivizo të gjitha njoftimet';

  @override
  String get settingsEmailNotifications => 'Njoftimet me E-mail';

  @override
  String get settingsEmailNotificationsSubtitle => 'Merrni njoftime me e-mail';

  @override
  String get settingsPushNotifications => 'Njoftimet Push';

  @override
  String get settingsPushNotificationsSubtitle => 'Merrni njoftime push';

  @override
  String get settingsAccount => 'Llogaria';

  @override
  String get settingsChangePassword => 'Ndrysho Fjalëkalimin';

  @override
  String get settingsChangePasswordSubtitle => 'Përditësoni fjalëkalimin tuaj';

  @override
  String get settingsPrivacyPolicy => 'Politika e Privatësisë';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Lexoni politikën tonë të privatësisë';

  @override
  String get settingsTermsOfService => 'Kushtet e Shërbimit';

  @override
  String get settingsTermsOfServiceSubtitle =>
      'Lexoni kushtet tona të shërbimit';

  @override
  String get settingsSupport => 'Mbështetje';

  @override
  String get settingsHelpSupport => 'Ndihmë dhe Mbështetje';

  @override
  String get settingsHelpSupportSubtitle =>
      'Merrni ndihmë dhe kontaktoni mbështetjen';

  @override
  String get settingsAddPhone => 'Shto numër telefoni';

  @override
  String get settingsThemeMode => 'Mënyra e temës';

  @override
  String get settingsThemeDescriptionSystem => 'Ndiq cilësimet e sistemit';

  @override
  String get settingsThemeDescriptionLight => 'Temë e çelët';

  @override
  String get settingsThemeDescriptionDark => 'Temë e errët';

  @override
  String get settingsThemeDialogTitle => 'Zgjidhni mënyrën e temës';

  @override
  String get settingsThemeOptionSystem => 'Sistemi';

  @override
  String get settingsThemeOptionSystemSubtitle =>
      'Përshtatu me cilësimet e pajisjes';

  @override
  String get settingsThemeOptionLight => 'E çelët';

  @override
  String get settingsThemeOptionLightSubtitle => 'Skemë ngjyrash e çelët';

  @override
  String get settingsThemeOptionDark => 'E errët';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Skemë ngjyrash e errët';

  @override
  String get settingsKvkkFormTitle => 'Formular Kërkese KVKK';

  @override
  String get settingsKvkkFormSubtitle =>
      'Paraqitni kërkesë për të dhënat tuaja personale';

  @override
  String get settingsGdprFormTitle => 'Formular Kontakti GDPR';

  @override
  String get settingsGdprFormSubtitle =>
      'Njoftim informacioni për KVKK dhe GDPR';

  @override
  String get settingsRecordsTitle => 'Dosjet e Mia';

  @override
  String get settingsTreatmentHistoryTitle => 'Historiku i Trajtimit';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Shikoni takimet dhe regjistrimet tuaja të operacioneve';

  @override
  String get settingsDocumentsTitle => 'Dokumentet';

  @override
  String get settingsDocumentsSubtitle => 'Raporte, receta dhe dosje të ndara';

  @override
  String get settingsInvoicesTitle => 'Faturat';

  @override
  String get settingsInvoicesSubtitle => 'Menaxho pagesat dhe faturat';

  @override
  String get settingsSupportCenterSubtitle =>
      'Mbështetje 24/7 dhe kanale kontakti';

  @override
  String get settingsContactTitle => 'Kontakt';

  @override
  String get settingsContactSubtitle =>
      'Adresa, telefoni dhe opsionet e kontaktit';

  @override
  String get settingsProfileLoginRequired =>
      'Ju lutemi hyni për të ndryshuar foton tuaj të profilit.';

  @override
  String get settingsProfilePhotoUpdated =>
      'Fotoja juaj e profilit u përditësua.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Gabim në përditësimin e fotos: $error';
  }

  @override
  String get supportCenterTitle => 'Qendra e Mbështetjes';

  @override
  String get supportCenterHeroTitle => 'Këtu për ju 24/7';

  @override
  String get supportCenterHeroDescription =>
      'Ekipi i mbështetjes së Smile Hair Clinic është me ju në çdo hap të udhëtimit tuaj të trajtimit.';

  @override
  String get supportCenterQuickContact => 'Kontakt i Shpejtë';

  @override
  String get supportCenterWhatsappTitle => 'Bisedo përmes WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Flisni me ekipin tonë të mbështetjes live menjëherë';

  @override
  String get supportCenterCallTitle => 'Na telefononi';

  @override
  String get supportCenterEmailTitle => 'Dërgoni një email';

  @override
  String get supportCenterKnowledgeBase => 'Qendra e Njohurive';

  @override
  String get supportCenterFaqSubtitle => 'Pyetje para dhe pas operacionit';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Baza e Njohurive';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Të gjitha artikujt tanë për transplantimin e flokëve';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Mbështetje për Takime dhe Trajtim';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Merrni informacion për planin tuaj të trajtimit';

  @override
  String get supportCenterMessageSectionTitle => 'Dërgoni një mesazh';

  @override
  String get supportCenterMessageLabel => 'Mesazhi juaj';

  @override
  String get supportCenterMessageHint =>
      'Shkruani pyetjen ose kërkesën tuaj...';

  @override
  String get supportCenterMessageEmpty => 'Ju lutemi shkruani një mesazh';

  @override
  String get supportCenterMessageSuccess =>
      'Kemi marrë mesazhin tuaj. Do t\'ju kthejmë përgjigje së shpejti.';

  @override
  String get supportCenterSendButton => 'Dërgo';

  @override
  String get treatmentHistoryTitle => 'Historiku i Trajtimit';

  @override
  String get treatmentHistoryLoginRequired =>
      'Duhet të hyni për të parë këtë veçori.';

  @override
  String get treatmentHistoryEmpty => 'Nuk keni ende trajtime të regjistruara.';

  @override
  String get treatmentHistoryDatePending => 'Data në pritje';

  @override
  String get treatmentHistoryDefaultType => 'Kontroll';

  @override
  String get treatmentHistoryDoctorPending => 'Për të caktuar';

  @override
  String get treatmentHistoryStatusCompleted => 'Përfunduar';

  @override
  String get treatmentHistoryStatusCancelled => 'Anuluar';

  @override
  String get treatmentHistoryStatusInProgress => 'Në vazhdim';

  @override
  String get treatmentHistoryStatusScheduled => 'Planifikuar';

  @override
  String get settingsAbout => 'Rreth';

  @override
  String get settingsAboutSubtitle =>
      'Versioni dhe informacioni i aplikacionit';

  @override
  String get settingsLogout => 'Dil';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'Rikthim Premium i Flokëve';

  @override
  String get clinicProfileAbout => 'Rreth';

  @override
  String get clinicProfileDoctors => 'Mjekët';

  @override
  String get clinicProfileGallery => 'Galeria';

  @override
  String get clinicProfileTreatments => 'Trajtime';

  @override
  String get clinicProfileBookConsultation => 'Rezervo Konsultim';

  @override
  String get clinicProfileAboutTitle => 'Rreth Nesh';

  @override
  String get clinicProfileEthicsTitle => 'Etika Jonë';

  @override
  String get clinicProfilePressTitle => 'Në Shtyp';

  @override
  String get clinicProfileContactTitle => 'Informacioni i Kontaktit';

  @override
  String get clinicProfileDoctorsTitle => 'Mjekët Tanë';

  @override
  String get clinicProfileGalleryTitle => 'Galeria e Rezultateve';

  @override
  String get clinicProfileHairSurgeon => 'Kirurg i Transplantimit të Flokëve';

  @override
  String get pastAnalysesTitle => 'Analizat e Kaluara';

  @override
  String get faqTitle => 'Pyetjet e Bëra Shpesh';

  @override
  String get faqSubtitle => 'Për pyetjet tuaja';

  @override
  String get splashTagline => 'Specialist në Transplantim Flokësh dhe Estetikë';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Kapje automatike nga 5 kënde kritike për flokët dhe skalpin.\nSigurohuni që jeni në një ambient me dritë të mirë para se të filloni.';

  @override
  String get captureFlowStartCapture => 'Fillo Kapjen';

  @override
  String get captureFlowFaceDetection =>
      'Poziciononi fytyrën tuaj në kornizë dhe shikoni kamerën.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Pozicioni i saktë, mbani qetë ($seconds sek)';
  }

  @override
  String get captureFlowTurnRightMore =>
      'Ktheni kokën tuaj pak më shumë në të djathtë.';

  @override
  String get captureFlowTooMuchRight =>
      'E ktheni pak shumë, rregulloni pak në të majtë.';

  @override
  String get captureFlowKeepHeadStill =>
      'Mbani kokën tuaj qetë dhe mos lëvizni shpatullat.';

  @override
  String get captureFlowTurnLeftMore =>
      'Ktheni kokën tuaj pak më shumë në të majtë.';

  @override
  String get captureFlowTooMuchLeft =>
      'E ktheni pak shumë, rregulloni pak në të djathtë.';

  @override
  String get captureFlowCaptured => 'kapur';

  @override
  String get captureFlowInitializingCamera => 'Inicializimi i kamerës...';

  @override
  String get captureFlowCapturedPhotos => 'Foto të Kapura';

  @override
  String get captureFlowEndSession => 'Përfundo Sesionin';

  @override
  String get captureFlowReviewPhotos => 'Rishiko Foton';

  @override
  String get captureFlowPhotosCaptured => 'foto të kapura';

  @override
  String get captureFlowSelected => 'E Zgjedhur';

  @override
  String get captureFlowContinueToAnalysis => 'Vazhdo te Analiza';

  @override
  String get captureFlowNewCapture => 'Fillo Kapje të Re';

  @override
  String get captureFlowPhotosFrom5Angles => 'Foto nga 5 kënde';

  @override
  String get captureStageFrontTitle => 'Pamje përpara';

  @override
  String get captureStageFrontBaseInstruction =>
      'Shikoni drejtpërdrejt në kamerë dhe mbani kokën të palëvizshme.';

  @override
  String get captureStageFrontReminder =>
      'Mbani kokën drejt dhe shikoni në kamerë.';

  @override
  String get captureStageRight45Title => 'Djathtas 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Ktheni kokën 45 gradë në të djathtë.';

  @override
  String get captureStageRight45Reminder =>
      'Ktheni kokën më shumë në të djathtë.';

  @override
  String get captureStageLeft45Title => 'Majtas 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Ktheni kokën 45 gradë në të majtë.';

  @override
  String get captureStageLeft45Reminder => 'Ktheni kokën më shumë në të majtë.';

  @override
  String get captureStageVertexTitle => 'Pamje nga lart';

  @override
  String get captureStageVertexBaseInstruction =>
      'Mbani telefonin tuaj horizontalisht mbi kokën tuaj.';

  @override
  String get captureStageVertexReminder =>
      'Mbani telefonin tuaj të sheshtë mbi kokën tuaj.';

  @override
  String get captureStageDonorTitle => 'Zona donatore';

  @override
  String get captureStageDonorBaseInstruction =>
      'Ktheni kokën dhe mbani telefonin pas kokës suaj.';

  @override
  String get captureStageDonorReminder =>
      'Mbani telefonin të qëndrueshëm pas kokës suaj.';

  @override
  String get photoCaptureFrontView => 'Pamje e Përparme';

  @override
  String get photoCapturePositionHead => 'Poziciononi kokën tuaj brenda skicës';

  @override
  String get photoCaptureFront => 'Përpara';

  @override
  String get photoCaptureTop => 'Lart';

  @override
  String get photoCaptureLeft => 'Majtas';

  @override
  String get photoCaptureRight => 'Djathtas';

  @override
  String get chatOnline => 'Online';

  @override
  String get chatToday => '--- Sot ---';

  @override
  String get chatMessageHint => 'Shkruani mesazhin tuaj...';

  @override
  String get chatQuickRepliesAppointment => 'Rezervo takim';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Plani im i trajtimit';

  @override
  String get chatQuickRepliesFollowup => 'Kërko ndjekje';

  @override
  String get chatQuickRepliesPriceInfo => 'Informacioni i çmimeve';

  @override
  String progressPatientIdParam(String id) {
    return 'ID e Pacientit: $id';
  }

  @override
  String get progressStatistics => 'Statistikat';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Muaj Pas Operacionit';
  }

  @override
  String get progressProcedureDay => 'Dita e Procedurës';

  @override
  String get progressInitialConsultation => 'Konsultimi Fillestar';

  @override
  String get progressUploadPhoto => 'Ngarko Foto të Re';

  @override
  String get analysisCaptureAndAnalyze => 'Kap dhe Analizo';

  @override
  String get analysisPastAnalyses => 'Analizat e Kaluara';

  @override
  String get analysisAnalysisDate1 => '15 tetor 2023';

  @override
  String get analysisAnalysisDesc1 => 'Hollim i lehtë në zonën e kurorës';

  @override
  String get analysisAnalysisDate2 => '12 korrik 2023';

  @override
  String get analysisAnalysisDesc2 => 'Shenja të inflamacioni në skalp';

  @override
  String get analysisAnalysisDate3 => '5 prill 2023';

  @override
  String get analysisAnalysisDesc3 =>
      'Shëndeti i përgjithshëm i skalpit është i mirë';

  @override
  String get analysisAnalysisDate4 => '20 janar 2023';

  @override
  String get analysisAnalysisDesc4 => 'Analizë fillestare për trajtim';

  @override
  String get faqQuestion1 =>
      'Sa kohë zgjat procedura e transplantimit të flokëve?';

  @override
  String get faqAnswer1 =>
      'Procedura e transplantimit të flokëve zakonisht zgjat 4-8 orë në varësi të numrit të grefteve që do të transplantohen. Meqenëse përdoret anestezia lokale gjatë procedurës, pacienti nuk ndjen dhimbje.';

  @override
  String get faqQuestion2 =>
      'Kur mund të kthehem në jetën normale pas transplantimit të flokëve?';

  @override
  String get faqAnswer2 =>
      'Mund të bëni aktivitete të lehta 2-3 ditë pas transplantimit të flokëve. Rekomandohet të prisni 2 javë për sporte të rënda dhe aktivitete fizike. Kthimi në punë zakonisht është i mundur 3-5 ditë më vonë.';

  @override
  String get faqQuestion3 => 'Kur fillojnë të rriten flokët e transplantuar?';

  @override
  String get faqAnswer3 =>
      'Flokët e transplantuar bien në 2-3 javët e para (humbje shoku). Flokët e rinj fillojnë të rriten 3-4 muaj më vonë dhe rezultatet e plota shihen brenda 6-12 muajve.';

  @override
  String get faqQuestion4 =>
      'A është e dhimbshme procedura e transplantimit të flokëve?';

  @override
  String get faqAnswer4 =>
      'Meqenëse përdoret anestezia lokale gjatë procedurës, nuk ndihet dhimbje. Mund të ketë dhimbje të lehtë pas procedurës, por kjo mund të kontrollohet me ilaçe kundër dhimbjes.';

  @override
  String get faqQuestion5 =>
      'Sa është shkalla e suksesit të transplantimit të flokëve?';

  @override
  String get faqAnswer5 =>
      'Transplantimi i flokëve ka një shkallë suksesi shumë të lartë, zakonisht 95-98%. Suksesi varet nga shëndeti i pacientit, cilësia e zonës donatore dhe ndjekja e udhëzimeve për kujdesin pas operacionit.';

  @override
  String get faqQuestion6 => 'A mund të bëjnë gratë transplantim flokësh?';

  @override
  String get faqAnswer6 =>
      'Po, gratë mund të bëjnë transplantim flokësh. Humbja e flokëve të tipit femëror është e zakonshme dhe mund të trajtohet me procedura transplantimi flokësh. Kërkohet një konsultim për të përcaktuar nëse pacienti është një kandidat i përshtatshëm.';

  @override
  String get faqQuestion7 =>
      'Sa grefte nevojiten për një transplantim flokësh?';

  @override
  String get faqAnswer7 =>
      'Numri i grefteve të nevojshme varet nga shtrirja e humbjes së flokëve dhe dendësia e dëshiruar. Zakonisht, përdoren 1,500-3,000 grefte për humbje të moderuar të flokëve, ndërsa mund të nevojiten 3,000-5,000 grefte për humbje të gjerë të flokëve.';

  @override
  String get faqQuestion8 =>
      'A ka një kufi moshe për transplantimin e flokëve?';

  @override
  String get faqAnswer8 =>
      'Nuk ka një kufi të rreptë moshe, por procedura zakonisht rekomandohet për pacientët mbi 25 vjeç kur modeli i humbjes së flokëve është më i qëndrueshëm. Çdo rast vlerësohet individualisht.';

  @override
  String get faqQuestion9 =>
      'Sa është koha e shërimit pas transplantimit të flokëve?';

  @override
  String get faqAnswer9 =>
      'Shumica e pacientëve mund të kthehen në punë brenda 3-5 ditëve. Krustat zakonisht bien brenda 7-10 ditëve. Shërimi i plotë dhe aktivitetet normale mund të vazhdohen pas 2 javëve.';

  @override
  String get faqQuestion10 =>
      'A janë të përhershme rezultatet e transplantimit të flokëve?';

  @override
  String get faqAnswer10 =>
      'Po, flokët e transplantuar janë të përhershëm sepse merren nga zona donatore që është gjenetikisht rezistente ndaj humbjes së flokëve. Flokët e transplantuar do të vazhdojnë të rriten natyrshëm për pjesën tjetër të jetës suaj.';

  @override
  String get pastAnalysesListView => 'Pamje Listë';

  @override
  String get pastAnalysesGridView => 'Pamje Rrjet';

  @override
  String get pastAnalysesDetailedView => 'Pamje e Detajuar';

  @override
  String get pastAnalysesDensityModerate => 'Dendësia: E Moderuar';

  @override
  String get pastAnalysesDensityLow => 'Dendësia: E Ulët';

  @override
  String get privacyPolicyTitle =>
      'Politika e Përpunimit dhe Mbrojtjes së të Dhënave Personale';

  @override
  String get privacyPolicyDocumentDate => 'Data e Dokumentit:';

  @override
  String get privacyPolicyRevisionDate => 'Data e Rishikimit:';

  @override
  String get privacyPolicyRevisionNumber => 'Numri i Rishikimit:';

  @override
  String get privacyPolicySection1 => 'I. HYRJE';

  @override
  String get privacyPolicySection1A => 'A. Qëllimi dhe Shtrirja';

  @override
  String get privacyPolicySection1AContent =>
      'Kjo Politikë rregullon parimet e adoptuara nga Smile Hair Clinic në lidhje me mbrojtjen dhe përpunimin e të dhënave personale.\n\nBrenda shtrirjes së kësaj Politike, Smile Hair Clinic ofron shpjegime në lidhje me aktivitetet e përpunimit të të dhënave personale dhe sistemet e adoptuara për mbrojtjen e të dhënave personale. Kjo përfshin informimin dhe sigurimin e transparencës për Personat e Rëndësishëm, kryesisht duke përfshirë Marrësit e Produkteve ose Shërbimeve, Punonjësit dhe Kandidatët për Punë, Klientët e Mundshëm, Aksionarët, Vizitorët, Pjesëmarrësit, Furnizuesit dhe Palët e Treta, vendosjen dhe sigurimin e standardeve në menaxhimin e të dhënave personale; përcaktimin dhe mbështetjen e qëllimeve dhe detyrimeve organizative; vendosjen e mekanizmave të kontrollit të përputhshëm me nivelet e pranueshme të rrezikut, përputhjen me parimet dhe rregullat e vendosura nga konventat ndërkombëtare, Kushtetuta, ligjet, rregulloret, kontratat dhe legjislacioni tjetër në lidhje me mbrojtjen e të dhënave personale, dhe sigurimin e mbrojtjes më të mirë të të drejtave dhe lirive themelore të Personit të Rëndësishëm. Përveç kësaj, kjo Politikë mbulon të gjitha sistemet dhe mjediset e regjistrimit të të dhënave fizike dhe elektronike të përdorura për përpunimin e të dhënave personale dhe të dhënave personale të kategorisë speciale automatikisht ose si pjesë e një sistemi regjistrimi të dhënash me mjete jo-automatike.';

  @override
  String get privacyPolicySection1B => 'B. Përkufizimet';

  @override
  String get photoAnalysisTitle => 'Analiza e Fotove';

  @override
  String photosUploadedCount(String count) {
    return '$count foto u ngarkuan';
  }

  @override
  String get autoAnalysisStarting =>
      '5 foto u ngarkuan. Analiza automatike do të fillojë...';

  @override
  String stageUploaded(String stage) {
    return 'Këndi $stage u ngarkua';
  }

  @override
  String stageCaptured(String stage) {
    return 'Këndi $stage u kap';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Gabim në ngarkimin e fotos: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Gabim në ngarkimin e shumë fotove: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Gabim në kapjen e fotos: $error';
  }

  @override
  String get imageSourceTitle => 'Burimi i Fotos';

  @override
  String get imageSourceCamera => 'Kamera';

  @override
  String get imageSourceGallery => 'Galeria';

  @override
  String get imageSourceMultiGallery => 'Zgjidh shumë nga galeria';

  @override
  String get promptNoPhotosForAnalysis =>
      'Ju lutemi ngarkoni një foto së pari. Trokitni butonin 📷 për të ngarkuar.';

  @override
  String get analyzingPhotos => 'Fotot tuaja po analizohen...';

  @override
  String get visualAnalysisHeader => '📸 Analiza Vizuale - Çfarë shoh:';

  @override
  String get importantWarningHeader => '⚠️ PARALAJMËRIM I RËNDËSISHËM:';

  @override
  String get differentPersonsDetected =>
      'Persona të ndryshëm u zbuluan në foto! Të gjitha fotot duhet të jenë të së njëjtës person.';

  @override
  String get pleaseCaptureSamePerson =>
      'Ju lutemi kapo foto të së njëjtës person nga 5 këndeve të ndryshme.';

  @override
  String get detectedAnglesHeader => '🔍 Këndet e Zbuluara:';

  @override
  String get analysisCompleted => '✅ Analiza u përfundua!';

  @override
  String get allPhotosLookGood => 'Të gjitha fotot duken mirë.';

  @override
  String get savedToFirebase => '✅ Fotot u ruajtën në Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'ID e Analizës: $id';
  }

  @override
  String get savedLocationLabel =>
      'Vendi i Ruajtur: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Rezultati i Analizës';

  @override
  String get retakeRequiredAngles => '❌ Kënde që duhet të rimerren:';

  @override
  String get errorDetailsHeader => 'Detajet e gabimit:';

  @override
  String get retakeTheseAnglesQuestion =>
      'Do të dëshironit të rimerren këto kënde?';

  @override
  String get retakeFirstInvalidQuestion =>
      'Do të dëshironit të rimerret këndi i parë i pavlefshëm?';

  @override
  String get retake => 'Rimer';

  @override
  String get aiAnalysisTitle => 'AI Analysis';

  @override
  String get aiAnalysisDescription =>
      'The AI analyzes your photos and provides feedback on your hair transplant progress.';

  @override
  String get aiAnalysisInProgress => 'AI analysis in progress...';

  @override
  String get aiAnalysisCompleted =>
      'AI analysis completed. Please check the results.';

  @override
  String aiAnalysisError(String error) {
    return 'Error occurred during AI analysis: $error';
  }

  @override
  String get uploadAndAnalyze => 'Ngarko dhe Analizo';

  @override
  String get captureWithFaceDetection => 'Kap me Zbulim të Fytyrës';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'Zgjidhni kohën';

  @override
  String get dateNotAvailable => 'Date not available';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get enableDailyMedicationReminder =>
      'Aktivizo Kujtesën e Përditshme të Barnave';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Qasje e Shpejtë';

  @override
  String get quickActions => 'Veprime të Shpejta';

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
  String get ok => 'OK';

  @override
  String get noUpcomingAppointments => 'Nuk ka takime të ardhshme';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Konsultim Falas';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Emri i Plotë';

  @override
  String get fullNameHint => 'Emër Mbiemër';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Shkruani mesazhin tuaj këtu...';

  @override
  String get or => 'ose';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'Rreth Nesh';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'Vlerat Tona';

  @override
  String get professionalism => 'Profesionalizëm';

  @override
  String get professionalismDescription =>
      'Doktorët tanë ekspertë të certifikuar ndërkombytarisht në fushën e tyre';

  @override
  String get patientSatisfaction => 'Kënaqësia e Pacientit';

  @override
  String get patientSatisfactionDescription =>
      'Lumturia e pacientëve tanë është gjithmonë prioriteti ynë';

  @override
  String get medicalEducation => 'Arsim Mjekësor';

  @override
  String get medicalEducationDescription =>
      'Çdo anëtar i ekipit tonë përbëhet nga profesionistë me trajnim mjekësor';

  @override
  String get internationalService => 'Shërbim Ndërkombëtar';

  @override
  String get internationalServiceDescription =>
      'Duke shrbyer pacientët tanë nga e gjithë bota';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Operacione\ntë Suksesshme';

  @override
  String get patientsFromCountries => 'Pacientë nga\nVende';

  @override
  String get expertDoctors => 'Doktorë\nEkspertë';

  @override
  String get patientSatisfactionRate => 'Kënëqësia e\nPacientëve';

  @override
  String get experience => 'Përvojy';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'Rreth';

  @override
  String get expertiseAreas => 'Fushat e Ekspertizës';

  @override
  String get interview => 'Intervistë';

  @override
  String get contactUs => 'Na Kontaktoni';

  @override
  String get call => 'Telefono';

  @override
  String get workingHours => 'Orët e Punës';

  @override
  String get mondayFriday => 'E Hënë - E Premte';

  @override
  String get saturday => 'E Shtunë';

  @override
  String get sunday => 'E Diel';

  @override
  String get closed => 'Mbyllur';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'Të Gjitha';

  @override
  String get unread => 'Të Palexuara';

  @override
  String get scheduled => 'Të Planifikuara';

  @override
  String get markAllAsRead => 'Shënoji Të Gjitha si të Lexuara';

  @override
  String get noNotificationsYet => 'Ende pa njoftime';

  @override
  String get newNotificationsWillAppearHere =>
      'Njoftimet e reja do të shfaqen këtu';

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
  String get showFaceToCamera => 'Show your face to the camera...';

  @override
  String cameraNotFound(Object type) {
    return 'Kamera nuk u gjet në pajisje: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'Nuk mund të hapet aplikacioni i telefonit. Ju lutemi sigurohuni që aplikacioni i telefonit është i instaluar në pajisjen tuaj.';

  @override
  String get emailAppCannotOpen =>
      'Nuk mund të hapet aplikacioni i emailit. Ju lutemi sigurohuni që aplikacioni i emailit është i instaluar në pajisjen tuaj.';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Doktorët Tanë';

  @override
  String get contact => 'Contact';

  @override
  String get history => 'History';

  @override
  String get timeNotAvailable => 'Time not available';

  @override
  String get date => 'Date';

  @override
  String get time => 'Time';

  @override
  String get doctor => 'Doktor';

  @override
  String get doctorNamePlaceholder => 'Dr. Sarah Johnson';

  @override
  String get type => 'Type';

  @override
  String get consultationTypePlaceholder => 'Follow-up Consultation';

  @override
  String get location => 'Location';

  @override
  String get notes => 'Notes';

  @override
  String get yourDoctor => 'Doktori Juaj';

  @override
  String get appointment => 'Takim';

  @override
  String get soon => 'së shpejti';

  @override
  String get reminderAdded => 'Reminder added';

  @override
  String reminderAddError(Object error) {
    return 'Could not add reminder: $error';
  }

  @override
  String appointmentWith(Object doctorName, Object type) {
    return '$doctorName with $type';
  }

  @override
  String cameraInitError(Object error) {
    return 'Error initializing camera: $error';
  }

  @override
  String cameraRefreshError(Object error) {
    return 'Could not refresh camera: $error';
  }

  @override
  String photoCaptureError(Object error) {
    return 'Error capturing photo: $error';
  }

  @override
  String get panoramaComplete => 'Panoramic capture complete.';

  @override
  String get panoramaVertexInstruction =>
      'Hold phone above your head, horizontal with screen facing down.';

  @override
  String get sensorDataWaiting => 'Waiting for sensor data...';

  @override
  String panoramaContinueToDonor(Object degrees) {
    return 'Continue towards the back of the head';
  }

  @override
  String get panoramaHoldSteady => 'Hold phone steady, capturing back photo.';

  @override
  String get turnHeadRightInstruction =>
      'Turn your head significantly to the RIGHT (approx 70–90°). Keep chin level.';

  @override
  String get turnHeadLeftCorrection =>
      'Turned too much; come back LEFT a bit. Keep chin level.';

  @override
  String get holdSteadyNearTarget =>
      'Don\'t move, very close to alignment. Stay steady.';

  @override
  String get turnHeadLeftInstruction =>
      'Turn your head significantly to the LEFT (approx 70–90°). Keep chin level.';

  @override
  String get turnHeadRightCorrection =>
      'Turned too much; come back RIGHT a bit. Keep chin level.';

  @override
  String get holdPhoneFlatInstruction =>
      'Hold phone COMPLETELY FLAT! Screen must face up.';

  @override
  String get holdPhoneFlatter =>
      'Hold phone a bit flatter. Screen must face exactly up.';

  @override
  String get dontTiltForward => 'Hold phone flatter, don\'t tilt forward.';

  @override
  String get dontTiltBackward => 'Hold phone flatter, don\'t tilt backward.';

  @override
  String get dontTiltRight => 'Hold phone flatter, don\'t tilt right.';

  @override
  String get dontTiltLeft => 'Hold phone flatter, don\'t tilt left.';

  @override
  String perfectHoldStill(Object seconds) {
    return 'Perfect! Hold still... ($seconds sec)';
  }

  @override
  String get donorInstruction =>
      'Hold phone behind your head to capture donor area. Hold still...';

  @override
  String get dontTiltUpOrDown => 'Hold phone straight, don\'t tilt up/down.';

  @override
  String get dontTiltSideToSide =>
      'Hold phone straight, don\'t tilt side to side.';

  @override
  String get movePhoneBack =>
      'Move phone completely to the back, must be in opposite direction.';

  @override
  String positionCorrectHoldStill(Object seconds) {
    return 'Position correct, hold still ($seconds sec)';
  }

  @override
  String get holdStill => 'Hold still.';

  @override
  String get lookStraight => 'Look straight. Keep your head level.';

  @override
  String get turnHeadRight => 'Turn your head to the right. Keep chin level.';

  @override
  String get turnHeadLeft => 'Turn your head to the left. Keep chin level.';

  @override
  String get holdPhoneFlat => 'Hold the phone flat above your head, screen up.';

  @override
  String get movePhoneBehind =>
      'Move the phone behind your head and keep it steady.';

  @override
  String get continueButton => 'Continue';

  @override
  String get firstPhotoCaptured => '1st Photo Captured';

  @override
  String get turkishTR => 'Turkish (TR)';

  @override
  String get englishEN => 'English (EN)';

  @override
  String get voiceLanguage => 'Voice Language';

  @override
  String get myMessages => 'My Messages';

  @override
  String get doctorSessionNotFound => 'Doctor session not found.';

  @override
  String get newMessage => 'New Message';

  @override
  String errorWithDetails(Object error) {
    return 'Error: $error';
  }

  @override
  String get noMessagesYet => 'No messages yet.';

  @override
  String get startNewMessageHint => 'Click + button to start a new message';

  @override
  String get doctorInfoNotFoundLoginAgain =>
      'Doctor information not found. Please log in again.';

  @override
  String get noPatientsFound => 'No patients found.';

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
    return '$minutes minuta më parë';
  }

  @override
  String get justNow => 'Taniëve';

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
  String get front => 'Ballore';

  @override
  String get right45 => 'Djathtas 45°';

  @override
  String get left45 => 'Majtas 45°';

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
    return 'Mesazhi nuk mund të dërgohet: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'Pacient';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'Ende nuk ka mesazhe';

  @override
  String get typeMessage => 'Shkruani mesazhin...';

  @override
  String get doctorPanel => 'Doctor Panel';

  @override
  String get myPatients => 'My Patients';

  @override
  String get appointments => 'Appointments';

  @override
  String get approvals => 'Approvals';

  @override
  String get messages => 'Messages';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get settings => 'Settings';

  @override
  String get sendMessage => 'Send Message';

  @override
  String get doctorInfoNotFound => 'Doctor information not found.';

  @override
  String get aiAssistantDescription =>
      'Get AI-powered answers to your medical questions';

  @override
  String get chatWithAI => 'Chat with AI';

  @override
  String get logoutDoctor => 'Log Out (Doctor)';

  @override
  String errorWithDetail(Object error) {
    return 'Error: $error';
  }

  @override
  String get noDate => 'No date';

  @override
  String get statusApproved => 'Approved';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get statusPending => 'Pending';

  @override
  String get photoReview => 'Photo Review';

  @override
  String get reviewAndApproveAnalyses => 'Review and approve analyses';

  @override
  String get pending => 'Në Pritje';

  @override
  String get noCompletedAnalyses => 'No completed analyses yet';

  @override
  String get analysesWillAppearHere =>
      'Will appear here when patients complete photo analysis';

  @override
  String get analysisProcess =>
      'Analysis process:\n• Patient takes photo\n• AI analyzes it\n• Valid analyses are listed here';

  @override
  String get noApprovedPhotos => 'No approved photos yet';

  @override
  String get approvedPhotosWillAppearHere =>
      'Photos you approved will appear here';

  @override
  String get photoCountSuffix => 'photos';

  @override
  String get processing => 'Processing...';

  @override
  String get photoApproved => '✅ Photo approved';

  @override
  String get approvalFailed => '❌ Approval failed';

  @override
  String get approvalPermissionDenied =>
      'Approval permission denied. Please check Firebase rules.';

  @override
  String get networkError =>
      'Network error. Please check your internet connection.';

  @override
  String get photoRejected => '❌ Photo rejected. Notification sent to patient.';

  @override
  String get rejectionFailed => '❌ Rejection failed';

  @override
  String get rejectionPermissionDenied =>
      'Rejection permission denied. Please check Firebase rules.';

  @override
  String patientAdded(String name) {
    return 'Patient added: $name';
  }

  @override
  String get allSamplePatientsAdded =>
      'All sample patients and analyses added!';

  @override
  String patientAddError(String error) {
    return 'Error adding patient: $error';
  }

  @override
  String firebasePatientListError(String error) {
    return 'Could not fetch Firebase patient list: $error';
  }

  @override
  String get analysisPhoto => 'Analysis Photo';

  @override
  String get scalpHealthGood => 'Good';

  @override
  String get recommendationContinue => 'Continue current treatment';

  @override
  String get sampleAnalysisData => 'Sample analysis data';

  @override
  String get errorPrefix => 'Error: ';

  @override
  String get errorTitle => 'Error';

  @override
  String get profileLoadError => 'Could not load profile information';

  @override
  String get profileReadPermissionDenied =>
      'Permission denied to read profile information';

  @override
  String get firebaseServiceUnavailable => 'Firebase service is unavailable';

  @override
  String get profileSaveError => 'Could not save profile information';

  @override
  String get profileSavePermissionDenied =>
      'Permission denied to save profile information';

  @override
  String saveError(String error) {
    return 'Save error: $error';
  }

  @override
  String get profileSavedSuccessfully => 'Profile saved successfully';

  @override
  String get photoUploadedSaveRequired =>
      'Photo uploaded. Please click Save button to make changes permanent.';

  @override
  String get photoUploadError => 'Photo upload error';

  @override
  String get photoUploadPermissionDenied => 'Permission denied to upload photo';

  @override
  String get photoUploadUnauthorized => 'Unauthorized to upload photo';

  @override
  String get photoUploadCancelled => 'Photo upload cancelled';

  @override
  String get doctorLoginNotFound => 'Doctor login information not found';

  @override
  String doctorIdLabel(String id) {
    return 'Doctor ID: $id';
  }

  @override
  String get patientInfoLoadError => 'Could not load patient information';

  @override
  String get analysesLoadError => 'Could not load analyses';

  @override
  String get noAnalysesFound => 'No analyses found';

  @override
  String get imageNotFound => 'Image not found';

  @override
  String get tryAgainFromPatientList =>
      'Please try again from the patient list';

  @override
  String get rememberMe => 'Keep me signed in';

  @override
  String get doctorLogin => 'Doctor Login';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get emailAndPasswordRequired =>
      'Email and password fields must be filled.';

  @override
  String googleSignInFailed(String error) {
    return 'Google sign in failed: $error';
  }

  @override
  String get invalidEmailFormat => 'Invalid email format.';

  @override
  String get accountDisabled => 'This account has been disabled.';

  @override
  String get userNotFound => 'No user found with this email address.';

  @override
  String get wrongPassword => 'Wrong password.';

  @override
  String get tooManyRequests =>
      'Too many failed login attempts. Please try again later.';

  @override
  String get loginError =>
      'An error occurred while logging in. Please try again.';

  @override
  String get emailAlreadyInUse => 'This email address has already been used.';

  @override
  String get weakPassword => 'Password must be at least 6 characters.';

  @override
  String get registrationError =>
      'An error occurred while registering. Please try again.';

  @override
  String get acceptTermsPrefix => 'By registering, you accept the ';

  @override
  String get termsOfServiceLink => 'Terms of Service';

  @override
  String get and => ' and ';

  @override
  String get privacyPolicyLink => 'Privacy Policy';

  @override
  String get acceptTermsSuffix => ' texts.';

  @override
  String get loginRequired => 'You need to sign in';

  @override
  String get noAnalysesYet => 'No Analyses Yet';

  @override
  String get goToMainPage => 'Go to the main page to make your first analysis';

  @override
  String get unknownDate => 'Datë e Panjohur';

  @override
  String get january => 'Janar';

  @override
  String get february => 'Shkurt';

  @override
  String get march => 'Mars';

  @override
  String get april => 'Prill';

  @override
  String get may => 'Maj';

  @override
  String get june => 'Qershor';

  @override
  String get july => 'Korrik';

  @override
  String get august => 'Gusht';

  @override
  String get september => 'Shtator';

  @override
  String get october => 'Tetor';

  @override
  String get november => 'Nëntor';

  @override
  String get december => 'Dhjetor';

  @override
  String get analysisCompletedShort => 'Analiza u përfundua!';

  @override
  String get retakeDialogTitle => 'Kërkohet Rimerrje';

  @override
  String get retakeDialogBody =>
      'Analiza AI tregon se këndet e mëposhtme duhet të rimerren:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'Do të dëshironit të rimerret këndi i parë i pavlefshëm?';

  @override
  String get noExistingPhotosFound => 'No existing photos found';

  @override
  String get noValidPhotosToUpload => 'No valid photos to upload found';

  @override
  String errorOccurred(String error) {
    return 'Error: $error';
  }

  @override
  String get uploadAndAnalyzeTitle => 'Upload and Analyze';

  @override
  String get loading => 'Loading...';

  @override
  String get okUnderstood => 'OK, Understood';

  @override
  String get pendingStatus => 'Pending';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get noTitle => 'No Title';

  @override
  String photoSelectAngle(String current, String total) {
    return 'Photo $current/$total - Select Angle';
  }

  @override
  String get alreadySelected => 'Already selected';

  @override
  String get importantWarning => '⚠️ IMPORTANT WARNING:';

  @override
  String get somePhotosNeedRetake => 'Some photos need to be retaken.';

  @override
  String get anglesThatNeedRetake => 'Angles that need to be retaken:';

  @override
  String userHasPhotosNote(String count) {
    return 'Note: User has $count photos uploaded. You can ask questions about photo analysis.';
  }

  @override
  String get userNoPhotosNote =>
      'Note: User has no photos yet. You can help with photo upload.';

  @override
  String get frontShort => 'Front';

  @override
  String get right45Short => 'Right 45°';

  @override
  String get left45Short => 'Left 45°';

  @override
  String get vertexShort => 'Top';

  @override
  String get donorShort => 'Back';

  @override
  String get retakeRequired => 'Retake Required';

  @override
  String get retakeButton => 'Retake';

  @override
  String get analysisWaitingDoctorApproval =>
      'Analysis is waiting for doctor approval.';

  @override
  String get orWriteAnalyze => 'Or write \"Analyze\" to start manual analysis';

  @override
  String get analysisCompletedSuccess => '✅ Analysis Completed!';

  @override
  String get detectedAnglesLabel => '📐 Detected Angles:';

  @override
  String get pastAnalyses => 'Past Analyses';

  @override
  String get noSavedAnalyses => 'Nuk ka ende analiza të ruajtura.';

  @override
  String welcomeGreeting(String name) {
    return 'Mirë se vini, $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'Duhet të hyni për të dërguar mesazhe';

  @override
  String get chatWithMyDoctor => 'Chat with my doctor';

  @override
  String get analysisSavedSuccessfully => 'Analysis saved successfully!';

  @override
  String get allPhotosAnalyzedAndSaved =>
      'All photos have been successfully analyzed and saved.';

  @override
  String get reanalyzing => 'Re-analyzing...';

  @override
  String get someAnglesNotCapturedCorrectly =>
      'Some angles were not captured correctly';

  @override
  String get photosUploadingStatus => 'Uploading photos...';

  @override
  String get temporaryRecordAndAnalysis => 'Temporary Record and Analysis';

  @override
  String get capturedPhotos => 'Captured Photos';

  @override
  String get anglesThatNeedRetakeHeader => 'Angles That Need to Be Retaken:';

  @override
  String get myAppointments => 'My Appointments';

  @override
  String get faceDetectionCapture => 'Face Detection Capture';

  @override
  String get showYourFaceToCamera => 'Please show your face to the camera';

  @override
  String cameraCouldNotStart(String error) {
    return 'Camera could not start: $error';
  }

  @override
  String get faceDetected => 'Face detected! Counting starts...';

  @override
  String get photoCapturing => 'Capturing photo...';

  @override
  String get photoCaptured => 'Photo captured!';

  @override
  String photoCouldNotCapture(String error) {
    return 'Photo could not be captured: $error';
  }

  @override
  String get photoPreparing => 'Photo preparing...';

  @override
  String get photoUploading => 'Photo uploading...';

  @override
  String get aiAnalysisInProgressStatus => 'AI analysis in progress...';

  @override
  String get resultsSaving => 'Saving results...';

  @override
  String get analysisSuccessful => 'Analysis Successful!';

  @override
  String get analyzeButton => 'Analyze';

  @override
  String get update => 'Update';

  @override
  String get confirmCancelAppointment =>
      'Are you sure you want to cancel this appointment?';

  @override
  String get cancelReasonOptional => 'Cancel Reason (optional)';

  @override
  String get cancelReasonExample => 'E.g.: Personal reasons';

  @override
  String get appointmentCancelled => 'Appointment cancelled';

  @override
  String get newAppointment => 'New Appointment';

  @override
  String get notesOptional => 'Notes (optional)';

  @override
  String get appointmentNotesHint => 'Notes about the appointment...';

  @override
  String get createAppointment => 'Create Appointment';

  @override
  String get updateAppointment => 'Update Appointment';

  @override
  String get currentDate => 'Current Date:';

  @override
  String get appointmentCreatedWaitingApproval =>
      '✅ Appointment created! Waiting for approval.';

  @override
  String errorSelectingPhoto(String error) {
    return 'An error occurred while selecting photo: $error';
  }

  @override
  String get pleaseSelectAtLeastOnePhoto => 'Please select at least one photo';

  @override
  String get noValidPhotoFound => 'No valid photo found';

  @override
  String get photosAnalyzedAndSavedSuccessfully =>
      'Photos have been successfully analyzed and saved!';

  @override
  String get allNotificationsMarkedAsRead =>
      'Të gjitha njoftimet u shënuan si të lexuara';

  @override
  String get selectNewDate => 'Select New Date';

  @override
  String get document => 'Document';

  @override
  String get defaultDocumentDescription => 'No description available';

  @override
  String get download => 'Download';

  @override
  String get viewDocument => 'View Document';

  @override
  String get contactAddress => 'Adresa';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Telefoni';

  @override
  String get contactWhatsApp => 'Konsulent WhatsApp';

  @override
  String get patientCareGuideTitle => 'Patient Care Guide';

  @override
  String get planningTab => 'Planning';

  @override
  String get operationTab => 'Operation';

  @override
  String get recoveryTab => 'Recovery';

  @override
  String get resourcesTab => 'Burime';

  @override
  String get personalizedPlanning => 'Personalized Planning';

  @override
  String get contactAndQuickSupport => 'Contact & Quick Support';

  @override
  String get preOperationPreparation => 'Pre-Operation Preparation';

  @override
  String get operationDayFlow => 'Operation Day Flow';

  @override
  String get operationDayExperience => 'Operation Day Experience';

  @override
  String get sterilizationAndHygieneStandards =>
      'Sterilization & Hygiene Standards';

  @override
  String get recoveryJourney => 'Recovery Journey';

  @override
  String get postOperationCare => 'Post-Operation Care';

  @override
  String get hairWashingProtocol => 'Hair Washing Protocol';

  @override
  String get knowledgeBase => 'Knowledge Base';

  @override
  String get frequentlyAskedQuestions => 'Frequently Asked Questions';

  @override
  String get visualGuide => 'Visual Guide';

  @override
  String get tapToSeeDetails => 'Tap to see details';

  @override
  String get connectionCannotOpen => 'Connection cannot be opened';

  @override
  String get pleaseEnterDoctorEmail => 'Please enter your doctor email';

  @override
  String get emailAndCodeRequired => 'Email and code are required';

  @override
  String get codeMustBe6Digits => 'Code must be 6 digits';

  @override
  String get codeInvalidOrExpired =>
      'Code is invalid or expired. Please check console logs.';

  @override
  String verificationFailed(String error) {
    return 'Verification failed: $error';
  }

  @override
  String get doctorLoginDescription =>
      'Enter your registered doctor email, request verification code and login.';

  @override
  String get doctorEmail => 'Doctor Email';

  @override
  String get doctorEmailHint => 'doctor@example.com';

  @override
  String get verificationCode => '6-Digit Verification Code';

  @override
  String get verificationCodeHint => '000000';

  @override
  String get sending => 'Sending...';

  @override
  String get requestCode => 'Request Code';

  @override
  String get login => 'Login';

  @override
  String get message => 'Mesazh';

  @override
  String get photo => 'Photos';

  @override
  String get patientIdNotFound => 'Patient ID not found';

  @override
  String get analyses => 'Analyses';

  @override
  String get approved => 'Approved';

  @override
  String get rejected => 'Rejected';

  @override
  String get examplePhotoFrontTitle => 'Shembull Këndi i Përparmë';

  @override
  String get examplePhotoFrontInstructions =>
      '• Shikoni drejtpërdrejt në kamerë\n• Mbani mjekrën të sheshtë, kokën drejt\n• Sytë duhet të shikojnë në kamerë\n• Fytyra duhet të jetë plotësisht e dukshme';

  @override
  String get examplePhotoRight45Title => 'Shembull Këndi i Djathtë 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• Ktheni kokën dukshëm DJATHTAS (~70–90°)\n• Mbani mjekrën të sheshtë, kokën drejt\n• Faqja e djathtë dhe tempulli duhet të jenë të dukshme\n• Shpatullat nuk duhet të lëvizin';

  @override
  String get examplePhotoLeft45Title => 'Shembull Këndi i Majtë 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• Ktheni kokën dukshëm MAJTAS (~70–90°)\n• Mbani mjekrën të sheshtë, kokën drejt\n• Faqja e majtë dhe tempulli duhet të jenë të dukshme\n• Shpatullat nuk duhet të lëvizin';

  @override
  String get examplePhotoVertexTitle => 'Shembull Këndi i Kulmit';

  @override
  String get examplePhotoVertexInstructions =>
      '• Mbani telefonin horizontalisht dhe të sheshtë\n• Ekrani duhet të jetë i kthyer lart\n• Vendosni telefonin mbi kokën tuaj\n• E gjithë lëkura e kokës duhet të jetë e dukshme';

  @override
  String get examplePhotoDonorTitle => 'Shembull Zona e Donatorit';

  @override
  String get examplePhotoDonorInstructions =>
      '• Mbani telefonin pas kokës suaj\n• Pjesa e pasme e kokës dhe qafa duhet të jenë të dukshme\n• Mbani telefonin të qetë\n• Ndriçimi duhet të jetë i mjaftueshëm';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galeria';

  @override
  String get deleteForMe => 'Fshi për mua';

  @override
  String get messageDeleted => 'Mesazhi u fshi';

  @override
  String get deleteForEveryone => 'Fshi për të gjithë';

  @override
  String get deleteMessage => 'Fshi mesazhin';

  @override
  String get deleteMessageReadWarning =>
      'Ky mesazh është lexuar nga marrësi. A dëshironi ta fshini prapë?';

  @override
  String get deleteMessageConfirm =>
      'Ky mesazh do të fshihet për të gjithë. Jeni i sigurt?';

  @override
  String get messageDeletedForEveryone => 'Mesazhi u fshi për të gjithë';

  @override
  String get userNotLoggedIn => 'Përdoruesi nuk është i kyqur';

  @override
  String get messagesLoadingError =>
      'Ndodhi një gabim gjatë ngarkimit të mesazheve';

  @override
  String get loadingMessages => 'Duke ngarkuar mesazhet...';

  @override
  String get startConversation => 'Filloni një bisedë duke dërguar një mesazh';

  @override
  String get loadOlderMessages => 'Ngarko mesazhe më të vjetra';

  @override
  String get sendPhoto => 'Dërgo foto';

  @override
  String get appointmentManagement => 'Appointment Management';

  @override
  String get pendingApproval => 'Pending Approval';

  @override
  String get cancelled => 'Cancelled';

  @override
  String photos(String count) {
    return 'Photos ($count)';
  }

  @override
  String get needLoginForAnalysis => 'Duhet të hyni për të analizuar';

  @override
  String openCaptureFlowError(String error) {
    return 'Gabim në hapjen e ekranit të kapjes: $error';
  }

  @override
  String get sessionExpired =>
      'Sesioni juaj ka skaduar. Ju lutemi hyni përsëri.';

  @override
  String get photosAnalyzedAndSaved =>
      'Fotot u analizuan dhe u ruajtën me sukses!';

  @override
  String get photoNotFoundForAnalysis => 'Nuk u gjetën foto për analizë';

  @override
  String get noValidPhotosFound => 'No valid photos found';

  @override
  String get analysisPreparing => 'Duke përgatitur fotot...';

  @override
  String get photosUploading => 'Duke ngarkuar fotot...';

  @override
  String get errorUploadingPhotos => 'An error occurred while uploading photos';

  @override
  String get geminiChecking => 'Duke kontrolluar lidhjen Gemini API...';

  @override
  String get geminiFailed =>
      'Lidhja Gemini API dështoi. Ju lutemi kontrolloni lidhjen tuaj të internetit.';

  @override
  String get aiAnalyzing => 'Duke kryer analizën AI...';

  @override
  String get someAnglesNeedRetake => 'Disa kënde duhet të rimerren...';

  @override
  String get analysisSaved => 'Analiza u ruajt me sukses!';

  @override
  String get analysisCompletedSuccessfully => 'Analiza u përfundua me sukses!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count kënde duhet të rimerren...';
  }

  @override
  String get errorDuringAnalysis => 'Gabim gjatë analizës';

  @override
  String get geminiApiError =>
      'Gabim lidhje Gemini API. Ju lutemi kontrolloni lidhjen tuaj të internetit.';

  @override
  String get firebaseError =>
      'Gabim lidhje Firebase. Ju lutemi provoni përsëri.';

  @override
  String get photoProcessingError =>
      'Gabim përpunimi fotoje. Ju lutemi provoni përsëri.';

  @override
  String get authErrorLoginAgain => 'Gabim autorizimi. Ju lutemi hyni përsëri.';

  @override
  String get analysisSuccessfulTitle => 'Analizë e Suksesshme';

  @override
  String get analysisResultsTitle => 'Rezultatet e Analizës';

  @override
  String get detailedAnalysisHeader => 'Analiza e Detajuar:';

  @override
  String get retakeRequiredAnglesHeader => 'Kënde që Kërkojnë Rimerrje:';

  @override
  String dialogError(String error) {
    return 'Gabim në hapjen e dialogut: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Baseline photo not found';

  @override
  String get noPhotosToUpdate => 'No photos to update found';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Gabim gjatë analizës: $error';
  }

  @override
  String retakeError(String error) {
    return 'Gabim gjatë rimerrjes: $error';
  }

  @override
  String get aiSupport => 'Mbështetje AI';

  @override
  String get myPhotos => 'Foto të Mia';

  @override
  String get photoAnalysisChatbot => 'Chatbot Analizë Fotosh';

  @override
  String get disableMedicationReminder => 'Çaktivizo Kujtesën e Barnave';

  @override
  String get medicationReminderDisabled =>
      'Kujtesa e përditshme e barnave është çaktivizuar';

  @override
  String get medicationTime => 'Ora e Barnave';

  @override
  String get selectMedicationReminderTime =>
      'Zgjidhni orën e kujtesës suaj të përditshme të barnave';

  @override
  String get selectMedicationTime => 'Zgjidhni Orën e Barnave';

  @override
  String medicationReminderSetAt(String time) {
    return 'Kujtesa e përditshme e barnave është vendosur për $time';
  }

  @override
  String get noDateInfo => 'No date information';

  @override
  String get invalidDate => 'Datë e pavlefshme';

  @override
  String get today => 'Sot';

  @override
  String get yesterday => 'Dje';

  @override
  String get valid => 'Valid';

  @override
  String get samePerson => 'Same person';

  @override
  String get differentPersonSuspicion => 'Different person suspicion';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get profileSettings => 'Profile Settings';

  @override
  String get specialty => 'Specialty';

  @override
  String get hairTransplantTitle => 'Transplantim Flokësh';

  @override
  String get hairTransplantSectionCount => 'Seksione';

  @override
  String get hairTransplantVideo => 'Video';

  @override
  String get hairTransplantFreeConsultation => 'Merr Konsultim Falas';

  @override
  String get hairTransplantWatchVideo => 'Shiko Videon';

  @override
  String get hairTransplantWatchVideoSubtitle => 'Kliko për të parë në YouTube';

  @override
  String get photosSavedSuccessfully => 'Photos saved successfully!';

  @override
  String errorDuringRetake(String error) {
    return 'An error occurred during retake: $error';
  }

  @override
  String errorOpeningCaptureScreen(String error) {
    return 'An error occurred while opening capture screen: $error';
  }

  @override
  String errorDuringAnalysisShort(String error) {
    return 'Gabim gjatë analizës: $error';
  }

  @override
  String get myDocuments => 'Dokumentet e Mia';

  @override
  String get loginRequiredForDocuments =>
      'Duhet të hyni për të parë dokumentet';

  @override
  String get noDocumentsYet => 'Nuk ka dokumente ende';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Ndodhi një gabim:\n$error';
  }

  @override
  String get datePending => 'Në pritje';

  @override
  String get chatSupportWelcomeMessage =>
      'Përshëndetje! Unë jam asistenti juaj i IA. Si mund t\'ju ndihmoj sot?';

  @override
  String get newChat => 'Bisedë e Re';

  @override
  String get chatSupportAiAssistantName => 'Asistent IA';

  @override
  String get historyTooltip => 'Historia';

  @override
  String get typingIndicator => 'IA po shkruan...';

  @override
  String get chatHistoryTitle => 'Historia e Bisedave';

  @override
  String get noSavedChats => 'Nuk ka biseda të ruajtura';

  @override
  String genericErrorTryAgain(String error) {
    return 'Ndodhi një gabim. Ju lutem provoni përsëri.\nGabim: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp nuk mund të hapej. Ju lutem sigurohuni që aplikacioni WhatsApp është i instaluar.';

  @override
  String whatsappOpenError(String error) {
    return 'Ndodhi një gabim gjatë hapjes së WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Ndodhi një gabim gjatë hapjes së ekranit të kapjes: $error';
  }

  @override
  String get retakeAnalyzing => 'Fotoja e ri-marrë po analizohet...';

  @override
  String get autoAnalysisOn => 'Analiza Automatike: Aktivizuar';

  @override
  String get autoAnalysisOff => 'Analiza Automatike: Çaktivizuar';

  @override
  String get clearPhotosTooltip => 'Pastro fotot';

  @override
  String get messageHintAnalyze =>
      'Shkruani mesazhin tuaj ose shkruani \"Analizo\"...';

  @override
  String get send => 'Dërgo';

  @override
  String get aiAssistantName => 'Asistent Analize IA';

  @override
  String get expertTeam => 'Ekip Ekspertësh';

  @override
  String get expertTeamDescription =>
      'Ekipi ynë përbëhet nga specialistë me përvojë në kirurgjinë e transplantimit të flokëve.';

  @override
  String get comingSoon => 'Së Shpejti';

  @override
  String get loginToSendMessage => 'Ju lutem hyni për të dërguar një mesazh';

  @override
  String get doctorEmailMissing => 'Email-i i doktorit mungon';

  @override
  String doctorNotFound(String name) {
    return 'Doktori $name nuk u gjet';
  }

  @override
  String get messagingComingSoon => 'Funksioni i mesazheve së shpejti';

  @override
  String get years => 'vjet';

  @override
  String get watchWashingVideo => 'Shiko Videon e Larjes';

  @override
  String get preCareTip1Title => 'Zgjidhni kirurgun e duhur';

  @override
  String get preCareTip1Body =>
      'Procedura Sapphire FUE kërkon një kirurg me përvojë dhe një ekip multidisciplinar. Punoni me mjekë që shpjegojnë realisht pritjet tuaja, planifikojnë operacionin nga fillimi deri në fund dhe zbatojnë protokollet Smile Hair.';

  @override
  String get preCareTip2Title => 'Ndani historinë tuaj mjekësore';

  @override
  String get preCareTip2Body =>
      'Ndani sëmundjet tuaja kronike, ilaçet e rregullta dhe alergjitë me ekipin pa fshehur asgjë. Kjo minimizon rreziqet që mund të ndodhin gjatë anestezisë dhe kirurgjisë.';

  @override
  String get preCareTip3Title => 'Holluesit e gjakut dhe procesi i miratimit';

  @override
  String get preCareTip3Body =>
      'Ndalo aspirinën ose holluesit e ngjashëm të gjakut të paktën një javë para datës së operacionit me miratimin e mjekut tuaj që shkroi ilaçin. Mund të vazhdoni përdorimin dy ditë pas procedurës.';

  @override
  String get preCareTip4Title => 'Ekrani i infeksioneve';

  @override
  String get preCareTip4Body =>
      'Mbani rezultatet e testeve tuaja për Hepatit B/C dhe HIV të përditësuara. Klinikat pa kushte të përshtatshme të sallës së operacionit nuk mund të kryejnë operacione për këto infeksione, që udhëtimi juaj të mos jetë i kotë.';

  @override
  String get preCareTip5Title => 'Shtesa dhe vitaminat';

  @override
  String get preCareTip5Body =>
      'Shtesat që përmbajnë vitaminat B dhe E rrisin gjakderdhjen; ndalojini një javë para procedurës. Nëse është e nevojshme, mjeku juaj do të planifikojë trajtime mbështetëse.';

  @override
  String get preCareTip6Title => 'Alkooli dhe duhani';

  @override
  String get preCareTip6Body =>
      'Ndalo alkoolin të paktën një javë para operacionit dhe mos e konsumo për 14 ditë pas procedurës. Qëndroni larg duhanit 12 orë para dhe për dy javë pas operacionit, pasi shqetëson qarkullimin e gjakut.';

  @override
  String get preCareTip7Title => 'Plani i bagazhit dhe rrobave';

  @override
  String get preCareTip7Body =>
      'Zgjidhni rroba me kopsa ose zinxhir për pjesën e sipërme të trupit. Rrobat me jakë të ngushtë mund të dëmtojnë transplantet. Përgatitni një çantë të madhe që mund të mbajë grupin e kujdesit të dhënë pas operacionit.';

  @override
  String get preCareTip8Title => 'Pushimi dhe higjiena';

  @override
  String get preCareTip8Body =>
      'Flejini mirë në ditën e operacionit, hani një mëngjes ushqyes dhe bëni dush para se të vini në klinikë. Lëkura e pastër e kokës zvogëlon rrezikun e infeksionit.';

  @override
  String get postCareTip1Title => 'Mbrojini transplantet';

  @override
  String get postCareTip1Body =>
      'Gjatë 7 ditëve të para, kini kujdes të mos goditni kokën kudo. Flini në shpinë duke përdorur një jastëk për qafë dhe parandaloni fërkimin e transplantave me jastëkun.';

  @override
  String get postCareTip2Title => 'Nata e parë dhe ditët e mëpasshme';

  @override
  String get postCareTip2Body =>
      'Kaluani patjetër natën e parë pas operacionit duke pushuar. Nëse duhet të dilni, përdorni një çadër që mbron nga dielli dhe shiu.';

  @override
  String get postCareTip3Title => 'Përmbajuni planit të ilaçeve';

  @override
  String get postCareTip3Body =>
      'Përdorni antibiotikë, dhimbje, antiinflamatorë dhe spërkatje Pantenol saktësisht siç është recetuar. Sigurohuni që e kuptoni recetën dhe udhëzimet e përdorimit para se të largoheni nga ekipi i klinikës.';

  @override
  String get postCareTip4Title => 'Lagështimi dhe spërkatjet';

  @override
  String get postCareTip4Body =>
      'Përdorni vetëm spërkatjen e dhënë izotonike/Pantenol deri në larjen e parë. Aplikoni krem antibiotik në zonën e dhuruesit për 5-7 ditët e para.';

  @override
  String get postCareTip5Title => 'Protokolli i larjes';

  @override
  String get postCareTip5Body =>
      'Larja e parë bëhet në klinikë 48 orë më vonë. Çdo ditë pas kësaj, aplikoni shkumën butësisht me lëvizje të prekjes, përdorni ujë të ngrohtë me presion të ulët dhe thajeni me peshqir letre.';

  @override
  String get postCareTip6Title => 'Krustat dhe humbja nga shoku';

  @override
  String get postCareTip6Body =>
      'Nga dita 10, hiqni krustat me presion të lehtë. Humbja nga shoku e përjetuar midis javëve 2-4 është normale; flokët e rinj bëhen të dukshëm nga muaji 3.';

  @override
  String get postCareTip7Title => 'Aktiviteti dhe sportet';

  @override
  String get postCareTip7Body =>
      'Mos bëni sport për dy javët e para, mund të bëni shëtitje të lehta pas 3-4 ditësh. Shmangni pishinën, saunën dhe aktivitetet që kërkojnë djersitje intensive për të paktën 1 muaj.';

  @override
  String get postCareTip8Title => 'Ankesat e rehatisë';

  @override
  String get postCareTip8Body =>
      'Nëse ka djegje ose dhimbje në zonën e dhuruesit, përdorni krem që përmban steroide me miratimin e klinikës. Aplikoni komprese të ftohta për një kohë të shkurtër për ënjtjen.';

  @override
  String get operationDayTimeline1Title => 'Akomodimi dhe transferimi';

  @override
  String get operationDayTimeline1Body =>
      'Ekipi Smile Gentle Care organizon akomodim në hotele 4-5 yje. I gjithë transporti është i planifikuar nga mbërritja në hotel deri te transfertat në klinikë.';

  @override
  String get operationDayTimeline2Title => 'Mbështetje shumëgjuhësore';

  @override
  String get operationDayTimeline2Body =>
      'Përkthyesit profesional ofrohen për pacientët nga vende të ndryshme të botës. Ju informoheni në gjuhën tuaj në çdo hap të procesit.';

  @override
  String get operationDayTimeline3Title => 'Përgatitja para operacionit';

  @override
  String get operationDayTimeline3Body =>
      'Formularët e informacionit nënshkruhen, vija juaj e flokëve vizatohet, foto merren dhe testet HIV/HBV/HCV dhe shenjat vitale kontrollohen.';

  @override
  String get operationDayTimeline4Title => 'Rrjedha e operacionit';

  @override
  String get operationDayTimeline4Body =>
      'Hapat e procedurës 6-8 orëshe: planifikimi, mbledhja e transplantave, hapja e kanaleve dhe implantimi. Mjekët tuaj ndajnë të gjithë procesin me ju.';

  @override
  String get operationDayTimeline5Title => 'Dreka dhe preferencat speciale';

  @override
  String get operationDayTimeline5Body =>
      'Menu vegjetariane, halal ose kosher përgatiten sipas kërkesës. Opsionet e TV-së inteligjente dhe muzikës janë të disponueshme në zonat e operacionit.';

  @override
  String get operationDayTimeline6Title => 'Kujdesi ditën tjetër';

  @override
  String get operationDayTimeline6Body =>
      'Vini në klinikë për ndryshim të fashave, kontroll të plagëve dhe trajnim të larjes së parë. Pas kësaj, procesi monitorohet me ndjekje fotografike digitale.';

  @override
  String get sterilizationMeasure1 =>
      'Testet ditore të rrjedhjes së vakumit kryhen për të kontrolluar integritetin e vulosjes së sterilizuesve.';

  @override
  String get sterilizationMeasure2 =>
      'Verifikimi ditor bëhet me testin Bowie-Dick për të siguruar që avulli të arrijë të gjitha sipërfaqet në mënyrë të barabartë.';

  @override
  String get sterilizationMeasure3 =>
      'Testet e larjes ultrazanore dokumentojnë që ne pastrojmë mbetjet mikro.';

  @override
  String get sterilizationMeasure4 =>
      'Testet e treguesve biologjikë kryhen çdo 15 ditë dhe raportohet që nuk ka riprodhim.';

  @override
  String get sterilizationMeasure5 =>
      'Instrumentet sterile dhe të përdorura ruhen veçmas në kuti të mbyllura; kontaminimi kryq parandalohet.';

  @override
  String get sterilizationMeasure6 =>
      'Çdo grup ndiqet me etiketa numri i autoklavës, data dhe data e skadimit.';

  @override
  String get sterilizationMeasure7 =>
      'Të gjitha proceset kryhen sipas Udhëzuesit DAS të Ministrisë së Shëndetësisë, standardeve të OBSH-së dhe AAMI ST79.';

  @override
  String get washStep1 =>
      'Mos lani flokët tuaj për 36-48 orët e para pas operacionit; prisni larjen e parë që do të bëhet në klinikë.';

  @override
  String get washStep2 =>
      'Aplikoni lotion ose shkumë si në zonën e dhuruesit ashtu edhe në atë të marrësit me majat e gishtërinjve tuaj në lëvizje të prekjes.';

  @override
  String get washStep3 =>
      'Shkumëzoni shampon dhe shpërndajeni butësisht në zonën e transplantuar me prekje vertikale; shmangni lëvizjet rrethore.';

  @override
  String get washStep4 =>
      'Përdorni ujë të ngrohtë me presion të ulët. Për 14 ditët e para, është më e sigurt të derdhni ujë me një tas në vend të kokës së dushit.';

  @override
  String get washStep5 =>
      'Thajeni zonën e transplantit duke shtypur butësisht me peshqir letre, mund të thajni zonën e dhuruesit me një peshqir normal.';

  @override
  String get washStep6 =>
      'Nëse duhet të përdorni një tharëse flokësh, përdorni atë vetëm në modalitetin e ftohtë dhe nga distanca.';

  @override
  String get faq1Question => 'Sa kohë zgjat rikuperimi?';

  @override
  String get faq1Answer =>
      'Dy javët e para janë një periudhë e ndjeshme; flokët kalojnë nëpër faza të ndryshme për 6-12 muaj. Rezultatet e dukshme shihen në muajin 6, dendësia përfundimtare në muajt 12-18.';

  @override
  String get faq2Question => 'Si duhet të jenë fashat dhe orari i gjumit?';

  @override
  String get faq2Answer =>
      'Fashat elastike mund të aplikohen për të reduktuar ënjtjen në zonën e ballit. Flini në shpinë me një jastëk për qafë në pozicion pak të ngritur për 7-10 ditët e para.';

  @override
  String get faq3Question => 'Dushi, larja dhe përdorimi i produkteve';

  @override
  String get faq3Answer =>
      'Mos lag flokët tuaj për dy ditët e para. Pas 48 orësh, lani një herë në ditë me shampo mjekësor pas larjes së parë në klinikë; mbani kohën e dushit të shkurtër, zvogëloni avullin.';

  @override
  String get faq4Question => 'Kur mund të thaj, kreh ose ngjyros flokët e mi?';

  @override
  String get faq4Answer =>
      'Vetëm tharja natyrore rekomandohet brenda muajit të parë. Mund të krehni zonën e dhuruesit por mos prekni zonën e transplantit për 2 javë. Qëndroni larg ngjyrave kimike për 6-8 javë.';

  @override
  String get faq5Question => 'Duhani, alkooli dhe ushtrimet';

  @override
  String get faq5Answer =>
      'Duhani është i ndaluar 12 orë para dhe 2 javë pas operacionit. Alkooli nuk duhet të përdoret për 14 ditët e para. Shëtitjet e lehta lejohen pas ditës 4, prisni 1 muaj për sporte të rënda.';

  @override
  String get faq6Question => 'Kapelë, dielli, udhëtimi dhe kthimi në punë';

  @override
  String get faq6Answer =>
      'Mos vishni kapelë për 10 ditët e para ose preferoni modele shumë të lirshme. Shmangni diellin direkt. Mund të ktheheni në punën e zyrës brenda 3-5 ditëve; prisni 2 javë për punë fizike. Mund të udhëtoni por mbrojini transplantet.';

  @override
  String get heroCardSubtitle1 =>
      'Ekipi Smile Hair menaxhon të gjithë procesin për ju, nga vlerësimi para operacionit deri te planifikimi i udhëtimit.';

  @override
  String get heroCardSubtitle2 =>
      'Përjetoni një përvojë të rehatshme me transferta, mbështetje përkthyesi dhe salla sterile operacioni.';

  @override
  String get heroCardSubtitle3 =>
      'Mbrojini transplantet me siguri me përdorimin e planifikuar të ilaçeve, larjen e duhur dhe kufizimet e lëvizjes.';

  @override
  String get heroCardSubtitle4 =>
      'Ndiqni të gjithë procesin me pyetje të shpeshta, imazhe dhe udhëzues dixhitalë.';

  @override
  String get imageBannerCaption1 =>
      'Aplikoni kujdes të butë me shampot dhe lotionet që ju jepen nga larja e parë.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
