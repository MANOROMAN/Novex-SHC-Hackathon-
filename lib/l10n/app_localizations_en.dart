// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get changePhoto => 'Change Photo';

  @override
  String get patientId => 'Patient ID';

  @override
  String get fullName => 'Full Name';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone';

  @override
  String get address => 'Address';

  @override
  String get birthDate => 'Date of Birth';

  @override
  String get gender => 'Gender';

  @override
  String get emergencyContact => 'Emergency Contact';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get nameRequired => 'Full name cannot be empty';

  @override
  String get emailInvalid => 'Please enter a valid email address';

  @override
  String get phoneRequired => 'Phone number cannot be empty';

  @override
  String get addressRequired => 'Address cannot be empty';

  @override
  String get birthDateRequired => 'Please select date of birth';

  @override
  String get profileUpdatedSuccessfully =>
      'Profile information updated successfully';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get preferNotToSay => 'Prefer not to say';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get change => 'Change';

  @override
  String get passwordsDoNotMatch => 'New passwords do not match';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get passwordChangedSuccessfully => 'Password changed successfully';

  @override
  String get currentPasswordRequired => 'Please enter your current password';

  @override
  String get newPasswordRequired => 'Please enter your new password';

  @override
  String get photoChangeFeatureComingSoon => 'Photo change feature coming soon';

  @override
  String get description => 'Description';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get viewAndManageNotifications => 'View and manage notifications';

  @override
  String get privacyPolicyError =>
      'Privacy policy page could not be opened. Please check your internet connection.';

  @override
  String get termsOfServiceError =>
      'Terms of service page could not be opened. Please check your internet connection.';

  @override
  String anErrorOccurred(String error) {
    return 'An error occurred: $error';
  }

  @override
  String get appDescription =>
      'A modern mobile application designed for hair transplant and care services. You can analyze by taking your own photos, track your treatment process and contact the clinic.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. All rights reserved.';

  @override
  String get emergencyContactHint => 'Name - Phone';

  @override
  String get appointmentDetails => 'Appointment Details';

  @override
  String get dateLabel => 'Date';

  @override
  String get timeLabel => 'Time';

  @override
  String get doctorLabel => 'Doctor';

  @override
  String get appointmentTypeLabel => 'Appointment Type';

  @override
  String get locationLabel => 'Location';

  @override
  String get phoneLabel => 'Phone';

  @override
  String get followUpConsultation => 'Follow-up Consultation';

  @override
  String get cancelAppointment => 'Cancel Appointment';

  @override
  String get addReminder => 'Add Reminder';

  @override
  String get appointmentReminderSet => 'Appointment reminder has been set';

  @override
  String get cameraPermissionRequired =>
      'We cannot continue without camera permission. Please grant permission from settings.';

  @override
  String get sensorPermissionRequired =>
      'Motion sensor permission is required for top and back angle shots.';

  @override
  String get recoveryProgress => 'Recovery Progress';

  @override
  String dayOfTotal(String current, String total) {
    return 'Day $current of $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Week $week: Healing Phase';
  }

  @override
  String get todaysCareRoutine => 'Today\'s Care Routine';

  @override
  String get takeMedicationMorning => 'Take medication (Morning)';

  @override
  String get applyTopicalSolution => 'Apply topical solution';

  @override
  String get takeMedicationEvening => 'Take medication (Evening)';

  @override
  String get upcomingAppointment => 'Upcoming Appointment';

  @override
  String get nextFollowUpConsultation => 'Your next follow-up consultation.';

  @override
  String get viewDetails => 'View Details';

  @override
  String get notifications => 'Notifications';

  @override
  String get appointmentReminder => 'Appointment Reminder';

  @override
  String appointmentReminderMessage(String time) {
    return 'You have an appointment tomorrow at $time';
  }

  @override
  String hoursAgo(Object hours) {
    return '$hours hours ago';
  }

  @override
  String get medicationReminder => 'Medication Reminder';

  @override
  String get morningMedicationReminder =>
      'Don\'t forget to take your morning medication';

  @override
  String get photoReminder => 'Photo Reminder';

  @override
  String get weeklyProgressPhotoReminder =>
      'Don\'t forget to take your weekly progress photo';

  @override
  String daysAgo(String days) {
    return '$days days ago';
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
    return '$title notification opened';
  }

  @override
  String get appointmentCancellation => 'Appointment Cancellation';

  @override
  String get cancelAppointmentConfirmation =>
      'Are you sure you want to cancel this appointment? This action cannot be undone.';

  @override
  String get appointmentCancelledSuccessfully =>
      'Appointment cancelled successfully';

  @override
  String get everyDay => 'Every day';

  @override
  String get weekends => 'Weekends';

  @override
  String get weekdays => 'Weekdays';

  @override
  String get mondayShort => 'Mon';

  @override
  String get tuesdayShort => 'Tue';

  @override
  String get wednesdayShort => 'Wed';

  @override
  String get thursdayShort => 'Thu';

  @override
  String get fridayShort => 'Fri';

  @override
  String get saturdayShort => 'Sat';

  @override
  String get sundayShort => 'Sun';

  @override
  String get titleCannotBeEmpty => 'Title cannot be empty';

  @override
  String get messageCannotBeEmpty => 'Message cannot be empty';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email address';

  @override
  String get selectAtLeastOneDay => 'Please select at least one day';

  @override
  String get dailyEmailScheduled => 'Daily email has been scheduled';

  @override
  String deleteTaskConfirmation(String title) {
    return 'Are you sure you want to delete the task \"$title\"?';
  }

  @override
  String get taskDeleted => 'Task deleted';

  @override
  String get deleteTask => 'Delete Task';

  @override
  String get newScheduledEmail => 'New Scheduled Email';

  @override
  String get createDailyEmailTasks => 'Create daily email tasks';

  @override
  String get titleLabel => 'Title';

  @override
  String get messageLabel => 'Message';

  @override
  String get recipientNameLabel => 'Recipient Name';

  @override
  String get delete => 'Delete';

  @override
  String get daysLabel => 'Days';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'One of Turkey\'s leading clinics in Istanbul, specializing in hair transplantation.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic is one of Turkey\'s leading clinics in Istanbul, specializing in hair transplantation. Led by internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'All operational processes are personally followed by doctors, and every team member consists of professionals with medical training. To date, successful hair transplantation procedures have been performed on numerous patients from all around the world.';

  @override
  String get clinicEthicsDescription =>
      'As Smile Hair Clinic, we serve in accordance with our principles of respect for patient rights, transparency, honesty, and professionalism. We act in compliance with ethical rules in all treatment processes, protect patient confidentiality, and aim to provide the highest quality service.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic has been featured in various media outlets for its successful results and patient satisfaction. It has presented at international hair transplantation conferences and has been a pioneer in the field.';

  @override
  String get mediaOutlets => 'Media Outlets We\'ve Been Featured In:';

  @override
  String get clinicFoundingPartner =>
      'is a founding partner of Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'works at Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'is an experienced physician working at Smile Hair Clinic, prioritizing patient satisfaction.';

  @override
  String get viewFaqPage => 'View FAQ Page';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Istanbul';

  @override
  String get chatWelcomeMessage =>
      'Welcome! How can we help you today? Our team usually responds within an hour.';

  @override
  String get chatSampleMessage =>
      'Hello, I would like to ask about my treatment plan.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'front';

  @override
  String get backCamera => 'back';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Timeline';

  @override
  String get visibleImprovementDescription =>
      'Visible improvement in density across the crown. Patient reports high satisfaction.';

  @override
  String get procedureDetails => 'Type: FUE Restoration\nGrafts: 2,450';

  @override
  String get scheduledEmails => 'Scheduled Emails';

  @override
  String get noScheduledEmails => 'No scheduled emails';

  @override
  String get sampleAppointmentDate => 'Tue, Nov 9, 10:30 AM';

  @override
  String get sampleAppointmentDateFull => 'Tuesday, November 9, 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'Istanbul, Turkey';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Hair Restoration & Care';

  @override
  String get welcomeLogin => 'Login';

  @override
  String get welcomeRegister => 'Sign Up';

  @override
  String get loginTitle => 'Welcome Back';

  @override
  String get loginSubtitle => 'Sign in to your account';

  @override
  String get loginEmail => 'Email';

  @override
  String get loginEmailHint => 'Enter your email address';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginPasswordHint => 'Enter your password';

  @override
  String get loginForgotPassword => 'Forgot your password?';

  @override
  String get loginLoginButton => 'Login';

  @override
  String get loginOr => 'or';

  @override
  String get loginGoogleLogin => 'Continue with Google';

  @override
  String get loginNeedAccount => 'Need an account?';

  @override
  String get forgotPasswordTitle => 'Reset your password';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your registered email and we will send a link to reset your password.';

  @override
  String get forgotPasswordSendButton => 'Send reset email';

  @override
  String get forgotPasswordEmailSent =>
      'Password reset email sent. Please check your inbox.';

  @override
  String get registrationTitle => 'Create Your Account';

  @override
  String get registrationSubtitle => 'Create a new account';

  @override
  String get registrationName => 'Full Name';

  @override
  String get registrationNameHint => 'Enter your first and last name';

  @override
  String get registrationEmail => 'Email';

  @override
  String get registrationEmailHint => 'Enter your email address';

  @override
  String get registrationPassword => 'Password';

  @override
  String get registrationPasswordHint => 'Create your password';

  @override
  String get registrationConfirmPassword => 'Confirm Password';

  @override
  String get registrationConfirmPasswordHint => 'Re-enter your password';

  @override
  String get registrationTerms =>
      'I accept the Terms of Use and Privacy Policy.';

  @override
  String get registrationRegisterButton => 'Create Account';

  @override
  String get registrationAlreadyHaveAccount => 'Already have an account?';

  @override
  String get registrationLoginLink => 'Login';

  @override
  String dashboardHelloParam(String name) {
    return 'Hello, $name';
  }

  @override
  String get dashboardHome => 'Home';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Analysis';

  @override
  String get dashboardMyAppointments => 'My Appointments';

  @override
  String get dashboardResources => 'Resources';

  @override
  String get dashboardCareGuide => 'Care Guide';

  @override
  String get dashboardCareGuideSubtitle => 'Post-transplant care instructions';

  @override
  String get dashboardDefaultUserName => 'Guest User';

  @override
  String get dashboardHairTransplantTitle => 'Hair Transplant';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Explore every transplant technique';

  @override
  String get dashboardOnlineConsultationTitle => 'Online Consultation';

  @override
  String get dashboardOnlineConsultationSubtitle => 'Get free expert advice';

  @override
  String get dashboardDoctorsTitle => 'Our Doctors';

  @override
  String get dashboardDoctorsSubtitle => 'Meet our specialist surgeons';

  @override
  String get dashboardAboutUsTitle => 'About Us';

  @override
  String get dashboardAboutUsSubtitle => 'Learn about our clinic';

  @override
  String get dashboardContactTitle => 'Contact';

  @override
  String get dashboardContactSubtitle => 'Get in touch with us';

  @override
  String get dashboardProgressTracking => 'Progress Tracking';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Track your treatment progress';

  @override
  String get dashboardPastAnalysesSubtitle => 'Your previous photo analyses';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsPreferences => 'Preferences';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSubtitle => 'Select your preferred language';

  @override
  String get settingsDarkMode => 'Dark Mode';

  @override
  String get settingsDarkModeSubtitle => 'Enable dark theme';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsNotificationsSubtitle => 'Enable all notifications';

  @override
  String get settingsEmailNotifications => 'Email Notifications';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'Receive notifications via email';

  @override
  String get settingsPushNotifications => 'Push Notifications';

  @override
  String get settingsPushNotificationsSubtitle => 'Receive push notifications';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsChangePassword => 'Change Password';

  @override
  String get settingsChangePasswordSubtitle => 'Update your password';

  @override
  String get settingsPrivacyPolicy => 'Privacy Policy';

  @override
  String get settingsPrivacyPolicySubtitle => 'Read our privacy policy';

  @override
  String get settingsTermsOfService => 'Terms of Service';

  @override
  String get settingsTermsOfServiceSubtitle => 'Read our terms of service';

  @override
  String get settingsSupport => 'Support';

  @override
  String get settingsHelpSupport => 'Help & Support';

  @override
  String get settingsHelpSupportSubtitle => 'Get help and contact support';

  @override
  String get settingsAddPhone => 'Add phone number';

  @override
  String get settingsThemeMode => 'Theme Mode';

  @override
  String get settingsThemeDescriptionSystem => 'Follow system settings';

  @override
  String get settingsThemeDescriptionLight => 'Light theme';

  @override
  String get settingsThemeDescriptionDark => 'Dark theme';

  @override
  String get settingsThemeDialogTitle => 'Choose Theme Mode';

  @override
  String get settingsThemeOptionSystem => 'System';

  @override
  String get settingsThemeOptionSystemSubtitle => 'Match device settings';

  @override
  String get settingsThemeOptionLight => 'Light';

  @override
  String get settingsThemeOptionLightSubtitle => 'Bright color theme';

  @override
  String get settingsThemeOptionDark => 'Dark';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Dim color theme';

  @override
  String get settingsKvkkFormTitle => 'KVKK Application Form';

  @override
  String get settingsKvkkFormSubtitle =>
      'Submit a request about your personal data';

  @override
  String get settingsGdprFormTitle => 'GDPR Contact Form';

  @override
  String get settingsGdprFormSubtitle => 'Information notice for KVKK and GDPR';

  @override
  String get settingsRecordsTitle => 'My Records';

  @override
  String get settingsTreatmentHistoryTitle => 'Treatment History';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'View your appointments and surgery records';

  @override
  String get settingsDocumentsTitle => 'Documents';

  @override
  String get settingsDocumentsSubtitle =>
      'Reports, prescriptions and shared files';

  @override
  String get settingsInvoicesTitle => 'Invoices';

  @override
  String get settingsInvoicesSubtitle => 'Manage your payments and invoices';

  @override
  String get settingsSupportCenterSubtitle =>
      '24/7 support and contact channels';

  @override
  String get settingsContactTitle => 'Contact';

  @override
  String get settingsContactSubtitle => 'Address, phone and contact options';

  @override
  String get settingsProfileLoginRequired =>
      'Please sign in to change your profile photo.';

  @override
  String get settingsProfilePhotoUpdated =>
      'Your profile photo has been updated.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Error while updating the photo: $error';
  }

  @override
  String get supportCenterTitle => 'Support Center';

  @override
  String get supportCenterHeroTitle => 'Here for you 24/7';

  @override
  String get supportCenterHeroDescription =>
      'The Smile Hair Clinic support team is with you at every step of your treatment journey.';

  @override
  String get supportCenterQuickContact => 'Quick Contact';

  @override
  String get supportCenterWhatsappTitle => 'Chat via WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Talk to our live support team instantly';

  @override
  String get supportCenterCallTitle => 'Call us';

  @override
  String get supportCenterEmailTitle => 'Send us an email';

  @override
  String get supportCenterKnowledgeBase => 'Knowledge Center';

  @override
  String get supportCenterFaqSubtitle =>
      'Questions before and after the operation';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Knowledge Base';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'All of our hair transplant articles';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Appointment & Treatment Support';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Get information about your treatment plan';

  @override
  String get supportCenterMessageSectionTitle => 'Send us a message';

  @override
  String get supportCenterMessageLabel => 'Your message';

  @override
  String get supportCenterMessageHint => 'Write your question or request...';

  @override
  String get supportCenterMessageEmpty => 'Please write a message';

  @override
  String get supportCenterMessageSuccess =>
      'We received your message. We will get back to you shortly.';

  @override
  String get supportCenterSendButton => 'Send';

  @override
  String get treatmentHistoryTitle => 'Treatment History';

  @override
  String get treatmentHistoryLoginRequired =>
      'You need to sign in to view this feature.';

  @override
  String get treatmentHistoryEmpty =>
      'You don\'t have any recorded treatment history yet.';

  @override
  String get treatmentHistoryDatePending => 'Date pending';

  @override
  String get treatmentHistoryDefaultType => 'Check-up';

  @override
  String get treatmentHistoryDoctorPending => 'To be assigned';

  @override
  String get treatmentHistoryStatusCompleted => 'Completed';

  @override
  String get treatmentHistoryStatusCancelled => 'Cancelled';

  @override
  String get treatmentHistoryStatusInProgress => 'In progress';

  @override
  String get treatmentHistoryStatusScheduled => 'Scheduled';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsAboutSubtitle => 'App version and information';

  @override
  String get settingsLogout => 'Logout';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'Premium Hair Restoration';

  @override
  String get clinicProfileAbout => 'About';

  @override
  String get clinicProfileDoctors => 'Doctors';

  @override
  String get clinicProfileGallery => 'Gallery';

  @override
  String get clinicProfileTreatments => 'Treatments';

  @override
  String get clinicProfileBookConsultation => 'Book Consultation';

  @override
  String get clinicProfileAboutTitle => 'About Us';

  @override
  String get clinicProfileEthicsTitle => 'Our Ethics';

  @override
  String get clinicProfilePressTitle => 'In the Press';

  @override
  String get clinicProfileContactTitle => 'Contact Information';

  @override
  String get clinicProfileDoctorsTitle => 'Our Doctors';

  @override
  String get clinicProfileGalleryTitle => 'Results Gallery';

  @override
  String get clinicProfileHairSurgeon => 'Hair Surgeon';

  @override
  String get pastAnalysesTitle => 'Past Analyses';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get faqSubtitle => 'For your questions';

  @override
  String get splashTagline => 'Hair Transplant and Aesthetic Specialist';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Automatic capture from 5 critical angles for hair and scalp.\nMake sure you are in a well-lit environment before starting.';

  @override
  String get captureFlowStartCapture => 'Start Capture';

  @override
  String get captureFlowFaceDetection =>
      'Position your face in the frame and look at the camera.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Position correct, hold still ($seconds sec)';
  }

  @override
  String get captureFlowTurnRightMore =>
      'Turn your head a bit more to the right.';

  @override
  String get captureFlowTooMuchRight =>
      'You turned a bit too much, adjust slightly to the left.';

  @override
  String get captureFlowKeepHeadStill =>
      'Keep your head still and don\'t move your shoulders.';

  @override
  String get captureFlowTurnLeftMore =>
      'Turn your head a bit more to the left.';

  @override
  String get captureFlowTooMuchLeft =>
      'You turned a bit too much, adjust slightly to the right.';

  @override
  String get captureFlowCaptured => 'captured';

  @override
  String get captureFlowInitializingCamera => 'Initializing camera...';

  @override
  String get captureFlowCapturedPhotos => 'Captured Photos';

  @override
  String get captureFlowEndSession => 'End Session';

  @override
  String get captureFlowReviewPhotos => 'Review Photos';

  @override
  String get captureFlowPhotosCaptured => 'photos captured';

  @override
  String get captureFlowSelected => 'Selected';

  @override
  String get captureFlowContinueToAnalysis => 'Continue to Analysis';

  @override
  String get captureFlowNewCapture => 'Start New Capture';

  @override
  String get captureFlowPhotosFrom5Angles => 'Photos from 5 angles';

  @override
  String get captureStageFrontTitle => 'Front View';

  @override
  String get captureStageFrontBaseInstruction =>
      'Look straight at the camera and keep your head still.';

  @override
  String get captureStageFrontReminder =>
      'Keep your head straight and look at the camera.';

  @override
  String get captureStageRight45Title => 'Right 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Turn your head 45 degrees to the right.';

  @override
  String get captureStageRight45Reminder => 'Turn your head more to the right.';

  @override
  String get captureStageLeft45Title => 'Left 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Turn your head 45 degrees to the left.';

  @override
  String get captureStageLeft45Reminder => 'Turn your head more to the left.';

  @override
  String get captureStageVertexTitle => 'Top View';

  @override
  String get captureStageVertexBaseInstruction =>
      'Hold your phone horizontally above your head.';

  @override
  String get captureStageVertexReminder =>
      'Hold your phone flat above your head.';

  @override
  String get captureStageDonorTitle => 'Donor Area';

  @override
  String get captureStageDonorBaseInstruction =>
      'Turn your head and hold the phone behind your head.';

  @override
  String get captureStageDonorReminder =>
      'Hold the phone steady behind your head.';

  @override
  String get photoCaptureFrontView => 'Front View';

  @override
  String get photoCapturePositionHead =>
      'Position your head within the outline';

  @override
  String get photoCaptureFront => 'Front';

  @override
  String get photoCaptureTop => 'Top';

  @override
  String get photoCaptureLeft => 'Left';

  @override
  String get photoCaptureRight => 'Right';

  @override
  String get chatOnline => 'Online';

  @override
  String get chatToday => '--- Today ---';

  @override
  String get chatMessageHint => 'Type your message...';

  @override
  String get chatQuickRepliesAppointment => 'Book appointment';

  @override
  String get chatQuickRepliesTreatmentPlan => 'My treatment plan';

  @override
  String get chatQuickRepliesFollowup => 'Request follow-up';

  @override
  String get chatQuickRepliesPriceInfo => 'Price information';

  @override
  String progressPatientIdParam(String id) {
    return 'Patient ID: $id';
  }

  @override
  String get progressStatistics => 'Statistics';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Months Post-Op';
  }

  @override
  String get progressProcedureDay => 'Procedure Day';

  @override
  String get progressInitialConsultation => 'Initial Consultation';

  @override
  String get progressUploadPhoto => 'Upload New Photo';

  @override
  String get analysisCaptureAndAnalyze => 'Capture and Analyze';

  @override
  String get analysisPastAnalyses => 'Past Analyses';

  @override
  String get analysisAnalysisDate1 => 'October 15, 2023';

  @override
  String get analysisAnalysisDesc1 => 'Slight thinning in the crown area';

  @override
  String get analysisAnalysisDate2 => 'July 12, 2023';

  @override
  String get analysisAnalysisDesc2 => 'Signs of inflammation on the scalp';

  @override
  String get analysisAnalysisDate3 => 'April 05, 2023';

  @override
  String get analysisAnalysisDesc3 => 'Overall scalp health is good';

  @override
  String get analysisAnalysisDate4 => 'January 20, 2023';

  @override
  String get analysisAnalysisDesc4 => 'Initial analysis for treatment';

  @override
  String get faqQuestion1 =>
      'How long does the hair transplant procedure take?';

  @override
  String get faqAnswer1 =>
      'The hair transplant procedure typically takes 4-8 hours depending on the number of grafts to be transplanted. Since local anesthesia is used during the procedure, the patient does not feel pain.';

  @override
  String get faqQuestion2 =>
      'When can I return to normal life after hair transplant?';

  @override
  String get faqAnswer2 =>
      'You can do light activities 2-3 days after hair transplant. It is recommended to wait 2 weeks for heavy sports and physical activities. Return to work is usually possible 3-5 days later.';

  @override
  String get faqQuestion3 => 'When do the transplanted hairs start to grow?';

  @override
  String get faqAnswer3 =>
      'Transplanted hairs fall out in the first 2-3 weeks (shock loss). New hairs start to grow 3-4 months later and full results are seen within 6-12 months.';

  @override
  String get faqQuestion4 => 'Is the hair transplant procedure painful?';

  @override
  String get faqAnswer4 =>
      'Since local anesthesia is used during the procedure, no pain is felt. There may be mild pain after the procedure, but this can be controlled with painkillers.';

  @override
  String get faqQuestion5 => 'What is the success rate of hair transplant?';

  @override
  String get faqAnswer5 =>
      'Hair transplant has a very high success rate, typically 95-98%. The success depends on the patient\'s health, the quality of the donor area, and following post-operative care instructions.';

  @override
  String get faqQuestion6 => 'Can women have hair transplant?';

  @override
  String get faqAnswer6 =>
      'Yes, women can have hair transplant. Female pattern hair loss is common and can be treated with hair transplant procedures. A consultation is needed to determine if the patient is a suitable candidate.';

  @override
  String get faqQuestion7 =>
      'How many grafts are needed for a hair transplant?';

  @override
  String get faqAnswer7 =>
      'The number of grafts needed depends on the extent of hair loss and the desired density. Typically, 1,500-3,000 grafts are used for moderate hair loss, while 3,000-5,000 grafts may be needed for extensive hair loss.';

  @override
  String get faqQuestion8 => 'Is there an age limit for hair transplant?';

  @override
  String get faqAnswer8 =>
      'There is no strict age limit, but the procedure is generally recommended for patients over 25 years old when hair loss pattern is more stable. Each case is evaluated individually.';

  @override
  String get faqQuestion9 => 'What is the recovery time after hair transplant?';

  @override
  String get faqAnswer9 =>
      'Most patients can return to work within 3-5 days. The scabs typically fall off within 7-10 days. Full recovery and normal activities can resume after 2 weeks.';

  @override
  String get faqQuestion10 => 'Are the results of hair transplant permanent?';

  @override
  String get faqAnswer10 =>
      'Yes, the transplanted hair is permanent because it is taken from the donor area which is genetically resistant to hair loss. The transplanted hair will continue to grow naturally for the rest of your life.';

  @override
  String get pastAnalysesListView => 'List View';

  @override
  String get pastAnalysesGridView => 'Grid View';

  @override
  String get pastAnalysesDetailedView => 'Detailed View';

  @override
  String get pastAnalysesDensityModerate => 'Density: Moderate';

  @override
  String get pastAnalysesDensityLow => 'Density: Low';

  @override
  String get privacyPolicyTitle =>
      'Personal Data Processing and Protection Policy';

  @override
  String get privacyPolicyDocumentDate => 'Document Date:';

  @override
  String get privacyPolicyRevisionDate => 'Revision Date:';

  @override
  String get privacyPolicyRevisionNumber => 'Revision Number:';

  @override
  String get privacyPolicySection1 => 'I. INTRODUCTION';

  @override
  String get privacyPolicySection1A => 'A. Purpose and Scope';

  @override
  String get privacyPolicySection1AContent =>
      'This Policy regulates the principles adopted by Smile Hair Clinic regarding the protection and processing of personal data.\n\nWithin the scope of this Policy, Smile Hair Clinic provides explanations regarding the processing activities of personal data and the systems adopted for the protection of personal data. This includes informing and ensuring transparency for Relevant Persons, primarily including Product or Service Recipients, Employees and Employee Candidates, Potential Customers, Shareholders, Visitors, Participants, Suppliers and Third Parties, establishing and ensuring standards in the management of personal data; determining and supporting organizational goals and obligations; establishing control mechanisms compatible with acceptable risk levels, compliance with principles and rules brought by international conventions, the Constitution, laws, regulations, contracts and other legislation regarding the protection of personal data, and ensuring the best protection of the fundamental rights and freedoms of the Relevant Person. Additionally, this Policy covers all physical and electronic data recording systems and environments used for processing personal and special category personal data automatically or as part of a data recording system by non-automatic means.';

  @override
  String get privacyPolicySection1B => 'B. Definitions';

  @override
  String get photoAnalysisTitle => 'Photo Analysis';

  @override
  String photosUploadedCount(String count) {
    return '$count photos uploaded';
  }

  @override
  String get autoAnalysisStarting =>
      '5 photos uploaded. Starting automatic analysis...';

  @override
  String stageUploaded(String stage) {
    return '$stage angle uploaded';
  }

  @override
  String stageCaptured(String stage) {
    return '$stage angle captured';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'An error occurred while loading the photo: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'An error occurred while loading multiple photos: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'An error occurred while capturing the photo: $error';
  }

  @override
  String get imageSourceTitle => 'Photo Source';

  @override
  String get imageSourceCamera => 'Camera';

  @override
  String get imageSourceGallery => 'Gallery';

  @override
  String get imageSourceMultiGallery => 'Select Multiple from Gallery';

  @override
  String get promptNoPhotosForAnalysis =>
      'Please upload a photo first. Tap the 📷 button to upload.';

  @override
  String get analyzingPhotos => 'Your photos are being analyzed...';

  @override
  String get visualAnalysisHeader => '📸 Visual Analysis - What I See:';

  @override
  String get importantWarningHeader => '⚠️ IMPORTANT WARNING:';

  @override
  String get differentPersonsDetected =>
      'Different persons were detected in the photos! All photos must belong to the same person.';

  @override
  String get pleaseCaptureSamePerson =>
      'Please take photos of the same person from 5 different angles.';

  @override
  String get detectedAnglesHeader => '📐 Detected Angles:';

  @override
  String get analysisCompleted => 'Analysis completed';

  @override
  String get allPhotosLookGood => 'All photos look suitable.';

  @override
  String get savedToFirebase => '✅ Photos have been saved to Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'Analysis ID: $id';
  }

  @override
  String get savedLocationLabel =>
      'Saved Location: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Analysis Result';

  @override
  String get retakeRequiredAngles => '❌ Angles that need to be retaken:';

  @override
  String get errorDetailsHeader => 'Error Details:';

  @override
  String get retakeTheseAnglesQuestion =>
      'Would you like to retake these angles?';

  @override
  String get retakeFirstInvalidQuestion =>
      'Would you like to retake the first invalid angle?';

  @override
  String get retake => 'Retake';

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
  String get uploadAndAnalyze => 'Upload and Analyze';

  @override
  String get captureWithFaceDetection => 'Capture with Face Detection';

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
      'Enable Daily Medication Reminder';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Quick Access';

  @override
  String get quickActions => 'Quick Actions';

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
  String get noUpcomingAppointments => 'No Upcoming Appointments';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Free Consultation';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Full Name *';

  @override
  String get fullNameHint => 'Full Name';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Write your message here...';

  @override
  String get or => 'or';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'About Us';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'Our Values';

  @override
  String get professionalism => 'Professionalism';

  @override
  String get professionalismDescription =>
      'Our internationally certified expert doctors';

  @override
  String get patientSatisfaction => 'Patient Satisfaction';

  @override
  String get patientSatisfactionDescription =>
      'Our priority is always our patients\' happiness';

  @override
  String get medicalEducation => 'Medical Education';

  @override
  String get medicalEducationDescription =>
      'Every member of our team consists of professionals with medical training';

  @override
  String get internationalService => 'International Service';

  @override
  String get internationalServiceDescription =>
      'Serving patients from all over the world';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Successful\nOperations';

  @override
  String get patientsFromCountries => 'Patients from\nCountries';

  @override
  String get expertDoctors => 'Expert\nDoctors';

  @override
  String get patientSatisfactionRate => 'Patient\nSatisfaction';

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
  String get contactUs => 'Contact Us';

  @override
  String get call => 'Call';

  @override
  String get workingHours => 'Working Hours';

  @override
  String get mondayFriday => 'Monday - Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get closed => 'Closed';

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
  String get showFaceToCamera => 'Show your face to the camera...';

  @override
  String cameraNotFound(Object type) {
    return 'Camera not found';
  }

  @override
  String get phoneAppCannotOpen =>
      'Phone app cannot be opened. Please make sure the phone app is installed on your device.';

  @override
  String get emailAppCannotOpen =>
      'Email app cannot be opened. Please make sure the email app is installed on your device.';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Our Doctors';

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
  String get doctor => 'Doctor';

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
  String get yourDoctor => 'Your Doctor';

  @override
  String get appointment => 'Appointment';

  @override
  String get soon => 'Soon';

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
    return 'Message could not be sent: $error';
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
  String get noMessages => 'No messages';

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
  String get pending => 'Pending';

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
  String get unknownDate => 'Unknown Date';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get analysisCompletedShort => 'Completed';

  @override
  String get retakeDialogTitle => 'Retake Required';

  @override
  String get retakeDialogBody =>
      'According to AI analysis, the following angles need to be retaken:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'Would you like to retake the first invalid angle?';

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
  String get noSavedAnalyses => 'No saved analyses yet.';

  @override
  String welcomeGreeting(String name) {
    return 'Welcome, $name';
  }

  @override
  String get loginRequiredForMessaging => 'You must sign in to send messages';

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
  String get allNotificationsMarkedAsRead => 'All notifications marked as read';

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
  String get contactAddress => 'Address';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Phone';

  @override
  String get contactWhatsApp => 'WhatsApp';

  @override
  String get patientCareGuideTitle => 'Patient Care Guide';

  @override
  String get planningTab => 'Planning';

  @override
  String get operationTab => 'Operation';

  @override
  String get recoveryTab => 'Recovery';

  @override
  String get resourcesTab => 'Resources';

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
  String get message => 'Messages';

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
  String get examplePhotoFrontTitle => 'Front View Example';

  @override
  String get examplePhotoFrontInstructions => 'Look straight at the camera';

  @override
  String get examplePhotoRight45Title => 'Right 45° View Example';

  @override
  String get examplePhotoRight45Instructions =>
      'Turn your head 45° to the right';

  @override
  String get examplePhotoLeft45Title => 'Left 45° View Example';

  @override
  String get examplePhotoLeft45Instructions => 'Turn your head 45° to the left';

  @override
  String get examplePhotoVertexTitle => 'Top View Example';

  @override
  String get examplePhotoVertexInstructions => 'Hold phone above your head';

  @override
  String get examplePhotoDonorTitle => 'Back View Example';

  @override
  String get examplePhotoDonorInstructions => 'Move phone behind your head';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get deleteForMe => 'Delete for Me';

  @override
  String get messageDeleted => 'Message deleted';

  @override
  String get deleteForEveryone => 'Delete for Everyone';

  @override
  String get deleteMessage => 'Delete Message';

  @override
  String get deleteMessageReadWarning =>
      'This message has been read by the recipient. Do you want to delete it anyway?';

  @override
  String get deleteMessageConfirm =>
      'This message will be deleted for everyone. Are you sure?';

  @override
  String get messageDeletedForEveryone => 'Message deleted for everyone';

  @override
  String get userNotLoggedIn => 'User is not logged in';

  @override
  String get messagesLoadingError => 'An error occurred while loading messages';

  @override
  String get loadingMessages => 'Loading messages...';

  @override
  String get startConversation => 'Start a conversation by sending a message';

  @override
  String get loadOlderMessages => 'Load Older Messages';

  @override
  String get sendPhoto => 'Send Photo';

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
  String get needLoginForAnalysis => 'You need to login for analysis';

  @override
  String openCaptureFlowError(String error) {
    return 'An error occurred while opening capture screen: $error';
  }

  @override
  String get sessionExpired => 'Your session has expired. Please login again.';

  @override
  String get photosAnalyzedAndSaved =>
      'Photos have been successfully analyzed and saved!';

  @override
  String get photoNotFoundForAnalysis => 'No photos found for analysis';

  @override
  String get noValidPhotosFound => 'No valid photos found';

  @override
  String get analysisPreparing => 'Preparing photos...';

  @override
  String get photosUploading => 'Uploading photos...';

  @override
  String get errorUploadingPhotos => 'An error occurred while uploading photos';

  @override
  String get geminiChecking => 'Checking Gemini API connection...';

  @override
  String get geminiFailed =>
      'Gemini API connection failed. Please check your internet connection.';

  @override
  String get aiAnalyzing => 'AI analysis in progress...';

  @override
  String get someAnglesNeedRetake => 'Some angles need to be retaken...';

  @override
  String get analysisSaved => 'Analysis saved successfully!';

  @override
  String get analysisCompletedSuccessfully =>
      'Analysis completed successfully!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count angles need to be retaken...';
  }

  @override
  String get errorDuringAnalysis => 'An error occurred during analysis';

  @override
  String get geminiApiError =>
      'Gemini API connection error. Please check your internet connection.';

  @override
  String get firebaseError => 'Firebase connection error. Please try again.';

  @override
  String get photoProcessingError =>
      'Photo processing error. Please try again.';

  @override
  String get authErrorLoginAgain => 'Authorization error. Please login again.';

  @override
  String get analysisSuccessfulTitle => 'Analysis Successful';

  @override
  String get analysisResultsTitle => 'Analysis Results';

  @override
  String get detailedAnalysisHeader => 'Detailed Analysis:';

  @override
  String get retakeRequiredAnglesHeader => 'Angles That Need Retake:';

  @override
  String dialogError(String error) {
    return 'An error occurred while opening dialog: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Baseline photo not found';

  @override
  String get noPhotosToUpdate => 'No photos to update found';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'An error occurred during retake analysis: $error';
  }

  @override
  String retakeError(String error) {
    return 'An error occurred during retake: $error';
  }

  @override
  String get aiSupport => 'AI Support';

  @override
  String get myPhotos => 'My Photos';

  @override
  String get photoAnalysisChatbot => 'Photo Analysis Chatbot';

  @override
  String get disableMedicationReminder => 'Disable Medication Reminder';

  @override
  String get medicationReminderDisabled =>
      'Daily medication reminder has been disabled';

  @override
  String get medicationTime => 'Medication Time';

  @override
  String get selectMedicationReminderTime =>
      'Select Daily Medication Reminder Time';

  @override
  String get selectMedicationTime => 'Select Medication Time';

  @override
  String medicationReminderSetAt(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get noDateInfo => 'No date information';

  @override
  String get invalidDate => 'Invalid date';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

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
  String get hairTransplantTitle => 'Hair Transplant';

  @override
  String get hairTransplantSectionCount => 'Sections';

  @override
  String get hairTransplantVideo => 'Video';

  @override
  String get hairTransplantFreeConsultation => 'Get Free Consultation';

  @override
  String get hairTransplantWatchVideo => 'Watch Video';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Watch the hair transplant procedure video';

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
    return 'Error during analysis: $error';
  }

  @override
  String get myDocuments => 'My Documents';

  @override
  String get loginRequiredForDocuments => 'You need to login to view documents';

  @override
  String get noDocumentsYet => 'No documents yet';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'An error occurred:\n$error';
  }

  @override
  String get datePending => 'Pending';

  @override
  String get chatSupportWelcomeMessage =>
      'Hello! I\'m your AI assistant. How can I help you today?';

  @override
  String get newChat => 'New Chat';

  @override
  String get chatSupportAiAssistantName => 'AI Assistant';

  @override
  String get historyTooltip => 'History';

  @override
  String get typingIndicator => 'AI is typing...';

  @override
  String get chatHistoryTitle => 'Chat History';

  @override
  String get noSavedChats => 'No saved chats';

  @override
  String genericErrorTryAgain(String error) {
    return 'An error occurred. Please try again.\nError: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp could not be opened. Please make sure the WhatsApp app is installed.';

  @override
  String whatsappOpenError(String error) {
    return 'An error occurred while opening WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'An error occurred while opening the capture screen: $error';
  }

  @override
  String get retakeAnalyzing => 'The retaken photo is being analyzed...';

  @override
  String get autoAnalysisOn => 'Auto Analysis: On';

  @override
  String get autoAnalysisOff => 'Auto Analysis: Off';

  @override
  String get clearPhotosTooltip => 'Clear photos';

  @override
  String get messageHintAnalyze => 'Type your message or write \"Analyze\"...';

  @override
  String get send => 'Send';

  @override
  String get aiAssistantName => 'AI Analysis Assistant';

  @override
  String get expertTeam => 'Expert Team';

  @override
  String get expertTeamDescription =>
      'Our team consists of experienced specialists in hair transplant surgery.';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get loginToSendMessage => 'Please login to send a message';

  @override
  String get doctorEmailMissing => 'Doctor email is missing';

  @override
  String doctorNotFound(String name) {
    return 'Doctor $name not found';
  }

  @override
  String get messagingComingSoon => 'Messaging feature coming soon';

  @override
  String get years => 'years';

  @override
  String get watchWashingVideo => 'Watch Washing Video';

  @override
  String get preCareTip1Title => 'Choose the right surgeon';

  @override
  String get preCareTip1Body =>
      'Sapphire FUE procedure requires an experienced surgeon and multidisciplinary team. Work with doctors who realistically explain your expectations, plan the operation end-to-end, and apply Smile Hair protocols.';

  @override
  String get preCareTip2Title => 'Share your medical history';

  @override
  String get preCareTip2Body =>
      'Share your chronic diseases, regular medications, and allergies with the team without hiding. This minimizes risks that may occur during anesthesia and surgery.';

  @override
  String get preCareTip3Title => 'Blood thinners and approval process';

  @override
  String get preCareTip3Body =>
      'Stop aspirin or similar blood thinners at least one week before the operation date with your prescribing doctor\'s approval. You can resume use two days after the procedure.';

  @override
  String get preCareTip4Title => 'Infection screening';

  @override
  String get preCareTip4Body =>
      'Keep your Hepatitis B/C and HIV test results up to date. Clinics without proper operating room conditions cannot perform operations for these infections, so your trip won\'t be wasted.';

  @override
  String get preCareTip5Title => 'Supplements and vitamins';

  @override
  String get preCareTip5Body =>
      'Supplements containing vitamins B and E increase bleeding; stop them one week before the procedure. If necessary, your doctor will plan supportive treatments.';

  @override
  String get preCareTip6Title => 'Alcohol and smoking';

  @override
  String get preCareTip6Body =>
      'Stop alcohol at least one week before the operation and do not consume it for 14 days after the procedure. Stay away from smoking 12 hours before and for two weeks after the operation, as it disrupts blood circulation.';

  @override
  String get preCareTip7Title => 'Luggage and clothing plan';

  @override
  String get preCareTip7Body =>
      'Choose buttoned or zippered clothing for your upper body. Tight-necked clothing can damage grafts. Prepare a large bag that can carry the care kit given after the operation.';

  @override
  String get preCareTip8Title => 'Rest and hygiene';

  @override
  String get preCareTip8Body =>
      'Get good sleep on the operation day, have a nutritious breakfast, and shower before coming to the clinic. Clean scalp reduces infection risk.';

  @override
  String get postCareTip1Title => 'Protect the grafts';

  @override
  String get postCareTip1Body =>
      'For the first 7 days, be careful not to hit your head anywhere. Sleep on your back using a neck pillow and prevent grafts from rubbing against the pillow.';

  @override
  String get postCareTip2Title => 'First night and following days';

  @override
  String get postCareTip2Body =>
      'Definitely spend the first night after the operation resting. If you need to go out, use an umbrella that protects from sun and rain.';

  @override
  String get postCareTip3Title => 'Stick to the medication plan';

  @override
  String get postCareTip3Body =>
      'Use antibiotics, painkillers, anti-inflammatory, and Panthenol spray exactly as prescribed. Make sure you understand the prescription and usage instructions before leaving the clinic team.';

  @override
  String get postCareTip4Title => 'Moisturizing and sprays';

  @override
  String get postCareTip4Body =>
      'Use only the given isotonic/Panthenol spray until the first wash. Apply antibiotic cream to the donor area for the first 5-7 days.';

  @override
  String get postCareTip5Title => 'Washing protocol';

  @override
  String get postCareTip5Body =>
      'The first wash is done at the clinic 48 hours later. Every day after, gently apply the foam with patting movements, use low-pressure warm water, and dry with paper towels.';

  @override
  String get postCareTip6Title => 'Scabs and shock loss';

  @override
  String get postCareTip6Body =>
      'From day 10, remove scabs with light pressure. Shock loss experienced between weeks 2-4 is normal; new hair becomes visible from month 3.';

  @override
  String get postCareTip7Title => 'Activity and sports';

  @override
  String get postCareTip7Body =>
      'Do not do sports for the first two weeks, you can do light walking after 3-4 days. Avoid pool, sauna, and activities that require heavy sweating for at least 1 month.';

  @override
  String get postCareTip8Title => 'Comfort complaints';

  @override
  String get postCareTip8Body =>
      'If there is burning or pain in the donor area, use steroid-containing cream with clinic approval. Apply cold compresses briefly for swelling.';

  @override
  String get operationDayTimeline1Title => 'Accommodation and transfer';

  @override
  String get operationDayTimeline1Body =>
      'Smile Gentle Care team arranges 4-5 star hotel accommodation. All transportation is planned from arrival at the hotel to transfers to the clinic.';

  @override
  String get operationDayTimeline2Title => 'Multilingual support';

  @override
  String get operationDayTimeline2Body =>
      'Professional translators are provided for patients from different countries around the world. You are informed in your own language at every step of the process.';

  @override
  String get operationDayTimeline3Title => 'Pre-operation preparation';

  @override
  String get operationDayTimeline3Body =>
      'Information forms are signed, your hairline is drawn, photos are taken, and HIV/HBV/HCV tests and vital signs are checked.';

  @override
  String get operationDayTimeline4Title => 'Operation flow';

  @override
  String get operationDayTimeline4Body =>
      'Steps of the 6-8 hour procedure: planning, graft harvesting, channel opening, and implantation. Your doctors share the entire process with you.';

  @override
  String get operationDayTimeline5Title => 'Lunch and special preferences';

  @override
  String get operationDayTimeline5Body =>
      'Vegetarian, halal, or kosher menus are prepared upon request. Smart TV and music options are available in operation areas.';

  @override
  String get operationDayTimeline6Title => 'Next day care';

  @override
  String get operationDayTimeline6Body =>
      'You come to the clinic for bandage change, wound check, and first wash training. Afterwards, the process is monitored with digital photo tracking.';

  @override
  String get sterilizationMeasure1 =>
      'Daily vacuum leak tests are performed to check the seal integrity of sterilizers.';

  @override
  String get sterilizationMeasure2 =>
      'Daily verification is done with Bowie-Dick test to ensure steam reaches all surfaces equally.';

  @override
  String get sterilizationMeasure3 =>
      'Ultrasonic washing tests document that we clean micro residues.';

  @override
  String get sterilizationMeasure4 =>
      'Biological indicator tests are performed every 15 days and it is reported that there is no reproduction.';

  @override
  String get sterilizationMeasure5 =>
      'Sterile and used instruments are stored separately in locked boxes; cross-contamination is prevented.';

  @override
  String get sterilizationMeasure6 =>
      'Each set is tracked with autoclave number, date, and expiration date labels.';

  @override
  String get sterilizationMeasure7 =>
      'All processes are carried out according to Ministry of Health DAS Guide, WHO and AAMI ST79 standards.';

  @override
  String get washStep1 =>
      'Do not wash your hair for the first 36-48 hours after the operation; wait for the first wash to be done at the clinic.';

  @override
  String get washStep2 =>
      'Apply lotion or foam to both donor and recipient areas with your fingertips in patting movements.';

  @override
  String get washStep3 =>
      'Foam the shampoo and gently spread it to the transplanted area with vertical touches; avoid circular movements.';

  @override
  String get washStep4 =>
      'Use warm and low-pressure water. For the first 14 days, it is safer to pour water with a bowl instead of a shower head.';

  @override
  String get washStep5 =>
      'Dry the graft area by gently pressing with paper towels, you can dry the donor area with a normal towel.';

  @override
  String get washStep6 =>
      'If you need to use a hair dryer, use it only in cold mode and from a distance.';

  @override
  String get faq1Question => 'How long does recovery take?';

  @override
  String get faq1Answer =>
      'The first two weeks are a sensitive period; hair goes through different stages for 6-12 months. Significant results are seen at month 6, final density at months 12-18.';

  @override
  String get faq2Question => 'How should bandage and sleep schedule be?';

  @override
  String get faq2Answer =>
      'Elastic bandage can be applied to reduce swelling in the forehead area. Sleep on your back with a neck pillow in a slightly elevated position for the first 7-10 days.';

  @override
  String get faq3Question => 'Shower, washing and product use';

  @override
  String get faq3Answer =>
      'Do not wet your hair for the first two days. After 48 hours, wash once a day with medical shampoo after the first wash at the clinic; keep shower time short, reduce steam.';

  @override
  String get faq4Question => 'When can I dry, comb, or dye my hair?';

  @override
  String get faq4Answer =>
      'Only natural drying is recommended within the first month. You can comb the donor area but do not touch the transplant area for 2 weeks. Stay away from chemical dyes for 6-8 weeks.';

  @override
  String get faq5Question => 'Smoking, alcohol and exercise';

  @override
  String get faq5Answer =>
      'Smoking is prohibited 12 hours before and 2 weeks after the operation. Alcohol should not be used for the first 14 days. Light walks are allowed after day 4, wait 1 month for heavy sports.';

  @override
  String get faq6Question => 'Hat, sun, travel and return to work';

  @override
  String get faq6Answer =>
      'Do not wear a hat for the first 10 days or prefer very loose models. Avoid direct sun. You can return to office work within 3-5 days; wait 2 weeks for physical work. You can travel but protect the grafts.';

  @override
  String get heroCardSubtitle1 =>
      'Smile Hair team manages the entire process for you, from pre-operation evaluation to travel planning.';

  @override
  String get heroCardSubtitle2 =>
      'Experience a comfortable experience with transfers, translator support and sterile operating rooms.';

  @override
  String get heroCardSubtitle3 =>
      'Safely protect grafts with planned medication use, proper washing and movement restrictions.';

  @override
  String get heroCardSubtitle4 =>
      'Track the entire process with frequently asked questions, visuals and digital guides.';

  @override
  String get imageBannerCaption1 =>
      'Apply gentle care with the shampoo and lotions given to you from the first wash.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
