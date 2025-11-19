// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Modifier le Profil';

  @override
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get close => 'Fermer';

  @override
  String get changePhoto => 'Changer la Photo';

  @override
  String get patientId => 'ID Patient';

  @override
  String get fullName => 'Nom Complet';

  @override
  String get email => 'E-mail';

  @override
  String get phone => 'Téléphone';

  @override
  String get address => 'Adresse';

  @override
  String get birthDate => 'Date de Naissance';

  @override
  String get gender => 'Genre';

  @override
  String get emergencyContact => 'Contact d\'Urgence';

  @override
  String get saveChanges => 'Enregistrer les Modifications';

  @override
  String get nameRequired => 'Le nom complet ne peut pas être vide';

  @override
  String get emailInvalid => 'Veuillez entrer une adresse e-mail valide';

  @override
  String get phoneRequired => 'Le numéro de téléphone ne peut pas être vide';

  @override
  String get addressRequired => 'L\'adresse ne peut pas être vide';

  @override
  String get birthDateRequired => 'Veuillez sélectionner la date de naissance';

  @override
  String get profileUpdatedSuccessfully =>
      'Informations du profil mises à jour avec succès';

  @override
  String get male => 'Homme';

  @override
  String get female => 'Femme';

  @override
  String get preferNotToSay => 'Je préfère ne pas le dire';

  @override
  String get currentPassword => 'Mot de Passe Actuel';

  @override
  String get newPassword => 'Nouveau Mot de Passe';

  @override
  String get confirmNewPassword => 'Confirmer le Nouveau Mot de Passe';

  @override
  String get change => 'Changer';

  @override
  String get passwordsDoNotMatch =>
      'Les nouveaux mots de passe ne correspondent pas';

  @override
  String get passwordTooShort =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get passwordChangedSuccessfully => 'Mot de passe modifié avec succès';

  @override
  String get currentPasswordRequired =>
      'Veuillez entrer votre mot de passe actuel';

  @override
  String get newPasswordRequired =>
      'Veuillez entrer votre nouveau mot de passe';

  @override
  String get photoChangeFeatureComingSoon =>
      'La fonctionnalité de changement de photo arrivera bientôt';

  @override
  String get description => 'Description';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get viewAndManageNotifications =>
      'Afficher et gérer les notifications';

  @override
  String get privacyPolicyError =>
      'La page de politique de confidentialité n\'a pas pu être ouverte. Veuillez vérifier votre connexion Internet.';

  @override
  String get termsOfServiceError =>
      'La page des conditions de service n\'a pas pu être ouverte. Veuillez vérifier votre connexion Internet.';

  @override
  String anErrorOccurred(String error) {
    return 'Une erreur s\'est produite: $error';
  }

  @override
  String get appDescription =>
      'Une application mobile moderne conçue pour les services de greffe de cheveux et de soins. Vous pouvez analyser en prenant vos propres photos, suivre votre processus de traitement et contacter la clinique.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. Tous droits réservés.';

  @override
  String get emergencyContactHint => 'Nom - Téléphone';

  @override
  String get appointmentDetails => 'Détails du Rendez-vous';

  @override
  String get dateLabel => 'Date';

  @override
  String get timeLabel => 'Heure';

  @override
  String get doctorLabel => 'Médecin';

  @override
  String get appointmentTypeLabel => 'Type de Rendez-vous';

  @override
  String get locationLabel => 'Emplacement';

  @override
  String get phoneLabel => 'Téléphone';

  @override
  String get followUpConsultation => 'Consultation de Suivi';

  @override
  String get cancelAppointment => 'Annuler le Rendez-vous';

  @override
  String get addReminder => 'Ajouter un Rappel';

  @override
  String get appointmentReminderSet => 'Rappel de rendez-vous a été défini';

  @override
  String get cameraPermissionRequired =>
      'Nous ne pouvons pas continuer sans autorisation de la caméra. Veuillez accorder l\'autorisation dans les paramètres.';

  @override
  String get sensorPermissionRequired =>
      'L\'autorisation du capteur de mouvement est requise pour les prises de vue du haut et de l\'arrière.';

  @override
  String get recoveryProgress => 'Progrès de Récupération';

  @override
  String dayOfTotal(String current, String total) {
    return 'Jour $current sur $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Semaine $week: Phase de Guérison';
  }

  @override
  String get todaysCareRoutine => 'Routine de Soins d\'Aujourd\'hui';

  @override
  String get takeMedicationMorning => 'Prendre le médicament (Matin)';

  @override
  String get applyTopicalSolution => 'Appliquer une solution topique';

  @override
  String get takeMedicationEvening => 'Prendre le médicament (Soir)';

  @override
  String get upcomingAppointment => 'Rendez-vous à Venir';

  @override
  String get nextFollowUpConsultation =>
      'Votre prochaine consultation de suivi.';

  @override
  String get viewDetails => 'Voir les Détails';

  @override
  String get notifications => 'Notifications';

  @override
  String get appointmentReminder => 'Rappel de Rendez-vous';

  @override
  String appointmentReminderMessage(String time) {
    return 'Vous avez un rendez-vous demain à $time';
  }

  @override
  String hoursAgo(Object hours) {
    return 'il y a $hours heures';
  }

  @override
  String get medicationReminder => 'Rappel de Médicament';

  @override
  String get morningMedicationReminder =>
      'N\'oubliez pas de prendre votre médicament du matin';

  @override
  String get photoReminder => 'Rappel de Photo';

  @override
  String get weeklyProgressPhotoReminder =>
      'N\'oubliez pas de prendre votre photo de progression hebdomadaire';

  @override
  String daysAgo(String days) {
    return 'il y a $days jours';
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
    return 'Notification $title ouverte';
  }

  @override
  String get appointmentCancellation => 'Annulation de Rendez-vous';

  @override
  String get cancelAppointmentConfirmation =>
      'Êtes-vous sûr de vouloir annuler ce rendez-vous? Cette action ne peut pas être annulée.';

  @override
  String get appointmentCancelledSuccessfully =>
      'Rendez-vous annulé avec succès';

  @override
  String get everyDay => 'Tous les jours';

  @override
  String get weekends => 'Week-ends';

  @override
  String get weekdays => 'Jours de semaine';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mer';

  @override
  String get thursdayShort => 'Jeu';

  @override
  String get fridayShort => 'Ven';

  @override
  String get saturdayShort => 'Sam';

  @override
  String get sundayShort => 'Dim';

  @override
  String get titleCannotBeEmpty => 'Le titre ne peut pas être vide';

  @override
  String get messageCannotBeEmpty => 'Le message ne peut pas être vide';

  @override
  String get pleaseEnterValidEmail =>
      'Veuillez entrer une adresse e-mail valide';

  @override
  String get selectAtLeastOneDay => 'Veuillez sélectionner au moins un jour';

  @override
  String get dailyEmailScheduled => 'E-mail quotidien a été programmé';

  @override
  String deleteTaskConfirmation(String title) {
    return 'Êtes-vous sûr de vouloir supprimer la tâche \"$title\"?';
  }

  @override
  String get taskDeleted => 'Tâche supprimée';

  @override
  String get deleteTask => 'Supprimer la Tâche';

  @override
  String get newScheduledEmail => 'Nouvel E-mail Programmé';

  @override
  String get createDailyEmailTasks => 'Créer des tâches e-mail quotidiennes';

  @override
  String get titleLabel => 'Titre';

  @override
  String get messageLabel => 'Votre Message';

  @override
  String get recipientNameLabel => 'Nom du destinataire';

  @override
  String get delete => 'Supprimer';

  @override
  String get daysLabel => 'Jours';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'L\'une des principales cliniques à Istanbul, spécialisée dans la greffe de cheveux.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic est l\'une des principales cliniques à Istanbul, spécialisée dans la greffe de cheveux. Dirigée par les reconnus internationalement Dr. Gökay Bilgin et Dr. Mehmet Erdoğan, la satisfaction du patient est toujours prioritaire à Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'Tous les processus opérationnels sont suivis personnellement par les médecins, et chaque membre de l\'équipe est composé de professionnels ayant une formation médicale. À ce jour, des procédures réussies de greffe de cheveux ont été réalisées sur de nombreux patients du monde entier.';

  @override
  String get clinicEthicsDescription =>
      'En tant que Smile Hair Clinic, nous servons conformément à nos principes de respect des droits des patients, de transparence, d\'honnêteté et de professionnalisme. Nous agissons en conformité avec les règles éthiques dans tous les processus de traitement, protégeons la confidentialité des patients et visons à fournir le service de la plus haute qualité.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic a été présentée dans divers médias pour ses résultats réussis et la satisfaction des patients. Elle a présenté lors de conférences internationales de greffe de cheveux et a été un pionnier dans le domaine.';

  @override
  String get mediaOutlets => 'Médias dans lesquels nous avons été présentés:';

  @override
  String get clinicFoundingPartner =>
      'est un associé fondateur de Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'travaille à Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'est un médecin expérimenté travaillant à Smile Hair Clinic, priorisant la satisfaction des patients.';

  @override
  String get viewFaqPage => 'Voir la page FAQ';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Istanbul';

  @override
  String get chatWelcomeMessage =>
      'Bienvenue ! Comment pouvons-nous vous aider aujourd\'hui ? Notre équipe répond généralement dans l\'heure.';

  @override
  String get chatSampleMessage =>
      'Bonjour, j\'aimerais poser une question sur mon plan de traitement.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'avant';

  @override
  String get backCamera => 'arrière';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Chronologie';

  @override
  String get visibleImprovementDescription =>
      'Amélioration visible de la densité sur toute la couronne. Le patient rapporte une satisfaction élevée.';

  @override
  String get procedureDetails => 'Type : Restauration FUE\nGreffes : 2 450';

  @override
  String get scheduledEmails => 'E-mails programmés';

  @override
  String get noScheduledEmails => 'Aucun e-mail programmé';

  @override
  String get sampleAppointmentDate => 'Mar, 9 nov, 10:30';

  @override
  String get sampleAppointmentDateFull => 'Mardi 9 novembre 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'Istanbul, Turquie';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Restauration et Soins des Cheveux';

  @override
  String get welcomeLogin => 'Connexion';

  @override
  String get welcomeRegister => 'S\'inscrire';

  @override
  String get loginTitle => 'Bon Retour';

  @override
  String get loginSubtitle => 'Connectez-vous à votre compte';

  @override
  String get loginEmail => 'E-mail';

  @override
  String get loginEmailHint => 'Entrez votre adresse e-mail';

  @override
  String get loginPassword => 'Mot de Passe';

  @override
  String get loginPasswordHint => 'Entrez votre mot de passe';

  @override
  String get loginForgotPassword => 'Mot de passe oublié?';

  @override
  String get loginLoginButton => 'Connexion';

  @override
  String get loginOr => 'ou';

  @override
  String get loginGoogleLogin => 'Continuer avec Google';

  @override
  String get loginNeedAccount => 'Vous n\'avez pas de compte ?';

  @override
  String get forgotPasswordTitle => 'Réinitialisez votre mot de passe';

  @override
  String get forgotPasswordSubtitle =>
      'Saisissez votre e-mail enregistré et nous vous enverrons un lien pour le réinitialiser.';

  @override
  String get forgotPasswordSendButton => 'Envoyer le lien de réinitialisation';

  @override
  String get forgotPasswordEmailSent =>
      'E-mail de réinitialisation envoyé. Vérifiez votre boîte de réception.';

  @override
  String get registrationTitle => 'Créez Votre Compte';

  @override
  String get registrationSubtitle => 'Créer un nouveau compte';

  @override
  String get registrationName => 'Nom Complet';

  @override
  String get registrationNameHint => 'Entrez votre prénom et nom';

  @override
  String get registrationEmail => 'E-mail';

  @override
  String get registrationEmailHint => 'Entrez votre adresse e-mail';

  @override
  String get registrationPassword => 'Mot de Passe';

  @override
  String get registrationPasswordHint => 'Créez votre mot de passe';

  @override
  String get registrationConfirmPassword => 'Confirmer le Mot de Passe';

  @override
  String get registrationConfirmPasswordHint => 'Réentrez votre mot de passe';

  @override
  String get registrationTerms =>
      'J\'accepte les Conditions d\'Utilisation et la Politique de Confidentialité.';

  @override
  String get registrationRegisterButton => 'Créer un Compte';

  @override
  String get registrationAlreadyHaveAccount => 'Vous avez déjà un compte?';

  @override
  String get registrationLoginLink => 'Connexion';

  @override
  String dashboardHelloParam(String name) {
    return 'Bonjour, $name';
  }

  @override
  String get dashboardHome => 'Accueil';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Analyse';

  @override
  String get dashboardMyAppointments => 'Mes Rendez-vous';

  @override
  String get dashboardResources => 'Ressources';

  @override
  String get dashboardCareGuide => 'Guide de Soins';

  @override
  String get dashboardCareGuideSubtitle => 'Instructions de soins post-greffe';

  @override
  String get dashboardDefaultUserName => 'Utilisateur Invité';

  @override
  String get dashboardHairTransplantTitle => 'Greffe de Cheveux';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Explorez chaque technique de greffe';

  @override
  String get dashboardOnlineConsultationTitle => 'Consultation en Ligne';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'Obtenez des conseils d\'experts gratuits';

  @override
  String get dashboardDoctorsTitle => 'Nos Médecins';

  @override
  String get dashboardDoctorsSubtitle =>
      'Rencontrez nos chirurgiens spécialistes';

  @override
  String get dashboardAboutUsTitle => 'À Propos de Nous';

  @override
  String get dashboardAboutUsSubtitle => 'Découvrez notre clinique';

  @override
  String get dashboardContactTitle => 'Contact';

  @override
  String get dashboardContactSubtitle => 'Contactez-nous';

  @override
  String get dashboardProgressTracking => 'Suivi des Progrès';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Suivez votre progression de traitement';

  @override
  String get dashboardPastAnalysesSubtitle => 'Vos analyses photo précédentes';

  @override
  String get settingsProfile => 'Profil';

  @override
  String get settingsPreferences => 'Préférences';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsLanguageSubtitle => 'Sélectionnez votre langue préférée';

  @override
  String get settingsDarkMode => 'Mode Sombre';

  @override
  String get settingsDarkModeSubtitle => 'Activer le thème sombre';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsNotificationsSubtitle =>
      'Activer toutes les notifications';

  @override
  String get settingsEmailNotifications => 'Notifications E-mail';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'Recevoir des notifications par e-mail';

  @override
  String get settingsPushNotifications => 'Notifications Push';

  @override
  String get settingsPushNotificationsSubtitle =>
      'Recevoir des notifications push';

  @override
  String get settingsAccount => 'Compte';

  @override
  String get settingsChangePassword => 'Changer le Mot de Passe';

  @override
  String get settingsChangePasswordSubtitle =>
      'Mettez à jour votre mot de passe';

  @override
  String get settingsPrivacyPolicy => 'Politique de Confidentialité';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Lisez notre politique de confidentialité';

  @override
  String get settingsTermsOfService => 'Conditions de Service';

  @override
  String get settingsTermsOfServiceSubtitle =>
      'Lisez nos conditions de service';

  @override
  String get settingsSupport => 'Support';

  @override
  String get settingsHelpSupport => 'Aide et Support';

  @override
  String get settingsHelpSupportSubtitle =>
      'Obtenez de l\'aide et contactez le support';

  @override
  String get settingsAddPhone => 'Ajouter un numéro de téléphone';

  @override
  String get settingsThemeMode => 'Mode de Thème';

  @override
  String get settingsThemeDescriptionSystem =>
      'Suivre les paramètres du système';

  @override
  String get settingsThemeDescriptionLight => 'Thème clair';

  @override
  String get settingsThemeDescriptionDark => 'Thème sombre';

  @override
  String get settingsThemeDialogTitle => 'Choisir le Mode de Thème';

  @override
  String get settingsThemeOptionSystem => 'Système';

  @override
  String get settingsThemeOptionSystemSubtitle =>
      'Correspondre aux paramètres de l\'appareil';

  @override
  String get settingsThemeOptionLight => 'Clair';

  @override
  String get settingsThemeOptionLightSubtitle => 'Thème de couleurs vives';

  @override
  String get settingsThemeOptionDark => 'Sombre';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Thème de couleurs sombres';

  @override
  String get settingsKvkkFormTitle => 'Formulaire de Demande KVKK';

  @override
  String get settingsKvkkFormSubtitle =>
      'Soumettre une demande concernant vos données personnelles';

  @override
  String get settingsGdprFormTitle => 'Formulaire de Contact RGPD';

  @override
  String get settingsGdprFormSubtitle =>
      'Avis d\'information pour KVKK et RGPD';

  @override
  String get settingsRecordsTitle => 'Mes Dossiers';

  @override
  String get settingsTreatmentHistoryTitle => 'Historique des Traitements';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Consultez vos rendez-vous et dossiers chirurgicaux';

  @override
  String get settingsDocumentsTitle => 'Documents';

  @override
  String get settingsDocumentsSubtitle =>
      'Rapports, prescriptions et fichiers partagés';

  @override
  String get settingsInvoicesTitle => 'Factures';

  @override
  String get settingsInvoicesSubtitle => 'Gérez vos paiements et factures';

  @override
  String get settingsSupportCenterSubtitle =>
      'Support 24/7 et canaux de contact';

  @override
  String get settingsContactTitle => 'Contact';

  @override
  String get settingsContactSubtitle =>
      'Adresse, téléphone et options de contact';

  @override
  String get settingsProfileLoginRequired =>
      'Veuillez vous connecter pour changer votre photo de profil.';

  @override
  String get settingsProfilePhotoUpdated =>
      'Votre photo de profil a été mise à jour.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Erreur lors de la mise à jour de la photo: $error';
  }

  @override
  String get supportCenterTitle => 'Centre d\'Assistance';

  @override
  String get supportCenterHeroTitle => 'Ici pour vous 24/7';

  @override
  String get supportCenterHeroDescription =>
      'L\'équipe d\'assistance de Smile Hair Clinic est avec vous à chaque étape de votre parcours de traitement.';

  @override
  String get supportCenterQuickContact => 'Contact Rapide';

  @override
  String get supportCenterWhatsappTitle => 'Discuter via WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Parlez instantanément avec notre équipe d\'assistance en direct';

  @override
  String get supportCenterCallTitle => 'Appelez-nous';

  @override
  String get supportCenterEmailTitle => 'Envoyez-nous un e-mail';

  @override
  String get supportCenterKnowledgeBase => 'Centre de Connaissances';

  @override
  String get supportCenterFaqSubtitle =>
      'Questions avant et après l\'opération';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Base de Connaissances';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Tous nos articles sur la greffe de cheveux';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Support Rendez-vous et Traitement';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Obtenir des informations sur votre plan de traitement';

  @override
  String get supportCenterMessageSectionTitle => 'Envoyez-nous un message';

  @override
  String get supportCenterMessageLabel => 'Votre message';

  @override
  String get supportCenterMessageHint => 'Écrivez votre question ou demande...';

  @override
  String get supportCenterMessageEmpty => 'Veuillez écrire un message';

  @override
  String get supportCenterMessageSuccess =>
      'Nous avons reçu votre message. Nous vous répondrons bientôt.';

  @override
  String get supportCenterSendButton => 'Envoyer';

  @override
  String get treatmentHistoryTitle => 'Historique des Traitements';

  @override
  String get treatmentHistoryLoginRequired =>
      'Vous devez vous connecter pour voir cette fonctionnalité.';

  @override
  String get treatmentHistoryEmpty =>
      'Vous n\'avez pas encore d\'historique de traitement enregistré.';

  @override
  String get treatmentHistoryDatePending => 'Date en attente';

  @override
  String get treatmentHistoryDefaultType => 'Contrôle';

  @override
  String get treatmentHistoryDoctorPending => 'À assigner';

  @override
  String get treatmentHistoryStatusCompleted => 'Terminé';

  @override
  String get treatmentHistoryStatusCancelled => 'Annulé';

  @override
  String get treatmentHistoryStatusInProgress => 'En cours';

  @override
  String get treatmentHistoryStatusScheduled => 'Programmé';

  @override
  String get settingsAbout => 'À Propos';

  @override
  String get settingsAboutSubtitle =>
      'Version et informations de l\'application';

  @override
  String get settingsLogout => 'Déconnexion';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration =>
      'Restauration Premium des Cheveux';

  @override
  String get clinicProfileAbout => 'À Propos';

  @override
  String get clinicProfileDoctors => 'Médecins';

  @override
  String get clinicProfileGallery => 'Galerie';

  @override
  String get clinicProfileTreatments => 'Traitements';

  @override
  String get clinicProfileBookConsultation => 'Réserver une Consultation';

  @override
  String get clinicProfileAboutTitle => 'À Propos de Nous';

  @override
  String get clinicProfileEthicsTitle => 'Notre Éthique';

  @override
  String get clinicProfilePressTitle => 'Dans la Presse';

  @override
  String get clinicProfileContactTitle => 'Informations de Contact';

  @override
  String get clinicProfileDoctorsTitle => 'Nos Médecins';

  @override
  String get clinicProfileGalleryTitle => 'Galerie de Résultats';

  @override
  String get clinicProfileHairSurgeon => 'Chirurgien de Greffe de Cheveux';

  @override
  String get pastAnalysesTitle => 'Analyses Précédentes';

  @override
  String get faqTitle => 'Questions Fréquemment Posées';

  @override
  String get faqSubtitle => 'Pour vos questions';

  @override
  String get splashTagline => 'Spécialiste en Greffe de Cheveux et Esthétique';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Capture automatique depuis 5 angles critiques pour les cheveux et le cuir chevelu.\nAssurez-vous d\'être dans un environnement bien éclairé avant de commencer.';

  @override
  String get captureFlowStartCapture => 'Démarrer la Capture';

  @override
  String get captureFlowFaceDetection =>
      'Positionnez votre visage dans le cadre et regardez la caméra.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Position correcte, restez immobile ($seconds sec)';
  }

  @override
  String get captureFlowTurnRightMore =>
      'Tournez votre tête un peu plus vers la droite.';

  @override
  String get captureFlowTooMuchRight =>
      'Vous avez tourné un peu trop, ajustez légèrement vers la gauche.';

  @override
  String get captureFlowKeepHeadStill =>
      'Gardez votre tête immobile et ne bougez pas vos épaules.';

  @override
  String get captureFlowTurnLeftMore =>
      'Tournez votre tête un peu plus vers la gauche.';

  @override
  String get captureFlowTooMuchLeft =>
      'Vous avez tourné un peu trop, ajustez légèrement vers la droite.';

  @override
  String get captureFlowCaptured => 'capturé';

  @override
  String get captureFlowInitializingCamera => 'Initialisation de la caméra...';

  @override
  String get captureFlowCapturedPhotos => 'Photos Capturées';

  @override
  String get captureFlowEndSession => 'Terminer la Session';

  @override
  String get captureFlowReviewPhotos => 'Revoir les Photos';

  @override
  String get captureFlowPhotosCaptured => 'photos capturées';

  @override
  String get captureFlowSelected => 'Sélectionné';

  @override
  String get captureFlowContinueToAnalysis => 'Continuer vers l\'Analyse';

  @override
  String get captureFlowNewCapture => 'Démarrer une Nouvelle Capture';

  @override
  String get captureFlowPhotosFrom5Angles => 'Photos depuis 5 angles';

  @override
  String get captureStageFrontTitle => 'Vue de face';

  @override
  String get captureStageFrontBaseInstruction =>
      'Regardez directement la caméra et gardez la tête immobile.';

  @override
  String get captureStageFrontReminder =>
      'Gardez la tête droite et regardez la caméra.';

  @override
  String get captureStageRight45Title => 'Droite 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Tournez la tête de 45 degrés vers la droite.';

  @override
  String get captureStageRight45Reminder =>
      'Tournez la tête davantage vers la droite.';

  @override
  String get captureStageLeft45Title => 'Gauche 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Tournez la tête de 45 degrés vers la gauche.';

  @override
  String get captureStageLeft45Reminder =>
      'Tournez la tête davantage vers la gauche.';

  @override
  String get captureStageVertexTitle => 'Vue du dessus';

  @override
  String get captureStageVertexBaseInstruction =>
      'Tenez votre téléphone horizontalement au-dessus de votre tête.';

  @override
  String get captureStageVertexReminder =>
      'Tenez votre téléphone à plat au-dessus de votre tête.';

  @override
  String get captureStageDonorTitle => 'Zone donneuse';

  @override
  String get captureStageDonorBaseInstruction =>
      'Tournez la tête et tenez le téléphone derrière votre tête.';

  @override
  String get captureStageDonorReminder =>
      'Tenez le téléphone stable derrière votre tête.';

  @override
  String get photoCaptureFrontView => 'Vue de Face';

  @override
  String get photoCapturePositionHead =>
      'Positionnez votre tête dans le contour';

  @override
  String get photoCaptureFront => 'Face';

  @override
  String get photoCaptureTop => 'Dessus';

  @override
  String get photoCaptureLeft => 'Gauche';

  @override
  String get photoCaptureRight => 'Droite';

  @override
  String get chatOnline => 'En ligne';

  @override
  String get chatToday => '--- Aujourd\'hui ---';

  @override
  String get chatMessageHint => 'Tapez votre message...';

  @override
  String get chatQuickRepliesAppointment => 'Réserver un rendez-vous';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Mon plan de traitement';

  @override
  String get chatQuickRepliesFollowup => 'Demander un suivi';

  @override
  String get chatQuickRepliesPriceInfo => 'Informations sur les prix';

  @override
  String progressPatientIdParam(String id) {
    return 'ID Patient : $id';
  }

  @override
  String get progressStatistics => 'Statistiques';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Mois Post-Opération';
  }

  @override
  String get progressProcedureDay => 'Jour de la Procédure';

  @override
  String get progressInitialConsultation => 'Consultation Initiale';

  @override
  String get progressUploadPhoto => 'Télécharger une Nouvelle Photo';

  @override
  String get analysisCaptureAndAnalyze => 'Capturer et Analyser';

  @override
  String get analysisPastAnalyses => 'Analyses Précédentes';

  @override
  String get analysisAnalysisDate1 => '15 octobre 2023';

  @override
  String get analysisAnalysisDesc1 =>
      'Légère perte de densité dans la zone de la couronne';

  @override
  String get analysisAnalysisDate2 => '12 juillet 2023';

  @override
  String get analysisAnalysisDesc2 =>
      'Signes d\'inflammation sur le cuir chevelu';

  @override
  String get analysisAnalysisDate3 => '5 avril 2023';

  @override
  String get analysisAnalysisDesc3 =>
      'La santé générale du cuir chevelu est bonne';

  @override
  String get analysisAnalysisDate4 => '20 janvier 2023';

  @override
  String get analysisAnalysisDesc4 => 'Analyse initiale pour traitement';

  @override
  String get faqQuestion1 =>
      'Combien de temps dure la procédure de greffe de cheveux?';

  @override
  String get faqAnswer1 =>
      'La procédure de greffe de cheveux prend généralement 4-8 heures selon le nombre de greffes à transplanter. Comme une anesthésie locale est utilisée pendant la procédure, le patient ne ressent pas de douleur.';

  @override
  String get faqQuestion2 =>
      'Quand puis-je retourner à la vie normale après la greffe de cheveux?';

  @override
  String get faqAnswer2 =>
      'Vous pouvez faire des activités légères 2-3 jours après la greffe de cheveux. Il est recommandé d\'attendre 2 semaines pour les sports intenses et les activités physiques. Le retour au travail est généralement possible 3-5 jours plus tard.';

  @override
  String get faqQuestion3 =>
      'Quand les cheveux greffés commencent-ils à pousser?';

  @override
  String get faqAnswer3 =>
      'Les cheveux greffés tombent dans les premières 2-3 semaines (chute de choc). Les nouveaux cheveux commencent à pousser 3-4 mois plus tard et les résultats complets sont visibles dans les 6-12 mois.';

  @override
  String get faqQuestion4 =>
      'La procédure de greffe de cheveux est-elle douloureuse?';

  @override
  String get faqAnswer4 =>
      'Comme une anesthésie locale est utilisée pendant la procédure, aucune douleur n\'est ressentie. Il peut y avoir une légère douleur après la procédure, mais cela peut être contrôlé avec des analgésiques.';

  @override
  String get faqQuestion5 =>
      'Quel est le taux de réussite de la greffe de cheveux?';

  @override
  String get faqAnswer5 =>
      'La greffe de cheveux a un taux de réussite très élevé, généralement de 95 à 98%. Le succès dépend de la santé du patient, de la qualité de la zone donneuse et du respect des instructions de soins postopératoires.';

  @override
  String get faqQuestion6 =>
      'Les femmes peuvent-elles subir une greffe de cheveux?';

  @override
  String get faqAnswer6 =>
      'Oui, les femmes peuvent subir une greffe de cheveux. La perte de cheveux de type féminin est courante et peut être traitée par des procédures de greffe de cheveux. Une consultation est nécessaire pour déterminer si le patient est un candidat approprié.';

  @override
  String get faqQuestion7 =>
      'Combien de greffons sont nécessaires pour une greffe de cheveux?';

  @override
  String get faqAnswer7 =>
      'Le nombre de greffons nécessaires dépend de l\'étendue de la perte de cheveux et de la densité souhaitée. Généralement, 1 500 à 3 000 greffons sont utilisés pour une perte de cheveux modérée, tandis que 3 000 à 5 000 greffons peuvent être nécessaires pour une perte de cheveux importante.';

  @override
  String get faqQuestion8 =>
      'Y a-t-il une limite d\'âge pour la greffe de cheveux?';

  @override
  String get faqAnswer8 =>
      'Il n\'y a pas de limite d\'âge stricte, mais la procédure est généralement recommandée pour les patients de plus de 25 ans lorsque le modèle de perte de cheveux est plus stable. Chaque cas est évalué individuellement.';

  @override
  String get faqQuestion9 =>
      'Quel est le temps de récupération après la greffe de cheveux?';

  @override
  String get faqAnswer9 =>
      'La plupart des patients peuvent retourner au travail dans 3 à 5 jours. Les croûtes tombent généralement dans 7 à 10 jours. La récupération complète et les activités normales peuvent reprendre après 2 semaines.';

  @override
  String get faqQuestion10 =>
      'Les résultats de la greffe de cheveux sont-ils permanents?';

  @override
  String get faqAnswer10 =>
      'Oui, les cheveux transplantés sont permanents car ils sont prélevés dans la zone donneuse qui est génétiquement résistante à la perte de cheveux. Les cheveux transplantés continueront à pousser naturellement pour le reste de votre vie.';

  @override
  String get pastAnalysesListView => 'Vue Liste';

  @override
  String get pastAnalysesGridView => 'Vue Grille';

  @override
  String get pastAnalysesDetailedView => 'Vue Détaillée';

  @override
  String get pastAnalysesDensityModerate => 'Densité : Modérée';

  @override
  String get pastAnalysesDensityLow => 'Densité : Faible';

  @override
  String get privacyPolicyTitle =>
      'Politique de Traitement et de Protection des Données Personnelles';

  @override
  String get privacyPolicyDocumentDate => 'Date du Document:';

  @override
  String get privacyPolicyRevisionDate => 'Date de Révision:';

  @override
  String get privacyPolicyRevisionNumber => 'Numéro de Révision:';

  @override
  String get privacyPolicySection1 => 'I. INTRODUCTION';

  @override
  String get privacyPolicySection1A => 'A. Objet et Portée';

  @override
  String get privacyPolicySection1AContent =>
      'Cette Politique régit les principes adoptés par Smile Hair Clinic concernant la protection et le traitement des données personnelles.\n\nDans le cadre de cette Politique, Smile Hair Clinic fournit des explications concernant les activités de traitement des données personnelles et les systèmes adoptés pour la protection des données personnelles. Cela comprend l\'information et la garantie de transparence pour les Personnes Concernées, principalement y compris les Destinataires de Produits ou Services, les Employés et Candidats Employés, les Clients Potentiels, les Actionnaires, les Visiteurs, les Participants, les Fournisseurs et Tiers, l\'établissement et la garantie de normes dans la gestion des données personnelles; la détermination et le soutien des objectifs et obligations organisationnels; l\'établissement de mécanismes de contrôle compatibles avec des niveaux de risque acceptables, la conformité aux principes et règles établis par les conventions internationales, la Constitution, les lois, les règlements, les contrats et autres législations concernant la protection des données personnelles, et la garantie de la meilleure protection des droits et libertés fondamentaux de la Personne Concernée. De plus, cette Politique couvre tous les systèmes et environnements d\'enregistrement de données physiques et électroniques utilisés pour traiter les données personnelles et les données personnelles de catégorie spéciale automatiquement ou dans le cadre d\'un système d\'enregistrement de données par des moyens non automatiques.';

  @override
  String get privacyPolicySection1B => 'B. Définitions';

  @override
  String get photoAnalysisTitle => 'Analyse de Photo';

  @override
  String photosUploadedCount(String count) {
    return '$count photos téléchargées';
  }

  @override
  String get autoAnalysisStarting =>
      '5 photos téléchargées. Démarrage de l\'analyse automatique...';

  @override
  String stageUploaded(String stage) {
    return 'Angle $stage téléchargé';
  }

  @override
  String stageCaptured(String stage) {
    return 'Angle $stage capturé';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Une erreur s\'est produite lors du chargement de la photo: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Une erreur s\'est produite lors du chargement de plusieurs photos: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Une erreur s\'est produite lors de la capture de la photo: $error';
  }

  @override
  String get imageSourceTitle => 'Source de Photo';

  @override
  String get imageSourceCamera => 'Caméra';

  @override
  String get imageSourceGallery => 'Galerie';

  @override
  String get imageSourceMultiGallery => 'Sélectionner Plusieurs de la Galerie';

  @override
  String get promptNoPhotosForAnalysis =>
      'Veuillez d\'abord télécharger une photo. Appuyez sur le bouton 📷 pour télécharger.';

  @override
  String get analyzingPhotos => 'Vos photos sont en cours d\'analyse...';

  @override
  String get visualAnalysisHeader => '📸 Analyse Visuelle - Ce Que Je Vois:';

  @override
  String get importantWarningHeader => '⚠️ AVERTISSEMENT IMPORTANT:';

  @override
  String get differentPersonsDetected =>
      'Différentes personnes ont été détectées sur les photos! Toutes les photos doivent appartenir à la même personne.';

  @override
  String get pleaseCaptureSamePerson =>
      'Veuillez prendre des photos de la même personne sous 5 angles différents.';

  @override
  String get detectedAnglesHeader => '🔍 Angles Détectés:';

  @override
  String get analysisCompleted => '✅ Analyse Terminée!';

  @override
  String get allPhotosLookGood => 'Toutes les photos semblent appropriées.';

  @override
  String get savedToFirebase =>
      '✅ Les photos ont été enregistrées sur Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'ID d\'Analyse: $id';
  }

  @override
  String get savedLocationLabel =>
      'Emplacement Enregistré: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Résultat de l\'Analyse';

  @override
  String get retakeRequiredAngles => '❌ Angles qui doivent être repris:';

  @override
  String get errorDetailsHeader => 'Détails de l\'Erreur:';

  @override
  String get retakeTheseAnglesQuestion => 'Voulez-vous reprendre ces angles?';

  @override
  String get retakeFirstInvalidQuestion =>
      'Voulez-vous reprendre le premier angle invalide?';

  @override
  String get retake => 'Reprendre';

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
  String get uploadAndAnalyze => 'Télécharger et Analyser';

  @override
  String get captureWithFaceDetection => 'Capturer avec Détection Faciale';

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
      'Activer le Rappel de Médicaments Quotidien';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Accès Rapide';

  @override
  String get quickActions => 'Actions Rapides';

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
  String get noUpcomingAppointments => 'Aucun rendez-vous à venir';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Consultation Gratuite';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Nom Complet';

  @override
  String get fullNameHint => 'Nom Prénom';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Écrivez votre message ici...';

  @override
  String get or => 'ou';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'À Propos de Nous';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'Nos Valeurs';

  @override
  String get professionalism => 'Professionnalisme';

  @override
  String get professionalismDescription =>
      'Nos médecins experts certifiés internationalement dans leur domaine';

  @override
  String get patientSatisfaction => 'Satisfaction du Patient';

  @override
  String get patientSatisfactionDescription =>
      'Le bonheur de nos patients est toujours notre priorité';

  @override
  String get medicalEducation => 'Formation Médicale';

  @override
  String get medicalEducationDescription =>
      'Chaque membre de notre équipe est composé de professionnels ayant une formation médicale';

  @override
  String get internationalService => 'Service International';

  @override
  String get internationalServiceDescription =>
      'Au service de nos patients du monde entier';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Opérations\nRéussies';

  @override
  String get patientsFromCountries => 'Patients de\nPays';

  @override
  String get expertDoctors => 'Docteurs\nExperts';

  @override
  String get patientSatisfactionRate => 'Satisfaction\ndu Patient';

  @override
  String get experience => 'Expérience';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'À Propos';

  @override
  String get expertiseAreas => 'Domaines d\'Expertise';

  @override
  String get interview => 'Entretien';

  @override
  String get contactUs => 'Contactez-nous';

  @override
  String get call => 'Appeler';

  @override
  String get workingHours => 'Heures de Travail';

  @override
  String get mondayFriday => 'Lundi - Vendredi';

  @override
  String get saturday => 'Samedi';

  @override
  String get sunday => 'Dimanche';

  @override
  String get closed => 'Fermé';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'Tout';

  @override
  String get unread => 'Non lu';

  @override
  String get scheduled => 'Programmé';

  @override
  String get markAllAsRead => 'Tout marquer comme lu';

  @override
  String get noNotificationsYet => 'Pas encore de notifications';

  @override
  String get newNotificationsWillAppearHere =>
      'Les nouvelles notifications apparaîtront ici';

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
    return 'Caméra introuvable sur l\'appareil : $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'L\'application téléphone ne peut pas être ouverte';

  @override
  String get emailAppCannotOpen =>
      'L\'application e-mail ne peut pas être ouverte';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Nos Docteurs';

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
  String get doctor => 'Docteur';

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
  String get yourDoctor => 'Votre Médecin';

  @override
  String get appointment => 'Rendez-vous';

  @override
  String get soon => 'bientôt';

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
  String get front => 'Face';

  @override
  String get right45 => 'Droite 45°';

  @override
  String get left45 => 'Gauche 45°';

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
    return 'Le message n\'a pas pu être envoyé: $error';
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
  String get noMessages => 'Pas encore de messages';

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
  String get pending => 'En attente';

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
  String get unknownDate => 'Date inconnue';

  @override
  String get january => 'Janvier';

  @override
  String get february => 'Février';

  @override
  String get march => 'Mars';

  @override
  String get april => 'Avril';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juin';

  @override
  String get july => 'Juillet';

  @override
  String get august => 'Août';

  @override
  String get september => 'Septembre';

  @override
  String get october => 'Octobre';

  @override
  String get november => 'Novembre';

  @override
  String get december => 'Décembre';

  @override
  String get analysisCompletedShort => 'Analyse terminée!';

  @override
  String get retakeDialogTitle => 'Reprise Requise';

  @override
  String get retakeDialogBody =>
      'L\'analyse IA indique que les angles suivants doivent être repris:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'Voulez-vous reprendre le premier angle invalide?';

  @override
  String get noExistingPhotosFound => 'Aucune photo existante trouvée';

  @override
  String get noValidPhotosToUpload => 'Aucune photo valide à télécharger';

  @override
  String errorOccurred(String error) {
    return 'Une erreur s\'est produite: $error';
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
  String get noSavedAnalyses => 'Pas encore d\'analyses enregistrées.';

  @override
  String welcomeGreeting(String name) {
    return 'Bienvenue, $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'Vous devez vous connecter pour envoyer des messages';

  @override
  String get chatWithMyDoctor => 'Chat with my doctor';

  @override
  String get analysisSavedSuccessfully => 'Analyse enregistrée avec succès!';

  @override
  String get allPhotosAnalyzedAndSaved =>
      'Toutes les photos analysées et enregistrées avec succès.';

  @override
  String get reanalyzing => 'Re-analyzing...';

  @override
  String get someAnglesNotCapturedCorrectly =>
      'Certains angles n\'ont pas été capturés correctement';

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
      'Toutes les notifications ont été marquées comme lues';

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
  String get contactEmail => 'E-mail';

  @override
  String get contactPhone => 'Téléphone';

  @override
  String get contactWhatsApp => 'Conseiller WhatsApp';

  @override
  String get patientCareGuideTitle => 'Guide de Soins du Patient';

  @override
  String get planningTab => 'Planification';

  @override
  String get operationTab => 'Opération';

  @override
  String get recoveryTab => 'Récupération';

  @override
  String get resourcesTab => 'Ressources';

  @override
  String get personalizedPlanning => 'Planification Personnalisée';

  @override
  String get contactAndQuickSupport => 'Contact et Support Rapide';

  @override
  String get preOperationPreparation => 'Préparation Pré-Opération';

  @override
  String get operationDayFlow => 'Déroulement de la Journée d\'Opération';

  @override
  String get operationDayExperience => 'Expérience du Jour de l\'Opération';

  @override
  String get sterilizationAndHygieneStandards =>
      'Normes de Stérilisation et d\'Hygiène';

  @override
  String get recoveryJourney => 'Parcours de Récupération';

  @override
  String get postOperationCare => 'Soins Post-Opération';

  @override
  String get hairWashingProtocol => 'Protocole de Lavage des Cheveux';

  @override
  String get knowledgeBase => 'Base de Connaissances';

  @override
  String get frequentlyAskedQuestions => 'Questions Fréquemment Posées';

  @override
  String get visualGuide => 'Guide Visuel';

  @override
  String get tapToSeeDetails => 'Appuyez pour voir les détails';

  @override
  String get connectionCannotOpen =>
      'La connexion n\'a pas pu être ouverte. Veuillez vérifier votre connexion Internet ou vous assurer que l\'application est installée.';

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
  String get message => 'Message';

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
  String get examplePhotoFrontTitle => 'Exemple d\'angle frontal';

  @override
  String get examplePhotoFrontInstructions =>
      '• Regardez droit dans la caméra\n• Gardez le menton droit, la tête droite\n• Les yeux doivent regarder la caméra\n• Le visage doit être entièrement visible';

  @override
  String get examplePhotoRight45Title => 'Exemple d\'angle droit 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• Tournez votre tête nettement vers la DROITE (~70–90°)\n• Gardez le menton droit, la tête droite\n• La joue droite et la tempe doivent être visibles\n• Les épaules ne doivent pas bouger';

  @override
  String get examplePhotoLeft45Title => 'Exemple d\'angle gauche 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• Tournez votre tête nettement vers la GAUCHE (~70–90°)\n• Gardez le menton droit, la tête droite\n• La joue gauche et la tempe doivent être visibles\n• Les épaules ne doivent pas bouger';

  @override
  String get examplePhotoVertexTitle => 'Exemple d\'angle du vertex';

  @override
  String get examplePhotoVertexInstructions =>
      '• Tenez le téléphone horizontalement et à plat\n• L\'écran doit être tourné vers le haut\n• Placez le téléphone au-dessus de votre tête\n• Tout le cuir chevelu doit être visible';

  @override
  String get examplePhotoDonorTitle => 'Exemple de zone donneuse';

  @override
  String get examplePhotoDonorInstructions =>
      '• Tenez le téléphone derrière votre tête\n• L\'arrière de la tête et la nuque doivent être visibles\n• Gardez le téléphone stable\n• L\'éclairage doit être suffisant';

  @override
  String get camera => 'Caméra';

  @override
  String get gallery => 'Galerie';

  @override
  String get deleteForMe => 'Supprimer pour moi';

  @override
  String get messageDeleted => 'Message supprimé';

  @override
  String get deleteForEveryone => 'Supprimer pour tout le monde';

  @override
  String get deleteMessage => 'Supprimer le Message';

  @override
  String get deleteMessageReadWarning =>
      'Ce message a été lu par le destinataire. Voulez-vous toujours le supprimer?';

  @override
  String get deleteMessageConfirm =>
      'Ce message sera supprimé pour tout le monde. Êtes-vous sûr?';

  @override
  String get messageDeletedForEveryone => 'Message supprimé pour tout le monde';

  @override
  String get userNotLoggedIn => 'L\'utilisateur n\'est pas connecté';

  @override
  String get messagesLoadingError =>
      'Une erreur s\'est produite lors du chargement des messages';

  @override
  String get loadingMessages => 'Chargement des messages...';

  @override
  String get startConversation =>
      'Commencez une conversation en envoyant un message';

  @override
  String get loadOlderMessages => 'Charger les anciens messages';

  @override
  String get sendPhoto => 'Envoyer une Photo';

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
  String get needLoginForAnalysis => 'Vous devez vous connecter pour analyser';

  @override
  String openCaptureFlowError(String error) {
    return 'Une erreur s\'est produite lors de l\'ouverture de l\'écran de capture: $error';
  }

  @override
  String get sessionExpired =>
      'Votre session a expiré. Veuillez vous reconnecter.';

  @override
  String get photosAnalyzedAndSaved =>
      'Photos analysées et enregistrées avec succès!';

  @override
  String get photoNotFoundForAnalysis => 'Aucune photo trouvée pour l\'analyse';

  @override
  String get noValidPhotosFound => 'Aucune photo valide trouvée';

  @override
  String get analysisPreparing => 'Préparation des photos...';

  @override
  String get photosUploading => 'Téléchargement des photos...';

  @override
  String get errorUploadingPhotos => 'Erreur lors du téléchargement des photos';

  @override
  String get geminiChecking => 'Vérification de la connexion API Gemini...';

  @override
  String get geminiFailed =>
      'La connexion API Gemini a échoué. Vérifiez votre connexion Internet.';

  @override
  String get aiAnalyzing => 'Réalisation de l\'analyse IA...';

  @override
  String get someAnglesNeedRetake => 'Certains angles doivent être repris...';

  @override
  String get analysisSaved => 'Analyse enregistrée avec succès!';

  @override
  String get analysisCompletedSuccessfully => 'Analyse terminée avec succès!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count angles doivent être repris...';
  }

  @override
  String get errorDuringAnalysis =>
      'Une erreur s\'est produite lors de l\'analyse';

  @override
  String get geminiApiError =>
      'Erreur de connexion API Gemini. Vérifiez votre connexion Internet.';

  @override
  String get firebaseError =>
      'Erreur de connexion Firebase. Veuillez réessayer.';

  @override
  String get photoProcessingError =>
      'Erreur de traitement de photo. Veuillez réessayer.';

  @override
  String get authErrorLoginAgain =>
      'Erreur d\'autorisation. Veuillez vous reconnecter.';

  @override
  String get analysisSuccessfulTitle => 'Analyse Réussie';

  @override
  String get analysisResultsTitle => 'Résultats de l\'Analyse';

  @override
  String get detailedAnalysisHeader => 'Analyse Détaillée:';

  @override
  String get retakeRequiredAnglesHeader => 'Angles à Reprendre:';

  @override
  String dialogError(String error) {
    return 'Une erreur s\'est produite lors de l\'ouverture du dialogue: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Photo de référence non trouvée';

  @override
  String get noPhotosToUpdate => 'Aucune photo à mettre à jour';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Une erreur s\'est produite lors de l\'analyse: $error';
  }

  @override
  String retakeError(String error) {
    return 'Une erreur s\'est produite lors de la reprise: $error';
  }

  @override
  String get aiSupport => 'Support IA';

  @override
  String get myPhotos => 'Mes Photos';

  @override
  String get photoAnalysisChatbot => 'Chatbot d\'Analyse Photo';

  @override
  String get disableMedicationReminder => 'Désactiver le Rappel de Médicaments';

  @override
  String get medicationReminderDisabled =>
      'Le rappel quotidien de médicaments a été désactivé';

  @override
  String get medicationTime => 'Heure des Médicaments';

  @override
  String get selectMedicationReminderTime =>
      'Sélectionnez l\'heure de votre rappel quotidien de médicaments';

  @override
  String get selectMedicationTime => 'Sélectionner l\'Heure des Médicaments';

  @override
  String medicationReminderSetAt(String time) {
    return 'Rappel quotidien de médicaments défini pour $time';
  }

  @override
  String get noDateInfo => 'Aucune information de date';

  @override
  String get invalidDate => 'Date invalide';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get yesterday => 'Hier';

  @override
  String get valid => 'Valide';

  @override
  String get samePerson => 'Même personne';

  @override
  String get differentPersonSuspicion => 'Suspicion de personne différente';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get profileSettings => 'Profile Settings';

  @override
  String get specialty => 'Specialty';

  @override
  String get hairTransplantTitle => 'Greffe de Cheveux';

  @override
  String get hairTransplantSectionCount => 'Sections';

  @override
  String get hairTransplantVideo => 'Vidéo';

  @override
  String get hairTransplantFreeConsultation =>
      'Obtenir une Consultation Gratuite';

  @override
  String get hairTransplantWatchVideo => 'Regarder la Vidéo';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Cliquez pour regarder sur YouTube';

  @override
  String get photosSavedSuccessfully => 'Photos enregistrées avec succès!';

  @override
  String errorDuringRetake(String error) {
    return 'Une erreur s\'est produite lors de la reprise: $error';
  }

  @override
  String errorOpeningCaptureScreen(String error) {
    return 'Erreur lors de l\'ouverture de l\'écran de capture: $error';
  }

  @override
  String errorDuringAnalysisShort(String error) {
    return 'Erreur lors de l\'analyse: $error';
  }

  @override
  String get myDocuments => 'Mes Documents';

  @override
  String get loginRequiredForDocuments =>
      'Vous devez vous connecter pour voir les documents';

  @override
  String get noDocumentsYet => 'Aucun document pour le moment';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Une erreur s\'est produite:\n$error';
  }

  @override
  String get datePending => 'En attente';

  @override
  String get chatSupportWelcomeMessage =>
      'Bonjour! Je suis votre assistant IA. Comment puis-je vous aider aujourd\'hui?';

  @override
  String get newChat => 'Nouveau Chat';

  @override
  String get chatSupportAiAssistantName => 'Assistant IA';

  @override
  String get historyTooltip => 'Historique';

  @override
  String get typingIndicator => 'L\'IA tape...';

  @override
  String get chatHistoryTitle => 'Historique des Chats';

  @override
  String get noSavedChats => 'Aucun chat enregistré';

  @override
  String genericErrorTryAgain(String error) {
    return 'Une erreur s\'est produite. Veuillez réessayer.\nErreur: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp n\'a pas pu être ouvert. Veuillez vous assurer que l\'application WhatsApp est installée.';

  @override
  String whatsappOpenError(String error) {
    return 'Une erreur s\'est produite lors de l\'ouverture de WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Une erreur s\'est produite lors de l\'ouverture de l\'écran de capture: $error';
  }

  @override
  String get retakeAnalyzing => 'La photo retirée est en cours d\'analyse...';

  @override
  String get autoAnalysisOn => 'Analyse Automatique: Activée';

  @override
  String get autoAnalysisOff => 'Analyse Automatique: Désactivée';

  @override
  String get clearPhotosTooltip => 'Effacer les photos';

  @override
  String get messageHintAnalyze =>
      'Tapez votre message ou écrivez \"Analyser\"...';

  @override
  String get send => 'Envoyer';

  @override
  String get aiAssistantName => 'Assistant d\'Analyse IA';

  @override
  String get expertTeam => 'Équipe d\'Experts';

  @override
  String get expertTeamDescription =>
      'Notre équipe est composée de spécialistes expérimentés en chirurgie de greffe capillaire.';

  @override
  String get comingSoon => 'Bientôt';

  @override
  String get loginToSendMessage =>
      'Veuillez vous connecter pour envoyer un message';

  @override
  String get doctorEmailMissing => 'L\'e-mail du médecin est manquant';

  @override
  String doctorNotFound(String name) {
    return 'Médecin $name introuvable';
  }

  @override
  String get messagingComingSoon => 'Fonction de messagerie à venir';

  @override
  String get years => 'ans';

  @override
  String get watchWashingVideo => 'Regarder la Vidéo de Lavage';

  @override
  String get preCareTip1Title => 'Choisissez le bon chirurgien';

  @override
  String get preCareTip1Body =>
      'La procédure Sapphire FUE nécessite un chirurgien expérimenté et une équipe multidisciplinaire. Travaillez avec des médecins qui expliquent vos attentes de manière réaliste, planifient l\'opération de bout en bout et appliquent les protocoles Smile Hair.';

  @override
  String get preCareTip2Title => 'Partagez vos antécédents médicaux';

  @override
  String get preCareTip2Body =>
      'Partagez vos maladies chroniques, médicaments réguliers et allergies avec l\'équipe sans rien cacher. Cela minimise les risques qui peuvent survenir pendant l\'anesthésie et la chirurgie.';

  @override
  String get preCareTip3Title => 'Anticoagulants et processus d\'approbation';

  @override
  String get preCareTip3Body =>
      'Arrêtez l\'aspirine ou des anticoagulants similaires au moins une semaine avant la date de l\'opération avec l\'approbation de votre médecin prescripteur. Vous pouvez reprendre l\'utilisation deux jours après la procédure.';

  @override
  String get preCareTip4Title => 'Dépistage des infections';

  @override
  String get preCareTip4Body =>
      'Gardez vos résultats de tests Hépatite B/C et VIH à jour. Les cliniques sans conditions appropriées de salle d\'opération ne peuvent pas effectuer d\'opérations pour ces infections, afin que votre voyage ne soit pas gaspillé.';

  @override
  String get preCareTip5Title => 'Compléments et vitamines';

  @override
  String get preCareTip5Body =>
      'Les compléments contenant les vitamines B et E augmentent le saignement; arrêtez-les une semaine avant la procédure. Si nécessaire, votre médecin planifiera des traitements de soutien.';

  @override
  String get preCareTip6Title => 'Alcool et tabac';

  @override
  String get preCareTip6Body =>
      'Arrêtez l\'alcool au moins une semaine avant l\'opération et ne le consommez pas pendant 14 jours après la procédure. Éloignez-vous du tabac 12 heures avant et pendant deux semaines après l\'opération, car il perturbe la circulation sanguine.';

  @override
  String get preCareTip7Title => 'Plan de bagages et vêtements';

  @override
  String get preCareTip7Body =>
      'Choisissez des vêtements à boutons ou à fermeture éclair pour le haut du corps. Les vêtements à col serré peuvent endommager les greffes. Préparez un grand sac qui peut transporter le kit de soins donné après l\'opération.';

  @override
  String get preCareTip8Title => 'Repos et hygiène';

  @override
  String get preCareTip8Body =>
      'Dormez bien le jour de l\'opération, prenez un petit-déjeuner nutritif et douchez-vous avant de venir à la clinique. Un cuir chevelu propre réduit le risque d\'infection.';

  @override
  String get postCareTip1Title => 'Protégez les greffes';

  @override
  String get postCareTip1Body =>
      'Pendant les 7 premiers jours, faites attention à ne pas vous cogner la tête. Dormez sur le dos en utilisant un oreiller pour le cou et empêchez les greffes de frotter contre l\'oreiller.';

  @override
  String get postCareTip2Title => 'Première nuit et jours suivants';

  @override
  String get postCareTip2Body =>
      'Passez définitivement la première nuit après l\'opération en vous reposant. Si vous devez sortir, utilisez un parapluie qui protège du soleil et de la pluie.';

  @override
  String get postCareTip3Title => 'Respectez le plan de médication';

  @override
  String get postCareTip3Body =>
      'Utilisez les antibiotiques, analgésiques, anti-inflammatoires et spray Panthenol exactement comme prescrit. Assurez-vous de comprendre l\'ordonnance et les instructions d\'utilisation avant de quitter l\'équipe de la clinique.';

  @override
  String get postCareTip4Title => 'Hydratation et sprays';

  @override
  String get postCareTip4Body =>
      'Utilisez uniquement le spray isotonique/Panthenol donné jusqu\'au premier lavage. Appliquez une crème antibiotique sur la zone donneuse pendant les 5-7 premiers jours.';

  @override
  String get postCareTip5Title => 'Protocole de lavage';

  @override
  String get postCareTip5Body =>
      'Le premier lavage est effectué à la clinique 48 heures plus tard. Chaque jour après, appliquez la mousse doucement avec des mouvements de tapotement, utilisez de l\'eau tiède à faible pression et séchez avec des serviettes en papier.';

  @override
  String get postCareTip6Title => 'Croûtes et perte de choc';

  @override
  String get postCareTip6Body =>
      'À partir du jour 10, éliminez les croûtes avec une pression légère. La perte de choc vécue entre les semaines 2-4 est normale; les nouveaux cheveux deviennent visibles à partir du mois 3.';

  @override
  String get postCareTip7Title => 'Activité et sports';

  @override
  String get postCareTip7Body =>
      'Ne faites pas de sport pendant les deux premières semaines, vous pouvez faire des promenades légères après 3-4 jours. Évitez la piscine, le sauna et les activités nécessitant une transpiration intense pendant au moins 1 mois.';

  @override
  String get postCareTip8Title => 'Plaintes de confort';

  @override
  String get postCareTip8Body =>
      'S\'il y a une sensation de brûlure ou de douleur dans la zone donneuse, utilisez une crème contenant des stéroïdes avec l\'approbation de la clinique. Appliquez des compresses froides brièvement pour le gonflement.';

  @override
  String get operationDayTimeline1Title => 'Hébergement et transfert';

  @override
  String get operationDayTimeline1Body =>
      'L\'équipe Smile Gentle Care organise un hébergement hôtelier 4-5 étoiles. Tous les transports sont planifiés de l\'arrivée à l\'hôtel aux transferts vers la clinique.';

  @override
  String get operationDayTimeline2Title => 'Support multilingue';

  @override
  String get operationDayTimeline2Body =>
      'Des traducteurs professionnels sont fournis pour les patients de différents pays du monde. Vous êtes informé dans votre propre langue à chaque étape du processus.';

  @override
  String get operationDayTimeline3Title => 'Préparation préopératoire';

  @override
  String get operationDayTimeline3Body =>
      'Les formulaires d\'information sont signés, votre ligne de cheveux est dessinée, des photos sont prises et les tests VIH/VHB/VHC et les signes vitaux sont vérifiés.';

  @override
  String get operationDayTimeline4Title => 'Flux d\'opération';

  @override
  String get operationDayTimeline4Body =>
      'Étapes de la procédure de 6-8 heures: planification, récolte de greffes, ouverture de canaux et implantation. Vos médecins partagent tout le processus avec vous.';

  @override
  String get operationDayTimeline5Title => 'Déjeuner et préférences spéciales';

  @override
  String get operationDayTimeline5Body =>
      'Les menus végétariens, halal ou casher sont préparés sur demande. Des options de TV intelligente et de musique sont disponibles dans les zones d\'opération.';

  @override
  String get operationDayTimeline6Title => 'Soins le lendemain';

  @override
  String get operationDayTimeline6Body =>
      'Vous venez à la clinique pour le changement de bandage, le contrôle des plaies et la formation au premier lavage. Ensuite, le processus est surveillé avec un suivi photo numérique.';

  @override
  String get sterilizationMeasure1 =>
      'Des tests de fuite sous vide quotidiens sont effectués pour vérifier l\'étanchéité des stérilisateurs.';

  @override
  String get sterilizationMeasure2 =>
      'Une vérification quotidienne est effectuée avec le test Bowie-Dick pour s\'assurer que la vapeur atteint toutes les surfaces également.';

  @override
  String get sterilizationMeasure3 =>
      'Les tests de lavage ultrasoniques documentent que nous nettoyons les micro résidus.';

  @override
  String get sterilizationMeasure4 =>
      'Des tests d\'indicateurs biologiques sont effectués tous les 15 jours et il est rapporté qu\'il n\'y a pas de reproduction.';

  @override
  String get sterilizationMeasure5 =>
      'Les instruments stériles et utilisés sont stockés séparément dans des boîtes verrouillées; la contamination croisée est empêchée.';

  @override
  String get sterilizationMeasure6 =>
      'Chaque ensemble est suivi avec des étiquettes de numéro d\'autoclave, date et date d\'expiration.';

  @override
  String get sterilizationMeasure7 =>
      'Tous les processus sont effectués selon le Guide DAS du Ministère de la Santé, les normes OMS et AAMI ST79.';

  @override
  String get washStep1 =>
      'Ne lavez pas vos cheveux pendant les 36-48 premières heures après l\'opération; attendez le premier lavage qui sera effectué à la clinique.';

  @override
  String get washStep2 =>
      'Appliquez la lotion ou la mousse sur les zones donneuse et receveuse avec le bout des doigts en mouvements de tapotement.';

  @override
  String get washStep3 =>
      'Moussez le shampooing et étalez-le doucement sur la zone transplantée avec des touches verticales; évitez les mouvements circulaires.';

  @override
  String get washStep4 =>
      'Utilisez de l\'eau tiède à faible pression. Pendant les 14 premiers jours, il est plus sûr de verser de l\'eau avec un bol au lieu d\'une pomme de douche.';

  @override
  String get washStep5 =>
      'Séchez la zone de greffe en appuyant doucement avec des serviettes en papier, vous pouvez sécher la zone donneuse avec une serviette normale.';

  @override
  String get washStep6 =>
      'Si vous devez utiliser un sèche-cheveux, utilisez-le uniquement en mode froid et à distance.';

  @override
  String get faq1Question => 'Combien de temps dure la récupération?';

  @override
  String get faq1Answer =>
      'Les deux premières semaines sont une période sensible; les cheveux passent par différentes étapes pendant 6-12 mois. Des résultats significatifs sont vus au mois 6, la densité finale aux mois 12-18.';

  @override
  String get faq2Question =>
      'Comment doivent être le bandage et le programme de sommeil?';

  @override
  String get faq2Answer =>
      'Un bandage élastique peut être appliqué pour réduire le gonflement dans la zone du front. Dormez sur le dos avec un oreiller pour le cou en position légèrement surélevée pendant les 7-10 premiers jours.';

  @override
  String get faq3Question => 'Douche, lavage et utilisation de produits';

  @override
  String get faq3Answer =>
      'Ne mouillez pas vos cheveux pendant les deux premiers jours. Après 48 heures, lavez une fois par jour avec un shampooing médical après le premier lavage à la clinique; gardez le temps de douche court, réduisez la vapeur.';

  @override
  String get faq4Question =>
      'Quand puis-je sécher, peigner ou teindre mes cheveux?';

  @override
  String get faq4Answer =>
      'Seul le séchage naturel est recommandé dans le premier mois. Vous pouvez peigner la zone donneuse mais ne touchez pas la zone de transplantation pendant 2 semaines. Éloignez-vous des teintures chimiques pendant 6-8 semaines.';

  @override
  String get faq5Question => 'Tabac, alcool et exercice';

  @override
  String get faq5Answer =>
      'Fumer est interdit 12 heures avant et 2 semaines après l\'opération. L\'alcool ne doit pas être utilisé pendant les 14 premiers jours. Les promenades légères sont autorisées après le jour 4, attendez 1 mois pour les sports lourds.';

  @override
  String get faq6Question => 'Chapeau, soleil, voyage et retour au travail';

  @override
  String get faq6Answer =>
      'Ne portez pas de chapeau pendant les 10 premiers jours ou préférez des modèles très lâches. Évitez le soleil direct. Vous pouvez retourner au travail de bureau dans 3-5 jours; attendez 2 semaines pour le travail physique. Vous pouvez voyager mais protégez les greffes.';

  @override
  String get heroCardSubtitle1 =>
      'L\'équipe Smile Hair gère tout le processus pour vous, de l\'évaluation préopératoire à la planification du voyage.';

  @override
  String get heroCardSubtitle2 =>
      'Vivez une expérience confortable avec des transferts, un support de traducteur et des salles d\'opération stériles.';

  @override
  String get heroCardSubtitle3 =>
      'Protégez les greffes en toute sécurité avec l\'utilisation planifiée de médicaments, un lavage approprié et des restrictions de mouvement.';

  @override
  String get heroCardSubtitle4 =>
      'Suivez tout le processus avec des questions fréquemment posées, des images et des guides numériques.';

  @override
  String get imageBannerCaption1 =>
      'Appliquez des soins doux avec les shampooings et lotions qui vous sont donnés dès le premier lavage.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
