// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get close => 'إغلاق';

  @override
  String get changePhoto => 'تغيير الصورة';

  @override
  String get patientId => 'معرف المريض';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get phone => 'الهاتف';

  @override
  String get address => 'العنوان';

  @override
  String get birthDate => 'تاريخ الميلاد';

  @override
  String get gender => 'الجنس';

  @override
  String get emergencyContact => 'جهة اتصال الطوارئ';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get nameRequired => 'الاسم الكامل لا يمكن أن يكون فارغاً';

  @override
  String get emailInvalid => 'يرجى إدخال عنوان بريد إلكتروني صالح';

  @override
  String get phoneRequired => 'رقم الهاتف لا يمكن أن يكون فارغاً';

  @override
  String get addressRequired => 'العنوان لا يمكن أن يكون فارغاً';

  @override
  String get birthDateRequired => 'يرجى اختيار تاريخ الميلاد';

  @override
  String get profileUpdatedSuccessfully =>
      'تم تحديث معلومات الملف الشخصي بنجاح';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get preferNotToSay => 'أفضل عدم الإفصاح';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get confirmNewPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get change => 'تغيير';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور الجديدة غير متطابقة';

  @override
  String get passwordTooShort => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get passwordChangedSuccessfully => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get currentPasswordRequired => 'يرجى إدخال كلمة المرور الحالية';

  @override
  String get newPasswordRequired => 'يرجى إدخال كلمة المرور الجديدة';

  @override
  String get photoChangeFeatureComingSoon => 'ميزة تغيير الصورة قريباً';

  @override
  String get description => 'الوصف';

  @override
  String version(String version) {
    return 'الإصدار $version';
  }

  @override
  String get viewAndManageNotifications => 'عرض وإدارة الإشعارات';

  @override
  String get privacyPolicyError =>
      'تعذر فتح صفحة سياسة الخصوصية. يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String get termsOfServiceError =>
      'تعذر فتح صفحة شروط الخدمة. يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String anErrorOccurred(String error) {
    return 'حدث خطأ: $error';
  }

  @override
  String get appDescription =>
      'تطبيق محمول حديث مصمم لخدمات زراعة الشعر والرعاية. يمكنك التحليل عن طريق التقاط صورك الخاصة، وتتبع عملية العلاج الخاصة بك، والاتصال بالعيادة.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. جميع الحقوق محفوظة.';

  @override
  String get emergencyContactHint => 'الاسم - الهاتف';

  @override
  String get appointmentDetails => 'تفاصيل الموعد';

  @override
  String get dateLabel => 'التاريخ';

  @override
  String get timeLabel => 'الوقت';

  @override
  String get doctorLabel => 'الطبيب';

  @override
  String get appointmentTypeLabel => 'نوع الموعد';

  @override
  String get locationLabel => 'الموقع';

  @override
  String get phoneLabel => 'الهاتف';

  @override
  String get followUpConsultation => 'استشارة المتابعة';

  @override
  String get cancelAppointment => 'إلغاء الموعد';

  @override
  String get addReminder => 'إضافة تذكير';

  @override
  String get appointmentReminderSet => 'تم تعيين تذكير الموعد';

  @override
  String get cameraPermissionRequired =>
      'لا يمكننا المتابعة بدون إذن الكاميرا. يرجى منح الإذن من الإعدادات.';

  @override
  String get sensorPermissionRequired =>
      'إذن مستشعر الحركة مطلوب لالتقاط الصور من الأعلى والخلف.';

  @override
  String get recoveryProgress => 'تقدم التعافي';

  @override
  String dayOfTotal(String current, String total) {
    return 'اليوم $current من $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'الأسبوع $week: مرحلة الشفاء';
  }

  @override
  String get todaysCareRoutine => 'روتين العناية اليوم';

  @override
  String get takeMedicationMorning => 'تناول الدواء (الصباح)';

  @override
  String get applyTopicalSolution => 'تطبيق محلول موضعي';

  @override
  String get takeMedicationEvening => 'تناول الدواء (المساء)';

  @override
  String get upcomingAppointment => 'الموعد القادم';

  @override
  String get nextFollowUpConsultation => 'استشارة المتابعة القادمة.';

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get appointmentReminder => 'تذكير الموعد';

  @override
  String appointmentReminderMessage(String time) {
    return 'لديك موعد غداً في $time';
  }

  @override
  String hoursAgo(Object hours) {
    return 'قبل $hours ساعة';
  }

  @override
  String get medicationReminder => 'تذكير الدواء';

  @override
  String get morningMedicationReminder => 'لا تنس تناول دواء الصباح';

  @override
  String get photoReminder => 'تذكير الصورة';

  @override
  String get weeklyProgressPhotoReminder =>
      'لا تنس التقاط صورة التقدم الأسبوعية';

  @override
  String daysAgo(String days) {
    return 'قبل $days يوم';
  }

  @override
  String weeksAgo(String weeks) {
    return 'قبل $weeks أسبوع';
  }

  @override
  String monthsAgo(String months) {
    return 'قبل $months شهر';
  }

  @override
  String yearsAgo(String years) {
    return 'قبل $years سنة';
  }

  @override
  String notificationOpened(String title) {
    return 'تم فتح إشعار $title';
  }

  @override
  String get appointmentCancellation => 'إلغاء الموعد';

  @override
  String get cancelAppointmentConfirmation =>
      'هل أنت متأكد أنك تريد إلغاء هذا الموعد؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get appointmentCancelledSuccessfully => 'تم إلغاء الموعد بنجاح';

  @override
  String get everyDay => 'كل يوم';

  @override
  String get weekends => 'عطلة نهاية الأسبوع';

  @override
  String get weekdays => 'أيام الأسبوع';

  @override
  String get mondayShort => 'الإثنين';

  @override
  String get tuesdayShort => 'الثلاثاء';

  @override
  String get wednesdayShort => 'الأربعاء';

  @override
  String get thursdayShort => 'الخميس';

  @override
  String get fridayShort => 'الجمعة';

  @override
  String get saturdayShort => 'السبت';

  @override
  String get sundayShort => 'الأحد';

  @override
  String get titleCannotBeEmpty => 'لا يمكن أن يكون العنوان فارغاً';

  @override
  String get messageCannotBeEmpty => 'لا يمكن أن تكون الرسالة فارغة';

  @override
  String get pleaseEnterValidEmail => 'يرجى إدخال عنوان بريد إلكتروني صالح';

  @override
  String get selectAtLeastOneDay => 'يرجى اختيار يوم واحد على الأقل';

  @override
  String get dailyEmailScheduled => 'تم جدولة البريد الإلكتروني اليومي';

  @override
  String deleteTaskConfirmation(String title) {
    return 'هل أنت متأكد أنك تريد حذف المهمة \"$title\"؟';
  }

  @override
  String get taskDeleted => 'تم حذف المهمة';

  @override
  String get deleteTask => 'حذف المهمة';

  @override
  String get newScheduledEmail => 'بريد إلكتروني مجدول جديد';

  @override
  String get createDailyEmailTasks => 'إنشاء مهام بريد إلكتروني يومية';

  @override
  String get titleLabel => 'العنوان';

  @override
  String get messageLabel => 'رسالتك';

  @override
  String get recipientNameLabel => 'اسم المستلم';

  @override
  String get delete => 'حذف';

  @override
  String get daysLabel => 'أيام';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'إحدى العيادات الرائدة في إسطنبول، متخصصة في زراعة الشعر.';

  @override
  String get clinicAboutDescription =>
      'عيادة Smile Hair Clinic هي إحدى العيادات الرائدة في إسطنبول، متخصصة في زراعة الشعر. تحت قيادة الدكتور غوكاي بيلجين والدكتور محمد أردوغان المعترف بهم دولياً، يُعطى رضا المريض الأولوية دائماً في عيادة Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'جميع العمليات التشغيلية يتم متابعتها شخصياً من قبل الأطباء، وكل عضو في الفريق يتكون من محترفين بتدريب طبي. حتى الآن، تم إجراء إجراءات زراعة شعر ناجحة على عدد كبير من المرضى من جميع أنحاء العالم.';

  @override
  String get clinicEthicsDescription =>
      'كعيادة Smile Hair Clinic، نخدم وفقاً لمبادئنا المتمثلة في احترام حقوق المرضى والشفافية والصدق والاحترافية. نعمل وفقاً للقواعد الأخلاقية في جميع عمليات العلاج، ونحمي خصوصية المريض ونسعى لتقديم خدمة بأعلى جودة.';

  @override
  String get clinicPressDescription =>
      'تم تقديم عيادة Smile Hair Clinic في وسائل الإعلام المختلفة لنتائجها الناجحة ورضا المرضى. قدمت في مؤتمرات زراعة الشعر الدولية وكانت رائدة في هذا المجال.';

  @override
  String get mediaOutlets => 'وسائل الإعلام التي تم تقديمنا فيها:';

  @override
  String get clinicFoundingPartner => 'شريك مؤسس في عيادة Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'يعمل في عيادة Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'هو طبيب ذو خبرة يعمل في عيادة Smile Hair Clinic، يعطي أولوية لرضا المرضى.';

  @override
  String get viewFaqPage => 'عرض صفحة الأسئلة الشائعة';

  @override
  String get clinicDefaultLocation => 'عيادة Smile Hair Clinic، إسطنبول';

  @override
  String get chatWelcomeMessage =>
      'مرحباً! كيف يمكننا مساعدتك اليوم؟ عادة ما يستجيب فريقنا في غضون ساعة.';

  @override
  String get chatSampleMessage =>
      'مرحباً، أود أن أسأل عن خطة العلاج الخاصة بي.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'أمامية';

  @override
  String get backCamera => 'خلفية';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'الجدول الزمني';

  @override
  String get visibleImprovementDescription =>
      'تحسن واضح في الكثافة عبر التاج. يبلغ المريض عن رضا عالٍ.';

  @override
  String get procedureDetails => 'النوع: استعادة FUE\nالطعم: 2,450';

  @override
  String get scheduledEmails => 'رسائل البريد الإلكتروني المجدولة';

  @override
  String get noScheduledEmails => 'لا توجد رسائل بريد إلكتروني مجدولة';

  @override
  String get sampleAppointmentDate => 'الثلاثاء، 9 نوفمبر، 10:30';

  @override
  String get sampleAppointmentDateFull => 'الثلاثاء، 9 نوفمبر 2023';

  @override
  String get sampleDoctorName => 'د. أحمد يلماز';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'ديفيد';

  @override
  String get sampleCityCountry => 'إسطنبول، تركيا';

  @override
  String get sampleEmergencyContact => 'أحمد يلماز - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'استعادة ورعاية الشعر';

  @override
  String get welcomeLogin => 'تسجيل الدخول';

  @override
  String get welcomeRegister => 'التسجيل';

  @override
  String get loginTitle => 'مرحباً بعودتك';

  @override
  String get loginSubtitle => 'قم بتسجيل الدخول إلى حسابك';

  @override
  String get loginEmail => 'البريد الإلكتروني';

  @override
  String get loginEmailHint => 'أدخل عنوان بريدك الإلكتروني';

  @override
  String get loginPassword => 'كلمة المرور';

  @override
  String get loginPasswordHint => 'أدخل كلمة المرور';

  @override
  String get loginForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get loginLoginButton => 'تسجيل الدخول';

  @override
  String get loginOr => 'أو';

  @override
  String get loginGoogleLogin => 'المتابعة مع Google';

  @override
  String get loginNeedAccount => 'لا تملك حسابًا؟';

  @override
  String get forgotPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get forgotPasswordSubtitle =>
      'أدخل بريدك الإلكتروني المسجل وسنرسل رابطًا لإعادة تعيين كلمة المرور.';

  @override
  String get forgotPasswordSendButton => 'إرسال بريد إعادة التعيين';

  @override
  String get forgotPasswordEmailSent =>
      'تم إرسال بريد إعادة تعيين كلمة المرور. يرجى التحقق من صندوق الوارد.';

  @override
  String get registrationTitle => 'إنشاء حسابك';

  @override
  String get registrationSubtitle => 'إنشاء حساب جديد';

  @override
  String get registrationName => 'الاسم الكامل';

  @override
  String get registrationNameHint => 'أدخل اسمك الأول والأخير';

  @override
  String get registrationEmail => 'البريد الإلكتروني';

  @override
  String get registrationEmailHint => 'أدخل عنوان بريدك الإلكتروني';

  @override
  String get registrationPassword => 'كلمة المرور';

  @override
  String get registrationPasswordHint => 'أنشئ كلمة المرور';

  @override
  String get registrationConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get registrationConfirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get registrationTerms => 'أوافق على شروط الاستخدام وسياسة الخصوصية.';

  @override
  String get registrationRegisterButton => 'إنشاء حساب';

  @override
  String get registrationAlreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get registrationLoginLink => 'تسجيل الدخول';

  @override
  String dashboardHelloParam(String name) {
    return 'مرحباً، $name';
  }

  @override
  String get dashboardHome => 'الرئيسية';

  @override
  String get dashboardChatbot => 'شات بوت';

  @override
  String get dashboardAnalysis => 'التحليل';

  @override
  String get dashboardMyAppointments => 'مواعيدي';

  @override
  String get dashboardResources => 'الموارد';

  @override
  String get dashboardCareGuide => 'دليل العناية';

  @override
  String get dashboardCareGuideSubtitle => 'تعليمات العناية بعد الزراعة';

  @override
  String get dashboardDefaultUserName => 'مستخدم ضيف';

  @override
  String get dashboardHairTransplantTitle => 'زراعة الشعر';

  @override
  String get dashboardHairTransplantSubtitle => 'استكشف كل تقنية زراعة';

  @override
  String get dashboardOnlineConsultationTitle => 'استشارة عبر الإنترنت';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'احصل على نصيحة خبيرة مجانية';

  @override
  String get dashboardDoctorsTitle => 'أطباؤنا';

  @override
  String get dashboardDoctorsSubtitle => 'تعرف على جراحينا المتخصصين';

  @override
  String get dashboardAboutUsTitle => 'من نحن';

  @override
  String get dashboardAboutUsSubtitle => 'تعرف على عيادتنا';

  @override
  String get dashboardContactTitle => 'اتصل بنا';

  @override
  String get dashboardContactSubtitle => 'تواصل معنا';

  @override
  String get dashboardProgressTracking => 'تتبع التقدم';

  @override
  String get dashboardProgressTrackingSubtitle => 'تتبع تقدم علاجك';

  @override
  String get dashboardPastAnalysesSubtitle => 'تحليلات الصور السابقة';

  @override
  String get settingsProfile => 'الملف الشخصي';

  @override
  String get settingsPreferences => 'التفضيلات';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageSubtitle => 'اختر لغتك المفضلة';

  @override
  String get settingsDarkMode => 'الوضع الداكن';

  @override
  String get settingsDarkModeSubtitle => 'تفعيل المظهر الداكن';

  @override
  String get settingsNotifications => 'الإشعارات';

  @override
  String get settingsNotificationsSubtitle => 'تفعيل جميع الإشعارات';

  @override
  String get settingsEmailNotifications => 'إشعارات البريد الإلكتروني';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'تلقي الإشعارات عبر البريد الإلكتروني';

  @override
  String get settingsPushNotifications => 'الإشعارات الفورية';

  @override
  String get settingsPushNotificationsSubtitle => 'تلقي الإشعارات الفورية';

  @override
  String get settingsAccount => 'الحساب';

  @override
  String get settingsChangePassword => 'تغيير كلمة المرور';

  @override
  String get settingsChangePasswordSubtitle => 'قم بتحديث كلمة المرور';

  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get settingsPrivacyPolicySubtitle => 'اقرأ سياسة الخصوصية الخاصة بنا';

  @override
  String get settingsTermsOfService => 'شروط الخدمة';

  @override
  String get settingsTermsOfServiceSubtitle => 'اقرأ شروط الخدمة الخاصة بنا';

  @override
  String get settingsSupport => 'الدعم';

  @override
  String get settingsHelpSupport => 'المساعدة والدعم';

  @override
  String get settingsHelpSupportSubtitle => 'احصل على المساعدة واتصل بالدعم';

  @override
  String get settingsAddPhone => 'إضافة رقم هاتف';

  @override
  String get settingsThemeMode => 'وضع السمة';

  @override
  String get settingsThemeDescriptionSystem => 'اتباع إعدادات النظام';

  @override
  String get settingsThemeDescriptionLight => 'السمة الفاتحة';

  @override
  String get settingsThemeDescriptionDark => 'السمة الداكنة';

  @override
  String get settingsThemeDialogTitle => 'اختر وضع السمة';

  @override
  String get settingsThemeOptionSystem => 'النظام';

  @override
  String get settingsThemeOptionSystemSubtitle => 'التكيف مع إعدادات الجهاز';

  @override
  String get settingsThemeOptionLight => 'فاتح';

  @override
  String get settingsThemeOptionLightSubtitle => 'سمة ألوان فاتحة';

  @override
  String get settingsThemeOptionDark => 'داكن';

  @override
  String get settingsThemeOptionDarkSubtitle => 'سمة ألوان داكنة';

  @override
  String get settingsKvkkFormTitle => 'نموذج طلب KVKK';

  @override
  String get settingsKvkkFormSubtitle => 'تقديم طلب بخصوص بياناتك الشخصية';

  @override
  String get settingsGdprFormTitle => 'نموذج الاتصال بموجب GDPR';

  @override
  String get settingsGdprFormSubtitle => 'إشعار المعلومات لـ KVKK و GDPR';

  @override
  String get settingsRecordsTitle => 'سجلاتي';

  @override
  String get settingsTreatmentHistoryTitle => 'تاريخ العلاج';

  @override
  String get settingsTreatmentHistorySubtitle => 'عرض مواعيدك وسجلات العمليات';

  @override
  String get settingsDocumentsTitle => 'المستندات';

  @override
  String get settingsDocumentsSubtitle =>
      'التقارير والوصفات الطبية والملفات المشتركة';

  @override
  String get settingsInvoicesTitle => 'الفواتير';

  @override
  String get settingsInvoicesSubtitle => 'إدارة المدفوعات والفواتير';

  @override
  String get settingsSupportCenterSubtitle =>
      'الدعم على مدار 24/7 وقنوات الاتصال';

  @override
  String get settingsContactTitle => 'اتصل بنا';

  @override
  String get settingsContactSubtitle => 'العنوان والهاتف وخيارات الاتصال';

  @override
  String get settingsProfileLoginRequired =>
      'يرجى تسجيل الدخول لتغيير صورة ملفك الشخصي.';

  @override
  String get settingsProfilePhotoUpdated => 'تم تحديث صورة ملفك الشخصي.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'خطأ في تحديث الصورة: $error';
  }

  @override
  String get supportCenterTitle => 'مركز الدعم';

  @override
  String get supportCenterHeroTitle => 'هنا من أجلك 24/7';

  @override
  String get supportCenterHeroDescription =>
      'فريق الدعم في Smile Hair Clinic معك في كل خطوة من رحلة علاجك.';

  @override
  String get supportCenterQuickContact => 'اتصال سريع';

  @override
  String get supportCenterWhatsappTitle => 'الدردشة عبر واتساب';

  @override
  String get supportCenterWhatsappSubtitle =>
      'تحدث مع فريق الدعم المباشر على الفور';

  @override
  String get supportCenterCallTitle => 'اتصل بنا';

  @override
  String get supportCenterEmailTitle => 'أرسل لنا بريدًا إلكترونيًا';

  @override
  String get supportCenterKnowledgeBase => 'مركز المعرفة';

  @override
  String get supportCenterFaqSubtitle => 'الأسئلة قبل وبعد العملية';

  @override
  String get supportCenterKnowledgeBaseTitle => 'قاعدة المعرفة';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'جميع مقالاتنا حول زراعة الشعر';

  @override
  String get supportCenterAppointmentSupportTitle => 'دعم المواعيد والعلاج';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'احصل على معلومات حول خطة علاجك';

  @override
  String get supportCenterMessageSectionTitle => 'أرسل لنا رسالة';

  @override
  String get supportCenterMessageLabel => 'رسالتك';

  @override
  String get supportCenterMessageHint => 'اكتب سؤالك أو طلبك...';

  @override
  String get supportCenterMessageEmpty => 'يرجى كتابة رسالة';

  @override
  String get supportCenterMessageSuccess =>
      'لقد تلقينا رسالتك. سنعود إليك قريبًا.';

  @override
  String get supportCenterSendButton => 'إرسال';

  @override
  String get treatmentHistoryTitle => 'تاريخ العلاج';

  @override
  String get treatmentHistoryLoginRequired =>
      'يجب عليك تسجيل الدخول لعرض هذه الميزة.';

  @override
  String get treatmentHistoryEmpty => 'ليس لديك أي علاجات مسجلة حتى الآن.';

  @override
  String get treatmentHistoryDatePending => 'التاريخ معلق';

  @override
  String get treatmentHistoryDefaultType => 'فحص';

  @override
  String get treatmentHistoryDoctorPending => 'للتعيين';

  @override
  String get treatmentHistoryStatusCompleted => 'مكتمل';

  @override
  String get treatmentHistoryStatusCancelled => 'ملغى';

  @override
  String get treatmentHistoryStatusInProgress => 'قيد التنفيذ';

  @override
  String get treatmentHistoryStatusScheduled => 'مجدول';

  @override
  String get settingsAbout => 'حول';

  @override
  String get settingsAboutSubtitle => 'إصدار التطبيق والمعلومات';

  @override
  String get settingsLogout => 'تسجيل الخروج';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'استعادة الشعر المميزة';

  @override
  String get clinicProfileAbout => 'حول';

  @override
  String get clinicProfileDoctors => 'الأطباء';

  @override
  String get clinicProfileGallery => 'المعرض';

  @override
  String get clinicProfileTreatments => 'العلاجات';

  @override
  String get clinicProfileBookConsultation => 'حجز استشارة';

  @override
  String get clinicProfileAboutTitle => 'من نحن';

  @override
  String get clinicProfileEthicsTitle => 'أخلاقياتنا';

  @override
  String get clinicProfilePressTitle => 'في الصحافة';

  @override
  String get clinicProfileContactTitle => 'معلومات الاتصال';

  @override
  String get clinicProfileDoctorsTitle => 'أطباؤنا';

  @override
  String get clinicProfileGalleryTitle => 'معرض النتائج';

  @override
  String get clinicProfileHairSurgeon => 'جراح زراعة الشعر';

  @override
  String get pastAnalysesTitle => 'التحليلات السابقة';

  @override
  String get faqTitle => 'الأسئلة الشائعة';

  @override
  String get faqSubtitle => 'لأسئلتك';

  @override
  String get splashTagline => 'متخصص في زراعة الشعر والجمال';

  @override
  String get captureFlowTitle => 'التقاط ذاتي';

  @override
  String get captureFlowSubtitle =>
      'التقاط تلقائي من 5 زوايا حرجة للشعر وفروة الرأس.\nتأكد من أنك في بيئة جيدة الإضاءة قبل البدء.';

  @override
  String get captureFlowStartCapture => 'بدء الالتقاط';

  @override
  String get captureFlowFaceDetection =>
      'ضع وجهك في الإطار وانظر إلى الكاميرا.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'الموضع صحيح، ابق ثابتاً ($seconds ثانية)';
  }

  @override
  String get captureFlowTurnRightMore => 'أدر رأسك قليلاً أكثر إلى اليمين.';

  @override
  String get captureFlowTooMuchRight =>
      'لقد أدرت كثيراً، اضبط قليلاً إلى اليسار.';

  @override
  String get captureFlowKeepHeadStill => 'أبق رأسك ثابتاً ولا تحرك كتفيك.';

  @override
  String get captureFlowTurnLeftMore => 'أدر رأسك قليلاً أكثر إلى اليسار.';

  @override
  String get captureFlowTooMuchLeft =>
      'لقد أدرت كثيراً، اضبط قليلاً إلى اليمين.';

  @override
  String get captureFlowCaptured => 'تم الالتقاط';

  @override
  String get captureFlowInitializingCamera => 'تهيئة الكاميرا...';

  @override
  String get captureFlowCapturedPhotos => 'الصور الملتقطة';

  @override
  String get captureFlowEndSession => 'إنهاء الجلسة';

  @override
  String get captureFlowReviewPhotos => 'مراجعة الصور';

  @override
  String get captureFlowPhotosCaptured => 'صور ملتقطة';

  @override
  String get captureFlowSelected => 'محدد';

  @override
  String get captureFlowContinueToAnalysis => 'المتابعة إلى التحليل';

  @override
  String get captureFlowNewCapture => 'بدء التقاط جديد';

  @override
  String get captureFlowPhotosFrom5Angles => 'صور من 5 زوايا';

  @override
  String get captureStageFrontTitle => 'المنظر الأمامي';

  @override
  String get captureStageFrontBaseInstruction =>
      'انظر مباشرة إلى الكاميرا وأبقي رأسك ثابتاً.';

  @override
  String get captureStageFrontReminder =>
      'أبقي رأسك مستقيماً وانظر إلى الكاميرا.';

  @override
  String get captureStageRight45Title => 'يمين 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'أدر رأسك 45 درجة إلى اليمين.';

  @override
  String get captureStageRight45Reminder => 'أدر رأسك أكثر إلى اليمين.';

  @override
  String get captureStageLeft45Title => 'يسار 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'أدر رأسك 45 درجة إلى اليسار.';

  @override
  String get captureStageLeft45Reminder => 'أدر رأسك أكثر إلى اليسار.';

  @override
  String get captureStageVertexTitle => 'المنظر العلوي';

  @override
  String get captureStageVertexBaseInstruction => 'أمسك هاتفك أفقياً فوق رأسك.';

  @override
  String get captureStageVertexReminder => 'أمسك هاتفك بشكل مسطح فوق رأسك.';

  @override
  String get captureStageDonorTitle => 'منطقة المتبرع';

  @override
  String get captureStageDonorBaseInstruction =>
      'أدر رأسك وأمسك الهاتف خلف رأسك.';

  @override
  String get captureStageDonorReminder => 'أمسك الهاتف بثبات خلف رأسك.';

  @override
  String get photoCaptureFrontView => 'المنظر الأمامي';

  @override
  String get photoCapturePositionHead => 'ضع رأسك داخل الخطوط';

  @override
  String get photoCaptureFront => 'أمامي';

  @override
  String get photoCaptureTop => 'أعلى';

  @override
  String get photoCaptureLeft => 'يسار';

  @override
  String get photoCaptureRight => 'يمين';

  @override
  String get chatOnline => 'متصل';

  @override
  String get chatToday => '--- اليوم ---';

  @override
  String get chatMessageHint => 'اكتب رسالتك...';

  @override
  String get chatQuickRepliesAppointment => 'حجز موعد';

  @override
  String get chatQuickRepliesTreatmentPlan => 'خطة علاجي';

  @override
  String get chatQuickRepliesFollowup => 'طلب متابعة';

  @override
  String get chatQuickRepliesPriceInfo => 'معلومات الأسعار';

  @override
  String progressPatientIdParam(String id) {
    return 'معرف المريض: $id';
  }

  @override
  String get progressStatistics => 'الإحصائيات';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months أشهر بعد العملية';
  }

  @override
  String get progressProcedureDay => 'يوم الإجراء';

  @override
  String get progressInitialConsultation => 'الاستشارة الأولية';

  @override
  String get progressUploadPhoto => 'رفع صورة جديدة';

  @override
  String get analysisCaptureAndAnalyze => 'التقاط وتحليل';

  @override
  String get analysisPastAnalyses => 'التحليلات السابقة';

  @override
  String get analysisAnalysisDate1 => '15 أكتوبر 2023';

  @override
  String get analysisAnalysisDesc1 => 'ترقق طفيف في منطقة التاج';

  @override
  String get analysisAnalysisDate2 => '12 يوليو 2023';

  @override
  String get analysisAnalysisDesc2 => 'علامات التهاب على فروة الرأس';

  @override
  String get analysisAnalysisDate3 => '5 أبريل 2023';

  @override
  String get analysisAnalysisDesc3 => 'صحة فروة الرأس العامة جيدة';

  @override
  String get analysisAnalysisDate4 => '20 يناير 2023';

  @override
  String get analysisAnalysisDesc4 => 'التحليل الأولي للعلاج';

  @override
  String get faqQuestion1 => 'كم تستغرق عملية زراعة الشعر؟';

  @override
  String get faqAnswer1 =>
      'عادة ما تستغرق عملية زراعة الشعر 4-8 ساعات اعتماداً على عدد الطعوم المزروعة. نظراً لاستخدام التخدير الموضعي أثناء العملية، لا يشعر المريض بألم.';

  @override
  String get faqQuestion2 =>
      'متى يمكنني العودة إلى الحياة الطبيعية بعد زراعة الشعر؟';

  @override
  String get faqAnswer2 =>
      'يمكنك القيام بأنشطة خفيفة بعد 2-3 أيام من زراعة الشعر. يُنصح بالانتظار أسبوعين للرياضات الشاقة والأنشطة البدنية. العودة إلى العمل ممكنة عادة بعد 3-5 أيام.';

  @override
  String get faqQuestion3 => 'متى تبدأ الشعرات المزروعة في النمو؟';

  @override
  String get faqAnswer3 =>
      'تسقط الشعرات المزروعة في أول 2-3 أسابيع (فقدان الصدمة). تبدأ الشعرات الجديدة في النمو بعد 3-4 أشهر وتظهر النتائج الكاملة خلال 6-12 شهراً.';

  @override
  String get faqQuestion4 => 'هل عملية زراعة الشعر مؤلمة؟';

  @override
  String get faqAnswer4 =>
      'نظراً لاستخدام التخدير الموضعي أثناء العملية، لا يُشعر بألم. قد يكون هناك ألم خفيف بعد العملية، ولكن يمكن السيطرة عليه بمسكنات الألم.';

  @override
  String get faqQuestion5 => 'ما هو معدل نجاح زراعة الشعر؟';

  @override
  String get faqAnswer5 =>
      'زراعة الشعر لديها معدل نجاح عالٍ جداً، عادة 95-98%. يعتمد النجاح على صحة المريض وجودة منطقة المتبرع واتباع تعليمات الرعاية بعد العملية.';

  @override
  String get faqQuestion6 => 'هل يمكن للنساء إجراء زراعة الشعر؟';

  @override
  String get faqAnswer6 =>
      'نعم، يمكن للنساء إجراء زراعة الشعر. تساقط الشعر الأنثوي شائع ويمكن علاجه بإجراءات زراعة الشعر. هناك حاجة لاستشارة لتحديد ما إذا كان المريض مرشحاً مناسباً.';

  @override
  String get faqQuestion7 => 'كم عدد الطعوم المطلوبة لزراعة الشعر؟';

  @override
  String get faqAnswer7 =>
      'يعتمد عدد الطعوم المطلوبة على مدى تساقط الشعر والكثافة المرغوبة. عادة، يتم استخدام 1,500-3,000 طعم لتساقط الشعر المعتدل، بينما قد تكون هناك حاجة لـ 3,000-5,000 طعم لتساقط الشعر الشديد.';

  @override
  String get faqQuestion8 => 'هل هناك حد للعمر لزراعة الشعر؟';

  @override
  String get faqAnswer8 =>
      'لا يوجد حد صارم للعمر، ولكن يُنصح عادة بالإجراء للمرضى الذين تزيد أعمارهم عن 25 عاماً عندما يكون نمط تساقط الشعر أكثر استقراراً. يتم تقييم كل حالة بشكل فردي.';

  @override
  String get faqQuestion9 => 'ما هو وقت التعافي بعد زراعة الشعر؟';

  @override
  String get faqAnswer9 =>
      'يمكن لمعظم المرضى العودة إلى العمل في غضون 3-5 أيام. عادة ما تسقط القشور في غضون 7-10 أيام. يمكن استئناف التعافي الكامل والأنشطة العادية بعد أسبوعين.';

  @override
  String get faqQuestion10 => 'هل نتائج زراعة الشعر دائمة؟';

  @override
  String get faqAnswer10 =>
      'نعم، الشعر المزروع دائم لأنه مأخوذ من منطقة المتبرع المقاومة وراثياً لتساقط الشعر. سيستمر الشعر المزروع في النمو بشكل طبيعي لبقية حياتك.';

  @override
  String get pastAnalysesListView => 'عرض القائمة';

  @override
  String get pastAnalysesGridView => 'عرض الشبكة';

  @override
  String get pastAnalysesDetailedView => 'عرض مفصل';

  @override
  String get pastAnalysesDensityModerate => 'الكثافة: متوسطة';

  @override
  String get pastAnalysesDensityLow => 'الكثافة: منخفضة';

  @override
  String get privacyPolicyTitle => 'سياسة معالجة وحماية البيانات الشخصية';

  @override
  String get privacyPolicyDocumentDate => 'تاريخ المستند:';

  @override
  String get privacyPolicyRevisionDate => 'تاريخ المراجعة:';

  @override
  String get privacyPolicyRevisionNumber => 'رقم المراجعة:';

  @override
  String get privacyPolicySection1 => 'I. مقدمة';

  @override
  String get privacyPolicySection1A => 'أ. الغرض والنطاق';

  @override
  String get privacyPolicySection1AContent =>
      'تنظم هذه السياسة المبادئ التي تتبناها عيادة Smile Hair Clinic فيما يتعلق بحماية ومعالجة البيانات الشخصية.\n\nضمن نطاق هذه السياسة، توفر عيادة Smile Hair Clinic تفسيرات فيما يتعلق بأنشطة معالجة البيانات الشخصية والأنظمة المعتمدة لحماية البيانات الشخصية. يتضمن ذلك إعلام وضمان الشفافية للأشخاص المعنيين، بما في ذلك بشكل أساسي متلقو المنتجات أو الخدمات، والموظفون ومرشحو الموظفين، والعملاء المحتملون، والمساهمون، والزوار، والمشاركون، والموردون والأطراف الثالثة، وإنشاء وضمان المعايير في إدارة البيانات الشخصية؛ تحديد ودعم الأهداف والالتزامات التنظيمية؛ إنشاء آليات تحكم متوافقة مع مستويات المخاطر المقبولة، والامتثال للمبادئ والقواعد التي تفرضها الاتفاقيات الدولية، والدستور، والقوانين، واللوائح، والعقود والتشريعات الأخرى المتعلقة بحماية البيانات الشخصية، وضمان أفضل حماية للحقوق والحريات الأساسية للشخص المعني. بالإضافة إلى ذلك، تغطي هذه السياسة جميع أنظمة وبيئات تسجيل البيانات المادية والإلكترونية المستخدمة لمعالجة البيانات الشخصية والبيانات الشخصية ذات الفئة الخاصة تلقائياً أو كجزء من نظام تسجيل بيانات بوسائل غير تلقائية.';

  @override
  String get privacyPolicySection1B => 'ب. التعريفات';

  @override
  String get photoAnalysisTitle => 'تحليل الصور';

  @override
  String photosUploadedCount(String count) {
    return 'تم تحميل $count صور';
  }

  @override
  String get autoAnalysisStarting =>
      'تم تحميل 5 صور. سيبدأ التحليل التلقائي...';

  @override
  String stageUploaded(String stage) {
    return 'تم تحميل الزاوية $stage';
  }

  @override
  String stageCaptured(String stage) {
    return 'تم التقاط الزاوية $stage';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'خطأ في تحميل الصورة: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'خطأ في تحميل صور متعددة: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'خطأ في التقاط الصورة: $error';
  }

  @override
  String get imageSourceTitle => 'مصدر الصورة';

  @override
  String get imageSourceCamera => 'الكاميرا';

  @override
  String get imageSourceGallery => 'المعرض';

  @override
  String get imageSourceMultiGallery => 'تحديد عدة صور من المعرض';

  @override
  String get promptNoPhotosForAnalysis =>
      'يرجى تحميل صورة أولاً. اضغط على زر 📷 للتحميل.';

  @override
  String get analyzingPhotos => 'يتم تحليل صورك...';

  @override
  String get visualAnalysisHeader => '📸 التحليل البصري - ما أراه:';

  @override
  String get importantWarningHeader => '⚠️ تحذير مهم:';

  @override
  String get differentPersonsDetected =>
      'تم الكشف عن أشخاص مختلفين في الصور! يجب أن تكون جميع الصور لنفس الشخص.';

  @override
  String get pleaseCaptureSamePerson =>
      'يرجى التقاط صور لنفس الشخص من 5 زوايا مختلفة.';

  @override
  String get detectedAnglesHeader => '🔍 الزوايا المكتشفة:';

  @override
  String get analysisCompleted => '✅ اكتمل التحليل!';

  @override
  String get allPhotosLookGood => 'جميع الصور تبدو جيدة.';

  @override
  String get savedToFirebase => '✅ تم حفظ الصور في Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'معرف التحليل: $id';
  }

  @override
  String get savedLocationLabel =>
      'الموقع المحفوظ: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ نتيجة التحليل';

  @override
  String get retakeRequiredAngles => '❌ الزوايا التي تحتاج إلى إعادة التقاط:';

  @override
  String get errorDetailsHeader => 'تفاصيل الخطأ:';

  @override
  String get retakeTheseAnglesQuestion => 'هل تريد إعادة التقاط هذه الزوايا؟';

  @override
  String get retakeFirstInvalidQuestion =>
      'هل تريد إعادة التقاط الزاوية الأولى غير الصالحة؟';

  @override
  String get retake => 'إعادة التقاط';

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
  String get uploadAndAnalyze => 'رفع وتحليل';

  @override
  String get captureWithFaceDetection => 'التقاط مع كشف الوجه';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'اختر الوقت';

  @override
  String get dateNotAvailable => 'Date not available';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get enableDailyMedicationReminder => 'تفعيل تذكير الدواء اليومي';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'الوصول السريع';

  @override
  String get quickActions => 'الإجراءات السريعة';

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
  String get noUpcomingAppointments => 'لا توجد مواعيد قادمة';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'استشارة مجانية';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'الاسم الكامل';

  @override
  String get fullNameHint => 'الاسم الكامل';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'اكتب رسالتك هنا...';

  @override
  String get or => 'أو';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'من نحن';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'قيمنا';

  @override
  String get professionalism => 'الاحترافية';

  @override
  String get professionalismDescription =>
      'أطباؤنا الخبراء المعتمدون دوليًا في مجالهم';

  @override
  String get patientSatisfaction => 'رضا المريض';

  @override
  String get patientSatisfactionDescription => 'سعادة مرضانا دائمًا أولويتنا';

  @override
  String get medicalEducation => 'التعليم الطبي';

  @override
  String get medicalEducationDescription =>
      'كل عضو في فريقنا يتألف من محترفين ذوي تدريب طبي';

  @override
  String get internationalService => 'الخدمة الدولية';

  @override
  String get internationalServiceDescription =>
      'نخدم مرضانا من جميع أنحاء العالم';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'عمليات\nناجحة';

  @override
  String get patientsFromCountries => 'مرضى من\nالبلدان';

  @override
  String get expertDoctors => 'أطباء\nخبراء';

  @override
  String get patientSatisfactionRate => 'رضا\nالمرضى';

  @override
  String get experience => 'الخبرة';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'حول';

  @override
  String get expertiseAreas => 'مجالات الخبرة';

  @override
  String get interview => 'مقابلة';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get call => 'اتصل';

  @override
  String get workingHours => 'ساعات العمل';

  @override
  String get mondayFriday => 'الإثنين - الجمعة';

  @override
  String get saturday => 'السبت';

  @override
  String get sunday => 'الأحد';

  @override
  String get closed => 'مغلق';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'الكل';

  @override
  String get unread => 'غير مقروء';

  @override
  String get scheduled => 'مجدول';

  @override
  String get markAllAsRead => 'تحديد الكل كمقروء';

  @override
  String get noNotificationsYet => 'لا توجد إشعارات بعد';

  @override
  String get newNotificationsWillAppearHere => 'ستظهر الإشعارات الجديدة هنا';

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
    return 'الكاميرا غير موجودة على الجهاز: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'تعذر فتح تطبيق الهاتف. يرجى التأكد من تثبيت تطبيق الهاتف على جهازك.';

  @override
  String get emailAppCannotOpen =>
      'تعذر فتح تطبيق البريد الإلكتروني. يرجى التأكد من تثبيت تطبيق البريد الإلكتروني على جهازك.';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'أطباؤنا';

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
  String get doctor => 'الطبيب';

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
  String get yourDoctor => 'طبيبك';

  @override
  String get appointment => 'موعد';

  @override
  String get soon => 'قريباً';

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
    return 'قبل $minutes دقيقة';
  }

  @override
  String get justNow => 'للتو';

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
  String get front => 'أمامي';

  @override
  String get right45 => 'يمين 45°';

  @override
  String get left45 => 'يسار 45°';

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
    return 'تعذر إرسال الرسالة: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'المريض';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'لا توجد رسائل بعد';

  @override
  String get typeMessage => 'اكتب رسالة...';

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
  String get pending => 'قيد الانتظار';

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
  String get unknownDate => 'تاريخ غير معروف';

  @override
  String get january => 'يناير';

  @override
  String get february => 'فبراير';

  @override
  String get march => 'مارس';

  @override
  String get april => 'أبريل';

  @override
  String get may => 'مايو';

  @override
  String get june => 'يونيو';

  @override
  String get july => 'يوليو';

  @override
  String get august => 'أغسطس';

  @override
  String get september => 'سبتمبر';

  @override
  String get october => 'أكتوبر';

  @override
  String get november => 'نوفمبر';

  @override
  String get december => 'ديسمبر';

  @override
  String get analysisCompletedShort => 'اكتمل التحليل!';

  @override
  String get retakeDialogTitle => 'مطلوب إعادة التقاط';

  @override
  String get retakeDialogBody =>
      'يشير تحليل الذكاء الاصطناعي إلى أن الزوايا التالية تحتاج إلى إعادة التقاط:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'هل تريد إعادة التقاط الزاوية الأولى غير الصالحة؟';

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
  String get noSavedAnalyses => 'لا توجد تحليلات محفوظة حتى الآن.';

  @override
  String welcomeGreeting(String name) {
    return 'مرحباً، $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'يجب عليك تسجيل الدخول لإرسال الرسائل';

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
  String get allNotificationsMarkedAsRead => 'تم تحديد جميع الإشعارات كمقروءة';

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
  String get contactAddress => 'العنوان';

  @override
  String get contactEmail => 'البريد الإلكتروني';

  @override
  String get contactPhone => 'الهاتف';

  @override
  String get contactWhatsApp => 'مستشار واتساب';

  @override
  String get patientCareGuideTitle => 'Patient Care Guide';

  @override
  String get planningTab => 'Planning';

  @override
  String get operationTab => 'Operation';

  @override
  String get recoveryTab => 'Recovery';

  @override
  String get resourcesTab => 'الموارد';

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
  String get message => 'رسالة';

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
  String get examplePhotoFrontTitle => 'مثال الزاوية الأمامية';

  @override
  String get examplePhotoFrontInstructions =>
      '• انظر مباشرة إلى الكاميرا\n• حافظ على الذقن مستوياً والرأس منتصباً\n• يجب أن تنظر العينان إلى الكاميرا\n• يجب أن يكون الوجه مرئياً بالكامل';

  @override
  String get examplePhotoRight45Title => 'مثال الزاوية اليمنى 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• أدر رأسك بشكل واضح إلى اليمين (~70–90°)\n• حافظ على الذقن مستوياً والرأس منتصباً\n• يجب أن تكون الخد الأيمن والصدغ مرئيين\n• لا يجب أن تتحرك الكتفان';

  @override
  String get examplePhotoLeft45Title => 'مثال الزاوية اليسرى 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• أدر رأسك بشكل واضح إلى اليسار (~70–90°)\n• حافظ على الذقن مستوياً والرأس منتصباً\n• يجب أن يكون الخد الأيسر والصدغ مرئيين\n• لا يجب أن تتحرك الكتفان';

  @override
  String get examplePhotoVertexTitle => 'مثال زاوية القمة';

  @override
  String get examplePhotoVertexInstructions =>
      '• أمسك الهاتف أفقياً ومستوياً\n• يجب أن يواجه الشاشة لأعلى\n• ضع الهاتف فوق رأسك\n• يجب أن تكون فروة الرأس بالكامل مرئية';

  @override
  String get examplePhotoDonorTitle => 'مثال منطقة المتبرع';

  @override
  String get examplePhotoDonorInstructions =>
      '• أمسك الهاتف خلف رأسك\n• يجب أن يكون مؤخرة الرأس والرقبة مرئيين\n• حافظ على الهاتف ثابتاً\n• يجب أن تكون الإضاءة كافية';

  @override
  String get camera => 'الكاميرا';

  @override
  String get gallery => 'المعرض';

  @override
  String get deleteForMe => 'حذف لي';

  @override
  String get messageDeleted => 'تم حذف الرسالة';

  @override
  String get deleteForEveryone => 'حذف للجميع';

  @override
  String get deleteMessage => 'حذف الرسالة';

  @override
  String get deleteMessageReadWarning =>
      'تم قراءة هذه الرسالة من قبل المستلم. هل تريد حذفها على أي حال؟';

  @override
  String get deleteMessageConfirm =>
      'سيتم حذف هذه الرسالة للجميع. هل أنت متأكد؟';

  @override
  String get messageDeletedForEveryone => 'تم حذف الرسالة للجميع';

  @override
  String get userNotLoggedIn => 'المستخدم غير مسجل الدخول';

  @override
  String get messagesLoadingError => 'حدث خطأ أثناء تحميل الرسائل';

  @override
  String get loadingMessages => 'جارٍ تحميل الرسائل...';

  @override
  String get startConversation => 'ابدأ محادثة بإرسال رسالة';

  @override
  String get loadOlderMessages => 'تحميل رسائل أقدم';

  @override
  String get sendPhoto => 'إرسال صورة';

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
  String get needLoginForAnalysis => 'يجب عليك تسجيل الدخول للتحليل';

  @override
  String openCaptureFlowError(String error) {
    return 'خطأ في فتح شاشة الالتقاط: $error';
  }

  @override
  String get sessionExpired =>
      'انتهت صلاحية جلستك. يرجى تسجيل الدخول مرة أخرى.';

  @override
  String get photosAnalyzedAndSaved => 'تم تحليل وحفظ الصور بنجاح!';

  @override
  String get photoNotFoundForAnalysis => 'لم يتم العثور على صور للتحليل';

  @override
  String get noValidPhotosFound => 'No valid photos found';

  @override
  String get analysisPreparing => 'يتم تحضير الصور...';

  @override
  String get photosUploading => 'يتم تحميل الصور...';

  @override
  String get errorUploadingPhotos => 'An error occurred while uploading photos';

  @override
  String get geminiChecking => 'يتم التحقق من اتصال Gemini API...';

  @override
  String get geminiFailed =>
      'فشل اتصال Gemini API. يرجى التحقق من اتصال الإنترنت.';

  @override
  String get aiAnalyzing => 'يتم إجراء تحليل الذكاء الاصطناعي...';

  @override
  String get someAnglesNeedRetake => 'بعض الزوايا تحتاج إلى إعادة التقاط...';

  @override
  String get analysisSaved => 'تم حفظ التحليل بنجاح!';

  @override
  String get analysisCompletedSuccessfully => 'اكتمل التحليل بنجاح!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count زوايا تحتاج إلى إعادة التقاط...';
  }

  @override
  String get errorDuringAnalysis => 'خطأ أثناء التحليل';

  @override
  String get geminiApiError =>
      'خطأ في اتصال Gemini API. يرجى التحقق من اتصال الإنترنت.';

  @override
  String get firebaseError => 'خطأ في اتصال Firebase. يرجى المحاولة مرة أخرى.';

  @override
  String get photoProcessingError =>
      'خطأ في معالجة الصورة. يرجى المحاولة مرة أخرى.';

  @override
  String get authErrorLoginAgain =>
      'خطأ في التفويض. يرجى تسجيل الدخول مرة أخرى.';

  @override
  String get analysisSuccessfulTitle => 'التحليل ناجح';

  @override
  String get analysisResultsTitle => 'نتائج التحليل';

  @override
  String get detailedAnalysisHeader => 'التحليل التفصيلي:';

  @override
  String get retakeRequiredAnglesHeader => 'الزوايا المطلوب إعادة التقاطها:';

  @override
  String dialogError(String error) {
    return 'خطأ في فتح الحوار: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Baseline photo not found';

  @override
  String get noPhotosToUpdate => 'No photos to update found';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'خطأ أثناء التحليل: $error';
  }

  @override
  String retakeError(String error) {
    return 'خطأ أثناء إعادة التقاط: $error';
  }

  @override
  String get aiSupport => 'دعم الذكاء الاصطناعي';

  @override
  String get myPhotos => 'صوري';

  @override
  String get photoAnalysisChatbot => 'روبوت تحليل الصور';

  @override
  String get disableMedicationReminder => 'تعطيل تذكير الأدوية';

  @override
  String get medicationReminderDisabled => 'تم تعطيل تذكير الأدوية اليومي';

  @override
  String get medicationTime => 'وقت الدواء';

  @override
  String get selectMedicationReminderTime => 'اختر وقت تذكير الأدوية اليومي';

  @override
  String get selectMedicationTime => 'اختر وقت الدواء';

  @override
  String medicationReminderSetAt(String time) {
    return 'تم تعيين تذكير الأدوية اليومي لـ $time';
  }

  @override
  String get noDateInfo => 'No date information';

  @override
  String get invalidDate => 'تاريخ غير صالح';

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

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
  String get hairTransplantTitle => 'زراعة الشعر';

  @override
  String get hairTransplantSectionCount => 'أقسام';

  @override
  String get hairTransplantVideo => 'فيديو';

  @override
  String get hairTransplantFreeConsultation => 'احصل على استشارة مجانية';

  @override
  String get hairTransplantWatchVideo => 'شاهد الفيديو';

  @override
  String get hairTransplantWatchVideoSubtitle => 'انقر لمشاهدته على YouTube';

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
    return 'خطأ أثناء التحليل: $error';
  }

  @override
  String get myDocuments => 'مستنداتي';

  @override
  String get loginRequiredForDocuments =>
      'تحتاج إلى تسجيل الدخول لعرض المستندات';

  @override
  String get noDocumentsYet => 'لا توجد مستندات بعد';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'حدث خطأ:\n$error';
  }

  @override
  String get datePending => 'قيد الانتظار';

  @override
  String get chatSupportWelcomeMessage =>
      'مرحباً! أنا مساعدك الذكي. كيف يمكنني مساعدتك اليوم؟';

  @override
  String get newChat => 'محادثة جديدة';

  @override
  String get chatSupportAiAssistantName => 'المساعد الذكي';

  @override
  String get historyTooltip => 'السجل';

  @override
  String get typingIndicator => 'الذكي يكتب...';

  @override
  String get chatHistoryTitle => 'سجل المحادثات';

  @override
  String get noSavedChats => 'لا توجد محادثات محفوظة';

  @override
  String genericErrorTryAgain(String error) {
    return 'حدث خطأ. يرجى المحاولة مرة أخرى.\nالخطأ: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'لا يمكن فتح واتساب. يرجى التأكد من تثبيت تطبيق واتساب.';

  @override
  String whatsappOpenError(String error) {
    return 'حدث خطأ أثناء فتح واتساب: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'حدث خطأ أثناء فتح شاشة التقاط الصور: $error';
  }

  @override
  String get retakeAnalyzing => 'يتم تحليل الصورة المعاد التقاطها...';

  @override
  String get autoAnalysisOn => 'التحليل التلقائي: مفعّل';

  @override
  String get autoAnalysisOff => 'التحليل التلقائي: معطّل';

  @override
  String get clearPhotosTooltip => 'مسح الصور';

  @override
  String get messageHintAnalyze => 'اكتب رسالتك أو اكتب \"تحليل\"...';

  @override
  String get send => 'إرسال';

  @override
  String get aiAssistantName => 'مساعد التحليل الذكي';

  @override
  String get expertTeam => 'فريق الخبراء';

  @override
  String get expertTeamDescription =>
      'يتكون فريقنا من أخصائيين ذوي خبرة في جراحة زراعة الشعر.';

  @override
  String get comingSoon => 'قريباً';

  @override
  String get loginToSendMessage => 'يرجى تسجيل الدخول لإرسال رسالة';

  @override
  String get doctorEmailMissing => 'البريد الإلكتروني للطبيب مفقود';

  @override
  String doctorNotFound(String name) {
    return 'الطبيب $name غير موجود';
  }

  @override
  String get messagingComingSoon => 'ميزة المراسلة قريباً';

  @override
  String get years => 'سنوات';

  @override
  String get watchWashingVideo => 'مشاهدة فيديو الغسيل';

  @override
  String get preCareTip1Title => 'اختر الجراح المناسب';

  @override
  String get preCareTip1Body =>
      'إجراء Sapphire FUE يتطلب جراحاً خبيراً وفريقاً متعدد التخصصات. اعمل مع أطباء يشرحون توقعاتك بشكل واقعي، ويخططون العملية من البداية للنهاية، ويطبقون بروتوكولات Smile Hair.';

  @override
  String get preCareTip2Title => 'شارك تاريخك الطبي';

  @override
  String get preCareTip2Body =>
      'شارك أمراضك المزمنة وأدويتك المنتظمة وحساسياتك مع الفريق دون إخفاء. هذا يقلل من المخاطر التي قد تحدث أثناء التخدير والجراحة.';

  @override
  String get preCareTip3Title => 'مميعات الدم وعملية الموافقة';

  @override
  String get preCareTip3Body =>
      'توقف عن تناول الأسبرين أو مميعات الدم المشابهة قبل أسبوع على الأقل من تاريخ العملية بموافقة طبيبك الذي وصف الدواء. يمكنك استئناف الاستخدام بعد يومين من الإجراء.';

  @override
  String get preCareTip4Title => 'فحص العدوى';

  @override
  String get preCareTip4Body =>
      'حافظ على نتائج اختبارات التهاب الكبد B/C وفيروس نقص المناعة البشرية محدثة. العيادات التي لا تملك ظروف غرفة عمليات مناسبة لا يمكنها إجراء عمليات لهذه العدوى، حتى لا يضيع سفرك.';

  @override
  String get preCareTip5Title => 'المكملات والفيتامينات';

  @override
  String get preCareTip5Body =>
      'المكملات التي تحتوي على فيتامينات B و E تزيد النزيف؛ توقف عنها قبل أسبوع من الإجراء. إذا لزم الأمر، سيقوم طبيبك بتخطيط العلاجات الداعمة.';

  @override
  String get preCareTip6Title => 'الكحول والتدخين';

  @override
  String get preCareTip6Body =>
      'توقف عن الكحول قبل أسبوع على الأقل من العملية ولا تستهلكه لمدة 14 يوماً بعد الإجراء. ابتعد عن التدخين قبل 12 ساعة من العملية ولمدة أسبوعين بعدها، لأنه يعطل الدورة الدموية.';

  @override
  String get preCareTip7Title => 'خطة الأمتعة والملابس';

  @override
  String get preCareTip7Body =>
      'اختر ملابس بأزرار أو سحاب للجزء العلوي من الجسم. الملابس ذات الياقة الضيقة قد تضر بالطعم. جهز حقيبة كبيرة يمكنها حمل مجموعة العناية المعطاة بعد العملية.';

  @override
  String get preCareTip8Title => 'الراحة والنظافة';

  @override
  String get preCareTip8Body =>
      'نم جيداً في يوم العملية، تناول إفطاراً مغذياً واغتسل قبل القدوم إلى العيادة. فروة الرأس النظيفة تقلل من خطر العدوى.';

  @override
  String get postCareTip1Title => 'احمِ الطعوم';

  @override
  String get postCareTip1Body =>
      'خلال الأيام السبعة الأولى، احرص على عدم ضرب رأسك في أي مكان. نم على ظهرك باستخدام وسادة للرقبة وامنع احتكاك الطعوم بالوسادة.';

  @override
  String get postCareTip2Title => 'الليلة الأولى والأيام التالية';

  @override
  String get postCareTip2Body =>
      'اقضِ الليلة الأولى بعد العملية بالتأكيد في الراحة. إذا كنت بحاجة للخروج، استخدم مظلة تحميك من الشمس والمطر.';

  @override
  String get postCareTip3Title => 'التزم بخطة الأدوية';

  @override
  String get postCareTip3Body =>
      'استخدم المضادات الحيوية ومسكنات الألم ومضادات الالتهاب وبخاخ البانثينول تماماً كما هو موصوف. تأكد من فهم الوصفة وتعليمات الاستخدام قبل مغادرة فريق العيادة.';

  @override
  String get postCareTip4Title => 'الترطيب والبخاخات';

  @override
  String get postCareTip4Body =>
      'استخدم فقط بخاخ الأيزوتونيك/البانثينول المعطى حتى الغسيل الأول. ضع كريماً مضاداً حيوياً على منطقة المتبرع لمدة 5-7 أيام الأولى.';

  @override
  String get postCareTip5Title => 'بروتوكول الغسيل';

  @override
  String get postCareTip5Body =>
      'يتم الغسيل الأول في العيادة بعد 48 ساعة. كل يوم بعد ذلك، ضع الرغوة برفق بحركات التربيت، استخدم ماءً دافئاً بضغط منخفض وجفف بمناشف ورقية.';

  @override
  String get postCareTip6Title => 'القشور وفقدان الصدمة';

  @override
  String get postCareTip6Body =>
      'من اليوم 10، أزل القشور بضغط خفيف. فقدان الصدمة الذي يحدث بين الأسبوعين 2-4 طبيعي؛ الشعر الجديد يصبح مرئياً من الشهر 3.';

  @override
  String get postCareTip7Title => 'النشاط والرياضة';

  @override
  String get postCareTip7Body =>
      'لا تمارس الرياضة في الأسبوعين الأولين، يمكنك المشي الخفيف بعد 3-4 أيام. تجنب المسبح والساونا والأنشطة التي تتطلب التعرق الشديد لمدة شهر على الأقل.';

  @override
  String get postCareTip8Title => 'شكاوى الراحة';

  @override
  String get postCareTip8Body =>
      'إذا كان هناك حرقان أو ألم في منطقة المتبرع، استخدم كريماً يحتوي على الستيرويدات بموافقة العيادة. ضع كمادات باردة لفترة قصيرة للتورم.';

  @override
  String get operationDayTimeline1Title => 'الإقامة والنقل';

  @override
  String get operationDayTimeline1Body =>
      'فريق Smile Gentle Care ينظم إقامة في فنادق 4-5 نجوم. يتم تخطيط جميع وسائل النقل من الوصول إلى الفندق إلى النقل إلى العيادة.';

  @override
  String get operationDayTimeline2Title => 'الدعم متعدد اللغات';

  @override
  String get operationDayTimeline2Body =>
      'يتم توفير مترجمين محترفين للمرضى من دول مختلفة حول العالم. يتم إعلامك بلغتك في كل خطوة من العملية.';

  @override
  String get operationDayTimeline3Title => 'التحضير قبل العملية';

  @override
  String get operationDayTimeline3Body =>
      'يتم توقيع نماذج المعلومات، يتم رسم خط شعرك، يتم التقاط الصور ويتم فحص اختبارات فيروس نقص المناعة البشرية/التهاب الكبد B/التهاب الكبد C والعلامات الحيوية.';

  @override
  String get operationDayTimeline4Title => 'تدفق العملية';

  @override
  String get operationDayTimeline4Body =>
      'خطوات الإجراء الذي يستغرق 6-8 ساعات: التخطيط، جمع الطعوم، فتح القنوات والزرع. أطباؤك يشاركونك العملية بأكملها.';

  @override
  String get operationDayTimeline5Title => 'الغداء والتفضيلات الخاصة';

  @override
  String get operationDayTimeline5Body =>
      'يتم تحضير قوائم نباتية أو حلال أو كوشير حسب الطلب. خيارات التلفزيون الذكي والموسيقى متاحة في مناطق العملية.';

  @override
  String get operationDayTimeline6Title => 'العناية في اليوم التالي';

  @override
  String get operationDayTimeline6Body =>
      'تأتي إلى العيادة لتغيير الضمادة وفحص الجروح وتدريب الغسيل الأول. بعد ذلك، يتم مراقبة العملية بتتبع الصور الرقمية.';

  @override
  String get sterilizationMeasure1 =>
      'يتم إجراء اختبارات تسرب الفراغ يومياً للتحقق من سلامة إحكام أجهزة التعقيم.';

  @override
  String get sterilizationMeasure2 =>
      'يتم إجراء التحقق اليومي باختبار Bowie-Dick للتأكد من وصول البخار لجميع الأسطح بالتساوي.';

  @override
  String get sterilizationMeasure3 =>
      'اختبارات الغسيل بالموجات فوق الصوتية توثق أننا ننظف المخلفات الدقيقة.';

  @override
  String get sterilizationMeasure4 =>
      'يتم إجراء اختبارات المؤشرات البيولوجية كل 15 يوماً ويتم الإبلاغ عن عدم وجود تكاثر.';

  @override
  String get sterilizationMeasure5 =>
      'الأدوات المعقمة والمستخدمة تُخزن منفصلة في صناديق مقفلة؛ يتم منع التلوث المتبادل.';

  @override
  String get sterilizationMeasure6 =>
      'يتم تتبع كل مجموعة بملصقات رقم الأوتوكليف والتاريخ وتاريخ انتهاء الصلاحية.';

  @override
  String get sterilizationMeasure7 =>
      'جميع العمليات تُنفذ وفقاً لدليل وزارة الصحة DAS ومعايير منظمة الصحة العالمية وAAMI ST79.';

  @override
  String get washStep1 =>
      'لا تغسل شعرك في أول 36-48 ساعة بعد العملية؛ انتظر الغسيل الأول الذي سيتم في العيادة.';

  @override
  String get washStep2 =>
      'ضع المستحضر أو الرغوة على كل من منطقة المتبرع والمستقبل بأطراف أصابعك بحركات التربيت.';

  @override
  String get washStep3 =>
      'أرغ الشامبو ووزعه برفق على المنطقة المزروعة بلمسات عمودية؛ تجنب الحركات الدائرية.';

  @override
  String get washStep4 =>
      'استخدم ماءً دافئاً بضغط منخفض. في أول 14 يوماً، من الأكثر أماناً صب الماء بوعاء بدلاً من رأس الدش.';

  @override
  String get washStep5 =>
      'جفف منطقة الطعم بالضغط برفق بمناشف ورقية، يمكنك تجفيف منطقة المتبرع بمنشفة عادية.';

  @override
  String get washStep6 =>
      'إذا كنت بحاجة لاستخدام مجفف الشعر، استخدمه فقط في الوضع البارد ومن مسافة بعيدة.';

  @override
  String get faq1Question => 'كم تستغرق فترة التعافي؟';

  @override
  String get faq1Answer =>
      'الأسبوعان الأولان فترة حساسة؛ يمر الشعر بمراحل مختلفة لمدة 6-12 شهراً. النتائج الواضحة تظهر في الشهر 6، الكثافة النهائية في الأشهر 12-18.';

  @override
  String get faq2Question => 'كيف يجب أن يكون الضمادة وبرنامج النوم؟';

  @override
  String get faq2Answer =>
      'يمكن تطبيق ضمادة مرنة لتقليل التورم في منطقة الجبهة. نم على ظهرك مع وسادة للرقبة في وضع مرتفع قليلاً في أول 7-10 أيام.';

  @override
  String get faq3Question => 'الدش والغسيل واستخدام المنتجات';

  @override
  String get faq3Answer =>
      'لا تبلل شعرك في أول يومين. بعد 48 ساعة، اغسل مرة يومياً بشامبو طبي بعد الغسيل الأول في العيادة؛ اجعل وقت الدش قصيراً، قلل البخار.';

  @override
  String get faq4Question => 'متى يمكنني تجفيف أو تمشيط أو صبغ شعري؟';

  @override
  String get faq4Answer =>
      'يُنصح بالتجفيف الطبيعي فقط في الشهر الأول. يمكنك تمشيط منطقة المتبرع لكن لا تلمس منطقة الزرع لمدة أسبوعين. ابتعد عن الصبغات الكيميائية لمدة 6-8 أسابيع.';

  @override
  String get faq5Question => 'التدخين والكحول والتمارين';

  @override
  String get faq5Answer =>
      'التدخين محظور قبل 12 ساعة من العملية ولمدة أسبوعين بعدها. لا يجب استخدام الكحول في أول 14 يوماً. المشي الخفيف مسموح بعد اليوم 4، انتظر شهراً للرياضات الثقيلة.';

  @override
  String get faq6Question => 'القبعة والشمس والسفر والعودة للعمل';

  @override
  String get faq6Answer =>
      'لا ترتدِ قبعة في أول 10 أيام أو اختر نماذج فضفاضة جداً. تجنب الشمس المباشرة. يمكنك العودة للعمل المكتبي خلال 3-5 أيام؛ انتظر أسبوعين للعمل البدني. يمكنك السفر لكن احمِ الطعوم.';

  @override
  String get heroCardSubtitle1 =>
      'فريق Smile Hair يدير العملية بأكملها لك، من التقييم قبل العملية إلى تخطيط السفر.';

  @override
  String get heroCardSubtitle2 =>
      'اختبر تجربة مريحة مع النقل ودعم المترجم وغرف العمليات المعقمة.';

  @override
  String get heroCardSubtitle3 =>
      'احمِ الطعوم بأمان مع الاستخدام المخطط للأدوية والغسيل المناسب وقيود الحركة.';

  @override
  String get heroCardSubtitle4 =>
      'تتبع العملية بأكملها مع الأسئلة الشائعة والصور والأدلة الرقمية.';

  @override
  String get imageBannerCaption1 =>
      'طبق العناية اللطيفة مع الشامبو والمستحضرات المعطاة لك من الغسيل الأول.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
