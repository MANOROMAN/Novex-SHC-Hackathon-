// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'ערוך פרופיל';

  @override
  String get save => 'שמור';

  @override
  String get cancel => 'ביטול';

  @override
  String get close => 'סגור';

  @override
  String get changePhoto => 'שנה תמונה';

  @override
  String get patientId => 'מזהה מטופל';

  @override
  String get fullName => 'שם מלא';

  @override
  String get email => 'אימייל';

  @override
  String get phone => 'טלפון';

  @override
  String get address => 'כתובת';

  @override
  String get birthDate => 'תאריך לידה';

  @override
  String get gender => 'מגדר';

  @override
  String get emergencyContact => 'קשר חירום';

  @override
  String get saveChanges => 'שמור שינויים';

  @override
  String get nameRequired => 'שם מלא לא יכול להיות ריק';

  @override
  String get emailInvalid => 'אנא הזן כתובת אימייל תקינה';

  @override
  String get phoneRequired => 'מספר טלפון לא יכול להיות ריק';

  @override
  String get addressRequired => 'כתובת לא יכולה להיות ריקה';

  @override
  String get birthDateRequired => 'אנא בחר תאריך לידה';

  @override
  String get profileUpdatedSuccessfully => 'פרטי הפרופיל עודכנו בהצלחה';

  @override
  String get male => 'זכר';

  @override
  String get female => 'נקבה';

  @override
  String get preferNotToSay => 'מעדיף לא לציין';

  @override
  String get currentPassword => 'סיסמה נוכחית';

  @override
  String get newPassword => 'סיסמה חדשה';

  @override
  String get confirmNewPassword => 'אישר סיסמה חדשה';

  @override
  String get change => 'שנה';

  @override
  String get passwordsDoNotMatch => 'הסיסמאות החדשות אינן תואמות';

  @override
  String get passwordTooShort => 'הסיסמה חייבת להכיל לפחות 6 תווים';

  @override
  String get passwordChangedSuccessfully => 'הסיסמה שונתה בהצלחה';

  @override
  String get currentPasswordRequired => 'אנא הזן את הסיסמה הנוכחית שלך';

  @override
  String get newPasswordRequired => 'אנא הזן את הסיסמה החדשה שלך';

  @override
  String get photoChangeFeatureComingSoon => 'תכונת שינוי התמונה תגיע בקרוב';

  @override
  String get description => 'תיאור';

  @override
  String version(String version) {
    return 'גרסה $version';
  }

  @override
  String get viewAndManageNotifications => 'הצג ונהל התראות';

  @override
  String get privacyPolicyError =>
      'לא ניתן לפתוח את דף מדיניות הפרטיות. אנא בדוק את חיבור האינטרנט שלך.';

  @override
  String get termsOfServiceError =>
      'לא ניתן לפתוח את דף תנאי השירות. אנא בדוק את חיבור האינטרנט שלך.';

  @override
  String anErrorOccurred(String error) {
    return 'אירעה שגיאה: $error';
  }

  @override
  String get appDescription =>
      'אפליקציה ניידת מודרנית המיועדת לשירותי השתלת שיער וטיפול. תוכל לנתח על ידי צילום התמונות שלך, לעקוב אחר תהליך הטיפול שלך ולהיכנס במגע עם הקליניקה.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. כל הזכויות שמורות.';

  @override
  String get emergencyContactHint => 'שם - טלפון';

  @override
  String get appointmentDetails => 'פרטי הפגישה';

  @override
  String get dateLabel => 'תאריך';

  @override
  String get timeLabel => 'שעה';

  @override
  String get doctorLabel => 'רופא';

  @override
  String get appointmentTypeLabel => 'סוג פגישה';

  @override
  String get locationLabel => 'מיקום';

  @override
  String get phoneLabel => 'טלפון';

  @override
  String get followUpConsultation => 'ייעוץ מעקב';

  @override
  String get cancelAppointment => 'בטל פגישה';

  @override
  String get addReminder => 'הוסף תזכורת';

  @override
  String get appointmentReminderSet => 'תזכורת פגישה הוגדרה';

  @override
  String get cameraPermissionRequired =>
      'איננו יכולים להמשיך ללא הרשאת מצלמה. אנא הענק הרשאה מההגדרות.';

  @override
  String get sensorPermissionRequired =>
      'הרשאת חיישן תנועה נדרשת לצילומים מלמעלה ומאחור.';

  @override
  String get recoveryProgress => 'התקדמות ההחלמה';

  @override
  String dayOfTotal(String current, String total) {
    return 'יום $current מתוך $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'שבוע $week: שלב הריפוי';
  }

  @override
  String get todaysCareRoutine => 'שגרת הטיפול של היום';

  @override
  String get takeMedicationMorning => 'קח תרופה (בוקר)';

  @override
  String get applyTopicalSolution => 'החל תמיסה מקומית';

  @override
  String get takeMedicationEvening => 'קח תרופה (ערב)';

  @override
  String get upcomingAppointment => 'פגישה קרובה';

  @override
  String get nextFollowUpConsultation => 'ההתייעצות הבאה שלך למעקב.';

  @override
  String get viewDetails => 'צפה בפרטים';

  @override
  String get notifications => 'התראות';

  @override
  String get appointmentReminder => 'תזכורת פגישה';

  @override
  String appointmentReminderMessage(String time) {
    return 'יש לך פגישה מחר בשעה $time';
  }

  @override
  String hoursAgo(Object hours) {
    return 'לפני $hours שעות';
  }

  @override
  String get medicationReminder => 'תזכורת תרופה';

  @override
  String get morningMedicationReminder => 'אל תשכח לקחת את התרופה של הבוקר';

  @override
  String get photoReminder => 'תזכורת תמונה';

  @override
  String get weeklyProgressPhotoReminder =>
      'אל תשכח לצלם את תמונת ההתקדמות השבועית שלך';

  @override
  String daysAgo(String days) {
    return 'לפני $days ימים';
  }

  @override
  String weeksAgo(String weeks) {
    return 'לפני $weeks שבועות';
  }

  @override
  String monthsAgo(String months) {
    return 'לפני $months חודשים';
  }

  @override
  String yearsAgo(String years) {
    return 'לפני $years שנים';
  }

  @override
  String notificationOpened(String title) {
    return 'התראה $title נפתחה';
  }

  @override
  String get appointmentCancellation => 'ביטול פגישה';

  @override
  String get cancelAppointmentConfirmation =>
      'האם אתה בטוח שאתה רוצה לבטל את הפגישה הזו? פעולה זו לא ניתנת לביטול.';

  @override
  String get appointmentCancelledSuccessfully => 'הפגישה בוטלה בהצלחה';

  @override
  String get everyDay => 'כל יום';

  @override
  String get weekends => 'סופי שבוע';

  @override
  String get weekdays => 'ימי חול';

  @override
  String get mondayShort => 'ב\'';

  @override
  String get tuesdayShort => 'ג\'';

  @override
  String get wednesdayShort => 'ד\'';

  @override
  String get thursdayShort => 'ה\'';

  @override
  String get fridayShort => 'ו\'';

  @override
  String get saturdayShort => 'ש\'';

  @override
  String get sundayShort => 'א\'';

  @override
  String get titleCannotBeEmpty => 'הכותרת לא יכולה להיות ריקה';

  @override
  String get messageCannotBeEmpty => 'ההודעה לא יכולה להיות ריקה';

  @override
  String get pleaseEnterValidEmail => 'אנא הזן כתובת אימייל תקינה';

  @override
  String get selectAtLeastOneDay => 'אנא בחר לפחות יום אחד';

  @override
  String get dailyEmailScheduled => 'אימייל יומי נקבע';

  @override
  String deleteTaskConfirmation(String title) {
    return 'האם אתה בטוח שאתה רוצה למחוק את המשימה \"$title\"?';
  }

  @override
  String get taskDeleted => 'משימה נמחקה';

  @override
  String get deleteTask => 'מחק משימה';

  @override
  String get newScheduledEmail => 'אימייל מתוזמן חדש';

  @override
  String get createDailyEmailTasks => 'צור משימות אימייל יומיות';

  @override
  String get titleLabel => 'כותרת';

  @override
  String get messageLabel => 'ההודעה שלך';

  @override
  String get recipientNameLabel => 'שם הנמען';

  @override
  String get delete => 'מחק';

  @override
  String get daysLabel => 'ימים';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'אחת מהקליניקות המובילות באיסטנבול, המתמחה בהשתלת שיער.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic היא אחת מהקליניקות המובילות באיסטנבול, המתמחה בהשתלת שיער. תחת הנהגתם של ד\"ר גוקאי בילגין וד\"ר מהמט ארדואן המוכרים בינלאומית, שביעות הרצון של המטופל תמיד מקבלת עדיפות ב-Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'כל התהליכים המבצעיים מנוהלים אישית על ידי רופאים, וכל חבר צוות מורכב ממומחים עם הכשרה רפואית. עד כה, בוצעו הליכי השתלת שיער מוצלחים על מטופלים רבים מכל רחבי העולם.';

  @override
  String get clinicEthicsDescription =>
      'כ-Smile Hair Clinic, אנו משרתים בהתאם לעקרונותינו של כבוד לזכויות המטופל, שקיפות, יושרה ומקצועיות. אנו פועלים בהתאם לכללי אתיקה בכל תהליכי הטיפול, מגנים על פרטיות המטופל ומטרתנו לספק שירות באיכות הגבוהה ביותר.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic הוצגה בתקשורת השונות בגלל תוצאותיה המוצלחות ושביעות הרצון של המטופלים. היא הציגה בכנסים בינלאומיים להשתלת שיער והייתה חלוצה בתחום.';

  @override
  String get mediaOutlets => 'אמצעי התקשורת בהם הוצגנו:';

  @override
  String get clinicFoundingPartner => 'הוא שותף מייסד ב-Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'עובד ב-Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'הוא רופא מנוסה העובד ב-Smile Hair Clinic, המתעדף את שביעות הרצון של המטופל.';

  @override
  String get viewFaqPage => 'הצג דף שאלות נפוצות';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, איסטנבול';

  @override
  String get chatWelcomeMessage =>
      'ברוך הבא! איך נוכל לעזור לך היום? הצוות שלנו בדרך כלל מגיב תוך שעה.';

  @override
  String get chatSampleMessage => 'שלום, אני רוצה לשאול על תוכנית הטיפול שלי.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'קדמי';

  @override
  String get backCamera => 'אחורי';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'ציר זמן';

  @override
  String get visibleImprovementDescription =>
      'שיפור נראה בצפיפות ברחבי הכתר. המטופל מדווח על שביעות רצון גבוהה.';

  @override
  String get procedureDetails => 'סוג: שחזור FUE\nשתלים: 2,450';

  @override
  String get scheduledEmails => 'אימיילים מתוזמנים';

  @override
  String get noScheduledEmails => 'אין אימיילים מתוזמנים';

  @override
  String get sampleAppointmentDate => 'ג\', 9 נוב\', 10:30';

  @override
  String get sampleAppointmentDateFull => 'יום שלישי, 9 בנובמבר 2023';

  @override
  String get sampleDoctorName => 'ד\"רмет ילמז';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'דוד';

  @override
  String get sampleCityCountry => 'איסטנבול, טורקיה';

  @override
  String get sampleEmergencyContact => 'мет ילמז - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'שחזור וטיפול בשיער';

  @override
  String get welcomeLogin => 'התחברות';

  @override
  String get welcomeRegister => 'הרשמה';

  @override
  String get loginTitle => 'ברוך שובך';

  @override
  String get loginSubtitle => 'התחבר לחשבון שלך';

  @override
  String get loginEmail => 'אימייל';

  @override
  String get loginEmailHint => 'הזן את כתובת האימייל שלך';

  @override
  String get loginPassword => 'סיסמה';

  @override
  String get loginPasswordHint => 'הזן את הסיסמה שלך';

  @override
  String get loginForgotPassword => 'שכחת את הסיסמה?';

  @override
  String get loginLoginButton => 'התחברות';

  @override
  String get loginOr => 'או';

  @override
  String get loginGoogleLogin => 'המשך עם Google';

  @override
  String get loginNeedAccount => 'אין לך חשבון?';

  @override
  String get forgotPasswordTitle => 'אפס את הסיסמה';

  @override
  String get forgotPasswordSubtitle =>
      'הזן את האימייל הרשום ונשלח קישור לאיפוס הסיסמה.';

  @override
  String get forgotPasswordSendButton => 'שלח קישור איפוס';

  @override
  String get forgotPasswordEmailSent =>
      'נשלחה הודעת אימייל לאיפוס הסיסמה. בדוק את תיבת הדואר.';

  @override
  String get registrationTitle => 'צור את החשבון שלך';

  @override
  String get registrationSubtitle => 'צור חשבון חדש';

  @override
  String get registrationName => 'שם מלא';

  @override
  String get registrationNameHint => 'הזן את השם הפרטי והמשפחה שלך';

  @override
  String get registrationEmail => 'אימייל';

  @override
  String get registrationEmailHint => 'הזן את כתובת האימייל שלך';

  @override
  String get registrationPassword => 'סיסמה';

  @override
  String get registrationPasswordHint => 'צור את הסיסמה שלך';

  @override
  String get registrationConfirmPassword => 'אישר סיסמה';

  @override
  String get registrationConfirmPasswordHint => 'הזן שוב את הסיסמה שלך';

  @override
  String get registrationTerms => 'אני מסכים לתנאי השימוש ולמדיניות הפרטיות.';

  @override
  String get registrationRegisterButton => 'צור חשבון';

  @override
  String get registrationAlreadyHaveAccount => 'כבר יש לך חשבון?';

  @override
  String get registrationLoginLink => 'התחברות';

  @override
  String dashboardHelloParam(String name) {
    return 'שלום, $name';
  }

  @override
  String get dashboardHome => 'בית';

  @override
  String get dashboardChatbot => 'צ\'אטבוט';

  @override
  String get dashboardAnalysis => 'ניתוח';

  @override
  String get dashboardMyAppointments => 'התורים שלי';

  @override
  String get dashboardResources => 'משאבים';

  @override
  String get dashboardCareGuide => 'מדריך טיפול';

  @override
  String get dashboardCareGuideSubtitle => 'הוראות טיפול לאחר השתלה';

  @override
  String get dashboardDefaultUserName => 'משתמש אורח';

  @override
  String get dashboardHairTransplantTitle => 'השתלת שיער';

  @override
  String get dashboardHairTransplantSubtitle => 'גלה כל טכניקת השתלה';

  @override
  String get dashboardOnlineConsultationTitle => 'ייעוץ מקוון';

  @override
  String get dashboardOnlineConsultationSubtitle => 'קבל עצה מקצועית בחינם';

  @override
  String get dashboardDoctorsTitle => 'הרופאים שלנו';

  @override
  String get dashboardDoctorsSubtitle => 'פגוש את המנתחים המומחים שלנו';

  @override
  String get dashboardAboutUsTitle => 'אודותינו';

  @override
  String get dashboardAboutUsSubtitle => 'למד על המרפאה שלנו';

  @override
  String get dashboardContactTitle => 'יצירת קשר';

  @override
  String get dashboardContactSubtitle => 'צור קשר איתנו';

  @override
  String get dashboardProgressTracking => 'מעקב התקדמות';

  @override
  String get dashboardProgressTrackingSubtitle => 'עקוב אחר התקדמות הטיפול שלך';

  @override
  String get dashboardPastAnalysesSubtitle => 'ניתוחי התמונות הקודמים שלך';

  @override
  String get settingsProfile => 'פרופיל';

  @override
  String get settingsPreferences => 'העדפות';

  @override
  String get settingsLanguage => 'שפה';

  @override
  String get settingsLanguageSubtitle => 'בחר את השפה המועדפת עליך';

  @override
  String get settingsDarkMode => 'מצב כהה';

  @override
  String get settingsDarkModeSubtitle => 'הפעל ערכת נושא כהה';

  @override
  String get settingsNotifications => 'התראות';

  @override
  String get settingsNotificationsSubtitle => 'הפעל את כל ההתראות';

  @override
  String get settingsEmailNotifications => 'התראות אימייל';

  @override
  String get settingsEmailNotificationsSubtitle => 'קבל התראות בדוא\"ל';

  @override
  String get settingsPushNotifications => 'התראות Push';

  @override
  String get settingsPushNotificationsSubtitle => 'קבל התראות push';

  @override
  String get settingsAccount => 'חשבון';

  @override
  String get settingsChangePassword => 'שנה סיסמה';

  @override
  String get settingsChangePasswordSubtitle => 'עדכן את הסיסמה שלך';

  @override
  String get settingsPrivacyPolicy => 'מדיניות פרטיות';

  @override
  String get settingsPrivacyPolicySubtitle => 'קרא את מדיניות הפרטיות שלנו';

  @override
  String get settingsTermsOfService => 'תנאי שירות';

  @override
  String get settingsTermsOfServiceSubtitle => 'קרא את תנאי השירות שלנו';

  @override
  String get settingsSupport => 'תמיכה';

  @override
  String get settingsHelpSupport => 'עזרה ותמיכה';

  @override
  String get settingsHelpSupportSubtitle => 'קבל עזרה וצור קשר עם התמיכה';

  @override
  String get settingsAddPhone => 'הוסף מספר טלפון';

  @override
  String get settingsThemeMode => 'מצב ערכת נושא';

  @override
  String get settingsThemeDescriptionSystem => 'עקוב אחר הגדרות המערכת';

  @override
  String get settingsThemeDescriptionLight => 'ערכת נושא בהירה';

  @override
  String get settingsThemeDescriptionDark => 'ערכת נושא כהה';

  @override
  String get settingsThemeDialogTitle => 'בחר מצב ערכת נושא';

  @override
  String get settingsThemeOptionSystem => 'מערכת';

  @override
  String get settingsThemeOptionSystemSubtitle => 'התאם להגדרות המכשיר';

  @override
  String get settingsThemeOptionLight => 'בהיר';

  @override
  String get settingsThemeOptionLightSubtitle => 'ערכת צבעים בהירה';

  @override
  String get settingsThemeOptionDark => 'כהה';

  @override
  String get settingsThemeOptionDarkSubtitle => 'ערכת צבעים כהה';

  @override
  String get settingsKvkkFormTitle => 'טופס בקשת KVKK';

  @override
  String get settingsKvkkFormSubtitle => 'הגש בקשה לגבי הנתונים האישיים שלך';

  @override
  String get settingsGdprFormTitle => 'טופס יצירת קשר GDPR';

  @override
  String get settingsGdprFormSubtitle => 'הודעת מידע עבור KVKK ו-GDPR';

  @override
  String get settingsRecordsTitle => 'הרישומים שלי';

  @override
  String get settingsTreatmentHistoryTitle => 'היסטוריית טיפול';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'צפה בתורים ורישומי הניתוחים שלך';

  @override
  String get settingsDocumentsTitle => 'מסמכים';

  @override
  String get settingsDocumentsSubtitle => 'דוחות, מרשמים וקבצים משותפים';

  @override
  String get settingsInvoicesTitle => 'חשבוניות';

  @override
  String get settingsInvoicesSubtitle => 'נהל תשלומים וחשבוניות';

  @override
  String get settingsSupportCenterSubtitle => 'תמיכה 24/7 וערוצי יצירת קשר';

  @override
  String get settingsContactTitle => 'יצירת קשר';

  @override
  String get settingsContactSubtitle => 'כתובת, טלפון ואפשרויות יצירת קשר';

  @override
  String get settingsProfileLoginRequired =>
      'אנא התחבר כדי לשנות את תמונת הפרופיל שלך.';

  @override
  String get settingsProfilePhotoUpdated => 'תמונת הפרופיל שלך עודכנה.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'שגיאה בעדכון תמונה: $error';
  }

  @override
  String get supportCenterTitle => 'מרכז תמיכה';

  @override
  String get supportCenterHeroTitle => 'כאן בשבילך 24/7';

  @override
  String get supportCenterHeroDescription =>
      'צוות התמיכה של Smile Hair Clinic איתך בכל שלב במסע הטיפול שלך.';

  @override
  String get supportCenterQuickContact => 'יצירת קשר מהירה';

  @override
  String get supportCenterWhatsappTitle => 'שוחח דרך WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'דבר עם צוות התמיכה החיה שלנו באופן מיידי';

  @override
  String get supportCenterCallTitle => 'התקשר אלינו';

  @override
  String get supportCenterEmailTitle => 'שלח לנו אימייל';

  @override
  String get supportCenterKnowledgeBase => 'מרכז ידע';

  @override
  String get supportCenterFaqSubtitle => 'שאלות לפני ואחרי הניתוח';

  @override
  String get supportCenterKnowledgeBaseTitle => 'בסיס ידע';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'כל המאמרים שלנו על השתלת שיער';

  @override
  String get supportCenterAppointmentSupportTitle => 'תמיכה בתורים וטיפול';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'קבל מידע על תוכנית הטיפול שלך';

  @override
  String get supportCenterMessageSectionTitle => 'שלח לנו הודעה';

  @override
  String get supportCenterMessageLabel => 'ההודעה שלך';

  @override
  String get supportCenterMessageHint => 'כתוב את השאלה או הבקשה שלך...';

  @override
  String get supportCenterMessageEmpty => 'אנא כתוב הודעה';

  @override
  String get supportCenterMessageSuccess =>
      'קיבלנו את הודעתך. נחזור אליך בקרוב.';

  @override
  String get supportCenterSendButton => 'שלח';

  @override
  String get treatmentHistoryTitle => 'היסטוריית טיפול';

  @override
  String get treatmentHistoryLoginRequired =>
      'עליך להתחבר כדי לצפות בתכונה זו.';

  @override
  String get treatmentHistoryEmpty => 'אין לך טיפולים רשומים עדיין.';

  @override
  String get treatmentHistoryDatePending => 'תאריך ממתין';

  @override
  String get treatmentHistoryDefaultType => 'בדיקה';

  @override
  String get treatmentHistoryDoctorPending => 'למינוי';

  @override
  String get treatmentHistoryStatusCompleted => 'הושלם';

  @override
  String get treatmentHistoryStatusCancelled => 'בוטל';

  @override
  String get treatmentHistoryStatusInProgress => 'בתהליך';

  @override
  String get treatmentHistoryStatusScheduled => 'מתוזמן';

  @override
  String get settingsAbout => 'אודות';

  @override
  String get settingsAboutSubtitle => 'גרסה ומידע על האפליקציה';

  @override
  String get settingsLogout => 'התנתקות';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'שחזור שיער פרימיום';

  @override
  String get clinicProfileAbout => 'אודות';

  @override
  String get clinicProfileDoctors => 'רופאים';

  @override
  String get clinicProfileGallery => 'גלריה';

  @override
  String get clinicProfileTreatments => 'טיפולים';

  @override
  String get clinicProfileBookConsultation => 'הזמן ייעוץ';

  @override
  String get clinicProfileAboutTitle => 'אודותינו';

  @override
  String get clinicProfileEthicsTitle => 'האתיקה שלנו';

  @override
  String get clinicProfilePressTitle => 'בעיתונות';

  @override
  String get clinicProfileContactTitle => 'פרטי יצירת קשר';

  @override
  String get clinicProfileDoctorsTitle => 'הרופאים שלנו';

  @override
  String get clinicProfileGalleryTitle => 'גלריית תוצאות';

  @override
  String get clinicProfileHairSurgeon => 'מנתח השתלת שיער';

  @override
  String get pastAnalysesTitle => 'ניתוחים קודמים';

  @override
  String get faqTitle => 'שאלות נפוצות';

  @override
  String get faqSubtitle => 'לשאלות שלך';

  @override
  String get splashTagline => 'מומחה להשתלת שיער ואסתטיקה';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'צילום אוטומטי מ-5 זוויות קריטיות לשיער ולקרקפת.\nודא שאתה בסביבה מוארת היטב לפני שתתחיל.';

  @override
  String get captureFlowStartCapture => 'התחל צילום';

  @override
  String get captureFlowFaceDetection =>
      'מקם את הפנים שלך במסגרת והסתכל למצלמה.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'מיקום נכון, הישאר ללא תנועה ($seconds שניות)';
  }

  @override
  String get captureFlowTurnRightMore => 'הפנה את הראש שלך קצת יותר ימינה.';

  @override
  String get captureFlowTooMuchRight => 'הפנית יותר מדי, התאם מעט שמאלה.';

  @override
  String get captureFlowKeepHeadStill =>
      'החזק את הראש שלך ללא תנועה ואל תזיז את הכתפיים.';

  @override
  String get captureFlowTurnLeftMore => 'הפנה את הראש שלך קצת יותר שמאלה.';

  @override
  String get captureFlowTooMuchLeft => 'הפנית יותר מדי, התאם מעט ימינה.';

  @override
  String get captureFlowCaptured => 'נצלם';

  @override
  String get captureFlowInitializingCamera => 'מאתחל מצלמה...';

  @override
  String get captureFlowCapturedPhotos => 'תמונות שצולמו';

  @override
  String get captureFlowEndSession => 'סיים סשן';

  @override
  String get captureFlowReviewPhotos => 'סקור תמונות';

  @override
  String get captureFlowPhotosCaptured => 'תמונות שצולמו';

  @override
  String get captureFlowSelected => 'נבחר';

  @override
  String get captureFlowContinueToAnalysis => 'המשך לניתוח';

  @override
  String get captureFlowNewCapture => 'התחל צילום חדש';

  @override
  String get captureFlowPhotosFrom5Angles => 'תמונות מ-5 זוויות';

  @override
  String get captureStageFrontTitle => 'מבט קדמי';

  @override
  String get captureStageFrontBaseInstruction =>
      'הביטו ישירות למצלמה והחזיקו את הראש ללא תנועה.';

  @override
  String get captureStageFrontReminder => 'החזיקו את הראש ישר והביטו למצלמה.';

  @override
  String get captureStageRight45Title => 'ימין 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'הפנו את הראש 45 מעלות ימינה.';

  @override
  String get captureStageRight45Reminder => 'הפנו את הראש יותר ימינה.';

  @override
  String get captureStageLeft45Title => 'שמאל 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'הפנו את הראש 45 מעלות שמאלה.';

  @override
  String get captureStageLeft45Reminder => 'הפנו את הראש יותר שמאלה.';

  @override
  String get captureStageVertexTitle => 'מבט עליון';

  @override
  String get captureStageVertexBaseInstruction =>
      'החזיקו את הטלפון שלכם אופקית מעל הראש.';

  @override
  String get captureStageVertexReminder =>
      'החזיקו את הטלפון שלכם שטוח מעל הראש.';

  @override
  String get captureStageDonorTitle => 'אזור תורם';

  @override
  String get captureStageDonorBaseInstruction =>
      'הפנו את הראש והחזיקו את הטלפון מאחורי הראש.';

  @override
  String get captureStageDonorReminder => 'החזיקו את הטלפון יציב מאחורי הראש.';

  @override
  String get photoCaptureFrontView => 'מבט קדמי';

  @override
  String get photoCapturePositionHead => 'מקם את הראש שלך בתוך הקו המתאר';

  @override
  String get photoCaptureFront => 'קדמי';

  @override
  String get photoCaptureTop => 'מעלה';

  @override
  String get photoCaptureLeft => 'שמאל';

  @override
  String get photoCaptureRight => 'ימין';

  @override
  String get chatOnline => 'מקוון';

  @override
  String get chatToday => '--- היום ---';

  @override
  String get chatMessageHint => 'הקלד את ההודעה שלך...';

  @override
  String get chatQuickRepliesAppointment => 'הזמן פגישה';

  @override
  String get chatQuickRepliesTreatmentPlan => 'תוכנית הטיפול שלי';

  @override
  String get chatQuickRepliesFollowup => 'בקש מעקב';

  @override
  String get chatQuickRepliesPriceInfo => 'מידע על מחירים';

  @override
  String progressPatientIdParam(String id) {
    return 'מזהה מטופל: $id';
  }

  @override
  String get progressStatistics => 'סטטיסטיקות';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months חודשים לאחר הניתוח';
  }

  @override
  String get progressProcedureDay => 'יום ההליך';

  @override
  String get progressInitialConsultation => 'ייעוץ ראשוני';

  @override
  String get progressUploadPhoto => 'העלה תמונה חדשה';

  @override
  String get analysisCaptureAndAnalyze => 'צלם ונתח';

  @override
  String get analysisPastAnalyses => 'ניתוחים קודמים';

  @override
  String get analysisAnalysisDate1 => '15 באוקטובר 2023';

  @override
  String get analysisAnalysisDesc1 => 'הדלדלות קלה באזור הכתר';

  @override
  String get analysisAnalysisDate2 => '12 ביולי 2023';

  @override
  String get analysisAnalysisDesc2 => 'סימני דלקת בקרקפת';

  @override
  String get analysisAnalysisDate3 => '5 באפריל 2023';

  @override
  String get analysisAnalysisDesc3 => 'בריאות הקרקפת הכללית טובה';

  @override
  String get analysisAnalysisDate4 => '20 בינואר 2023';

  @override
  String get analysisAnalysisDesc4 => 'ניתוח ראשוני לטיפול';

  @override
  String get faqQuestion1 => 'כמה זמן לוקח הליך השתלת השיער?';

  @override
  String get faqAnswer1 =>
      'הליך השתלת השיער בדרך כלל לוקח 4-8 שעות בהתאם למספר השתלים שיש להשתיל. מכיוון שמשתמשים בהרדמה מקומית במהלך ההליך, המטופל לא מרגיש כאב.';

  @override
  String get faqQuestion2 => 'מתי אוכל לחזור לחיים רגילים לאחר השתלת שיער?';

  @override
  String get faqAnswer2 =>
      'אתה יכול לבצע פעילויות קלות 2-3 ימים לאחר השתלת השיער. מומלץ לחכות שבועיים לספורט כבד ופעילויות פיזיות. חזרה לעבודה בדרך כלל אפשרית 3-5 ימים לאחר מכן.';

  @override
  String get faqQuestion3 => 'מתי השיערות המושתלות מתחילות לצמוח?';

  @override
  String get faqAnswer3 =>
      'השיערות המושתלות נושרות ב-2-3 השבועות הראשונים (נשירה כתוצאה מהלם). שיערות חדשות מתחילות לצמוח 3-4 חודשים לאחר מכן ותוצאות מלאות נראות תוך 6-12 חודשים.';

  @override
  String get faqQuestion4 => 'האם הליך השתלת השיער כואב?';

  @override
  String get faqAnswer4 =>
      'מכיוון שמשתמשים בהרדמה מקומית במהלך ההליך, לא מרגישים כאב. עשוי להיות כאב קל לאחר ההליך, אך ניתן לשלוט בזה עם משככי כאבים.';

  @override
  String get faqQuestion5 => 'מהו שיעור ההצלחה של השתלת השיער?';

  @override
  String get faqAnswer5 =>
      'להשתלת השיער יש שיעור הצלחה גבוה מאוד, בדרך כלל 95-98%. ההצלחה תלויה בבריאות המטופל, באיכות אזור התורם ובעמידה בהוראות הטיפול שלאחר הניתוח.';

  @override
  String get faqQuestion6 => 'האם נשים יכולות לעבור השתלת שיער?';

  @override
  String get faqAnswer6 =>
      'כן, נשים יכולות לעבור השתלת שיער. נשירת שיער נשית נפוצה וניתן לטפל בה בהליכי השתלת שיער. נדרשת התייעצות כדי לקבוע אם המטופל הוא מועמד מתאים.';

  @override
  String get faqQuestion7 => 'כמה שתלים נדרשים להשתלת שיער?';

  @override
  String get faqAnswer7 =>
      'מספר השתלים הנדרשים תלוי בהיקף נשירת השיער ובצפיפות הרצויה. בדרך כלל, משתמשים ב-1,500-3,000 שתלים לנשירת שיער בינונית, בעוד ש-3,000-5,000 שתלים עשויים להידרש לנשירת שיער נרחבת.';

  @override
  String get faqQuestion8 => 'האם יש הגבלת גיל להשתלת שיער?';

  @override
  String get faqAnswer8 =>
      'אין הגבלת גיל קפדנית, אך ההליך מומלץ בדרך כלל למטופלים מעל גיל 25 כאשר דפוס נשירת השיער יציב יותר. כל מקרה מוערך באופן אינדיבידואלי.';

  @override
  String get faqQuestion9 => 'מהו זמן ההחלמה לאחר השתלת השיער?';

  @override
  String get faqAnswer9 =>
      'רוב המטופלים יכולים לחזור לעבודה תוך 3-5 ימים. הקליפות נופלות בדרך כלל תוך 7-10 ימים. החלמה מלאה ופעילויות רגילות יכולות להתחדש לאחר שבועיים.';

  @override
  String get faqQuestion10 => 'האם תוצאות השתלת השיער קבועות?';

  @override
  String get faqAnswer10 =>
      'כן, השיער המושתל הוא קבוע מכיוון שהוא נלקח מאזור התורם העמיד גנטית לנשירת שיער. השיער המושתל ימשיך לצמוח באופן טבעי למשך שארית חייך.';

  @override
  String get pastAnalysesListView => 'תצוגת רשימה';

  @override
  String get pastAnalysesGridView => 'תצוגת רשת';

  @override
  String get pastAnalysesDetailedView => 'תצוגה מפורטת';

  @override
  String get pastAnalysesDensityModerate => 'צפיפות: בינונית';

  @override
  String get pastAnalysesDensityLow => 'צפיפות: נמוכה';

  @override
  String get privacyPolicyTitle => 'מדיניות עיבוד והגנה על נתונים אישיים';

  @override
  String get privacyPolicyDocumentDate => 'תאריך המסמך:';

  @override
  String get privacyPolicyRevisionDate => 'תאריך עדכון:';

  @override
  String get privacyPolicyRevisionNumber => 'מספר עדכון:';

  @override
  String get privacyPolicySection1 => 'I. מבוא';

  @override
  String get privacyPolicySection1A => 'א. מטרה והיקף';

  @override
  String get privacyPolicySection1AContent =>
      'מדיניות זו מסדירה את העקרונות שאומצו על ידי Smile Hair Clinic ביחס להגנה ועיבוד נתונים אישיים.\n\nבמסגרת מדיניות זו, Smile Hair Clinic מספקת הסברים לגבי פעילויות עיבוד נתונים אישיים והמערכות שאומצו להגנה על נתונים אישיים. זה כולל מידע והבטחת שקיפות עבור אנשים רלוונטיים, בעיקר כולל נמעני מוצרים או שירותים, עובדים ומועמדים לעבודה, לקוחות פוטנציאליים, בעלי מניות, מבקרים, משתתפים, ספקים וצדדים שלישיים, הקמה והבטחת סטנדרטים בניהול נתונים אישיים; קביעה ותמיכה ביעדים והתחייבויות ארגוניות; הקמת מנגנוני בקרה תואמים לרמות סיכון מקובלות, ציות לעקרונות וכללים שנקבעו על ידי אמנות בינלאומיות, החוקה, חוקים, תקנות, חוזים וחקיקה אחרת ביחס להגנה על נתונים אישיים, והבטחת ההגנה הטובה ביותר על זכויות וחירויות יסוד של האדם הרלוונטי. בנוסף, מדיניות זו מכסה את כל מערכות וסביבות רישום הנתונים הפיזיות והאלקטרוניות המשמשות לעיבוד נתונים אישיים ונתונים אישיים בקטגוריה מיוחדת אוטומטית או כחלק ממערכת רישום נתונים באמצעים לא אוטומטיים.';

  @override
  String get privacyPolicySection1B => 'ב. הגדרות';

  @override
  String get photoAnalysisTitle => 'ניתוח תמונות';

  @override
  String photosUploadedCount(String count) {
    return '$count תמונות הועלו';
  }

  @override
  String get autoAnalysisStarting => '5 תמונות הועלו. הניתוח האוטומטי יתחיל...';

  @override
  String stageUploaded(String stage) {
    return 'זווית $stage הועלתה';
  }

  @override
  String stageCaptured(String stage) {
    return 'זווית $stage נלכדה';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'שגיאה בטעינת תמונה: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'שגיאה בטעינת מספר תמונות: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'שגיאה בצילום תמונה: $error';
  }

  @override
  String get imageSourceTitle => 'מקור תמונה';

  @override
  String get imageSourceCamera => 'מצלמה';

  @override
  String get imageSourceGallery => 'גלריה';

  @override
  String get imageSourceMultiGallery => 'בחר מספר מהגלריה';

  @override
  String get promptNoPhotosForAnalysis =>
      'אנא העלה תמונה תחילה. הקש על כפתור 📷 להעלאה.';

  @override
  String get analyzingPhotos => 'התמונות שלך מנותחות...';

  @override
  String get visualAnalysisHeader => '📸 ניתוח חזותי - מה שאני רואה:';

  @override
  String get importantWarningHeader => '⚠️ אזהרה חשובה:';

  @override
  String get differentPersonsDetected =>
      'אנשים שונים זוהו בתמונות! כל התמונות חייבות להיות של אותו אדם.';

  @override
  String get pleaseCaptureSamePerson =>
      'אנא צלם תמונות של אותו אדם מ-5 זוויות שונות.';

  @override
  String get detectedAnglesHeader => '🔍 זוויות שזוהו:';

  @override
  String get analysisCompleted => '✅ הניתוח הושלם!';

  @override
  String get allPhotosLookGood => 'כל התמונות נראות טוב.';

  @override
  String get savedToFirebase => '✅ התמונות נשמרו ב-Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'מזהה ניתוח: $id';
  }

  @override
  String get savedLocationLabel => 'מיקום שמור: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ תוצאת ניתוח';

  @override
  String get retakeRequiredAngles => '❌ זוויות שצריך לצלם שוב:';

  @override
  String get errorDetailsHeader => 'פרטי שגיאה:';

  @override
  String get retakeTheseAnglesQuestion => 'האם תרצה לצלם מחדש את הזוויות האלה?';

  @override
  String get retakeFirstInvalidQuestion =>
      'האם תרצה לצלם מחדש את הזווית הלא תקינה הראשונה?';

  @override
  String get retake => 'צלם מחדש';

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
  String get uploadAndAnalyze => 'העלה ונתח';

  @override
  String get captureWithFaceDetection => 'צילום עם זיהוי פנים';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'בחר שעה';

  @override
  String get dateNotAvailable => 'Date not available';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get enableDailyMedicationReminder => 'הפעל תזכורת תרופות יומית';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'גישה מהירה';

  @override
  String get quickActions => 'פעולות מהירות';

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
  String get noUpcomingAppointments => 'אין פגישות קרובות';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'ייעוץ חינם';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'שם מלא';

  @override
  String get fullNameHint => 'שם משפחה';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'כתוב את ההודעה שלך כאן...';

  @override
  String get or => 'או';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'אודותינו';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'הערכים שלנו';

  @override
  String get professionalism => 'מקצועיות';

  @override
  String get professionalismDescription =>
      'הרופאים המומחים שלנו המוסמכים בינלאומית בתחומם';

  @override
  String get patientSatisfaction => 'שביעות רצון המטופל';

  @override
  String get patientSatisfactionDescription =>
      'האושר של המטופלים שלנו הוא תמיד בראש סדר העדיפויות';

  @override
  String get medicalEducation => 'חינוך רפואי';

  @override
  String get medicalEducationDescription =>
      'כל חבר בצוות שלנו מורכב ממקצועיים עם הכשרה רפואית';

  @override
  String get internationalService => 'שירות בינלאומי';

  @override
  String get internationalServiceDescription =>
      'משרתים את המטופלים שלנו מכל רחבי העולם';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'ניתוחים\nמוצלחים';

  @override
  String get patientsFromCountries => 'מטופלים מ\nמדינות';

  @override
  String get expertDoctors => 'רופאים\nמומחים';

  @override
  String get patientSatisfactionRate => 'שביעות רצון\nמטופלים';

  @override
  String get experience => 'ניסיון';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'אודות';

  @override
  String get expertiseAreas => 'תחומי מומחיות';

  @override
  String get interview => 'ראיון';

  @override
  String get contactUs => 'צור קשר';

  @override
  String get call => 'התקשר';

  @override
  String get workingHours => 'שעות עבודה';

  @override
  String get mondayFriday => 'שני - שישי';

  @override
  String get saturday => 'שבת';

  @override
  String get sunday => 'ראשון';

  @override
  String get closed => 'סגור';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'הכל';

  @override
  String get unread => 'לא נקרא';

  @override
  String get scheduled => 'מתוזמן';

  @override
  String get markAllAsRead => 'סמן הכל כנקרא';

  @override
  String get noNotificationsYet => 'אין התראות עדיין';

  @override
  String get newNotificationsWillAppearHere => 'התראות חדשות יופיעו כאן';

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
    return 'מצלמה לא נמצאה במכשיר: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'לא ניתן לפתוח את אפליקציית הטלפון. אנא ודא שאפליקציית הטלפון מותקנת במכשיר שלך.';

  @override
  String get emailAppCannotOpen =>
      'לא ניתן לפתוח את אפליקציית הדוא\"ל. אנא ודא שאפליקציית הדוא\"ל מותקנת במכשיר שלך.';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'הרופאים שלנו';

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
  String get doctor => 'רופא';

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
  String get yourDoctor => 'הרופא שלך';

  @override
  String get appointment => 'פגישה';

  @override
  String get soon => 'בקרוב';

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
    return 'לפני $minutes דקות';
  }

  @override
  String get justNow => 'ממש עכשיו';

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
  String get front => 'קדמי';

  @override
  String get right45 => 'ימין 45°';

  @override
  String get left45 => 'שמאל 45°';

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
    return 'לא ניתן לשלוח הודעה: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'מטופל';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'אין הודעות עדיין';

  @override
  String get typeMessage => 'הקלד הודעה...';

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
  String get pending => 'ממתין';

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
  String get unknownDate => 'תאריך לא ידוע';

  @override
  String get january => 'ינואר';

  @override
  String get february => 'פברואר';

  @override
  String get march => 'מרץ';

  @override
  String get april => 'אפריל';

  @override
  String get may => 'מאי';

  @override
  String get june => 'יוני';

  @override
  String get july => 'יולי';

  @override
  String get august => 'אוגוסט';

  @override
  String get september => 'ספטמבר';

  @override
  String get october => 'אוקטובר';

  @override
  String get november => 'נובמבר';

  @override
  String get december => 'דצמבר';

  @override
  String get analysisCompletedShort => 'הניתוח הושלם!';

  @override
  String get retakeDialogTitle => 'נדרש צילום מחדש';

  @override
  String get retakeDialogBody =>
      'ניתוח ה-AI מציין שהזוויות הבאות צריכות צילום מחדש:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'האם תרצה לצלם מחדש את הזווית הלא תקינה הראשונה?';

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
  String get noSavedAnalyses => 'אין ניתוחים שמורים עדיין.';

  @override
  String welcomeGreeting(String name) {
    return 'ברוך הבא, $name';
  }

  @override
  String get loginRequiredForMessaging => 'עליך להתחבר כדי לשלוח הודעות';

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
  String get allNotificationsMarkedAsRead => 'כל ההתראות סומנו כנקראו';

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
  String get contactAddress => 'כתובת';

  @override
  String get contactEmail => 'אימייל';

  @override
  String get contactPhone => 'טלפון';

  @override
  String get contactWhatsApp => 'יועץ WhatsApp';

  @override
  String get patientCareGuideTitle => 'Patient Care Guide';

  @override
  String get planningTab => 'Planning';

  @override
  String get operationTab => 'Operation';

  @override
  String get recoveryTab => 'Recovery';

  @override
  String get resourcesTab => 'משאבים';

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
  String get message => 'הודעה';

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
  String get examplePhotoFrontTitle => 'דוגמה לזווית קדמית';

  @override
  String get examplePhotoFrontInstructions =>
      '• הביטו ישירות למצלמה\n• שמרו על סנטר ישר, ראש זקוף\n• העיניים צריכות להביט למצלמה\n• הפנים צריכות להיות גלויות לחלוטין';

  @override
  String get examplePhotoRight45Title => 'דוגמה לזווית ימין 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• סובבו את הראש באופן בולט ימינה (~70–90°)\n• שמרו על סנטר ישר, ראש זקוף\n• הלחי הימנית והרקה צריכות להיות גלויות\n• הכתפיים לא צריכות לזוז';

  @override
  String get examplePhotoLeft45Title => 'דוגמה לזווית שמאל 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• סובבו את הראש באופן בולט שמאלה (~70–90°)\n• שמרו על סנטר ישר, ראש זקוף\n• הלחי השמאלית והרקה צריכות להיות גלויות\n• הכתפיים לא צריכות לזוז';

  @override
  String get examplePhotoVertexTitle => 'דוגמה לזווית קודקוד';

  @override
  String get examplePhotoVertexInstructions =>
      '• החזיקו את הטלפון אופקית ושטוח\n• המסך צריך להיות מופנה כלפי מעלה\n• הניחו את הטלפון מעל הראש\n• כל הקרקפת צריכה להיות גלויה';

  @override
  String get examplePhotoDonorTitle => 'דוגמה לאזור התורם';

  @override
  String get examplePhotoDonorInstructions =>
      '• החזיקו את הטלפון מאחורי הראש\n• העורף וצד אחורי של הראש צריכים להיות גלויים\n• שמרו על הטלפון יציב\n• התאורה צריכה להיות מספקת';

  @override
  String get camera => 'מצלמה';

  @override
  String get gallery => 'גלריה';

  @override
  String get deleteForMe => 'מחק בשבילי';

  @override
  String get messageDeleted => 'הודעה נמחקה';

  @override
  String get deleteForEveryone => 'מחק לכולם';

  @override
  String get deleteMessage => 'מחק הודעה';

  @override
  String get deleteMessageReadWarning =>
      'הודעה זו נקראה על ידי הנמען. האם אתה עדיין רוצה למחוק אותה?';

  @override
  String get deleteMessageConfirm => 'הודעה זו תימחק לכולם. האם אתה בטוח?';

  @override
  String get messageDeletedForEveryone => 'הודעה נמחקה לכולם';

  @override
  String get userNotLoggedIn => 'המשתמש לא מחובר';

  @override
  String get messagesLoadingError => 'אירעה שגיאה בטעינת ההודעות';

  @override
  String get loadingMessages => 'טוען הודעות...';

  @override
  String get startConversation => 'התחל שיחה על ידי שליחת הודעה';

  @override
  String get loadOlderMessages => 'טען הודעות ישנות יותר';

  @override
  String get sendPhoto => 'שלח תמונה';

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
  String get needLoginForAnalysis => 'עליך להתחבר כדי לנתח';

  @override
  String openCaptureFlowError(String error) {
    return 'שגיאה בפתיחת מסך צילום: $error';
  }

  @override
  String get sessionExpired => 'תוקף ההפעלה שלך פג. אנא התחבר שוב.';

  @override
  String get photosAnalyzedAndSaved => 'התמונות נותחו ונשמרו בהצלחה!';

  @override
  String get photoNotFoundForAnalysis => 'לא נמצאו תמונות לניתוח';

  @override
  String get noValidPhotosFound => 'No valid photos found';

  @override
  String get analysisPreparing => 'מכין תמונות...';

  @override
  String get photosUploading => 'מעלה תמונות...';

  @override
  String get errorUploadingPhotos => 'An error occurred while uploading photos';

  @override
  String get geminiChecking => 'בודק חיבור Gemini API...';

  @override
  String get geminiFailed =>
      'חיבור Gemini API נכשל. אנא בדוק את חיבור האינטרנט שלך.';

  @override
  String get aiAnalyzing => 'מבצע ניתוח AI...';

  @override
  String get someAnglesNeedRetake => 'כמה זוויות צריכות צילום מחדש...';

  @override
  String get analysisSaved => 'הניתוח נשמר בהצלחה!';

  @override
  String get analysisCompletedSuccessfully => 'הניתוח הושלם בהצלחה!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count זוויות צריכות צילום מחדש...';
  }

  @override
  String get errorDuringAnalysis => 'שגיאה במהלך הניתוח';

  @override
  String get geminiApiError =>
      'שגיאת חיבור Gemini API. אנא בדוק את חיבור האינטרנט שלך.';

  @override
  String get firebaseError => 'שגיאת חיבור Firebase. אנא נסה שוב.';

  @override
  String get photoProcessingError => 'שגיאת עיבוד תמונה. אנא נסה שוב.';

  @override
  String get authErrorLoginAgain => 'שגיאת אימות. אנא התחבר שוב.';

  @override
  String get analysisSuccessfulTitle => 'ניתוח מוצלח';

  @override
  String get analysisResultsTitle => 'תוצאות ניתוח';

  @override
  String get detailedAnalysisHeader => 'ניתוח מפורט:';

  @override
  String get retakeRequiredAnglesHeader => 'זוויות הדורשות צילום מחדש:';

  @override
  String dialogError(String error) {
    return 'שגיאה בפתיחת דיאלוג: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Baseline photo not found';

  @override
  String get noPhotosToUpdate => 'No photos to update found';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'שגיאה במהלך הניתוח: $error';
  }

  @override
  String retakeError(String error) {
    return 'שגיאה במהלך צילום מחדש: $error';
  }

  @override
  String get aiSupport => 'תמיכה ב-AI';

  @override
  String get myPhotos => 'התמונות שלי';

  @override
  String get photoAnalysisChatbot => 'צ\'אטבוט ניתוח תמונות';

  @override
  String get disableMedicationReminder => 'השבת תזכורת תרופות';

  @override
  String get medicationReminderDisabled => 'תזכורת התרופות היומית הושבתה';

  @override
  String get medicationTime => 'שעת תרופות';

  @override
  String get selectMedicationReminderTime =>
      'בחר את שעת התזכורת היומית שלך לתרופות';

  @override
  String get selectMedicationTime => 'בחר שעת תרופות';

  @override
  String medicationReminderSetAt(String time) {
    return 'תזכורת תרופות יומית הוגדרה ל-$time';
  }

  @override
  String get noDateInfo => 'No date information';

  @override
  String get invalidDate => 'תאריך לא חוקי';

  @override
  String get today => 'היום';

  @override
  String get yesterday => 'אתמול';

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
  String get hairTransplantTitle => 'השתלת שיער';

  @override
  String get hairTransplantSectionCount => 'סעיפים';

  @override
  String get hairTransplantVideo => 'וידאו';

  @override
  String get hairTransplantFreeConsultation => 'קבל ייעוץ חינם';

  @override
  String get hairTransplantWatchVideo => 'צפה בוידאו';

  @override
  String get hairTransplantWatchVideoSubtitle => 'לחץ לצפייה ב-YouTube';

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
    return 'שגיאה במהלך הניתוח: $error';
  }

  @override
  String get myDocuments => 'המסמכים שלי';

  @override
  String get loginRequiredForDocuments => 'עליך להתחבר כדי לצפות במסמכים';

  @override
  String get noDocumentsYet => 'אין עדיין מסמכים';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'אירעה שגיאה:\n$error';
  }

  @override
  String get datePending => 'ממתין';

  @override
  String get chatSupportWelcomeMessage =>
      'שלום! אני העוזר החכם שלך. איך אוכל לעזור לך היום?';

  @override
  String get newChat => 'צ\'אט חדש';

  @override
  String get chatSupportAiAssistantName => 'עוזר חכם';

  @override
  String get historyTooltip => 'היסטוריה';

  @override
  String get typingIndicator => 'החכם מקליד...';

  @override
  String get chatHistoryTitle => 'היסטוריית צ\'אט';

  @override
  String get noSavedChats => 'אין צ\'אטים שמורים';

  @override
  String genericErrorTryAgain(String error) {
    return 'אירעה שגיאה. אנא נסה שוב.\nשגיאה: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'לא ניתן לפתוח את WhatsApp. אנא ודא שאפליקציית WhatsApp מותקנת.';

  @override
  String whatsappOpenError(String error) {
    return 'אירעה שגיאה בעת פתיחת WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'אירעה שגיאה בעת פתיחת מסך הצילום: $error';
  }

  @override
  String get retakeAnalyzing => 'התמונה שצולמה מחדש נבדקת...';

  @override
  String get autoAnalysisOn => 'ניתוח אוטומטי: מופעל';

  @override
  String get autoAnalysisOff => 'ניתוח אוטומטי: כבוי';

  @override
  String get clearPhotosTooltip => 'נקה תמונות';

  @override
  String get messageHintAnalyze => 'הקלד את ההודעה שלך או כתוב \"נתח\"...';

  @override
  String get send => 'שלח';

  @override
  String get aiAssistantName => 'עוזר ניתוח חכם';

  @override
  String get expertTeam => 'צוות מומחים';

  @override
  String get expertTeamDescription =>
      'הצוות שלנו מורכב ממומחים מנוסים בניתוחי השתלת שיער.';

  @override
  String get comingSoon => 'בקרוב';

  @override
  String get loginToSendMessage => 'אנא התחבר כדי לשלוח הודעה';

  @override
  String get doctorEmailMissing => 'אימייל הרופא חסר';

  @override
  String doctorNotFound(String name) {
    return 'רופא $name לא נמצא';
  }

  @override
  String get messagingComingSoon => 'תכונת הודעות בקרוב';

  @override
  String get years => 'שנים';

  @override
  String get watchWashingVideo => 'צפה בסרטון שטיפה';

  @override
  String get preCareTip1Title => 'בחר את המנתח הנכון';

  @override
  String get preCareTip1Body =>
      'הליך Sapphire FUE דורש מנתח מנוסה וצוות רב-תחומי. עבוד עם רופאים המסבירים את הציפיות שלך באופן ריאלי, מתכננים את הניתוח מקצה לקצה ומיישמים את הפרוטוקולים של Smile Hair.';

  @override
  String get preCareTip2Title => 'שתף את ההיסטוריה הרפואית שלך';

  @override
  String get preCareTip2Body =>
      'שתף את המחלות הכרוניות שלך, התרופות הרגילות והאלרגיות עם הצוות מבלי להסתיר אותן. זה ממזער את הסיכונים שעלולים להתרחש במהלך ההרדמה והניתוח.';

  @override
  String get preCareTip3Title => 'מדללי דם ותהליך האישור';

  @override
  String get preCareTip3Body =>
      'הפסק אספירין או מדללי דם דומים לפחות שבוע לפני תאריך הניתוח, באישור הרופא שקבע את התרופה. אתה יכול לחדש את השימוש יומיים לאחר ההליך.';

  @override
  String get preCareTip4Title => 'בדיקת זיהומים';

  @override
  String get preCareTip4Body =>
      'שמור על תוצאות הבדיקה שלך להפטיטיס B/C ו-HIV מעודכנות. מרפאות ללא תנאים מתאימים של חדר ניתוח לא יכולות לבצע ניתוחים לזיהומים אלה, כדי שהנסיעה שלך לא תלך לבטלה.';

  @override
  String get preCareTip5Title => 'תוספי תזונה וויטמינים';

  @override
  String get preCareTip5Body =>
      'תוספי תזונה המכילים ויטמינים B ו-E מגבירים דימום; הפסק אותם שבוע לפני ההליך. במידת הצורך, הרופא שלך יתכנן טיפולים תומכים.';

  @override
  String get preCareTip6Title => 'אלכוהול וסיגריות';

  @override
  String get preCareTip6Body =>
      'הפסק אלכוהול לפחות שבוע לפני הניתוח ואל תצרוך אותו במשך 14 יום לאחר ההליך. הישאר רחוק מסיגריות 12 שעות לפני הניתוח ולמשך שבועיים אחר כך, מכיוון שזה מפריע למחזור הדם.';

  @override
  String get preCareTip7Title => 'תכנית מזוודות ובגדים';

  @override
  String get preCareTip7Body =>
      'בחר בגדים עם כפתורים או רוכסן לחלק העליון של הגוף. בגדים עם צווארון צמוד עלולים לפגוע בשתלים. הכין תיק גדול שיכול לשאת את ערכת הטיפול שניתנה לאחר הניתוח.';

  @override
  String get preCareTip8Title => 'מנוחה והיגיינה';

  @override
  String get preCareTip8Body =>
      'לישון טוב ביום הניתוח, לאכול ארוחת בוקר מזינה ולקחת מקלחת לפני בוא למרפאה. קרקפת נקייה מפחיתה את הסיכון לזיהום.';

  @override
  String get postCareTip1Title => 'הגן על השתלים';

  @override
  String get postCareTip1Body =>
      'היזהר לא להכות את הראש בשום מקום במשך 7 הימים הראשונים. לישון על הגב תוך שימוש בכרית צוואר ולמנוע שפשוף השתלים בכרית.';

  @override
  String get postCareTip2Title => 'הלילה הראשון והימים הבאים';

  @override
  String get postCareTip2Body =>
      'ודא שאתה מבלה את הלילה הראשון לאחר הניתוח במנוחה. אם אתה צריך לצאת, השתמש במטרייה המגנה עליך מפני השמש והגשם.';

  @override
  String get postCareTip3Title => 'הקפד על תכנית התרופות';

  @override
  String get postCareTip3Body =>
      'השתמש באנטיביוטיקה, משככי כאבים, תרופות אנטי-דלקתיות ותרסיס פנתנול בדיוק כפי שנקבע. ודא שאתה מבין את המרשם והוראות השימוש לפני שעזבת את צוות המרפאה.';

  @override
  String get postCareTip4Title => 'לחות ותרסיסים';

  @override
  String get postCareTip4Body =>
      'השתמש רק בתרסיס האיזוטוני/פנתנול שניתן לך עד השטיפה הראשונה. החל קרם אנטיביוטי על אזור התורם במשך 5-7 הימים הראשונים.';

  @override
  String get postCareTip5Title => 'פרוטוקול שטיפה';

  @override
  String get postCareTip5Body =>
      'השטיפה הראשונה נעשית במרפאה 48 שעות לאחר מכן. ואז כל יום, החל בעדינות את הקצף בתנועות טפיחה, השתמש במים פושרים בלחץ נמוך וייבש במגבות נייר.';

  @override
  String get postCareTip6Title => 'גלדים ואובדן הלם';

  @override
  String get postCareTip6Body =>
      'מהיום ה-10 ואילך, הסר את הגלדים בלחץ קל. אובדן הלם שחוו בין שבועות 2-4 הוא נורמלי; שיער חדש הופך נראה מהחודש השלישי.';

  @override
  String get postCareTip7Title => 'פעילות וספורט';

  @override
  String get postCareTip7Body =>
      'אל תעשה ספורט במשך השבועיים הראשונים, אתה יכול לעשות הליכות קלות אחרי 3-4 ימים. הימנע מבריכה, סאונה ופעילויות הדורשות הזעה אינטנסיבית למשך לפחות חודש.';

  @override
  String get postCareTip8Title => 'תלונות נוחות';

  @override
  String get postCareTip8Body =>
      'אם יש צריבה או כאב באזור התורם, השתמש בקרם המכיל סטרואידים באישור המרפאה. החל קומפרסים קרים לזמן קצר לנפיחות.';

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
      'כל יום, מבצעים בדיקות דליפת ואקום כדי לבדוק את אטימות המחטאים.';

  @override
  String get sterilizationMeasure2 =>
      'אימות יומי שהקיטור מגיע לכל המשטחים באופן שווה עם בדיקת Bowie-Dick.';

  @override
  String get sterilizationMeasure3 =>
      'בדיקות שטיפה אולטרה-סוניות מתעדות שאנחנו מנקים שאריות מיקרו.';

  @override
  String get sterilizationMeasure4 =>
      'בדיקות אינדיקטורים ביולוגיים מתבצעות כל 15 יום ומדווח שאין רבייה.';

  @override
  String get sterilizationMeasure5 =>
      'כלים סטריליים ומשומשים מאוחסנים בנפרד בתיבות נעולות; זיהום צולב נמנע.';

  @override
  String get sterilizationMeasure6 =>
      'כל סט מנוטר עם תוויות מספר אוטוקלב, תאריך ותאריך תפוגה.';

  @override
  String get sterilizationMeasure7 =>
      'כל התהליכים מתבצעים לפי מדריך DAS של משרד הבריאות, תקני ארגון הבריאות העולמי ו-AAMI ST79.';

  @override
  String get washStep1 =>
      'אל תשטוף את השיער במשך 36-48 השעות הראשונות לאחר הניתוח; חכה לשטיפה הראשונה שתיעשה במרפאה.';

  @override
  String get washStep2 =>
      'החל את הלוטיון או הקצף הן על אזור התורם והן על אזור המקבל בתנועות טפיחה עם קצות האצבעות.';

  @override
  String get washStep3 =>
      'הקצף את השמפו והפיץ בעדינות על האזור המושתל במגעים אנכיים; הימנע מתנועות מעגליות.';

  @override
  String get washStep4 =>
      'השתמש במים פושרים בלחץ נמוך. במשך 14 הימים הראשונים, זה בטוח יותר לשפוך מים עם קערה במקום ראש מקלחת.';

  @override
  String get washStep5 =>
      'ייבש את אזור השתלים על ידי לחיצה קלה במגבות נייר, אתה יכול לייבש את אזור התורם במגבת רגילה.';

  @override
  String get washStep6 =>
      'אם אתה צריך להשתמש במייבש שיער, השתמש בו רק במצב קר וממרחק.';

  @override
  String get faq1Question => 'כמה זמן נמשך ההחלמה?';

  @override
  String get faq1Answer =>
      'שבועיים הראשונים הם תקופה רגישה; השיער עובר שלבים שונים במשך 6-12 חודשים. תוצאות משמעותיות נראות בחודש ה-6, צפיפות סופית בחודשים 12-18.';

  @override
  String get faq2Question => 'איך צריכים להיות התחבושת ורוטינת השינה?';

  @override
  String get faq2Answer =>
      'תחבושת אלסטית יכולה להיות מיושמת כדי להפחית נפיחות באזור המצח. לישון על הגב עם כרית צוואר במצב מוגבה מעט במשך 7-10 הימים הראשונים.';

  @override
  String get faq3Question => 'מקלחת, שטיפה ושימוש במוצרים';

  @override
  String get faq3Answer =>
      'אל תרטיב את השיער במשך שני הימים הראשונים. אחרי 48 שעות, שטוף פעם ביום עם שמפו רפואי אחרי השטיפה הראשונה במרפאה; שמור על זמן המקלחת קצר, הפחת קיטור.';

  @override
  String get faq4Question => 'מתי אני יכול לייבש, לסרק או לצבוע את השיער שלי?';

  @override
  String get faq4Answer =>
      'רק ייבוש טבעי מומלץ בתוך החודש הראשון. אתה יכול לסרק את אזור התורם אבל אל תיגע באזור ההשתלה במשך 2 שבועות. הישאר רחוק מצבעים כימיים למשך 6-8 שבועות.';

  @override
  String get faq5Question => 'עישון, אלכוהול ופעילות גופנית';

  @override
  String get faq5Answer =>
      'עישון אסור 12 שעות לפני הניתוח ולמשך 2 שבועות אחר כך. אלכוהול לא צריך להיות בשימוש במשך 14 הימים הראשונים. הליכות קלות חופשיות אחרי יום 4, חכה חודש לספורט כבד.';

  @override
  String get faq6Question => 'כובע, שמש, נסיעה וחזרה לעבודה';

  @override
  String get faq6Answer =>
      'אל תלבש כובע במשך 10 הימים הראשונים או העדף דגמים מאוד רופפים. הימנע מאור שמש ישיר. אתה יכול לחזור לעבודת משרד תוך 3-5 ימים; חכה 2 שבועות לעבודה פיזית. אתה יכול לנסוע אבל הגן על השתלים.';

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
