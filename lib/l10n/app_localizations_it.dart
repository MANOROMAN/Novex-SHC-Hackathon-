// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Modifica Profilo';

  @override
  String get save => 'Salva';

  @override
  String get cancel => 'Annulla';

  @override
  String get close => 'Chiudi';

  @override
  String get changePhoto => 'Cambia Foto';

  @override
  String get patientId => 'ID Paziente';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get email => 'E-mail';

  @override
  String get phone => 'Telefono';

  @override
  String get address => 'Indirizzo';

  @override
  String get birthDate => 'Data di Nascita';

  @override
  String get gender => 'Genere';

  @override
  String get emergencyContact => 'Contatto di Emergenza';

  @override
  String get saveChanges => 'Salva Modifiche';

  @override
  String get nameRequired => 'Il nome completo non può essere vuoto';

  @override
  String get emailInvalid => 'Inserisci un indirizzo e-mail valido';

  @override
  String get phoneRequired => 'Il numero di telefono non può essere vuoto';

  @override
  String get addressRequired => 'L\'indirizzo non può essere vuoto';

  @override
  String get birthDateRequired => 'Seleziona la data di nascita';

  @override
  String get profileUpdatedSuccessfully =>
      'Informazioni del profilo aggiornate con successo';

  @override
  String get male => 'Maschio';

  @override
  String get female => 'Femmina';

  @override
  String get preferNotToSay => 'Preferisco non dirlo';

  @override
  String get currentPassword => 'Password Attuale';

  @override
  String get newPassword => 'Nuova Password';

  @override
  String get confirmNewPassword => 'Conferma Nuova Password';

  @override
  String get change => 'Cambia';

  @override
  String get passwordsDoNotMatch => 'Le nuove password non corrispondono';

  @override
  String get passwordTooShort =>
      'La password deve essere di almeno 6 caratteri';

  @override
  String get passwordChangedSuccessfully => 'Password cambiata con successo';

  @override
  String get currentPasswordRequired => 'Inserisci la tua password attuale';

  @override
  String get newPasswordRequired => 'Inserisci la tua nuova password';

  @override
  String get photoChangeFeatureComingSoon =>
      'La funzione di cambio foto arriverà presto';

  @override
  String get description => 'Descrizione';

  @override
  String version(String version) {
    return 'Versione $version';
  }

  @override
  String get viewAndManageNotifications => 'Visualizza e gestisci le notifiche';

  @override
  String get privacyPolicyError =>
      'Impossibile aprire la pagina della privacy policy. Controlla la tua connessione Internet.';

  @override
  String get termsOfServiceError =>
      'Impossibile aprire la pagina dei termini di servizio. Controlla la tua connessione Internet.';

  @override
  String anErrorOccurred(String error) {
    return 'Si è verificato un errore: $error';
  }

  @override
  String get appDescription =>
      'Un\'applicazione mobile moderna progettata per servizi di trapianto di capelli e cura. Puoi analizzare scattando le tue foto, tracciare il processo di trattamento e contattare la clinica.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. Tutti i diritti riservati.';

  @override
  String get emergencyContactHint => 'Nome - Telefono';

  @override
  String get appointmentDetails => 'Dettagli Appuntamento';

  @override
  String get dateLabel => 'Data';

  @override
  String get timeLabel => 'Ora';

  @override
  String get doctorLabel => 'Dottore';

  @override
  String get appointmentTypeLabel => 'Tipo di Appuntamento';

  @override
  String get locationLabel => 'Posizione';

  @override
  String get phoneLabel => 'Telefono';

  @override
  String get followUpConsultation => 'Consultazione di Follow-up';

  @override
  String get cancelAppointment => 'Annulla Appuntamento';

  @override
  String get addReminder => 'Aggiungi Promemoria';

  @override
  String get appointmentReminderSet =>
      'Promemoria appuntamento è stato impostato';

  @override
  String get cameraPermissionRequired =>
      'Non possiamo continuare senza il permesso della fotocamera. Si prega di concedere il permesso dalle impostazioni.';

  @override
  String get sensorPermissionRequired =>
      'Il permesso del sensore di movimento è richiesto per le riprese dall\'alto e da dietro.';

  @override
  String get recoveryProgress => 'Progresso di Recupero';

  @override
  String dayOfTotal(String current, String total) {
    return 'Giorno $current di $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Settimana $week: Fase di Guarigione';
  }

  @override
  String get todaysCareRoutine => 'Routine di Cura di Oggi';

  @override
  String get takeMedicationMorning => 'Prendi il farmaco (Mattina)';

  @override
  String get applyTopicalSolution => 'Applica soluzione topica';

  @override
  String get takeMedicationEvening => 'Prendi il farmaco (Sera)';

  @override
  String get upcomingAppointment => 'Prossimo Appuntamento';

  @override
  String get nextFollowUpConsultation =>
      'La tua prossima consultazione di follow-up.';

  @override
  String get viewDetails => 'Visualizza Dettagli';

  @override
  String get notifications => 'Notifiche';

  @override
  String get appointmentReminder => 'Promemoria Appuntamento';

  @override
  String appointmentReminderMessage(String time) {
    return 'Hai un appuntamento domani alle $time';
  }

  @override
  String hoursAgo(Object hours) {
    return '$hours ore fa';
  }

  @override
  String get medicationReminder => 'Promemoria Farmaco';

  @override
  String get morningMedicationReminder =>
      'Non dimenticare di prendere il tuo farmaco del mattino';

  @override
  String get photoReminder => 'Promemoria Foto';

  @override
  String get weeklyProgressPhotoReminder =>
      'Non dimenticare di scattare la tua foto di progresso settimanale';

  @override
  String daysAgo(String days) {
    return '$days giorni fa';
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
    return 'Notifica $title aperta';
  }

  @override
  String get appointmentCancellation => 'Cancellazione Appuntamento';

  @override
  String get cancelAppointmentConfirmation =>
      'Sei sicuro di voler cancellare questo appuntamento? Questa azione non può essere annullata.';

  @override
  String get appointmentCancelledSuccessfully =>
      'Appuntamento cancellato con successo';

  @override
  String get everyDay => 'Ogni giorno';

  @override
  String get weekends => 'Weekend';

  @override
  String get weekdays => 'Giorni feriali';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mer';

  @override
  String get thursdayShort => 'Gio';

  @override
  String get fridayShort => 'Ven';

  @override
  String get saturdayShort => 'Sab';

  @override
  String get sundayShort => 'Dom';

  @override
  String get titleCannotBeEmpty => 'Il titolo non può essere vuoto';

  @override
  String get messageCannotBeEmpty => 'Il messaggio non può essere vuoto';

  @override
  String get pleaseEnterValidEmail =>
      'Si prega di inserire un indirizzo email valido';

  @override
  String get selectAtLeastOneDay => 'Si prega di selezionare almeno un giorno';

  @override
  String get dailyEmailScheduled => 'Email giornaliera è stata programmata';

  @override
  String deleteTaskConfirmation(String title) {
    return 'Sei sicuro di voler eliminare il compito \"$title\"?';
  }

  @override
  String get taskDeleted => 'Compito eliminato';

  @override
  String get deleteTask => 'Elimina Compito';

  @override
  String get newScheduledEmail => 'Nuova Email Programmata';

  @override
  String get createDailyEmailTasks => 'Crea attività e-mail giornaliere';

  @override
  String get titleLabel => 'Titolo';

  @override
  String get messageLabel => 'Il Tuo Messaggio';

  @override
  String get recipientNameLabel => 'Nome del destinatario';

  @override
  String get delete => 'Elimina';

  @override
  String get daysLabel => 'Giorni';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'Una delle principali cliniche a Istanbul, specializzata nel trapianto di capelli.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic è una delle principali cliniche a Istanbul, specializzata nel trapianto di capelli. Guidata dai riconosciuti internazionalmente Dr. Gökay Bilgin e Dr. Mehmet Erdoğan, la soddisfazione del paziente è sempre prioritaria presso Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'Tutti i processi operativi sono seguiti personalmente dai medici, e ogni membro del team è composto da professionisti con formazione medica. Ad oggi, sono stati eseguiti con successo procedure di trapianto di capelli su numerosi pazienti da tutto il mondo.';

  @override
  String get clinicEthicsDescription =>
      'Come Smile Hair Clinic, serviamo in conformità con i nostri principi di rispetto per i diritti dei pazienti, trasparenza, onestà e professionalità. Agiamo in conformità con le regole etiche in tutti i processi di trattamento, proteggiamo la riservatezza del paziente e miriamo a fornire il servizio della più alta qualità.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic è stata presentata su vari media per i suoi risultati di successo e la soddisfazione del paziente. Ha presentato a conferenze internazionali sul trapianto di capelli ed è stata un pioniere nel campo.';

  @override
  String get mediaOutlets => 'Media in cui siamo stati presentati:';

  @override
  String get clinicFoundingPartner =>
      'è un socio fondatore di Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'lavora presso Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'è un medico esperto che lavora presso Smile Hair Clinic, dando priorità alla soddisfazione del paziente.';

  @override
  String get viewFaqPage => 'Visualizza pagina FAQ';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Istanbul';

  @override
  String get chatWelcomeMessage =>
      'Benvenuto! Come possiamo aiutarti oggi? Il nostro team di solito risponde entro un\'ora.';

  @override
  String get chatSampleMessage =>
      'Ciao, vorrei fare una domanda sul mio piano di trattamento.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'anteriore';

  @override
  String get backCamera => 'posteriore';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Sequenza temporale';

  @override
  String get visibleImprovementDescription =>
      'Miglioramento visibile della densità in tutta la corona. Il paziente riferisce un\'elevata soddisfazione.';

  @override
  String get procedureDetails => 'Tipo: Restauro FUE\nInnesti: 2.450';

  @override
  String get scheduledEmails => 'E-mail pianificati';

  @override
  String get noScheduledEmails => 'Nessuna e-mail pianificata';

  @override
  String get sampleAppointmentDate => 'Mar, 9 nov, 10:30';

  @override
  String get sampleAppointmentDateFull => 'Martedì 9 novembre 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'Istanbul, Turchia';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Restauro e Cura dei Capelli';

  @override
  String get welcomeLogin => 'Accedi';

  @override
  String get welcomeRegister => 'Registrati';

  @override
  String get loginTitle => 'Bentornato';

  @override
  String get loginSubtitle => 'Accedi al tuo account';

  @override
  String get loginEmail => 'E-mail';

  @override
  String get loginEmailHint => 'Inserisci il tuo indirizzo e-mail';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginPasswordHint => 'Inserisci la tua password';

  @override
  String get loginForgotPassword => 'Hai dimenticato la password?';

  @override
  String get loginLoginButton => 'Accedi';

  @override
  String get loginOr => 'o';

  @override
  String get loginGoogleLogin => 'Continua con Google';

  @override
  String get loginNeedAccount => 'Non hai un account?';

  @override
  String get forgotPasswordTitle => 'Reimposta la password';

  @override
  String get forgotPasswordSubtitle =>
      'Inserisci la tua email registrata e ti invieremo un link per reimpostarla.';

  @override
  String get forgotPasswordSendButton => 'Invia email di reimpostazione';

  @override
  String get forgotPasswordEmailSent =>
      'Email di reimpostazione inviata. Controlla la tua casella.';

  @override
  String get registrationTitle => 'Crea il Tuo Account';

  @override
  String get registrationSubtitle => 'Crea un nuovo account';

  @override
  String get registrationName => 'Nome Completo';

  @override
  String get registrationNameHint => 'Inserisci il tuo nome e cognome';

  @override
  String get registrationEmail => 'E-mail';

  @override
  String get registrationEmailHint => 'Inserisci il tuo indirizzo e-mail';

  @override
  String get registrationPassword => 'Password';

  @override
  String get registrationPasswordHint => 'Crea la tua password';

  @override
  String get registrationConfirmPassword => 'Conferma Password';

  @override
  String get registrationConfirmPasswordHint => 'Reinserisci la tua password';

  @override
  String get registrationTerms =>
      'Accetto i Termini di Utilizzo e l\'Informativa sulla Privacy.';

  @override
  String get registrationRegisterButton => 'Crea Account';

  @override
  String get registrationAlreadyHaveAccount => 'Hai già un account?';

  @override
  String get registrationLoginLink => 'Accedi';

  @override
  String dashboardHelloParam(String name) {
    return 'Ciao, $name';
  }

  @override
  String get dashboardHome => 'Home';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Analisi';

  @override
  String get dashboardMyAppointments => 'I Miei Appuntamenti';

  @override
  String get dashboardResources => 'Risorse';

  @override
  String get dashboardCareGuide => 'Guida alla Cura';

  @override
  String get dashboardCareGuideSubtitle =>
      'Istruzioni per la cura post-trapianto';

  @override
  String get dashboardDefaultUserName => 'Utente Ospite';

  @override
  String get dashboardHairTransplantTitle => 'Trapianto di Capelli';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Esplora ogni tecnica di trapianto';

  @override
  String get dashboardOnlineConsultationTitle => 'Consulenza Online';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'Ottieni consulenza esperta gratuita';

  @override
  String get dashboardDoctorsTitle => 'I Nostri Medici';

  @override
  String get dashboardDoctorsSubtitle =>
      'Incontra i nostri chirurghi specialisti';

  @override
  String get dashboardAboutUsTitle => 'Chi Siamo';

  @override
  String get dashboardAboutUsSubtitle => 'Scopri la nostra clinica';

  @override
  String get dashboardContactTitle => 'Contatti';

  @override
  String get dashboardContactSubtitle => 'Mettiti in contatto con noi';

  @override
  String get dashboardProgressTracking => 'Monitoraggio Progressi';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Traccia il tuo progresso di trattamento';

  @override
  String get dashboardPastAnalysesSubtitle =>
      'Le tue analisi fotografiche precedenti';

  @override
  String get settingsProfile => 'Profilo';

  @override
  String get settingsPreferences => 'Preferenze';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsLanguageSubtitle => 'Seleziona la tua lingua preferita';

  @override
  String get settingsDarkMode => 'Modalità Scura';

  @override
  String get settingsDarkModeSubtitle => 'Abilita tema scuro';

  @override
  String get settingsNotifications => 'Notifiche';

  @override
  String get settingsNotificationsSubtitle => 'Abilita tutte le notifiche';

  @override
  String get settingsEmailNotifications => 'Notifiche E-mail';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'Ricevi notifiche via e-mail';

  @override
  String get settingsPushNotifications => 'Notifiche Push';

  @override
  String get settingsPushNotificationsSubtitle => 'Ricevi notifiche push';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsChangePassword => 'Cambia Password';

  @override
  String get settingsChangePasswordSubtitle => 'Aggiorna la tua password';

  @override
  String get settingsPrivacyPolicy => 'Informativa sulla Privacy';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Leggi la nostra informativa sulla privacy';

  @override
  String get settingsTermsOfService => 'Termini di Servizio';

  @override
  String get settingsTermsOfServiceSubtitle =>
      'Leggi i nostri termini di servizio';

  @override
  String get settingsSupport => 'Supporto';

  @override
  String get settingsHelpSupport => 'Aiuto e Supporto';

  @override
  String get settingsHelpSupportSubtitle =>
      'Ottieni aiuto e contatta il supporto';

  @override
  String get settingsAddPhone => 'Aggiungi numero di telefono';

  @override
  String get settingsThemeMode => 'Modalità Tema';

  @override
  String get settingsThemeDescriptionSystem =>
      'Segui le impostazioni del sistema';

  @override
  String get settingsThemeDescriptionLight => 'Tema chiaro';

  @override
  String get settingsThemeDescriptionDark => 'Tema scuro';

  @override
  String get settingsThemeDialogTitle => 'Scegli Modalità Tema';

  @override
  String get settingsThemeOptionSystem => 'Sistema';

  @override
  String get settingsThemeOptionSystemSubtitle =>
      'Abbina le impostazioni del dispositivo';

  @override
  String get settingsThemeOptionLight => 'Chiaro';

  @override
  String get settingsThemeOptionLightSubtitle => 'Tema a colori luminosi';

  @override
  String get settingsThemeOptionDark => 'Scuro';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Tema a colori scuri';

  @override
  String get settingsKvkkFormTitle => 'Modulo di Richiesta KVKK';

  @override
  String get settingsKvkkFormSubtitle =>
      'Invia una richiesta sui tuoi dati personali';

  @override
  String get settingsGdprFormTitle => 'Modulo di Contatto GDPR';

  @override
  String get settingsGdprFormSubtitle => 'Informativa per KVKK e GDPR';

  @override
  String get settingsRecordsTitle => 'I Miei Registri';

  @override
  String get settingsTreatmentHistoryTitle => 'Storico Trattamenti';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Visualizza i tuoi appuntamenti e registri chirurgici';

  @override
  String get settingsDocumentsTitle => 'Documenti';

  @override
  String get settingsDocumentsSubtitle =>
      'Relazioni, prescrizioni e file condivisi';

  @override
  String get settingsInvoicesTitle => 'Fatture';

  @override
  String get settingsInvoicesSubtitle => 'Gestisci i tuoi pagamenti e fatture';

  @override
  String get settingsSupportCenterSubtitle =>
      'Supporto e canali di contatto 24/7';

  @override
  String get settingsContactTitle => 'Contatto';

  @override
  String get settingsContactSubtitle =>
      'Indirizzo, telefono e opzioni di contatto';

  @override
  String get settingsProfileLoginRequired =>
      'Effettua l\'accesso per cambiare la tua foto profilo.';

  @override
  String get settingsProfilePhotoUpdated =>
      'La tua foto profilo è stata aggiornata.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Errore durante l\'aggiornamento della foto: $error';
  }

  @override
  String get supportCenterTitle => 'Centro Assistenza';

  @override
  String get supportCenterHeroTitle => 'Qui per te 24/7';

  @override
  String get supportCenterHeroDescription =>
      'Il team di supporto di Smile Hair Clinic è con te ad ogni passo del tuo percorso di trattamento.';

  @override
  String get supportCenterQuickContact => 'Contatto Rapido';

  @override
  String get supportCenterWhatsappTitle => 'Chatta tramite WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Parla con il nostro team di supporto dal vivo immediatamente';

  @override
  String get supportCenterCallTitle => 'Chiamaci';

  @override
  String get supportCenterEmailTitle => 'Inviaci un\'email';

  @override
  String get supportCenterKnowledgeBase => 'Centro Conoscenze';

  @override
  String get supportCenterFaqSubtitle => 'Domande prima e dopo l\'operazione';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Base di Conoscenze';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Tutti i nostri articoli sul trapianto di capelli';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Supporto Appuntamenti e Trattamenti';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Ottieni informazioni sul tuo piano di trattamento';

  @override
  String get supportCenterMessageSectionTitle => 'Inviaci un messaggio';

  @override
  String get supportCenterMessageLabel => 'Il tuo messaggio';

  @override
  String get supportCenterMessageHint => 'Scrivi la tua domanda o richiesta...';

  @override
  String get supportCenterMessageEmpty => 'Si prega di scrivere un messaggio';

  @override
  String get supportCenterMessageSuccess =>
      'Abbiamo ricevuto il tuo messaggio. Ti risponderemo a breve.';

  @override
  String get supportCenterSendButton => 'Invia';

  @override
  String get treatmentHistoryTitle => 'Storico Trattamenti';

  @override
  String get treatmentHistoryLoginRequired =>
      'Devi effettuare l\'accesso per visualizzare questa funzione.';

  @override
  String get treatmentHistoryEmpty =>
      'Non hai ancora registrato alcuno storico di trattamento.';

  @override
  String get treatmentHistoryDatePending => 'Data in sospeso';

  @override
  String get treatmentHistoryDefaultType => 'Controllo';

  @override
  String get treatmentHistoryDoctorPending => 'Da assegnare';

  @override
  String get treatmentHistoryStatusCompleted => 'Completato';

  @override
  String get treatmentHistoryStatusCancelled => 'Annullato';

  @override
  String get treatmentHistoryStatusInProgress => 'In corso';

  @override
  String get treatmentHistoryStatusScheduled => 'Programmato';

  @override
  String get settingsAbout => 'Informazioni';

  @override
  String get settingsAboutSubtitle => 'Versione e informazioni dell\'app';

  @override
  String get settingsLogout => 'Esci';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'Restauro Premium dei Capelli';

  @override
  String get clinicProfileAbout => 'Informazioni';

  @override
  String get clinicProfileDoctors => 'Medici';

  @override
  String get clinicProfileGallery => 'Galleria';

  @override
  String get clinicProfileTreatments => 'Trattamenti';

  @override
  String get clinicProfileBookConsultation => 'Prenota Consultazione';

  @override
  String get clinicProfileAboutTitle => 'Chi Siamo';

  @override
  String get clinicProfileEthicsTitle => 'La Nostra Etica';

  @override
  String get clinicProfilePressTitle => 'Nella Stampa';

  @override
  String get clinicProfileContactTitle => 'Informazioni di Contatto';

  @override
  String get clinicProfileDoctorsTitle => 'I Nostri Medici';

  @override
  String get clinicProfileGalleryTitle => 'Galleria Risultati';

  @override
  String get clinicProfileHairSurgeon => 'Chirurgo del Trapianto di Capelli';

  @override
  String get pastAnalysesTitle => 'Analisi Precedenti';

  @override
  String get faqTitle => 'Domande Frequenti';

  @override
  String get faqSubtitle => 'Per le tue domande';

  @override
  String get splashTagline => 'Specialista in Trapianto di Capelli ed Estetica';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Cattura automatica da 5 angoli critici per capelli e cuoio capelluto.\nAssicurati di essere in un ambiente ben illuminato prima di iniziare.';

  @override
  String get captureFlowStartCapture => 'Inizia Cattura';

  @override
  String get captureFlowFaceDetection =>
      'Posiziona il tuo viso nel riquadro e guarda la fotocamera.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Posizione corretta, resta fermo ($seconds sec)';
  }

  @override
  String get captureFlowTurnRightMore => 'Gira la testa un po\' più a destra.';

  @override
  String get captureFlowTooMuchRight =>
      'Hai girato troppo, aggiusta leggermente a sinistra.';

  @override
  String get captureFlowKeepHeadStill =>
      'Tieni la testa ferma e non muovere le spalle.';

  @override
  String get captureFlowTurnLeftMore => 'Gira la testa un po\' più a sinistra.';

  @override
  String get captureFlowTooMuchLeft =>
      'Hai girato troppo, aggiusta leggermente a destra.';

  @override
  String get captureFlowCaptured => 'catturato';

  @override
  String get captureFlowInitializingCamera => 'Inizializzazione fotocamera...';

  @override
  String get captureFlowCapturedPhotos => 'Foto Catturate';

  @override
  String get captureFlowEndSession => 'Termina Sessione';

  @override
  String get captureFlowReviewPhotos => 'Rivedi Foto';

  @override
  String get captureFlowPhotosCaptured => 'foto catturate';

  @override
  String get captureFlowSelected => 'Selezionato';

  @override
  String get captureFlowContinueToAnalysis => 'Continua all\'Analisi';

  @override
  String get captureFlowNewCapture => 'Inizia Nuova Cattura';

  @override
  String get captureFlowPhotosFrom5Angles => 'Foto da 5 angoli';

  @override
  String get captureStageFrontTitle => 'Vista frontale';

  @override
  String get captureStageFrontBaseInstruction =>
      'Guarda direttamente la fotocamera e tieni la testa ferma.';

  @override
  String get captureStageFrontReminder =>
      'Tieni la testa dritta e guarda la fotocamera.';

  @override
  String get captureStageRight45Title => 'Destra 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Gira la testa di 45 gradi verso destra.';

  @override
  String get captureStageRight45Reminder =>
      'Gira la testa di più verso destra.';

  @override
  String get captureStageLeft45Title => 'Sinistra 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Gira la testa di 45 gradi verso sinistra.';

  @override
  String get captureStageLeft45Reminder =>
      'Gira la testa di più verso sinistra.';

  @override
  String get captureStageVertexTitle => 'Vista dall\'alto';

  @override
  String get captureStageVertexBaseInstruction =>
      'Tieni il telefono orizzontalmente sopra la testa.';

  @override
  String get captureStageVertexReminder =>
      'Tieni il telefono piatto sopra la testa.';

  @override
  String get captureStageDonorTitle => 'Area donatrice';

  @override
  String get captureStageDonorBaseInstruction =>
      'Gira la testa e tieni il telefono dietro la testa.';

  @override
  String get captureStageDonorReminder =>
      'Tieni il telefono stabile dietro la testa.';

  @override
  String get photoCaptureFrontView => 'Vista Frontale';

  @override
  String get photoCapturePositionHead =>
      'Posiziona la testa all\'interno del contorno';

  @override
  String get photoCaptureFront => 'Fronte';

  @override
  String get photoCaptureTop => 'Sopra';

  @override
  String get photoCaptureLeft => 'Sinistra';

  @override
  String get photoCaptureRight => 'Destra';

  @override
  String get chatOnline => 'Online';

  @override
  String get chatToday => '--- Oggi ---';

  @override
  String get chatMessageHint => 'Scrivi il tuo messaggio...';

  @override
  String get chatQuickRepliesAppointment => 'Prenota appuntamento';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Il mio piano di trattamento';

  @override
  String get chatQuickRepliesFollowup => 'Richiedi follow-up';

  @override
  String get chatQuickRepliesPriceInfo => 'Informazioni sui prezzi';

  @override
  String progressPatientIdParam(String id) {
    return 'ID Paziente: $id';
  }

  @override
  String get progressStatistics => 'Statistiche';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Mesi Post-Operazione';
  }

  @override
  String get progressProcedureDay => 'Giorno della Procedura';

  @override
  String get progressInitialConsultation => 'Consultazione Iniziale';

  @override
  String get progressUploadPhoto => 'Carica Nuova Foto';

  @override
  String get analysisCaptureAndAnalyze => 'Cattura e Analizza';

  @override
  String get analysisPastAnalyses => 'Analisi Precedenti';

  @override
  String get analysisAnalysisDate1 => '15 ottobre 2023';

  @override
  String get analysisAnalysisDesc1 =>
      'Leggero diradamento nell\'area della corona';

  @override
  String get analysisAnalysisDate2 => '12 luglio 2023';

  @override
  String get analysisAnalysisDesc2 =>
      'Segni di infiammazione sul cuoio capelluto';

  @override
  String get analysisAnalysisDate3 => '5 aprile 2023';

  @override
  String get analysisAnalysisDesc3 =>
      'La salute generale del cuoio capelluto è buona';

  @override
  String get analysisAnalysisDate4 => '20 gennaio 2023';

  @override
  String get analysisAnalysisDesc4 => 'Analisi iniziale per trattamento';

  @override
  String get faqQuestion1 =>
      'Quanto dura la procedura di trapianto di capelli?';

  @override
  String get faqAnswer1 =>
      'La procedura di trapianto di capelli tipicamente richiede 4-8 ore a seconda del numero di innesti da trapiantare. Poiché viene utilizzata l\'anestesia locale durante la procedura, il paziente non sente dolore.';

  @override
  String get faqQuestion2 =>
      'Quando posso tornare alla vita normale dopo il trapianto di capelli?';

  @override
  String get faqAnswer2 =>
      'Puoi fare attività leggere 2-3 giorni dopo il trapianto di capelli. Si raccomanda di aspettare 2 settimane per sport pesanti e attività fisiche. Il ritorno al lavoro è generalmente possibile 3-5 giorni dopo.';

  @override
  String get faqQuestion3 =>
      'Quando iniziano a crescere i capelli trapiantati?';

  @override
  String get faqAnswer3 =>
      'I capelli trapiantati cadono nelle prime 2-3 settimane (perdita da shock). I nuovi capelli iniziano a crescere 3-4 mesi dopo e i risultati completi si vedono entro 6-12 mesi.';

  @override
  String get faqQuestion4 => 'La procedura di trapianto di capelli è dolorosa?';

  @override
  String get faqAnswer4 =>
      'Poiché viene utilizzata l\'anestesia locale durante la procedura, non si sente dolore. Potrebbe esserci un leggero dolore dopo la procedura, ma questo può essere controllato con antidolorifici.';

  @override
  String get faqQuestion5 =>
      'Qual è il tasso di successo del trapianto di capelli?';

  @override
  String get faqAnswer5 =>
      'Il trapianto di capelli ha un tasso di successo molto alto, tipicamente del 95-98%. Il successo dipende dalla salute del paziente, dalla qualità dell\'area donatrice e dal seguire le istruzioni di cura postoperatoria.';

  @override
  String get faqQuestion6 =>
      'Le donne possono sottoporsi a un trapianto di capelli?';

  @override
  String get faqAnswer6 =>
      'Sì, le donne possono sottoporsi a un trapianto di capelli. La caduta dei capelli di tipo femminile è comune e può essere trattata con procedure di trapianto di capelli. È necessaria una consultazione per determinare se il paziente è un candidato adatto.';

  @override
  String get faqQuestion7 =>
      'Quanti innesti sono necessari per un trapianto di capelli?';

  @override
  String get faqAnswer7 =>
      'Il numero di innesti necessari dipende dall\'estensione della caduta dei capelli e dalla densità desiderata. Tipicamente, vengono utilizzati 1.500-3.000 innesti per la caduta moderata dei capelli, mentre possono essere necessari 3.000-5.000 innesti per la caduta estesa dei capelli.';

  @override
  String get faqQuestion8 =>
      'C\'è un limite di età per il trapianto di capelli?';

  @override
  String get faqAnswer8 =>
      'Non c\'è un limite di età rigoroso, ma la procedura è generalmente raccomandata per pazienti di età superiore ai 25 anni quando il modello di caduta dei capelli è più stabile. Ogni caso viene valutato individualmente.';

  @override
  String get faqQuestion9 =>
      'Qual è il tempo di recupero dopo il trapianto di capelli?';

  @override
  String get faqAnswer9 =>
      'La maggior parte dei pazienti può tornare al lavoro entro 3-5 giorni. Le croste tipicamente cadono entro 7-10 giorni. Il recupero completo e le attività normali possono riprendere dopo 2 settimane.';

  @override
  String get faqQuestion10 =>
      'I risultati del trapianto di capelli sono permanenti?';

  @override
  String get faqAnswer10 =>
      'Sì, i capelli trapiantati sono permanenti perché sono presi dall\'area donatrice che è geneticamente resistente alla caduta dei capelli. I capelli trapiantati continueranno a crescere naturalmente per il resto della tua vita.';

  @override
  String get pastAnalysesListView => 'Vista Elenco';

  @override
  String get pastAnalysesGridView => 'Vista Griglia';

  @override
  String get pastAnalysesDetailedView => 'Vista Dettagliata';

  @override
  String get pastAnalysesDensityModerate => 'Densità: Moderata';

  @override
  String get pastAnalysesDensityLow => 'Densità: Bassa';

  @override
  String get privacyPolicyTitle =>
      'Politica di Elaborazione e Protezione dei Dati Personali';

  @override
  String get privacyPolicyDocumentDate => 'Data del Documento:';

  @override
  String get privacyPolicyRevisionDate => 'Data di Revisione:';

  @override
  String get privacyPolicyRevisionNumber => 'Numero di Revisione:';

  @override
  String get privacyPolicySection1 => 'I. INTRODUZIONE';

  @override
  String get privacyPolicySection1A => 'A. Scopo e Ambito';

  @override
  String get privacyPolicySection1AContent =>
      'Questa Politica regola i principi adottati da Smile Hair Clinic riguardo alla protezione e all\'elaborazione dei dati personali.\n\nNell\'ambito di questa Politica, Smile Hair Clinic fornisce spiegazioni riguardo alle attività di elaborazione dei dati personali e ai sistemi adottati per la protezione dei dati personali. Ciò include l\'informazione e la garanzia di trasparenza per le Persone Rilevanti, principalmente inclusi Destinatari di Prodotti o Servizi, Dipendenti e Candidati Dipendenti, Clienti Potenziali, Azionisti, Visitatori, Partecipanti, Fornitori e Terze Parti, l\'istituzione e la garanzia di standard nella gestione dei dati personali; la determinazione e il supporto di obiettivi e obblighi organizzativi; l\'istituzione di meccanismi di controllo compatibili con livelli di rischio accettabili, la conformità ai principi e alle regole stabiliti da convenzioni internazionali, la Costituzione, leggi, regolamenti, contratti e altra legislazione riguardo alla protezione dei dati personali, e la garanzia della migliore protezione dei diritti e delle libertà fondamentali della Persona Rilevante. Inoltre, questa Politica copre tutti i sistemi e gli ambienti di registrazione dati fisici ed elettronici utilizzati per elaborare dati personali e dati personali di categoria speciale automaticamente o come parte di un sistema di registrazione dati con mezzi non automatici.';

  @override
  String get privacyPolicySection1B => 'B. Definizioni';

  @override
  String get photoAnalysisTitle => 'Analisi Foto';

  @override
  String photosUploadedCount(String count) {
    return '$count foto caricate';
  }

  @override
  String get autoAnalysisStarting =>
      '5 foto caricate. Avvio dell\'analisi automatica...';

  @override
  String stageUploaded(String stage) {
    return 'Angolo $stage caricato';
  }

  @override
  String stageCaptured(String stage) {
    return 'Angolo $stage catturato';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Si è verificato un errore durante il caricamento della foto: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Si è verificato un errore durante il caricamento di più foto: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Si è verificato un errore durante l\'acquisizione della foto: $error';
  }

  @override
  String get imageSourceTitle => 'Sorgente Foto';

  @override
  String get imageSourceCamera => 'Fotocamera';

  @override
  String get imageSourceGallery => 'Galleria';

  @override
  String get imageSourceMultiGallery => 'Seleziona Multiplo dalla Galleria';

  @override
  String get promptNoPhotosForAnalysis =>
      'Carica prima una foto. Tocca il pulsante 📷 per caricare.';

  @override
  String get analyzingPhotos => 'Le tue foto sono in analisi...';

  @override
  String get visualAnalysisHeader => '📸 Analisi Visiva - Cosa Vedo:';

  @override
  String get importantWarningHeader => '⚠️ AVVISO IMPORTANTE:';

  @override
  String get differentPersonsDetected =>
      'Sono state rilevate persone diverse nelle foto! Tutte le foto devono appartenere alla stessa persona.';

  @override
  String get pleaseCaptureSamePerson =>
      'Si prega di scattare foto della stessa persona da 5 angoli diversi.';

  @override
  String get detectedAnglesHeader => '🔍 Angoli Rilevati:';

  @override
  String get analysisCompleted => '✅ Analisi Completata!';

  @override
  String get allPhotosLookGood => 'Tutte le foto sembrano adatte.';

  @override
  String get savedToFirebase => '✅ Le foto sono state salvate su Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'ID Analisi: $id';
  }

  @override
  String get savedLocationLabel =>
      'Posizione Salvata: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Risultato Analisi';

  @override
  String get retakeRequiredAngles => '❌ Angoli che devono essere riscattati:';

  @override
  String get errorDetailsHeader => 'Dettagli Errore:';

  @override
  String get retakeTheseAnglesQuestion => 'Vuoi riscattare questi angoli?';

  @override
  String get retakeFirstInvalidQuestion =>
      'Vuoi riscattare il primo angolo non valido?';

  @override
  String get retake => 'Riscatta';

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
  String get uploadAndAnalyze => 'Carica e Analizza';

  @override
  String get captureWithFaceDetection => 'Cattura con Rilevamento Volto';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'Select Time';

  @override
  String get dateNotAvailable => 'Date not available';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get enableDailyMedicationReminder =>
      'Abilita Promemoria Farmaci Giornaliero';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Accesso Rapido';

  @override
  String get quickActions => 'Azioni Rapide';

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
  String get noUpcomingAppointments => 'Nessun appuntamento in arrivo';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Consulenza Gratuita';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Nome Completo';

  @override
  String get fullNameHint => 'Nome Cognome';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Scrivi il tuo messaggio qui...';

  @override
  String get or => 'o';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'Chi Siamo';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'I Nostri Valori';

  @override
  String get professionalism => 'Professionalità';

  @override
  String get professionalismDescription =>
      'Offriamo servizi professionali con i nostri medici esperti e il nostro team qualificato.';

  @override
  String get patientSatisfaction => 'Soddisfazione del Paziente';

  @override
  String get patientSatisfactionDescription =>
      'La soddisfazione del paziente è sempre la nostra priorità principale.';

  @override
  String get medicalEducation => 'Formazione Medica';

  @override
  String get medicalEducationDescription =>
      'Tutti i membri del nostro team hanno formazione medica.';

  @override
  String get internationalService => 'Servizio Internazionale';

  @override
  String get internationalServiceDescription =>
      'Serviamo pazienti da tutto il mondo.';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Operazioni Riuscite';

  @override
  String get patientsFromCountries => 'Pazienti da Paesi';

  @override
  String get expertDoctors => 'Dottori Esperti';

  @override
  String get patientSatisfactionRate => 'Tasso di Soddisfazione del Paziente';

  @override
  String get experience => 'Esperienza';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'Informazioni';

  @override
  String get expertiseAreas => 'Aree di Competenza';

  @override
  String get interview => 'Intervista';

  @override
  String get contactUs => 'Contattaci';

  @override
  String get call => 'Chiama';

  @override
  String get workingHours => 'Orari di Lavoro';

  @override
  String get mondayFriday => 'Lunedì - Venerdì';

  @override
  String get saturday => 'Sabato';

  @override
  String get sunday => 'Domenica';

  @override
  String get closed => 'Chiuso';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'Tutto';

  @override
  String get unread => 'Non letto';

  @override
  String get scheduled => 'Programmato';

  @override
  String get markAllAsRead => 'Segna tutto come letto';

  @override
  String get noNotificationsYet => 'Nessuna notifica ancora';

  @override
  String get newNotificationsWillAppearHere =>
      'Le nuove notifiche appariranno qui';

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
    return 'Fotocamera non trovata sul dispositivo: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'L\'applicazione telefonica non può essere aperta';

  @override
  String get emailAppCannotOpen =>
      'L\'applicazione email non può essere aperta';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'I Nostri Dottori';

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
  String get doctor => 'Dottore';

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
  String get yourDoctor => 'Il Tuo Dottore';

  @override
  String get appointment => 'Appuntamento';

  @override
  String get soon => 'presto';

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
  String get front => 'Fronte';

  @override
  String get right45 => 'Destra 45°';

  @override
  String get left45 => 'Sinistra 45°';

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
    return 'Il messaggio non può essere inviato: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'Paziente';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'Nessun messaggio ancora';

  @override
  String get typeMessage => 'Type a message...';

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
  String get pending => 'In attesa';

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
  String get unknownDate => 'Data sconosciuta';

  @override
  String get january => 'Gennaio';

  @override
  String get february => 'Febbraio';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Aprile';

  @override
  String get may => 'Maggio';

  @override
  String get june => 'Giugno';

  @override
  String get july => 'Luglio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Settembre';

  @override
  String get october => 'Ottobre';

  @override
  String get november => 'Novembre';

  @override
  String get december => 'Dicembre';

  @override
  String get analysisCompletedShort => 'Analisi completata!';

  @override
  String get retakeDialogTitle => 'Riscatto Richiesto';

  @override
  String get retakeDialogBody =>
      'L\'analisi AI indica che i seguenti angoli devono essere riscattati:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'Vuoi riscattare il primo angolo non valido?';

  @override
  String get noExistingPhotosFound => 'Nessuna foto esistente trovata';

  @override
  String get noValidPhotosToUpload => 'Nessuna foto valida da caricare';

  @override
  String errorOccurred(String error) {
    return 'Si è verificato un errore: $error';
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
  String get noSavedAnalyses => 'Nessuna analisi salvata ancora.';

  @override
  String welcomeGreeting(String name) {
    return 'Benvenuto, $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'Devi effettuare l\'accesso per inviare messaggi';

  @override
  String get chatWithMyDoctor => 'Chat with my doctor';

  @override
  String get analysisSavedSuccessfully => 'Analisi salvata con successo!';

  @override
  String get allPhotosAnalyzedAndSaved =>
      'Tutte le foto analizzate e salvate con successo.';

  @override
  String get reanalyzing => 'Re-analyzing...';

  @override
  String get someAnglesNotCapturedCorrectly =>
      'Alcuni angoli non sono stati catturati correttamente';

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
      'Tutte le notifiche sono state contrassegnate come lette';

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
  String get contactAddress => 'Indirizzo';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Telefono';

  @override
  String get contactWhatsApp => 'Consulente WhatsApp';

  @override
  String get patientCareGuideTitle => 'Guida alla Cura del Paziente';

  @override
  String get planningTab => 'Pianificazione';

  @override
  String get operationTab => 'Operazione';

  @override
  String get recoveryTab => 'Recupero';

  @override
  String get resourcesTab => 'Risorse';

  @override
  String get personalizedPlanning => 'Pianificazione Personalizzata';

  @override
  String get contactAndQuickSupport => 'Contatto e Supporto Rapido';

  @override
  String get preOperationPreparation => 'Preparazione Pre-Operazione';

  @override
  String get operationDayFlow => 'Flusso del Giorno dell\'Operazione';

  @override
  String get operationDayExperience => 'Esperienza del Giorno dell\'Operazione';

  @override
  String get sterilizationAndHygieneStandards =>
      'Standard di Sterilizzazione e Igiene';

  @override
  String get recoveryJourney => 'Viaggio di Recupero';

  @override
  String get postOperationCare => 'Cura Post-Operazione';

  @override
  String get hairWashingProtocol => 'Protocollo di Lavaggio Capelli';

  @override
  String get knowledgeBase => 'Base di Conoscenze';

  @override
  String get frequentlyAskedQuestions => 'Domande Frequenti';

  @override
  String get visualGuide => 'Guida Visiva';

  @override
  String get tapToSeeDetails => 'Tocca per vedere i dettagli';

  @override
  String get connectionCannotOpen =>
      'La connessione non può essere aperta. Si prega di controllare la connessione Internet o assicurarsi che l\'applicazione sia installata.';

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
  String get message => 'Messaggio';

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
  String get examplePhotoFrontTitle => 'Esempio Angolo Frontale';

  @override
  String get examplePhotoFrontInstructions =>
      '• Guardate direttamente nella fotocamera\n• Mantenete il mento dritto, la testa eretta\n• Gli occhi devono guardare la fotocamera\n• Il viso deve essere completamente visibile';

  @override
  String get examplePhotoRight45Title => 'Esempio Angolo Destro 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• Girate la testa nettamente verso DESTRA (~70–90°)\n• Mantenete il mento dritto, la testa eretta\n• La guancia destra e la tempia devono essere visibili\n• Le spalle non devono muoversi';

  @override
  String get examplePhotoLeft45Title => 'Esempio Angolo Sinistro 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• Girate la testa nettamente verso SINISTRA (~70–90°)\n• Mantenete il mento dritto, la testa eretta\n• La guancia sinistra e la tempia devono essere visibili\n• Le spalle non devono muoversi';

  @override
  String get examplePhotoVertexTitle => 'Esempio Angolo del Vertex';

  @override
  String get examplePhotoVertexInstructions =>
      '• Tenete il telefono orizzontalmente e piatto\n• Lo schermo deve essere rivolto verso l\'alto\n• Posizionate il telefono sopra la testa\n• Tutto il cuoio capelluto deve essere visibile';

  @override
  String get examplePhotoDonorTitle => 'Esempio Area Donatrice';

  @override
  String get examplePhotoDonorInstructions =>
      '• Tenete il telefono dietro la testa\n• La parte posteriore della testa e il collo devono essere visibili\n• Mantenete il telefono stabile\n• L\'illuminazione deve essere sufficiente';

  @override
  String get camera => 'Fotocamera';

  @override
  String get gallery => 'Galleria';

  @override
  String get deleteForMe => 'Elimina per me';

  @override
  String get messageDeleted => 'Messaggio eliminato';

  @override
  String get deleteForEveryone => 'Elimina per tutti';

  @override
  String get deleteMessage => 'Elimina Messaggio';

  @override
  String get deleteMessageReadWarning =>
      'Questo messaggio è stato letto dal destinatario. Vuoi ancora eliminarlo?';

  @override
  String get deleteMessageConfirm =>
      'Questo messaggio verrà eliminato per tutti. Sei sicuro?';

  @override
  String get messageDeletedForEveryone => 'Messaggio eliminato per tutti';

  @override
  String get userNotLoggedIn => 'L\'utente non ha effettuato l\'accesso';

  @override
  String get messagesLoadingError =>
      'Si è verificato un errore durante il caricamento dei messaggi';

  @override
  String get loadingMessages => 'Caricamento messaggi...';

  @override
  String get startConversation =>
      'Inizia una conversazione inviando un messaggio';

  @override
  String get loadOlderMessages => 'Carica messaggi più vecchi';

  @override
  String get sendPhoto => 'Invia Foto';

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
      'Devi effettuare l\'accesso per analizzare';

  @override
  String openCaptureFlowError(String error) {
    return 'Si è verificato un errore durante l\'apertura della schermata di acquisizione: $error';
  }

  @override
  String get sessionExpired =>
      'La tua sessione è scaduta. Effettua nuovamente l\'accesso.';

  @override
  String get photosAnalyzedAndSaved =>
      'Foto analizzate e salvate con successo!';

  @override
  String get photoNotFoundForAnalysis => 'Nessuna foto trovata per l\'analisi';

  @override
  String get noValidPhotosFound => 'Nessuna foto valida trovata';

  @override
  String get analysisPreparing => 'Preparazione delle foto...';

  @override
  String get photosUploading => 'Caricamento delle foto...';

  @override
  String get errorUploadingPhotos => 'Errore durante il caricamento delle foto';

  @override
  String get geminiChecking => 'Controllo connessione API Gemini...';

  @override
  String get geminiFailed =>
      'Connessione API Gemini fallita. Controlla la tua connessione internet.';

  @override
  String get aiAnalyzing => 'Esecuzione dell\'analisi AI...';

  @override
  String get someAnglesNeedRetake =>
      'Alcuni angoli devono essere riscattati...';

  @override
  String get analysisSaved => 'Analisi salvata con successo!';

  @override
  String get analysisCompletedSuccessfully =>
      'Analisi completata con successo!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count angoli devono essere riscattati...';
  }

  @override
  String get errorDuringAnalysis =>
      'Si è verificato un errore durante l\'analisi';

  @override
  String get geminiApiError =>
      'Errore di connessione API Gemini. Controlla la tua connessione internet.';

  @override
  String get firebaseError => 'Errore di connessione Firebase. Riprova.';

  @override
  String get photoProcessingError => 'Errore di elaborazione foto. Riprova.';

  @override
  String get authErrorLoginAgain =>
      'Errore di autorizzazione. Effettua nuovamente l\'accesso.';

  @override
  String get analysisSuccessfulTitle => 'Analisi Riuscita';

  @override
  String get analysisResultsTitle => 'Risultati Analisi';

  @override
  String get detailedAnalysisHeader => 'Analisi Dettagliata:';

  @override
  String get retakeRequiredAnglesHeader => 'Angoli da Riscattare:';

  @override
  String dialogError(String error) {
    return 'Si è verificato un errore durante l\'apertura del dialogo: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Foto di base non trovata';

  @override
  String get noPhotosToUpdate => 'Nessuna foto da aggiornare';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Si è verificato un errore durante l\'analisi: $error';
  }

  @override
  String retakeError(String error) {
    return 'Si è verificato un errore durante il riscatto: $error';
  }

  @override
  String get aiSupport => 'Supporto AI';

  @override
  String get myPhotos => 'Le Mie Foto';

  @override
  String get photoAnalysisChatbot => 'Chatbot Analisi Foto';

  @override
  String get disableMedicationReminder => 'Disattiva Promemoria Farmaci';

  @override
  String get medicationReminderDisabled =>
      'Il promemoria giornaliero dei farmaci è stato disattivato';

  @override
  String get medicationTime => 'Ora dei Farmaci';

  @override
  String get selectMedicationReminderTime =>
      'Seleziona l\'ora del tuo promemoria giornaliero dei farmaci';

  @override
  String get selectMedicationTime => 'Seleziona Ora dei Farmaci';

  @override
  String medicationReminderSetAt(String time) {
    return 'Promemoria giornaliero dei farmaci impostato per $time';
  }

  @override
  String get noDateInfo => 'Nessuna informazione sulla data';

  @override
  String get invalidDate => 'Data non valida';

  @override
  String get today => 'Oggi';

  @override
  String get yesterday => 'Ieri';

  @override
  String get valid => 'Valido';

  @override
  String get samePerson => 'Stessa persona';

  @override
  String get differentPersonSuspicion => 'Sospetto persona diversa';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get profileSettings => 'Profile Settings';

  @override
  String get specialty => 'Specialty';

  @override
  String get hairTransplantTitle => 'Trapianto di Capelli';

  @override
  String get hairTransplantSectionCount => 'Sezioni';

  @override
  String get hairTransplantVideo => 'Video';

  @override
  String get hairTransplantFreeConsultation => 'Ottieni Consultazione Gratuita';

  @override
  String get hairTransplantWatchVideo => 'Guarda il Video';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Clicca per guardare su YouTube';

  @override
  String get photosSavedSuccessfully => 'Foto salvate con successo!';

  @override
  String errorDuringRetake(String error) {
    return 'Si è verificato un errore durante il riscatto: $error';
  }

  @override
  String errorOpeningCaptureScreen(String error) {
    return 'Errore durante l\'apertura della schermata di acquisizione: $error';
  }

  @override
  String errorDuringAnalysisShort(String error) {
    return 'Errore durante l\'analisi: $error';
  }

  @override
  String get myDocuments => 'I Miei Documenti';

  @override
  String get loginRequiredForDocuments =>
      'È necessario accedere per visualizzare i documenti';

  @override
  String get noDocumentsYet => 'Nessun documento ancora';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Si è verificato un errore:\n$error';
  }

  @override
  String get datePending => 'In attesa';

  @override
  String get chatSupportWelcomeMessage =>
      'Ciao! Sono il tuo assistente IA. Come posso aiutarti oggi?';

  @override
  String get newChat => 'Nuova Chat';

  @override
  String get chatSupportAiAssistantName => 'Assistente IA';

  @override
  String get historyTooltip => 'Cronologia';

  @override
  String get typingIndicator => 'L\'IA sta scrivendo...';

  @override
  String get chatHistoryTitle => 'Cronologia Chat';

  @override
  String get noSavedChats => 'Nessuna chat salvata';

  @override
  String genericErrorTryAgain(String error) {
    return 'Si è verificato un errore. Riprova.\nErrore: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp non può essere aperto. Assicurati che l\'app WhatsApp sia installata.';

  @override
  String whatsappOpenError(String error) {
    return 'Si è verificato un errore durante l\'apertura di WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Si è verificato un errore durante l\'apertura della schermata di acquisizione: $error';
  }

  @override
  String get retakeAnalyzing => 'La foto ritirata è in fase di analisi...';

  @override
  String get autoAnalysisOn => 'Analisi Automatica: Attiva';

  @override
  String get autoAnalysisOff => 'Analisi Automatica: Disattiva';

  @override
  String get clearPhotosTooltip => 'Cancella foto';

  @override
  String get messageHintAnalyze =>
      'Digita il tuo messaggio o scrivi \"Analizza\"...';

  @override
  String get send => 'Invia';

  @override
  String get aiAssistantName => 'Assistente di Analisi IA';

  @override
  String get expertTeam => 'Team di Esperti';

  @override
  String get expertTeamDescription =>
      'Il nostro team è composto da specialisti esperti in chirurgia del trapianto di capelli.';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String get loginToSendMessage =>
      'Effettua l\'accesso per inviare un messaggio';

  @override
  String get doctorEmailMissing => 'Manca l\'e-mail del medico';

  @override
  String doctorNotFound(String name) {
    return 'Medico $name non trovato';
  }

  @override
  String get messagingComingSoon => 'Funzionalità di messaggistica in arrivo';

  @override
  String get years => 'anni';

  @override
  String get watchWashingVideo => 'Guarda il Video di Lavaggio';

  @override
  String get preCareTip1Title => 'Scegli il chirurgo giusto';

  @override
  String get preCareTip1Body =>
      'La procedura Sapphire FUE richiede un chirurgo esperto e un team multidisciplinare. Lavora con medici che spiegano realisticamente le tue aspettative, pianificano l\'operazione dall\'inizio alla fine e applicano i protocolli Smile Hair.';

  @override
  String get preCareTip2Title => 'Condividi la tua storia medica';

  @override
  String get preCareTip2Body =>
      'Condividi le tue malattie croniche, farmaci regolari e allergie con il team senza nascondere nulla. Questo minimizza i rischi che possono verificarsi durante l\'anestesia e la chirurgia.';

  @override
  String get preCareTip3Title => 'Anticoagulanti e processo di approvazione';

  @override
  String get preCareTip3Body =>
      'Interrompi l\'aspirina o anticoagulanti simili almeno una settimana prima della data dell\'operazione con l\'approvazione del tuo medico prescrittore. Puoi riprendere l\'uso due giorni dopo la procedura.';

  @override
  String get preCareTip4Title => 'Screening delle infezioni';

  @override
  String get preCareTip4Body =>
      'Mantieni aggiornati i risultati dei tuoi test per Epatite B/C e HIV. Le cliniche senza condizioni adeguate di sala operatoria non possono eseguire operazioni per queste infezioni, così il tuo viaggio non sarà sprecato.';

  @override
  String get preCareTip5Title => 'Integratori e vitamine';

  @override
  String get preCareTip5Body =>
      'Gli integratori contenenti vitamine B ed E aumentano il sanguinamento; interrompili una settimana prima della procedura. Se necessario, il tuo medico pianificherà trattamenti di supporto.';

  @override
  String get preCareTip6Title => 'Alcol e fumo';

  @override
  String get preCareTip6Body =>
      'Interrompi l\'alcol almeno una settimana prima dell\'operazione e non consumarlo per 14 giorni dopo la procedura. Stai lontano dal fumo 12 ore prima e per due settimane dopo l\'operazione, poiché interrompe la circolazione sanguigna.';

  @override
  String get preCareTip7Title => 'Piano bagagli e abbigliamento';

  @override
  String get preCareTip7Body =>
      'Scegli abiti con bottoni o cerniera per la parte superiore del corpo. Gli abiti con collo stretto possono danneggiare gli innesti. Prepara una borsa grande che possa trasportare il kit di cura dato dopo l\'operazione.';

  @override
  String get preCareTip8Title => 'Riposo e igiene';

  @override
  String get preCareTip8Body =>
      'Dormi bene il giorno dell\'operazione, fai una colazione nutriente e fai la doccia prima di venire in clinica. Il cuoio capelluto pulito riduce il rischio di infezione.';

  @override
  String get postCareTip1Title => 'Proteggi gli innesti';

  @override
  String get postCareTip1Body =>
      'Per i primi 7 giorni, fai attenzione a non sbattere la testa da nessuna parte. Dormi sulla schiena usando un cuscino per il collo e previeni che gli innesti si sfreghino contro il cuscino.';

  @override
  String get postCareTip2Title => 'Prima notte e giorni seguenti';

  @override
  String get postCareTip2Body =>
      'Passa definitivamente la prima notte dopo l\'operazione riposando. Se devi uscire, usa un ombrello che protegga dal sole e dalla pioggia.';

  @override
  String get postCareTip3Title => 'Rispetta il piano di medicazione';

  @override
  String get postCareTip3Body =>
      'Usa antibiotici, antidolorifici, antinfiammatori e spray Pantenolo esattamente come prescritto. Assicurati di capire la prescrizione e le istruzioni d\'uso prima di lasciare il team della clinica.';

  @override
  String get postCareTip4Title => 'Idratazione e spray';

  @override
  String get postCareTip4Body =>
      'Usa solo lo spray isotonico/Pantenolo dato fino al primo lavaggio. Applica crema antibiotica sull\'area donatrice per i primi 5-7 giorni.';

  @override
  String get postCareTip5Title => 'Protocollo di lavaggio';

  @override
  String get postCareTip5Body =>
      'Il primo lavaggio viene fatto in clinica 48 ore dopo. Ogni giorno dopo, applica la schiuma delicatamente con movimenti di tamponamento, usa acqua tiepida a bassa pressione e asciuga con asciugamani di carta.';

  @override
  String get postCareTip6Title => 'Croste e perdita da shock';

  @override
  String get postCareTip6Body =>
      'Dal giorno 10, rimuovi le croste con pressione leggera. La perdita da shock vissuta tra le settimane 2-4 è normale; i nuovi capelli diventano visibili dal mese 3.';

  @override
  String get postCareTip7Title => 'Attività e sport';

  @override
  String get postCareTip7Body =>
      'Non fare sport per le prime due settimane, puoi fare passeggiate leggere dopo 3-4 giorni. Evita piscina, sauna e attività che richiedono sudorazione intensa per almeno 1 mese.';

  @override
  String get postCareTip8Title => 'Lamentele di comfort';

  @override
  String get postCareTip8Body =>
      'Se c\'è bruciore o dolore nell\'area donatrice, usa crema contenente steroidi con l\'approvazione della clinica. Applica impacchi freddi brevemente per il gonfiore.';

  @override
  String get operationDayTimeline1Title => 'Alloggio e trasferimento';

  @override
  String get operationDayTimeline1Body =>
      'Il team Smile Gentle Care organizza alloggi in hotel 4-5 stelle. Tutti i trasporti sono pianificati dall\'arrivo in hotel ai trasferimenti in clinica.';

  @override
  String get operationDayTimeline2Title => 'Supporto multilingue';

  @override
  String get operationDayTimeline2Body =>
      'Vengono forniti traduttori professionali per pazienti provenienti da diversi paesi del mondo. Sei informato nella tua lingua ad ogni passo del processo.';

  @override
  String get operationDayTimeline3Title => 'Preparazione pre-operatoria';

  @override
  String get operationDayTimeline3Body =>
      'I moduli informativi vengono firmati, la tua linea dei capelli viene disegnata, vengono scattate foto e vengono controllati i test HIV/HBV/HCV e i segni vitali.';

  @override
  String get operationDayTimeline4Title => 'Flusso dell\'operazione';

  @override
  String get operationDayTimeline4Body =>
      'Passaggi della procedura di 6-8 ore: pianificazione, raccolta degli innesti, apertura dei canali e impianto. I tuoi medici condividono l\'intero processo con te.';

  @override
  String get operationDayTimeline5Title => 'Pranzo e preferenze speciali';

  @override
  String get operationDayTimeline5Body =>
      'Menu vegetariani, halal o kosher vengono preparati su richiesta. Opzioni di TV intelligente e musica sono disponibili nelle aree operative.';

  @override
  String get operationDayTimeline6Title => 'Cura il giorno successivo';

  @override
  String get operationDayTimeline6Body =>
      'Vieni in clinica per cambio di bendaggio, controllo delle ferite e formazione al primo lavaggio. Successivamente, il processo viene monitorato con tracciamento fotografico digitale.';

  @override
  String get sterilizationMeasure1 =>
      'Vengono eseguiti test giornalieri di perdita del vuoto per verificare l\'integrità della tenuta degli sterilizzatori.';

  @override
  String get sterilizationMeasure2 =>
      'Viene eseguita una verifica giornaliera con il test Bowie-Dick per assicurarsi che il vapore raggiunga tutte le superfici in modo uniforme.';

  @override
  String get sterilizationMeasure3 =>
      'I test di lavaggio ultrasonici documentano che puliamo i micro residui.';

  @override
  String get sterilizationMeasure4 =>
      'I test degli indicatori biologici vengono eseguiti ogni 15 giorni e viene segnalato che non c\'è riproduzione.';

  @override
  String get sterilizationMeasure5 =>
      'Gli strumenti sterili e usati sono conservati separatamente in scatole chiuse; la contaminazione incrociata è prevenuta.';

  @override
  String get sterilizationMeasure6 =>
      'Ogni set è tracciato con etichette di numero autoclave, data e data di scadenza.';

  @override
  String get sterilizationMeasure7 =>
      'Tutti i processi sono eseguiti secondo la Guida DAS del Ministero della Salute, standard OMS e AAMI ST79.';

  @override
  String get washStep1 =>
      'Non lavare i capelli per le prime 36-48 ore dopo l\'operazione; aspetta il primo lavaggio che verrà fatto in clinica.';

  @override
  String get washStep2 =>
      'Applica lozione o schiuma sia all\'area donatrice che a quella ricevente con la punta delle dita in movimenti di tamponamento.';

  @override
  String get washStep3 =>
      'Fai schiuma lo shampoo e distribuiscilo delicatamente sull\'area trapiantata con tocchi verticali; evita movimenti circolari.';

  @override
  String get washStep4 =>
      'Usa acqua tiepida a bassa pressione. Per i primi 14 giorni, è più sicuro versare acqua con una ciotola invece di un soffione doccia.';

  @override
  String get washStep5 =>
      'Asciuga l\'area dell\'innesto premendo delicatamente con asciugamani di carta, puoi asciugare l\'area donatrice con un asciugamano normale.';

  @override
  String get washStep6 =>
      'Se devi usare un asciugacapelli, usalo solo in modalità fredda e da lontano.';

  @override
  String get faq1Question => 'Quanto dura il recupero?';

  @override
  String get faq1Answer =>
      'Le prime due settimane sono un periodo sensibile; i capelli attraversano diverse fasi per 6-12 mesi. Risultati significativi si vedono al mese 6, densità finale ai mesi 12-18.';

  @override
  String get faq2Question =>
      'Come dovrebbero essere la benda e il programma del sonno?';

  @override
  String get faq2Answer =>
      'Può essere applicata una benda elastica per ridurre il gonfiore nell\'area della fronte. Dormi sulla schiena con un cuscino per il collo in posizione leggermente elevata per i primi 7-10 giorni.';

  @override
  String get faq3Question => 'Doccia, lavaggio e uso di prodotti';

  @override
  String get faq3Answer =>
      'Non bagnare i capelli per i primi due giorni. Dopo 48 ore, lava una volta al giorno con shampoo medico dopo il primo lavaggio in clinica; mantieni il tempo della doccia breve, riduci il vapore.';

  @override
  String get faq4Question =>
      'Quando posso asciugare, pettinare o tingere i miei capelli?';

  @override
  String get faq4Answer =>
      'Solo l\'asciugatura naturale è raccomandata entro il primo mese. Puoi pettinare l\'area donatrice ma non toccare l\'area del trapianto per 2 settimane. Stai lontano dalle tinture chimiche per 6-8 settimane.';

  @override
  String get faq5Question => 'Fumo, alcol ed esercizio';

  @override
  String get faq5Answer =>
      'Fumare è vietato 12 ore prima e 2 settimane dopo l\'operazione. L\'alcol non dovrebbe essere usato per i primi 14 giorni. Passeggiate leggere sono consentite dopo il giorno 4, aspetta 1 mese per sport pesanti.';

  @override
  String get faq6Question => 'Cappello, sole, viaggio e ritorno al lavoro';

  @override
  String get faq6Answer =>
      'Non indossare un cappello per i primi 10 giorni o preferisci modelli molto larghi. Evita il sole diretto. Puoi tornare al lavoro d\'ufficio entro 3-5 giorni; aspetta 2 settimane per il lavoro fisico. Puoi viaggiare ma proteggi gli innesti.';

  @override
  String get heroCardSubtitle1 =>
      'Il team Smile Hair gestisce l\'intero processo per te, dalla valutazione pre-operatoria alla pianificazione del viaggio.';

  @override
  String get heroCardSubtitle2 =>
      'Vivi un\'esperienza confortevole con trasferimenti, supporto di traduttore e sale operatorie sterili.';

  @override
  String get heroCardSubtitle3 =>
      'Proteggi gli innesti in sicurezza con l\'uso pianificato di farmaci, lavaggio appropriato e restrizioni di movimento.';

  @override
  String get heroCardSubtitle4 =>
      'Traccia l\'intero processo con domande frequenti, immagini e guide digitali.';

  @override
  String get imageBannerCaption1 =>
      'Applica cure delicate con gli shampoo e le lozioni che ti vengono dati dal primo lavaggio.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
