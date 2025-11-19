// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Profil bearbeiten';

  @override
  String get save => 'Speichern';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get close => 'Schließen';

  @override
  String get changePhoto => 'Foto ändern';

  @override
  String get patientId => 'Patienten-ID';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get email => 'E-Mail';

  @override
  String get phone => 'Telefon';

  @override
  String get address => 'Adresse';

  @override
  String get birthDate => 'Geburtsdatum';

  @override
  String get gender => 'Geschlecht';

  @override
  String get emergencyContact => 'Notfallkontakt';

  @override
  String get saveChanges => 'Änderungen speichern';

  @override
  String get nameRequired => 'Vollständiger Name darf nicht leer sein';

  @override
  String get emailInvalid => 'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get phoneRequired => 'Telefonnummer darf nicht leer sein';

  @override
  String get addressRequired => 'Adresse darf nicht leer sein';

  @override
  String get birthDateRequired => 'Bitte wählen Sie das Geburtsdatum';

  @override
  String get profileUpdatedSuccessfully =>
      'Profilinformationen erfolgreich aktualisiert';

  @override
  String get male => 'Männlich';

  @override
  String get female => 'Weiblich';

  @override
  String get preferNotToSay => 'Möchte ich nicht angeben';

  @override
  String get currentPassword => 'Aktuelles Passwort';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get confirmNewPassword => 'Neues Passwort bestätigen';

  @override
  String get change => 'Ändern';

  @override
  String get passwordsDoNotMatch => 'Neue Passwörter stimmen nicht überein';

  @override
  String get passwordTooShort => 'Passwort muss mindestens 6 Zeichen lang sein';

  @override
  String get passwordChangedSuccessfully => 'Passwort erfolgreich geändert';

  @override
  String get currentPasswordRequired =>
      'Bitte geben Sie Ihr aktuelles Passwort ein';

  @override
  String get newPasswordRequired => 'Bitte geben Sie Ihr neues Passwort ein';

  @override
  String get photoChangeFeatureComingSoon => 'Fotoänderungsfunktion kommt bald';

  @override
  String get description => 'Beschreibung';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get viewAndManageNotifications =>
      'Benachrichtigungen anzeigen und verwalten';

  @override
  String get privacyPolicyError =>
      'Datenschutzrichtlinien-Seite konnte nicht geöffnet werden. Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String get termsOfServiceError =>
      'Nutzungsbedingungen-Seite konnte nicht geöffnet werden. Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String anErrorOccurred(String error) {
    return 'Ein Fehler ist aufgetreten: $error';
  }

  @override
  String get appDescription =>
      'Eine moderne mobile Anwendung für Haartransplantations- und Pflegedienste. Sie können analysieren, indem Sie Ihre eigenen Fotos aufnehmen, Ihren Behandlungsprozess verfolgen und mit der Klinik Kontakt aufnehmen.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. Alle Rechte vorbehalten.';

  @override
  String get emergencyContactHint => 'Name - Telefon';

  @override
  String get appointmentDetails => 'Termindetails';

  @override
  String get dateLabel => 'Datum';

  @override
  String get timeLabel => 'Zeit';

  @override
  String get doctorLabel => 'Arzt';

  @override
  String get appointmentTypeLabel => 'Termintyp';

  @override
  String get locationLabel => 'Standort';

  @override
  String get phoneLabel => 'Telefon';

  @override
  String get followUpConsultation => 'Nachsorgeberatung';

  @override
  String get cancelAppointment => 'Termin absagen';

  @override
  String get addReminder => 'Erinnerung hinzufügen';

  @override
  String get appointmentReminderSet => 'Terminerinnerung wurde festgelegt';

  @override
  String get cameraPermissionRequired =>
      'Wir können ohne Kamera-Berechtigung nicht fortfahren. Bitte erteilen Sie die Berechtigung in den Einstellungen.';

  @override
  String get sensorPermissionRequired =>
      'Die Bewegungsmelder-Berechtigung ist für Aufnahmen von oben und hinten erforderlich.';

  @override
  String get recoveryProgress => 'Erholungsfortschritt';

  @override
  String dayOfTotal(String current, String total) {
    return 'Tag $current von $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Woche $week: Heilungsphase';
  }

  @override
  String get todaysCareRoutine => 'Heutige Pflegeroutine';

  @override
  String get takeMedicationMorning => 'Medikament einnehmen (Morgen)';

  @override
  String get applyTopicalSolution => 'Topische Lösung anwenden';

  @override
  String get takeMedicationEvening => 'Medikament einnehmen (Abend)';

  @override
  String get upcomingAppointment => 'Bevorstehender Termin';

  @override
  String get nextFollowUpConsultation => 'Ihre nächste Nachsorgeberatung.';

  @override
  String get viewDetails => 'Details anzeigen';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get appointmentReminder => 'Terminerinnerung';

  @override
  String appointmentReminderMessage(String time) {
    return 'Sie haben morgen um $time einen Termin';
  }

  @override
  String hoursAgo(Object hours) {
    return 'Vor $hours Stunden';
  }

  @override
  String get medicationReminder => 'Medikamentenerinnerung';

  @override
  String get morningMedicationReminder =>
      'Vergessen Sie nicht, Ihr Morgenmedikament einzunehmen';

  @override
  String get photoReminder => 'Fotoeinnerung';

  @override
  String get weeklyProgressPhotoReminder =>
      'Vergessen Sie nicht, Ihr wöchentliches Fortschrittsfoto zu machen';

  @override
  String daysAgo(String days) {
    return 'Vor $days Tagen';
  }

  @override
  String weeksAgo(String weeks) {
    return 'Vor $weeks Wochen';
  }

  @override
  String monthsAgo(String months) {
    return 'Vor $months Monaten';
  }

  @override
  String yearsAgo(String years) {
    return 'Vor $years Jahren';
  }

  @override
  String notificationOpened(String title) {
    return '$title Benachrichtigung geöffnet';
  }

  @override
  String get appointmentCancellation => 'Terminabsage';

  @override
  String get cancelAppointmentConfirmation =>
      'Sind Sie sicher, dass Sie diesen Termin absagen möchten? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get appointmentCancelledSuccessfully => 'Termin erfolgreich abgesagt';

  @override
  String get everyDay => 'Jeden Tag';

  @override
  String get weekends => 'Wochenenden';

  @override
  String get weekdays => 'Wochentage';

  @override
  String get mondayShort => 'Mo';

  @override
  String get tuesdayShort => 'Di';

  @override
  String get wednesdayShort => 'Mi';

  @override
  String get thursdayShort => 'Do';

  @override
  String get fridayShort => 'Fr';

  @override
  String get saturdayShort => 'Sa';

  @override
  String get sundayShort => 'So';

  @override
  String get titleCannotBeEmpty => 'Titel darf nicht leer sein';

  @override
  String get messageCannotBeEmpty => 'Nachricht darf nicht leer sein';

  @override
  String get pleaseEnterValidEmail =>
      'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get selectAtLeastOneDay => 'Bitte wählen Sie mindestens einen Tag';

  @override
  String get dailyEmailScheduled => 'Tägliche E-Mail wurde geplant';

  @override
  String deleteTaskConfirmation(String title) {
    return 'Sind Sie sicher, dass Sie die Aufgabe \"$title\" löschen möchten?';
  }

  @override
  String get taskDeleted => 'Aufgabe gelöscht';

  @override
  String get deleteTask => 'Aufgabe löschen';

  @override
  String get newScheduledEmail => 'Neue geplante E-Mail';

  @override
  String get createDailyEmailTasks => 'Tägliche E-Mail-Aufgaben erstellen';

  @override
  String get titleLabel => 'Titel';

  @override
  String get messageLabel => 'Ihre Nachricht';

  @override
  String get recipientNameLabel => 'Empfängername';

  @override
  String get delete => 'Löschen';

  @override
  String get daysLabel => 'Tage';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'Eine der führenden Kliniken in Istanbul, spezialisiert auf Haartransplantation.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic ist eine der führenden Kliniken in Istanbul, spezialisiert auf Haartransplantation. Unter der Leitung der international anerkannten Dr. Gökay Bilgin und Dr. Mehmet Erdoğan steht die Patientenzufriedenheit bei Smile Hair Clinic immer im Vordergrund.';

  @override
  String get clinicAboutDescription2 =>
      'Alle operativen Prozesse werden persönlich von Ärzten verfolgt, und jedes Teammitglied besteht aus Fachleuten mit medizinischer Ausbildung. Bisher wurden erfolgreiche Haartransplantationsverfahren bei zahlreichen Patienten aus aller Welt durchgeführt.';

  @override
  String get clinicEthicsDescription =>
      'Als Smile Hair Clinic dienen wir gemäß unseren Grundsätzen des Respekts für Patientenrechte, Transparenz, Ehrlichkeit und Professionalität. Wir handeln in Übereinstimmung mit ethischen Regeln in allen Behandlungsprozessen, schützen die Vertraulichkeit der Patienten und streben an, den höchsten Qualitätsservice zu bieten.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic wurde in verschiedenen Medien für ihre erfolgreichen Ergebnisse und Patientenzufriedenheit vorgestellt. Sie hat auf internationalen Haartransplantationskonferenzen präsentiert und war ein Pionier auf diesem Gebiet.';

  @override
  String get mediaOutlets => 'Medien, in denen wir vorgestellt wurden:';

  @override
  String get clinicFoundingPartner =>
      'ist ein Gründungspartner der Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'arbeitet bei Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'ist ein erfahrener Arzt, der bei Smile Hair Clinic arbeitet und die Patientenzufriedenheit priorisiert.';

  @override
  String get viewFaqPage => 'FAQ-Seite anzeigen';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Istanbul';

  @override
  String get chatWelcomeMessage =>
      'Willkommen! Wie können wir Ihnen heute helfen? Unser Team antwortet normalerweise innerhalb einer Stunde.';

  @override
  String get chatSampleMessage =>
      'Hallo, ich möchte etwas zu meinem Behandlungsplan fragen.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'vorne';

  @override
  String get backCamera => 'hinten';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Zeitachse';

  @override
  String get visibleImprovementDescription =>
      'Sichtbare Verbesserung der Dichte im Kronenbereich. Der Patient berichtet über hohe Zufriedenheit.';

  @override
  String get procedureDetails => 'Typ: FUE-Wiederherstellung\nGrafts: 2.450';

  @override
  String get scheduledEmails => 'Geplante E-Mails';

  @override
  String get noScheduledEmails => 'Keine geplanten E-Mails';

  @override
  String get sampleAppointmentDate => 'Di, 9. Nov, 10:30';

  @override
  String get sampleAppointmentDateFull => 'Dienstag, 9. November 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'Istanbul, Türkei';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Haarrestaurierung & Pflege';

  @override
  String get welcomeLogin => 'Anmelden';

  @override
  String get welcomeRegister => 'Registrieren';

  @override
  String get loginTitle => 'Willkommen zurück';

  @override
  String get loginSubtitle => 'Melden Sie sich in Ihrem Konto an';

  @override
  String get loginEmail => 'E-Mail';

  @override
  String get loginEmailHint => 'Geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get loginPassword => 'Passwort';

  @override
  String get loginPasswordHint => 'Geben Sie Ihr Passwort ein';

  @override
  String get loginForgotPassword => 'Passwort vergessen?';

  @override
  String get loginLoginButton => 'Anmelden';

  @override
  String get loginOr => 'oder';

  @override
  String get loginGoogleLogin => 'Mit Google fortfahren';

  @override
  String get loginNeedAccount => 'Noch keinen Account?';

  @override
  String get forgotPasswordTitle => 'Passwort zurücksetzen';

  @override
  String get forgotPasswordSubtitle =>
      'Gib deine registrierte E-Mail-Adresse ein. Wir senden dir einen Link zum Zurücksetzen.';

  @override
  String get forgotPasswordSendButton => 'Link senden';

  @override
  String get forgotPasswordEmailSent =>
      'Link zum Zurücksetzen wurde gesendet. Bitte prüfe deinen Posteingang.';

  @override
  String get registrationTitle => 'Konto erstellen';

  @override
  String get registrationSubtitle => 'Neues Konto erstellen';

  @override
  String get registrationName => 'Vollständiger Name';

  @override
  String get registrationNameHint => 'Geben Sie Ihren Vor- und Nachnamen ein';

  @override
  String get registrationEmail => 'E-Mail';

  @override
  String get registrationEmailHint => 'Geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get registrationPassword => 'Passwort';

  @override
  String get registrationPasswordHint => 'Erstellen Sie Ihr Passwort';

  @override
  String get registrationConfirmPassword => 'Passwort bestätigen';

  @override
  String get registrationConfirmPasswordHint =>
      'Geben Sie Ihr Passwort erneut ein';

  @override
  String get registrationTerms =>
      'Ich akzeptiere die Nutzungsbedingungen und die Datenschutzrichtlinie.';

  @override
  String get registrationRegisterButton => 'Konto erstellen';

  @override
  String get registrationAlreadyHaveAccount => 'Haben Sie bereits ein Konto?';

  @override
  String get registrationLoginLink => 'Anmelden';

  @override
  String dashboardHelloParam(String name) {
    return 'Hallo, $name';
  }

  @override
  String get dashboardHome => 'Startseite';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Analyse';

  @override
  String get dashboardMyAppointments => 'Meine Termine';

  @override
  String get dashboardResources => 'Ressourcen';

  @override
  String get dashboardCareGuide => 'Pflegeleitfaden';

  @override
  String get dashboardCareGuideSubtitle =>
      'Anweisungen zur Pflege nach der Transplantation';

  @override
  String get dashboardDefaultUserName => 'Gastbenutzer';

  @override
  String get dashboardHairTransplantTitle => 'Haartransplantation';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Jede Transplantationsmethode erkunden';

  @override
  String get dashboardOnlineConsultationTitle => 'Online-Beratung';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'Kostenlose Expertenberatung erhalten';

  @override
  String get dashboardDoctorsTitle => 'Unsere Ärzte';

  @override
  String get dashboardDoctorsSubtitle =>
      'Lernen Sie unsere Fachchirurgen kennen';

  @override
  String get dashboardAboutUsTitle => 'Über Uns';

  @override
  String get dashboardAboutUsSubtitle => 'Erfahren Sie mehr über unsere Klinik';

  @override
  String get dashboardContactTitle => 'Kontakt';

  @override
  String get dashboardContactSubtitle => 'Nehmen Sie Kontakt mit uns auf';

  @override
  String get dashboardProgressTracking => 'Fortschrittsverfolgung';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Verfolgen Sie Ihren Behandlungsfortschritt';

  @override
  String get dashboardPastAnalysesSubtitle => 'Ihre vorherigen Fotoanalysen';

  @override
  String get settingsProfile => 'Profil';

  @override
  String get settingsPreferences => 'Einstellungen';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsLanguageSubtitle => 'Wählen Sie Ihre bevorzugte Sprache';

  @override
  String get settingsDarkMode => 'Dunkler Modus';

  @override
  String get settingsDarkModeSubtitle => 'Dunkles Design aktivieren';

  @override
  String get settingsNotifications => 'Benachrichtigungen';

  @override
  String get settingsNotificationsSubtitle =>
      'Alle Benachrichtigungen aktivieren';

  @override
  String get settingsEmailNotifications => 'E-Mail-Benachrichtigungen';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'Benachrichtigungen per E-Mail erhalten';

  @override
  String get settingsPushNotifications => 'Push-Benachrichtigungen';

  @override
  String get settingsPushNotificationsSubtitle =>
      'Push-Benachrichtigungen erhalten';

  @override
  String get settingsAccount => 'Konto';

  @override
  String get settingsChangePassword => 'Passwort ändern';

  @override
  String get settingsChangePasswordSubtitle => 'Aktualisieren Sie Ihr Passwort';

  @override
  String get settingsPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Lesen Sie unsere Datenschutzrichtlinie';

  @override
  String get settingsTermsOfService => 'Nutzungsbedingungen';

  @override
  String get settingsTermsOfServiceSubtitle =>
      'Lesen Sie unsere Nutzungsbedingungen';

  @override
  String get settingsSupport => 'Support';

  @override
  String get settingsHelpSupport => 'Hilfe & Support';

  @override
  String get settingsHelpSupportSubtitle =>
      'Hilfe erhalten und Support kontaktieren';

  @override
  String get settingsAddPhone => 'Telefonnummer hinzufügen';

  @override
  String get settingsThemeMode => 'Themenmodus';

  @override
  String get settingsThemeDescriptionSystem => 'Systemeinstellungen folgen';

  @override
  String get settingsThemeDescriptionLight => 'Helles Thema';

  @override
  String get settingsThemeDescriptionDark => 'Dunkles Thema';

  @override
  String get settingsThemeDialogTitle => 'Themenmodus wählen';

  @override
  String get settingsThemeOptionSystem => 'System';

  @override
  String get settingsThemeOptionSystemSubtitle =>
      'Geräteeinstellungen anpassen';

  @override
  String get settingsThemeOptionLight => 'Hell';

  @override
  String get settingsThemeOptionLightSubtitle => 'Helles Farbthema';

  @override
  String get settingsThemeOptionDark => 'Dunkel';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Dunkles Farbthema';

  @override
  String get settingsKvkkFormTitle => 'KVKK-Antragsformular';

  @override
  String get settingsKvkkFormSubtitle =>
      'Anfrage zu Ihren persönlichen Daten einreichen';

  @override
  String get settingsGdprFormTitle => 'DSGVO-Kontaktformular';

  @override
  String get settingsGdprFormSubtitle =>
      'Informationshinweis für KVKK und DSGVO';

  @override
  String get settingsRecordsTitle => 'Meine Aufzeichnungen';

  @override
  String get settingsTreatmentHistoryTitle => 'Behandlungsverlauf';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Ihre Termine und Operationsunterlagen ansehen';

  @override
  String get settingsDocumentsTitle => 'Dokumente';

  @override
  String get settingsDocumentsSubtitle =>
      'Berichte, Rezepte und geteilte Dateien';

  @override
  String get settingsInvoicesTitle => 'Rechnungen';

  @override
  String get settingsInvoicesSubtitle => 'Zahlungen und Rechnungen verwalten';

  @override
  String get settingsSupportCenterSubtitle => '24/7 Support und Kontaktkanäle';

  @override
  String get settingsContactTitle => 'Kontakt';

  @override
  String get settingsContactSubtitle => 'Adresse, Telefon und Kontaktoptionen';

  @override
  String get settingsProfileLoginRequired =>
      'Bitte melden Sie sich an, um Ihr Profilfoto zu ändern.';

  @override
  String get settingsProfilePhotoUpdated =>
      'Ihr Profilfoto wurde aktualisiert.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Fehler beim Aktualisieren des Fotos: $error';
  }

  @override
  String get supportCenterTitle => 'Support-Center';

  @override
  String get supportCenterHeroTitle => '24/7 für Sie da';

  @override
  String get supportCenterHeroDescription =>
      'Das Support-Team von Smile Hair Clinic begleitet Sie bei jedem Schritt Ihrer Behandlungsreise.';

  @override
  String get supportCenterQuickContact => 'Schnellkontakt';

  @override
  String get supportCenterWhatsappTitle => 'Per WhatsApp chatten';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Sofort mit unserem Live-Support-Team sprechen';

  @override
  String get supportCenterCallTitle => 'Rufen Sie uns an';

  @override
  String get supportCenterEmailTitle => 'Senden Sie uns eine E-Mail';

  @override
  String get supportCenterKnowledgeBase => 'Wissenszentrum';

  @override
  String get supportCenterFaqSubtitle => 'Fragen vor und nach der Operation';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Wissensdatenbank';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Alle unsere Artikel zur Haartransplantation';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Termin- & Behandlungsunterstützung';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Informationen zu Ihrem Behandlungsplan erhalten';

  @override
  String get supportCenterMessageSectionTitle =>
      'Senden Sie uns eine Nachricht';

  @override
  String get supportCenterMessageLabel => 'Ihre Nachricht';

  @override
  String get supportCenterMessageHint =>
      'Schreiben Sie Ihre Frage oder Anfrage...';

  @override
  String get supportCenterMessageEmpty => 'Bitte schreiben Sie eine Nachricht';

  @override
  String get supportCenterMessageSuccess =>
      'Wir haben Ihre Nachricht erhalten. Wir werden uns in Kürze bei Ihnen melden.';

  @override
  String get supportCenterSendButton => 'Senden';

  @override
  String get treatmentHistoryTitle => 'Behandlungsverlauf';

  @override
  String get treatmentHistoryLoginRequired =>
      'Sie müssen sich anmelden, um diese Funktion anzuzeigen.';

  @override
  String get treatmentHistoryEmpty =>
      'Sie haben noch keine aufgezeichneten Behandlungen.';

  @override
  String get treatmentHistoryDatePending => 'Datum ausstehend';

  @override
  String get treatmentHistoryDefaultType => 'Kontrolle';

  @override
  String get treatmentHistoryDoctorPending => 'Zuzuweisen';

  @override
  String get treatmentHistoryStatusCompleted => 'Abgeschlossen';

  @override
  String get treatmentHistoryStatusCancelled => 'Storniert';

  @override
  String get treatmentHistoryStatusInProgress => 'In Bearbeitung';

  @override
  String get treatmentHistoryStatusScheduled => 'Geplant';

  @override
  String get settingsAbout => 'Über';

  @override
  String get settingsAboutSubtitle => 'App-Version und Informationen';

  @override
  String get settingsLogout => 'Abmelden';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'Premium Haarrestaurierung';

  @override
  String get clinicProfileAbout => 'Über';

  @override
  String get clinicProfileDoctors => 'Ärzte';

  @override
  String get clinicProfileGallery => 'Galerie';

  @override
  String get clinicProfileTreatments => 'Behandlungen';

  @override
  String get clinicProfileBookConsultation => 'Beratung buchen';

  @override
  String get clinicProfileAboutTitle => 'Über uns';

  @override
  String get clinicProfileEthicsTitle => 'Unsere Ethik';

  @override
  String get clinicProfilePressTitle => 'In den Medien';

  @override
  String get clinicProfileContactTitle => 'Kontaktinformationen';

  @override
  String get clinicProfileDoctorsTitle => 'Unsere Ärzte';

  @override
  String get clinicProfileGalleryTitle => 'Ergebnisgalerie';

  @override
  String get clinicProfileHairSurgeon => 'Haartransplantationschirurg';

  @override
  String get pastAnalysesTitle => 'Vergangene Analysen';

  @override
  String get faqTitle => 'Häufig gestellte Fragen';

  @override
  String get faqSubtitle => 'Für Ihre Fragen';

  @override
  String get splashTagline => 'Haartransplantations- und Ästhetikspezialist';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Automatische Aufnahme aus 5 kritischen Winkeln für Haar und Kopfhaut.\nStellen Sie sicher, dass Sie sich in einer gut beleuchteten Umgebung befinden, bevor Sie beginnen.';

  @override
  String get captureFlowStartCapture => 'Aufnahme starten';

  @override
  String get captureFlowFaceDetection =>
      'Positionieren Sie Ihr Gesicht im Rahmen und schauen Sie in die Kamera.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Position korrekt, ruhig halten ($seconds Sek)';
  }

  @override
  String get captureFlowTurnRightMore =>
      'Drehen Sie Ihren Kopf etwas mehr nach rechts.';

  @override
  String get captureFlowTooMuchRight =>
      'Sie haben etwas zu viel gedreht, passen Sie leicht nach links an.';

  @override
  String get captureFlowKeepHeadStill =>
      'Halten Sie Ihren Kopf ruhig und bewegen Sie Ihre Schultern nicht.';

  @override
  String get captureFlowTurnLeftMore =>
      'Drehen Sie Ihren Kopf etwas mehr nach links.';

  @override
  String get captureFlowTooMuchLeft =>
      'Sie haben etwas zu viel gedreht, passen Sie leicht nach rechts an.';

  @override
  String get captureFlowCaptured => 'aufgenommen';

  @override
  String get captureFlowInitializingCamera => 'Kamera wird initialisiert...';

  @override
  String get captureFlowCapturedPhotos => 'Aufgenommene Fotos';

  @override
  String get captureFlowEndSession => 'Sitzung beenden';

  @override
  String get captureFlowReviewPhotos => 'Fotos überprüfen';

  @override
  String get captureFlowPhotosCaptured => 'Fotos aufgenommen';

  @override
  String get captureFlowSelected => 'Ausgewählt';

  @override
  String get captureFlowContinueToAnalysis => 'Zur Analyse fortfahren';

  @override
  String get captureFlowNewCapture => 'Neue Aufnahme starten';

  @override
  String get captureFlowPhotosFrom5Angles => 'Fotos aus 5 Winkeln';

  @override
  String get captureStageFrontTitle => 'Vorderansicht';

  @override
  String get captureStageFrontBaseInstruction =>
      'Schauen Sie gerade in die Kamera und halten Sie Ihren Kopf still.';

  @override
  String get captureStageFrontReminder =>
      'Halten Sie Ihren Kopf gerade und schauen Sie in die Kamera.';

  @override
  String get captureStageRight45Title => 'Rechts 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Drehen Sie Ihren Kopf 45 Grad nach rechts.';

  @override
  String get captureStageRight45Reminder =>
      'Drehen Sie Ihren Kopf weiter nach rechts.';

  @override
  String get captureStageLeft45Title => 'Links 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Drehen Sie Ihren Kopf 45 Grad nach links.';

  @override
  String get captureStageLeft45Reminder =>
      'Drehen Sie Ihren Kopf weiter nach links.';

  @override
  String get captureStageVertexTitle => 'Draufsicht';

  @override
  String get captureStageVertexBaseInstruction =>
      'Halten Sie Ihr Telefon horizontal über Ihrem Kopf.';

  @override
  String get captureStageVertexReminder =>
      'Halten Sie Ihr Telefon flach über Ihrem Kopf.';

  @override
  String get captureStageDonorTitle => 'Spenderbereich';

  @override
  String get captureStageDonorBaseInstruction =>
      'Drehen Sie Ihren Kopf und halten Sie das Telefon hinter Ihrem Kopf.';

  @override
  String get captureStageDonorReminder =>
      'Halten Sie das Telefon stabil hinter Ihrem Kopf.';

  @override
  String get photoCaptureFrontView => 'Vorderansicht';

  @override
  String get photoCapturePositionHead =>
      'Positionieren Sie Ihren Kopf innerhalb der Umrisse';

  @override
  String get photoCaptureFront => 'Vorne';

  @override
  String get photoCaptureTop => 'Oben';

  @override
  String get photoCaptureLeft => 'Links';

  @override
  String get photoCaptureRight => 'Rechts';

  @override
  String get chatOnline => 'Online';

  @override
  String get chatToday => '--- Heute ---';

  @override
  String get chatMessageHint => 'Geben Sie Ihre Nachricht ein...';

  @override
  String get chatQuickRepliesAppointment => 'Termin buchen';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Mein Behandlungsplan';

  @override
  String get chatQuickRepliesFollowup => 'Nachsorge anfordern';

  @override
  String get chatQuickRepliesPriceInfo => 'Preisinformationen';

  @override
  String progressPatientIdParam(String id) {
    return 'Patienten-ID: $id';
  }

  @override
  String get progressStatistics => 'Statistiken';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Monate nach OP';
  }

  @override
  String get progressProcedureDay => 'Eingriffstag';

  @override
  String get progressInitialConsultation => 'Erstberatung';

  @override
  String get progressUploadPhoto => 'Neues Foto hochladen';

  @override
  String get analysisCaptureAndAnalyze => 'Aufnehmen und analysieren';

  @override
  String get analysisPastAnalyses => 'Vergangene Analysen';

  @override
  String get analysisAnalysisDate1 => '15. Oktober 2023';

  @override
  String get analysisAnalysisDesc1 => 'Leichte Ausdünnung im Kronenbereich';

  @override
  String get analysisAnalysisDate2 => '12. Juli 2023';

  @override
  String get analysisAnalysisDesc2 =>
      'Anzeichen von Entzündungen auf der Kopfhaut';

  @override
  String get analysisAnalysisDate3 => '5. April 2023';

  @override
  String get analysisAnalysisDesc3 => 'Allgemeine Kopfhautgesundheit ist gut';

  @override
  String get analysisAnalysisDate4 => '20. Januar 2023';

  @override
  String get analysisAnalysisDesc4 => 'Erstanalyse für Behandlung';

  @override
  String get faqQuestion1 =>
      'Wie lange dauert die Haartransplantationsprozedur?';

  @override
  String get faqAnswer1 =>
      'Die Haartransplantationsprozedur dauert typischerweise 4-8 Stunden, abhängig von der Anzahl der zu transplantierenden Grafts. Da während der Prozedur eine lokale Anästhesie verwendet wird, verspürt der Patient keine Schmerzen.';

  @override
  String get faqQuestion2 =>
      'Wann kann ich nach der Haartransplantation zum normalen Leben zurückkehren?';

  @override
  String get faqAnswer2 =>
      'Sie können 2-3 Tage nach der Haartransplantation leichte Aktivitäten ausführen. Es wird empfohlen, 2 Wochen für schwere Sport- und körperliche Aktivitäten zu warten. Die Rückkehr zur Arbeit ist normalerweise 3-5 Tage später möglich.';

  @override
  String get faqQuestion3 =>
      'Wann beginnen die transplantierten Haare zu wachsen?';

  @override
  String get faqAnswer3 =>
      'Transplantierte Haare fallen in den ersten 2-3 Wochen aus (Schockverlust). Neue Haare beginnen 3-4 Monate später zu wachsen und vollständige Ergebnisse werden innerhalb von 6-12 Monaten sichtbar.';

  @override
  String get faqQuestion4 =>
      'Ist die Haartransplantationsprozedur schmerzhaft?';

  @override
  String get faqAnswer4 =>
      'Da während der Prozedur eine lokale Anästhesie verwendet wird, werden keine Schmerzen verspürt. Es kann nach der Prozedur leichte Schmerzen geben, aber diese können mit Schmerzmitteln kontrolliert werden.';

  @override
  String get faqQuestion5 =>
      'Wie hoch ist die Erfolgsrate der Haartransplantation?';

  @override
  String get faqAnswer5 =>
      'Die Haartransplantation hat eine sehr hohe Erfolgsrate, typischerweise 95-98%. Der Erfolg hängt von der Gesundheit des Patienten, der Qualität des Spenderbereichs und der Befolgung der postoperativen Pflegeanweisungen ab.';

  @override
  String get faqQuestion6 =>
      'Können Frauen eine Haartransplantation durchführen lassen?';

  @override
  String get faqAnswer6 =>
      'Ja, Frauen können eine Haartransplantation durchführen lassen. Weiblicher Haarausfall ist häufig und kann mit Haartransplantationsverfahren behandelt werden. Eine Beratung ist erforderlich, um festzustellen, ob der Patient ein geeigneter Kandidat ist.';

  @override
  String get faqQuestion7 =>
      'Wie viele Grafts werden für eine Haartransplantation benötigt?';

  @override
  String get faqAnswer7 =>
      'Die Anzahl der benötigten Grafts hängt vom Ausmaß des Haarausfalls und der gewünschten Dichte ab. Typischerweise werden 1.500-3.000 Grafts für mäßigen Haarausfall verwendet, während 3.000-5.000 Grafts für umfangreichen Haarausfall erforderlich sein können.';

  @override
  String get faqQuestion8 =>
      'Gibt es eine Altersgrenze für die Haartransplantation?';

  @override
  String get faqAnswer8 =>
      'Es gibt keine strenge Altersgrenze, aber das Verfahren wird im Allgemeinen für Patienten über 25 Jahre empfohlen, wenn das Haarausfallmuster stabiler ist. Jeder Fall wird individuell bewertet.';

  @override
  String get faqQuestion9 =>
      'Wie lange ist die Erholungszeit nach der Haartransplantation?';

  @override
  String get faqAnswer9 =>
      'Die meisten Patienten können innerhalb von 3-5 Tagen zur Arbeit zurückkehren. Die Krusten fallen typischerweise innerhalb von 7-10 Tagen ab. Die vollständige Erholung und normale Aktivitäten können nach 2 Wochen wieder aufgenommen werden.';

  @override
  String get faqQuestion10 =>
      'Sind die Ergebnisse der Haartransplantation dauerhaft?';

  @override
  String get faqAnswer10 =>
      'Ja, das transplantierte Haar ist dauerhaft, da es aus dem Spenderbereich stammt, der genetisch resistent gegen Haarausfall ist. Das transplantierte Haar wird für den Rest Ihres Lebens natürlich weiterwachsen.';

  @override
  String get pastAnalysesListView => 'Listenansicht';

  @override
  String get pastAnalysesGridView => 'Rasteransicht';

  @override
  String get pastAnalysesDetailedView => 'Detaillierte Ansicht';

  @override
  String get pastAnalysesDensityModerate => 'Dichte: Mäßig';

  @override
  String get pastAnalysesDensityLow => 'Dichte: Niedrig';

  @override
  String get privacyPolicyTitle =>
      'Richtlinie zur Verarbeitung und zum Schutz personenbezogener Daten';

  @override
  String get privacyPolicyDocumentDate => 'Dokumentdatum:';

  @override
  String get privacyPolicyRevisionDate => 'Revisionsdatum:';

  @override
  String get privacyPolicyRevisionNumber => 'Revisionsnummer:';

  @override
  String get privacyPolicySection1 => 'I. EINLEITUNG';

  @override
  String get privacyPolicySection1A => 'A. Zweck und Geltungsbereich';

  @override
  String get privacyPolicySection1AContent =>
      'Diese Richtlinie regelt die von Smile Hair Clinic in Bezug auf den Schutz und die Verarbeitung personenbezogener Daten angenommenen Grundsätze.\n\nIm Rahmen dieser Richtlinie erläutert Smile Hair Clinic die Verarbeitungstätigkeiten personenbezogener Daten und die zum Schutz personenbezogener Daten angenommenen Systeme. Dies umfasst die Information und Gewährleistung von Transparenz für betroffene Personen, hauptsächlich einschließlich Produkt- oder Dienstleistungsempfänger, Mitarbeiter und Bewerber, potenzielle Kunden, Aktionäre, Besucher, Teilnehmer, Lieferanten und Dritte, die Festlegung und Gewährleistung von Standards im Management personenbezogener Daten; die Bestimmung und Unterstützung organisatorischer Ziele und Verpflichtungen; die Einrichtung von Kontrollmechanismen, die mit akzeptablen Risikoniveaus kompatibel sind, die Einhaltung der von internationalen Konventionen, der Verfassung, Gesetzen, Vorschriften, Verträgen und anderen Gesetzen zum Schutz personenbezogener Daten festgelegten Grundsätze und Regeln sowie die Gewährleistung des bestmöglichen Schutzes der Grundrechte und -freiheiten der betroffenen Person. Darüber hinaus deckt diese Richtlinie alle physischen und elektronischen Datenerfassungssysteme und -umgebungen ab, die zur automatischen Verarbeitung personenbezogener Daten und personenbezogener Daten besonderer Kategorien oder als Teil eines Datenerfassungssystems auf nichtautomatische Weise verwendet werden.';

  @override
  String get privacyPolicySection1B => 'B. Definitionen';

  @override
  String get photoAnalysisTitle => 'Fotoanalyse';

  @override
  String photosUploadedCount(String count) {
    return '$count Fotos hochgeladen';
  }

  @override
  String get autoAnalysisStarting =>
      '5 Fotos hochgeladen. Automatische Analyse wird gestartet...';

  @override
  String stageUploaded(String stage) {
    return 'Winkel $stage hochgeladen';
  }

  @override
  String stageCaptured(String stage) {
    return 'Winkel $stage erfasst';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Fehler beim Laden des Fotos: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Fehler beim Laden mehrerer Fotos: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Fehler beim Aufnehmen des Fotos: $error';
  }

  @override
  String get imageSourceTitle => 'Fotoquelle';

  @override
  String get imageSourceCamera => 'Kamera';

  @override
  String get imageSourceGallery => 'Galerie';

  @override
  String get imageSourceMultiGallery => 'Mehrere aus Galerie auswählen';

  @override
  String get promptNoPhotosForAnalysis =>
      'Bitte laden Sie zuerst ein Foto hoch. Tippen Sie auf die Schaltfläche 📷 zum Hochladen.';

  @override
  String get analyzingPhotos => 'Ihre Fotos werden analysiert...';

  @override
  String get visualAnalysisHeader => '📸 Visuelle Analyse - Was ich sehe:';

  @override
  String get importantWarningHeader => '⚠️ WICHTIGE WARNUNG:';

  @override
  String get differentPersonsDetected =>
      'Unterschiedliche Personen wurden in den Fotos erkannt! Alle Fotos müssen derselben Person gehören.';

  @override
  String get pleaseCaptureSamePerson =>
      'Bitte nehmen Sie Fotos derselben Person aus 5 verschiedenen Winkeln auf.';

  @override
  String get detectedAnglesHeader => '🔍 Erkannte Winkel:';

  @override
  String get analysisCompleted => '✅ Analyse abgeschlossen!';

  @override
  String get allPhotosLookGood => 'Alle Fotos sehen gut aus.';

  @override
  String get savedToFirebase => '✅ Die Fotos wurden in Firebase gespeichert!';

  @override
  String analysisIdLabel(String id) {
    return 'Analyse-ID: $id';
  }

  @override
  String get savedLocationLabel =>
      'Gespeicherter Ort: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Analyseergebnis';

  @override
  String get retakeRequiredAngles => '❌ Winkel, die wiederholt werden müssen:';

  @override
  String get errorDetailsHeader => 'Fehlerdetails:';

  @override
  String get retakeTheseAnglesQuestion =>
      'Möchten Sie diese Winkel wiederholen?';

  @override
  String get retakeFirstInvalidQuestion =>
      'Möchten Sie den ersten ungültigen Winkel wiederholen?';

  @override
  String get retake => 'Wiederholen';

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
  String get uploadAndAnalyze => 'Hochladen und analysieren';

  @override
  String get captureWithFaceDetection => 'Aufnahme mit Gesichtserkennung';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'Zeit auswählen';

  @override
  String get dateNotAvailable => 'Date not available';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get enableDailyMedicationReminder =>
      'Tägliche Medikamentenerinnerung aktivieren';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Schnellzugriff';

  @override
  String get quickActions => 'Schnellaktionen';

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
  String get noUpcomingAppointments => 'Keine bevorstehenden Termine';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Kostenlose Beratung';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Vollständiger Name';

  @override
  String get fullNameHint => 'Vor- und Nachname';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Schreiben Sie Ihre Nachricht hier...';

  @override
  String get or => 'oder';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'Über Uns';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'Unsere Werte';

  @override
  String get professionalism => 'Professionalität';

  @override
  String get professionalismDescription =>
      'Unsere international zertifizierten Experten-Ärzte in ihrem Fachgebiet';

  @override
  String get patientSatisfaction => 'Patientenzufriedenheit';

  @override
  String get patientSatisfactionDescription =>
      'Die Zufriedenheit unserer Patienten hat immer Priorität';

  @override
  String get medicalEducation => 'Medizinische Bildung';

  @override
  String get medicalEducationDescription =>
      'Jedes Mitglied unseres Teams besteht aus Fachleuten mit medizinischer Ausbildung';

  @override
  String get internationalService => 'Internationaler Service';

  @override
  String get internationalServiceDescription =>
      'Wir betreuen unsere Patienten aus der ganzen Welt';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Erfolgreiche\nOperationen';

  @override
  String get patientsFromCountries => 'Patienten aus\nLändern';

  @override
  String get expertDoctors => 'Experten-\nÄrzte';

  @override
  String get patientSatisfactionRate => 'Patienten-\nzufriedenheit';

  @override
  String get experience => 'Erfahrung';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'Über';

  @override
  String get expertiseAreas => 'Fachgebiete';

  @override
  String get interview => 'Interview';

  @override
  String get contactUs => 'Kontaktieren Sie uns';

  @override
  String get call => 'Anrufen';

  @override
  String get workingHours => 'Arbeitszeiten';

  @override
  String get mondayFriday => 'Montag - Freitag';

  @override
  String get saturday => 'Samstag';

  @override
  String get sunday => 'Sonntag';

  @override
  String get closed => 'Geschlossen';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'Alle';

  @override
  String get unread => 'Ungelesen';

  @override
  String get scheduled => 'Geplant';

  @override
  String get markAllAsRead => 'Alle als gelesen markieren';

  @override
  String get noNotificationsYet => 'Noch keine Benachrichtigungen';

  @override
  String get newNotificationsWillAppearHere =>
      'Neue Benachrichtigungen werden hier erscheinen';

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
    return 'Kamera auf Gerät nicht gefunden: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'Telefon-App konnte nicht geöffnet werden. Bitte stellen Sie sicher, dass die Telefon-App auf Ihrem Gerät installiert ist.';

  @override
  String get emailAppCannotOpen =>
      'E-Mail-App konnte nicht geöffnet werden. Bitte stellen Sie sicher, dass die E-Mail-App auf Ihrem Gerät installiert ist.';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Unsere Ärzte';

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
  String get doctor => 'Arzt';

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
  String get yourDoctor => 'Ihr Arzt';

  @override
  String get appointment => 'Termin';

  @override
  String get soon => 'bald';

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
    return 'Vor $minutes Minuten';
  }

  @override
  String get justNow => 'Gerade eben';

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
  String get front => 'Vorne';

  @override
  String get right45 => 'Rechts 45°';

  @override
  String get left45 => 'Links 45°';

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
    return 'Nachricht konnte nicht gesendet werden: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'Patient';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'Noch keine Nachrichten';

  @override
  String get typeMessage => 'Nachricht eingeben...';

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
  String get pending => 'Ausstehend';

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
  String get unknownDate => 'Unbekanntes Datum';

  @override
  String get january => 'Januar';

  @override
  String get february => 'Februar';

  @override
  String get march => 'März';

  @override
  String get april => 'April';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'Dezember';

  @override
  String get analysisCompletedShort => 'Analyse abgeschlossen!';

  @override
  String get retakeDialogTitle => 'Wiederholung Erforderlich';

  @override
  String get retakeDialogBody =>
      'Die KI-Analyse zeigt an, dass die folgenden Winkel wiederholt werden müssen:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'Möchten Sie den ersten ungültigen Winkel wiederholen?';

  @override
  String get noExistingPhotosFound => 'Keine vorhandenen Fotos gefunden';

  @override
  String get noValidPhotosToUpload =>
      'Keine gültigen Fotos zum Hochladen gefunden';

  @override
  String errorOccurred(String error) {
    return 'Ein Fehler ist aufgetreten: $error';
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
  String get noSavedAnalyses => 'Noch keine gespeicherten Analysen.';

  @override
  String welcomeGreeting(String name) {
    return 'Willkommen, $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'Sie müssen sich anmelden, um Nachrichten zu senden';

  @override
  String get chatWithMyDoctor => 'Chat with my doctor';

  @override
  String get analysisSavedSuccessfully => 'Analyse erfolgreich gespeichert!';

  @override
  String get allPhotosAnalyzedAndSaved =>
      'Alle Fotos wurden erfolgreich analysiert und gespeichert.';

  @override
  String get reanalyzing => 'Re-analyzing...';

  @override
  String get someAnglesNotCapturedCorrectly =>
      'Einige Winkel wurden nicht korrekt aufgenommen';

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
      'Alle Benachrichtigungen als gelesen markiert';

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
  String get contactAddress => 'Adresse';

  @override
  String get contactEmail => 'E-Mail';

  @override
  String get contactPhone => 'Telefon';

  @override
  String get contactWhatsApp => 'WhatsApp-Berater';

  @override
  String get patientCareGuideTitle => 'Patientenpflege-Leitfaden';

  @override
  String get planningTab => 'Planung';

  @override
  String get operationTab => 'Operation';

  @override
  String get recoveryTab => 'Erholung';

  @override
  String get resourcesTab => 'Ressourcen';

  @override
  String get personalizedPlanning => 'Personalisierte Planung';

  @override
  String get contactAndQuickSupport => 'Kontakt und schneller Support';

  @override
  String get preOperationPreparation => 'Vorbereitung vor der Operation';

  @override
  String get operationDayFlow => 'Ablauf am Operationstag';

  @override
  String get operationDayExperience => 'Erfahrung am Operationstag';

  @override
  String get sterilizationAndHygieneStandards =>
      'Sterilisations- und Hygienestandards';

  @override
  String get recoveryJourney => 'Erholungsreise';

  @override
  String get postOperationCare => 'Nachsorge nach der Operation';

  @override
  String get hairWashingProtocol => 'Haarwaschprotokoll';

  @override
  String get knowledgeBase => 'Wissensdatenbank';

  @override
  String get frequentlyAskedQuestions => 'Häufig gestellte Fragen';

  @override
  String get visualGuide => 'Visueller Leitfaden';

  @override
  String get tapToSeeDetails => 'Tippen Sie, um Details zu sehen';

  @override
  String get connectionCannotOpen =>
      'Verbindung konnte nicht geöffnet werden. Bitte überprüfen Sie Ihre Internetverbindung oder stellen Sie sicher, dass die App installiert ist.';

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
  String get message => 'Nachricht';

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
  String get examplePhotoFrontTitle => 'Frontwinkel Beispiel';

  @override
  String get examplePhotoFrontInstructions =>
      '• Schauen Sie gerade in die Kamera\n• Kinn gerade, Kopf aufrecht halten\n• Augen sollten in die Kamera schauen\n• Gesicht sollte vollständig sichtbar sein';

  @override
  String get examplePhotoRight45Title => 'Rechter 45° Winkel Beispiel';

  @override
  String get examplePhotoRight45Instructions =>
      '• Drehen Sie Ihren Kopf deutlich nach RECHTS (~70–90°)\n• Kinn gerade, Kopf aufrecht halten\n• Rechte Wange und Schläfe sollten sichtbar sein\n• Schultern sollten sich nicht bewegen';

  @override
  String get examplePhotoLeft45Title => 'Linker 45° Winkel Beispiel';

  @override
  String get examplePhotoLeft45Instructions =>
      '• Drehen Sie Ihren Kopf deutlich nach LINKS (~70–90°)\n• Kinn gerade, Kopf aufrecht halten\n• Linke Wange und Schläfe sollten sichtbar sein\n• Schultern sollten sich nicht bewegen';

  @override
  String get examplePhotoVertexTitle => 'Scheitelwinkel Beispiel';

  @override
  String get examplePhotoVertexInstructions =>
      '• Halten Sie das Telefon horizontal und flach\n• Bildschirm sollte nach oben zeigen\n• Platzieren Sie das Telefon über Ihrem Kopf\n• Gesamte Kopfhaut sollte sichtbar sein';

  @override
  String get examplePhotoDonorTitle => 'Spenderbereich Beispiel';

  @override
  String get examplePhotoDonorInstructions =>
      '• Halten Sie das Telefon hinter Ihrem Kopf\n• Hinterkopf und Nacken sollten sichtbar sein\n• Halten Sie das Telefon ruhig\n• Beleuchtung sollte ausreichend sein';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galerie';

  @override
  String get deleteForMe => 'Für mich löschen';

  @override
  String get messageDeleted => 'Nachricht gelöscht';

  @override
  String get deleteForEveryone => 'Für alle löschen';

  @override
  String get deleteMessage => 'Nachricht löschen';

  @override
  String get deleteMessageReadWarning =>
      'Diese Nachricht wurde vom Empfänger gelesen. Möchten Sie sie trotzdem löschen?';

  @override
  String get deleteMessageConfirm =>
      'Diese Nachricht wird für alle gelöscht. Sind Sie sicher?';

  @override
  String get messageDeletedForEveryone => 'Nachricht für alle gelöscht';

  @override
  String get userNotLoggedIn => 'Benutzer ist nicht angemeldet';

  @override
  String get messagesLoadingError =>
      'Ein Fehler ist beim Laden der Nachrichten aufgetreten';

  @override
  String get loadingMessages => 'Nachrichten werden geladen...';

  @override
  String get startConversation =>
      'Beginnen Sie eine Unterhaltung, indem Sie eine Nachricht senden';

  @override
  String get loadOlderMessages => 'Ältere Nachrichten laden';

  @override
  String get sendPhoto => 'Foto senden';

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
  String get needLoginForAnalysis =>
      'Sie müssen sich anmelden, um zu analysieren';

  @override
  String openCaptureFlowError(String error) {
    return 'Fehler beim Öffnen des Aufnahmebildschirms: $error';
  }

  @override
  String get sessionExpired =>
      'Ihre Sitzung ist abgelaufen. Bitte melden Sie sich erneut an.';

  @override
  String get photosAnalyzedAndSaved =>
      'Fotos erfolgreich analysiert und gespeichert!';

  @override
  String get photoNotFoundForAnalysis => 'Keine Fotos für die Analyse gefunden';

  @override
  String get noValidPhotosFound => 'Keine gültigen Fotos gefunden';

  @override
  String get analysisPreparing => 'Fotos werden vorbereitet...';

  @override
  String get photosUploading => 'Fotos werden hochgeladen...';

  @override
  String get errorUploadingPhotos => 'Fehler beim Hochladen der Fotos';

  @override
  String get geminiChecking => 'Gemini-API-Verbindung wird überprüft...';

  @override
  String get geminiFailed =>
      'Gemini-API-Verbindung fehlgeschlagen. Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String get aiAnalyzing => 'KI-Analyse wird durchgeführt...';

  @override
  String get someAnglesNeedRetake =>
      'Einige Winkel müssen wiederholt werden...';

  @override
  String get analysisSaved => 'Analyse erfolgreich gespeichert!';

  @override
  String get analysisCompletedSuccessfully =>
      'Analyse erfolgreich abgeschlossen!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count Winkel müssen wiederholt werden...';
  }

  @override
  String get errorDuringAnalysis => 'Fehler während der Analyse';

  @override
  String get geminiApiError =>
      'Gemini-API-Verbindungsfehler. Bitte überprüfen Sie Ihre Internetverbindung.';

  @override
  String get firebaseError =>
      'Firebase-Verbindungsfehler. Bitte versuchen Sie es erneut.';

  @override
  String get photoProcessingError =>
      'Fotoverarbeitungsfehler. Bitte versuchen Sie es erneut.';

  @override
  String get authErrorLoginAgain =>
      'Autorisierungsfehler. Bitte melden Sie sich erneut an.';

  @override
  String get analysisSuccessfulTitle => 'Analyse Erfolgreich';

  @override
  String get analysisResultsTitle => 'Analyseergebnisse';

  @override
  String get detailedAnalysisHeader => 'Detaillierte Analyse:';

  @override
  String get retakeRequiredAnglesHeader => 'Zu wiederholende Winkel:';

  @override
  String dialogError(String error) {
    return 'Fehler beim Öffnen des Dialogs: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Basisfoto nicht gefunden';

  @override
  String get noPhotosToUpdate => 'Keine Fotos zum Aktualisieren gefunden';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Fehler während der Analyse: $error';
  }

  @override
  String retakeError(String error) {
    return 'Fehler während der Wiederholung: $error';
  }

  @override
  String get aiSupport => 'KI-Unterstützung';

  @override
  String get myPhotos => 'Meine Fotos';

  @override
  String get photoAnalysisChatbot => 'Fotoanalyse-Chatbot';

  @override
  String get disableMedicationReminder => 'Medikamentenerinnerung deaktivieren';

  @override
  String get medicationReminderDisabled =>
      'Tägliche Medikamentenerinnerung wurde deaktiviert';

  @override
  String get medicationTime => 'Medikamentenzeit';

  @override
  String get selectMedicationReminderTime =>
      'Wählen Sie Ihre tägliche Medikamentenerinnerungszeit';

  @override
  String get selectMedicationTime => 'Medikamentenzeit auswählen';

  @override
  String medicationReminderSetAt(String time) {
    return 'Tägliche Medikamentenerinnerung für $time eingestellt';
  }

  @override
  String get noDateInfo => 'Keine Datumsinformation';

  @override
  String get invalidDate => 'Ungültiges Datum';

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String get valid => 'Gültig';

  @override
  String get samePerson => 'Gleiche Person';

  @override
  String get differentPersonSuspicion => 'Verdacht auf verschiedene Person';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get profileSettings => 'Profile Settings';

  @override
  String get specialty => 'Specialty';

  @override
  String get hairTransplantTitle => 'Haartransplantation';

  @override
  String get hairTransplantSectionCount => 'Abschnitte';

  @override
  String get hairTransplantVideo => 'Video';

  @override
  String get hairTransplantFreeConsultation => 'Kostenlose Beratung erhalten';

  @override
  String get hairTransplantWatchVideo => 'Video ansehen';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Klicken Sie, um auf YouTube anzusehen';

  @override
  String get photosSavedSuccessfully => 'Fotos erfolgreich gespeichert!';

  @override
  String errorDuringRetake(String error) {
    return 'Fehler während der erneuten Aufnahme: $error';
  }

  @override
  String errorOpeningCaptureScreen(String error) {
    return 'Fehler beim Öffnen des Aufnahme-Bildschirms: $error';
  }

  @override
  String errorDuringAnalysisShort(String error) {
    return 'Fehler bei der Analyse: $error';
  }

  @override
  String get myDocuments => 'Meine Dokumente';

  @override
  String get loginRequiredForDocuments =>
      'Sie müssen sich anmelden, um Dokumente anzuzeigen';

  @override
  String get noDocumentsYet => 'Noch keine Dokumente';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Ein Fehler ist aufgetreten:\n$error';
  }

  @override
  String get datePending => 'Ausstehend';

  @override
  String get chatSupportWelcomeMessage =>
      'Hallo! Ich bin Ihr KI-Assistent. Wie kann ich Ihnen heute helfen?';

  @override
  String get newChat => 'Neuer Chat';

  @override
  String get chatSupportAiAssistantName => 'KI-Assistent';

  @override
  String get historyTooltip => 'Verlauf';

  @override
  String get typingIndicator => 'KI tippt...';

  @override
  String get chatHistoryTitle => 'Chat-Verlauf';

  @override
  String get noSavedChats => 'Keine gespeicherten Chats';

  @override
  String genericErrorTryAgain(String error) {
    return 'Ein Fehler ist aufgetreten. Bitte versuchen Sie es erneut.\nFehler: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp konnte nicht geöffnet werden. Bitte stellen Sie sicher, dass die WhatsApp-App installiert ist.';

  @override
  String whatsappOpenError(String error) {
    return 'Beim Öffnen von WhatsApp ist ein Fehler aufgetreten: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Beim Öffnen des Aufnahme-Bildschirms ist ein Fehler aufgetreten: $error';
  }

  @override
  String get retakeAnalyzing =>
      'Das erneut aufgenommene Foto wird analysiert...';

  @override
  String get autoAnalysisOn => 'Automatische Analyse: Ein';

  @override
  String get autoAnalysisOff => 'Automatische Analyse: Aus';

  @override
  String get clearPhotosTooltip => 'Fotos löschen';

  @override
  String get messageHintAnalyze =>
      'Geben Sie Ihre Nachricht ein oder schreiben Sie \"Analysieren\"...';

  @override
  String get send => 'Senden';

  @override
  String get aiAssistantName => 'KI-Analyse-Assistent';

  @override
  String get expertTeam => 'Expertenteam';

  @override
  String get expertTeamDescription =>
      'Unser Team besteht aus erfahrenen Spezialisten für Haartransplantationen.';

  @override
  String get comingSoon => 'Demnächst';

  @override
  String get loginToSendMessage =>
      'Bitte melden Sie sich an, um eine Nachricht zu senden';

  @override
  String get doctorEmailMissing => 'E-Mail-Adresse des Arztes fehlt';

  @override
  String doctorNotFound(String name) {
    return 'Arzt $name nicht gefunden';
  }

  @override
  String get messagingComingSoon => 'Messaging-Funktion kommt demnächst';

  @override
  String get years => 'Jahre';

  @override
  String get watchWashingVideo => 'Waschvideo ansehen';

  @override
  String get preCareTip1Title => 'Wählen Sie den richtigen Chirurgen';

  @override
  String get preCareTip1Body =>
      'Das Sapphire FUE-Verfahren erfordert einen erfahrenen Chirurgen und ein multidisziplinäres Team. Arbeiten Sie mit Ärzten zusammen, die Ihre Erwartungen realistisch erklären, die Operation von Anfang bis Ende planen und Smile Hair-Protokolle anwenden.';

  @override
  String get preCareTip2Title => 'Teilen Sie Ihre Krankengeschichte mit';

  @override
  String get preCareTip2Body =>
      'Teilen Sie Ihre chronischen Krankheiten, regelmäßigen Medikamente und Allergien dem Team ohne Verheimlichung mit. Dies minimiert Risiken, die während der Anästhesie und Operation auftreten können.';

  @override
  String get preCareTip3Title => 'Blutverdünner und Genehmigungsprozess';

  @override
  String get preCareTip3Body =>
      'Stellen Sie Aspirin oder ähnliche Blutverdünner mindestens eine Woche vor dem Operationstermin mit Zustimmung Ihres verschreibenden Arztes ein. Sie können die Einnahme zwei Tage nach dem Eingriff wieder aufnehmen.';

  @override
  String get preCareTip4Title => 'Infektionsscreening';

  @override
  String get preCareTip4Body =>
      'Halten Sie Ihre Hepatitis B/C- und HIV-Testergebnisse auf dem neuesten Stand. Kliniken ohne angemessene Operationssaalbedingungen können keine Operationen für diese Infektionen durchführen, damit Ihre Reise nicht umsonst ist.';

  @override
  String get preCareTip5Title => 'Ergänzungsmittel und Vitamine';

  @override
  String get preCareTip5Body =>
      'Ergänzungsmittel mit Vitamin B und E erhöhen die Blutung; stellen Sie sie eine Woche vor dem Eingriff ein. Falls erforderlich, plant Ihr Arzt unterstützende Behandlungen.';

  @override
  String get preCareTip6Title => 'Alkohol und Rauchen';

  @override
  String get preCareTip6Body =>
      'Stellen Sie Alkohol mindestens eine Woche vor der Operation ein und konsumieren Sie ihn 14 Tage nach dem Eingriff nicht. Halten Sie sich 12 Stunden vor und zwei Wochen nach der Operation vom Rauchen fern, da es die Durchblutung stört.';

  @override
  String get preCareTip7Title => 'Gepäck- und Kleidungsplan';

  @override
  String get preCareTip7Body =>
      'Wählen Sie geknöpfte oder mit Reißverschluss versehene Kleidung für Ihren Oberkörper. Eng anliegende Kleidung kann die Transplantate beschädigen. Bereiten Sie eine große Tasche vor, die das nach der Operation gegebene Pflegeset tragen kann.';

  @override
  String get preCareTip8Title => 'Ruhe und Hygiene';

  @override
  String get preCareTip8Body =>
      'Schlafen Sie am Operationstag gut, frühstücken Sie nahrhaft und duschen Sie vor dem Besuch der Klinik. Eine saubere Kopfhaut reduziert das Infektionsrisiko.';

  @override
  String get postCareTip1Title => 'Schützen Sie die Transplantate';

  @override
  String get postCareTip1Body =>
      'Achten Sie in den ersten 7 Tagen darauf, dass Sie Ihren Kopf nirgendwo anschlagen. Schlafen Sie auf dem Rücken mit einem Nackenkissen und verhindern Sie, dass die Transplantate am Kissen reiben.';

  @override
  String get postCareTip2Title => 'Erste Nacht und folgende Tage';

  @override
  String get postCareTip2Body =>
      'Verbringen Sie die erste Nacht nach der Operation unbedingt ruhend. Wenn Sie ausgehen müssen, verwenden Sie einen Regenschirm, der vor Sonne und Regen schützt.';

  @override
  String get postCareTip3Title => 'Halten Sie sich an den Medikationsplan';

  @override
  String get postCareTip3Body =>
      'Verwenden Sie Antibiotika, Schmerzmittel, Entzündungshemmer und Panthenol-Spray genau wie verschrieben. Stellen Sie sicher, dass Sie das Rezept und die Gebrauchsanweisungen verstehen, bevor Sie das Klinikteam verlassen.';

  @override
  String get postCareTip4Title => 'Befeuchtung und Sprays';

  @override
  String get postCareTip4Body =>
      'Verwenden Sie bis zum ersten Waschen nur das gegebene isotonische/Panthenol-Spray. Tragen Sie 5-7 Tage lang antibiotische Creme auf den Spenderbereich auf.';

  @override
  String get postCareTip5Title => 'Waschprotokoll';

  @override
  String get postCareTip5Body =>
      'Das erste Waschen erfolgt 48 Stunden später in der Klinik. Jeden Tag danach tragen Sie den Schaum sanft mit Tupfbewegungen auf, verwenden Sie warmes Wasser mit niedrigem Druck und trocknen Sie mit Papiertüchern.';

  @override
  String get postCareTip6Title => 'Krusten und Schockausfall';

  @override
  String get postCareTip6Body =>
      'Ab Tag 10 entfernen Sie die Krusten mit leichtem Druck. Der zwischen Woche 2-4 auftretende Schockausfall ist normal; neues Haar wird ab Monat 3 sichtbar.';

  @override
  String get postCareTip7Title => 'Aktivität und Sport';

  @override
  String get postCareTip7Body =>
      'Machen Sie in den ersten zwei Wochen keinen Sport, Sie können nach 3-4 Tagen leichte Spaziergänge machen. Vermeiden Sie Pool, Sauna und Aktivitäten, die starkes Schwitzen erfordern, mindestens 1 Monat lang.';

  @override
  String get postCareTip8Title => 'Komfortbeschwerden';

  @override
  String get postCareTip8Body =>
      'Wenn es im Spenderbereich zu Brennen oder Schmerzen kommt, verwenden Sie mit Zustimmung der Klinik eine steroidhaltige Creme. Wenden Sie für Schwellungen kurz kalte Kompressen an.';

  @override
  String get operationDayTimeline1Title => 'Unterkunft und Transfer';

  @override
  String get operationDayTimeline1Body =>
      'Das Smile Gentle Care-Team organisiert 4-5-Sterne-Hotelunterkünfte. Alle Transporte werden von der Ankunft im Hotel bis zu den Transfers zur Klinik geplant.';

  @override
  String get operationDayTimeline2Title => 'Mehrsprachige Unterstützung';

  @override
  String get operationDayTimeline2Body =>
      'Professionelle Übersetzer werden für Patienten aus verschiedenen Ländern der Welt bereitgestellt. Sie werden in Ihrer eigenen Sprache in jedem Schritt des Prozesses informiert.';

  @override
  String get operationDayTimeline3Title => 'Vorbereitung vor der Operation';

  @override
  String get operationDayTimeline3Body =>
      'Informationsformulare werden unterschrieben, Ihre Haaransatzlinie wird gezeichnet, Fotos werden gemacht und HIV/HBV/HCV-Tests sowie Vitalzeichen werden überprüft.';

  @override
  String get operationDayTimeline4Title => 'Operationsablauf';

  @override
  String get operationDayTimeline4Body =>
      'Schritte des 6-8-stündigen Eingriffs: Planung, Transplantatentnahme, Kanalöffnung und Implantation. Ihre Ärzte teilen den gesamten Prozess mit Ihnen.';

  @override
  String get operationDayTimeline5Title =>
      'Mittagessen und besondere Vorlieben';

  @override
  String get operationDayTimeline5Body =>
      'Vegetarische, halal oder koschere Menüs werden auf Anfrage zubereitet. Smart-TV und Musikoptionen sind in den Operationsbereichen verfügbar.';

  @override
  String get operationDayTimeline6Title => 'Pflege am nächsten Tag';

  @override
  String get operationDayTimeline6Body =>
      'Sie kommen zur Klinik für Verbandswechsel, Wundkontrolle und erstes Waschtraining. Danach wird der Prozess mit digitaler Fotoverfolgung überwacht.';

  @override
  String get sterilizationMeasure1 =>
      'Täglich werden Vakuumlecktests durchgeführt, um die Dichtheit der Sterilisatoren zu überprüfen.';

  @override
  String get sterilizationMeasure2 =>
      'Täglich wird mit dem Bowie-Dick-Test überprüft, ob der Dampf alle Oberflächen gleichmäßig erreicht.';

  @override
  String get sterilizationMeasure3 =>
      'Ultraschallwaschtests dokumentieren, dass wir Mikrorückstände reinigen.';

  @override
  String get sterilizationMeasure4 =>
      'Alle 15 Tage werden biologische Indikatortests durchgeführt und gemeldet, dass keine Vermehrung stattgefunden hat.';

  @override
  String get sterilizationMeasure5 =>
      'Sterile und gebrauchte Instrumente werden getrennt in verschlossenen Kästen aufbewahrt; Kreuzkontamination wird verhindert.';

  @override
  String get sterilizationMeasure6 =>
      'Jeder Satz wird mit Autoklavnummer, Datum und Ablaufdatum-Etiketten verfolgt.';

  @override
  String get sterilizationMeasure7 =>
      'Alle Prozesse werden gemäß dem Leitfaden des Gesundheitsministeriums DAS, WHO und AAMI ST79-Standards durchgeführt.';

  @override
  String get washStep1 =>
      'Waschen Sie Ihr Haar in den ersten 36-48 Stunden nach der Operation nicht; warten Sie auf das erste Waschen in der Klinik.';

  @override
  String get washStep2 =>
      'Tragen Sie Lotion oder Schaum mit Ihren Fingerspitzen in Tupfbewegungen sowohl auf den Spender- als auch auf den Empfängerbereich auf.';

  @override
  String get washStep3 =>
      'Schaumen Sie das Shampoo auf und verteilen Sie es sanft mit vertikalen Berührungen auf dem transplantierten Bereich; vermeiden Sie kreisförmige Bewegungen.';

  @override
  String get washStep4 =>
      'Verwenden Sie warmes Wasser mit niedrigem Druck. In den ersten 14 Tagen ist es sicherer, Wasser mit einer Schüssel statt mit einem Duschkopf zu gießen.';

  @override
  String get washStep5 =>
      'Trocknen Sie den Transplantatbereich, indem Sie sanft mit Papiertüchern drücken, Sie können den Spenderbereich mit einem normalen Handtuch trocknen.';

  @override
  String get washStep6 =>
      'Wenn Sie einen Haartrockner verwenden müssen, verwenden Sie ihn nur im Kaltluftmodus und aus der Ferne.';

  @override
  String get faq1Question => 'Wie lange dauert die Genesung?';

  @override
  String get faq1Answer =>
      'Die ersten zwei Wochen sind eine sensible Phase; das Haar durchläuft verschiedene Stadien für 6-12 Monate. Signifikante Ergebnisse werden im Monat 6 gesehen, die endgültige Dichte in den Monaten 12-18.';

  @override
  String get faq2Question => 'Wie sollten Verband und Schlafplan sein?';

  @override
  String get faq2Answer =>
      'Elastischer Verband kann angewendet werden, um Schwellungen im Stirnbereich zu reduzieren. Schlafen Sie in den ersten 7-10 Tagen auf dem Rücken mit einem Nackenkissen in leicht erhöhter Position.';

  @override
  String get faq3Question => 'Dusche, Waschen und Produktverwendung';

  @override
  String get faq3Answer =>
      'Befeuchten Sie Ihr Haar in den ersten zwei Tagen nicht. Nach 48 Stunden waschen Sie einmal täglich mit medizinischem Shampoo nach dem ersten Waschen in der Klinik; halten Sie die Duschzeit kurz, reduzieren Sie den Dampf.';

  @override
  String get faq4Question =>
      'Wann kann ich mein Haar trocknen, kämmen oder färben?';

  @override
  String get faq4Answer =>
      'Im ersten Monat wird nur natürliches Trocknen empfohlen. Sie können den Spenderbereich kämmen, aber berühren Sie den Transplantatbereich 2 Wochen lang nicht. Halten Sie sich 6-8 Wochen von chemischen Farben fern.';

  @override
  String get faq5Question => 'Rauchen, Alkohol und Bewegung';

  @override
  String get faq5Answer =>
      'Rauchen ist 12 Stunden vor und 2 Wochen nach der Operation verboten. Alkohol sollte in den ersten 14 Tagen nicht verwendet werden. Leichte Spaziergänge sind nach Tag 4 erlaubt, warten Sie 1 Monat auf schwere Sportarten.';

  @override
  String get faq6Question => 'Hut, Sonne, Reisen und Rückkehr zur Arbeit';

  @override
  String get faq6Answer =>
      'Tragen Sie in den ersten 10 Tagen keinen Hut oder bevorzugen Sie sehr lockere Modelle. Vermeiden Sie direkte Sonne. Sie können innerhalb von 3-5 Tagen zur Büroarbeit zurückkehren; warten Sie 2 Wochen auf körperliche Arbeit. Sie können reisen, aber schützen Sie die Transplantate.';

  @override
  String get heroCardSubtitle1 =>
      'Das Smile Hair-Team verwaltet den gesamten Prozess für Sie, von der Voroperationsevaluierung bis zur Reiseplanung.';

  @override
  String get heroCardSubtitle2 =>
      'Erleben Sie ein komfortables Erlebnis mit Transfers, Übersetzerunterstützung und sterilen Operationssälen.';

  @override
  String get heroCardSubtitle3 =>
      'Schützen Sie Transplantate sicher mit geplanter Medikamenteneinnahme, richtigem Waschen und Bewegungsbeschränkungen.';

  @override
  String get heroCardSubtitle4 =>
      'Verfolgen Sie den gesamten Prozess mit häufig gestellten Fragen, Bildern und digitalen Leitfäden.';

  @override
  String get imageBannerCaption1 =>
      'Wenden Sie sanfte Pflege mit den Shampoos und Lotionen an, die Ihnen ab dem ersten Waschen gegeben werden.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
