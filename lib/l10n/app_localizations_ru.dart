// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Редактировать Профиль';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get close => 'Закрыть';

  @override
  String get changePhoto => 'Изменить Фото';

  @override
  String get patientId => 'ID Пациента';

  @override
  String get fullName => 'Полное Имя';

  @override
  String get email => 'Электронная Почта';

  @override
  String get phone => 'Телефон';

  @override
  String get address => 'Адрес';

  @override
  String get birthDate => 'Дата Рождения';

  @override
  String get gender => 'Пол';

  @override
  String get emergencyContact => 'Контакт для Экстренных Случаев';

  @override
  String get saveChanges => 'Сохранить Изменения';

  @override
  String get nameRequired => 'Полное имя не может быть пустым';

  @override
  String get emailInvalid =>
      'Пожалуйста, введите действительный адрес электронной почты';

  @override
  String get phoneRequired => 'Номер телефона не может быть пустым';

  @override
  String get addressRequired => 'Адрес не может быть пустым';

  @override
  String get birthDateRequired => 'Пожалуйста, выберите дату рождения';

  @override
  String get profileUpdatedSuccessfully =>
      'Информация профиля успешно обновлена';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get preferNotToSay => 'Предпочитаю не указывать';

  @override
  String get currentPassword => 'Текущий Пароль';

  @override
  String get newPassword => 'Новый Пароль';

  @override
  String get confirmNewPassword => 'Подтвердить Новый Пароль';

  @override
  String get change => 'Изменить';

  @override
  String get passwordsDoNotMatch => 'Новые пароли не совпадают';

  @override
  String get passwordTooShort => 'Пароль должен содержать не менее 6 символов';

  @override
  String get passwordChangedSuccessfully => 'Пароль успешно изменен';

  @override
  String get currentPasswordRequired =>
      'Пожалуйста, введите ваш текущий пароль';

  @override
  String get newPasswordRequired => 'Пожалуйста, введите ваш новый пароль';

  @override
  String get photoChangeFeatureComingSoon =>
      'Функция изменения фото скоро появится';

  @override
  String get description => 'Описание';

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get viewAndManageNotifications =>
      'Просмотр и управление уведомлениями';

  @override
  String get privacyPolicyError =>
      'Не удалось открыть страницу политики конфиденциальности. Пожалуйста, проверьте ваше подключение к Интернету.';

  @override
  String get termsOfServiceError =>
      'Не удалось открыть страницу условий обслуживания. Пожалуйста, проверьте ваше подключение к Интернету.';

  @override
  String anErrorOccurred(String error) {
    return 'Произошла ошибка: $error';
  }

  @override
  String get appDescription =>
      'Современное мобильное приложение, разработанное для услуг по пересадке волос и уходу. Вы можете анализировать, делая собственные фотографии, отслеживать процесс лечения и связываться с клиникой.';

  @override
  String get appCopyright => '© 2024 Hair Clinic. Все права защищены.';

  @override
  String get emergencyContactHint => 'Имя - Телефон';

  @override
  String get appointmentDetails => 'Детали Встречи';

  @override
  String get dateLabel => 'Дата';

  @override
  String get timeLabel => 'Время';

  @override
  String get doctorLabel => 'Врач';

  @override
  String get appointmentTypeLabel => 'Тип Встречи';

  @override
  String get locationLabel => 'Местоположение';

  @override
  String get phoneLabel => 'Телефон';

  @override
  String get followUpConsultation => 'Консультация по Наблюдению';

  @override
  String get cancelAppointment => 'Отменить Встречу';

  @override
  String get addReminder => 'Добавить напоминание';

  @override
  String get appointmentReminderSet => 'Напоминание о встрече установлено';

  @override
  String get cameraPermissionRequired =>
      'Мы не можем продолжить без разрешения камеры. Пожалуйста, предоставьте разрешение в настройках.';

  @override
  String get sensorPermissionRequired =>
      'Разрешение датчика движения требуется для съемки сверху и сзади.';

  @override
  String get recoveryProgress => 'Прогресс восстановления';

  @override
  String dayOfTotal(String current, String total) {
    return 'День $current из $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Неделя $week: Фаза заживления';
  }

  @override
  String get todaysCareRoutine => 'Рутина Ухода на Сегодня';

  @override
  String get takeMedicationMorning => 'Принять лекарство (Утро)';

  @override
  String get applyTopicalSolution => 'Применить местное решение';

  @override
  String get takeMedicationEvening => 'Принять лекарство (Вечер)';

  @override
  String get upcomingAppointment => 'Предстоящая Встреча';

  @override
  String get nextFollowUpConsultation =>
      'Ваша следующая консультация по наблюдению.';

  @override
  String get viewDetails => 'Просмотреть детали';

  @override
  String get notifications => 'Уведомления';

  @override
  String get appointmentReminder => 'Напоминание о встрече';

  @override
  String appointmentReminderMessage(String time) {
    return 'У вас встреча завтра в $time';
  }

  @override
  String hoursAgo(Object hours) {
    return '$hours часов назад';
  }

  @override
  String get medicationReminder => 'Напоминание о лекарстве';

  @override
  String get morningMedicationReminder =>
      'Не забудьте принять утреннее лекарство';

  @override
  String get photoReminder => 'Напоминание о фото';

  @override
  String get weeklyProgressPhotoReminder =>
      'Не забудьте сделать фото вашего еженедельного прогресса';

  @override
  String daysAgo(String days) {
    return '$days дней назад';
  }

  @override
  String weeksAgo(String weeks) {
    return '$weeks недель назад';
  }

  @override
  String monthsAgo(String months) {
    return '$months месяцев назад';
  }

  @override
  String yearsAgo(String years) {
    return '$years лет назад';
  }

  @override
  String notificationOpened(String title) {
    return 'Уведомление $title открыто';
  }

  @override
  String get appointmentCancellation => 'Отмена встречи';

  @override
  String get cancelAppointmentConfirmation =>
      'Вы уверены, что хотите отменить эту встречу? Это действие нельзя отменить.';

  @override
  String get appointmentCancelledSuccessfully => 'Встреча успешно отменена';

  @override
  String get everyDay => 'Каждый день';

  @override
  String get weekends => 'Выходные';

  @override
  String get weekdays => 'Будние дни';

  @override
  String get mondayShort => 'Пн';

  @override
  String get tuesdayShort => 'Вт';

  @override
  String get wednesdayShort => 'Ср';

  @override
  String get thursdayShort => 'Чт';

  @override
  String get fridayShort => 'Пт';

  @override
  String get saturdayShort => 'Сб';

  @override
  String get sundayShort => 'Вс';

  @override
  String get titleCannotBeEmpty => 'Заголовок не может быть пустым';

  @override
  String get messageCannotBeEmpty => 'Сообщение не может быть пустым';

  @override
  String get pleaseEnterValidEmail =>
      'Пожалуйста, введите действительный адрес электронной почты';

  @override
  String get selectAtLeastOneDay => 'Пожалуйста, выберите хотя бы один день';

  @override
  String get dailyEmailScheduled =>
      'Ежедневная электронная почта запланирована';

  @override
  String deleteTaskConfirmation(String title) {
    return 'Вы уверены, что хотите удалить задачу \"$title\"?';
  }

  @override
  String get taskDeleted => 'Задача удалена';

  @override
  String get deleteTask => 'Удалить задачу';

  @override
  String get newScheduledEmail => 'Новая запланированная электронная почта';

  @override
  String get createDailyEmailTasks =>
      'Создать ежедневные задачи электронной почты';

  @override
  String get titleLabel => 'Заголовок';

  @override
  String get messageLabel => 'Ваше Сообщение';

  @override
  String get recipientNameLabel => 'Имя получателя';

  @override
  String get delete => 'Удалить';

  @override
  String get daysLabel => 'Дни';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'Одна из ведущих клиник в Стамбуле, специализирующаяся на трансплантации волос.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic - одна из ведущих клиник в Стамбуле, специализирующаяся на трансплантации волос. Под руководством всемирно признанных доктора Гокая Билгина и доктора Мехмета Эрдогана удовлетворенность пациентов всегда является приоритетом в Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'Все операционные процессы лично отслеживаются врачами, и каждый член команды состоит из профессионалов с медицинским образованием. На сегодняшний день успешные процедуры трансплантации волос были выполнены для многочисленных пациентов со всего мира.';

  @override
  String get clinicEthicsDescription =>
      'Как Smile Hair Clinic, мы служим в соответствии с нашими принципами уважения прав пациентов, прозрачности, честности и профессионализма. Мы действуем в соответствии с этическими правилами во всех процессах лечения, защищаем конфиденциальность пациентов и стремимся предоставить услугу наивысшего качества.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic была представлена в различных средствах массовой информации за свои успешные результаты и удовлетворенность пациентов. Она выступала на международных конференциях по трансплантации волос и была пионером в этой области.';

  @override
  String get mediaOutlets => 'СМИ, в которых мы были представлены:';

  @override
  String get clinicFoundingPartner =>
      'является соучредителем Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'работает в Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'является опытным врачом, работающим в Smile Hair Clinic, приоритизирующим удовлетворенность пациентов.';

  @override
  String get viewFaqPage => 'Просмотреть страницу FAQ';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Стамбул';

  @override
  String get chatWelcomeMessage =>
      'Добро пожаловать! Как мы можем помочь вам сегодня? Наша команда обычно отвечает в течение часа.';

  @override
  String get chatSampleMessage =>
      'Здравствуйте, я хотел бы спросить о моем плане лечения.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'передняя';

  @override
  String get backCamera => 'задняя';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Временная шкала';

  @override
  String get visibleImprovementDescription =>
      'Видимое улучшение плотности по всей макушке. Пациент сообщает о высокой удовлетворенности.';

  @override
  String get procedureDetails => 'Тип: Восстановление FUE\nГрафты: 2,450';

  @override
  String get scheduledEmails => 'Запланированные письма';

  @override
  String get noScheduledEmails => 'Нет запланированных писем';

  @override
  String get sampleAppointmentDate => 'Вт, 9 ноя, 10:30';

  @override
  String get sampleAppointmentDateFull => 'Вторник, 9 ноября 2023';

  @override
  String get sampleDoctorName => 'Д-р Ахмет Йылмаз';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'Дэвид';

  @override
  String get sampleCityCountry => 'Стамбул, Турция';

  @override
  String get sampleEmergencyContact => 'Ахмет Йылмаз - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Восстановление и Уход за Волосами';

  @override
  String get welcomeLogin => 'Войти';

  @override
  String get welcomeRegister => 'Зарегистрироваться';

  @override
  String get loginTitle => 'Добро Пожаловать';

  @override
  String get loginSubtitle => 'Войдите в свой аккаунт';

  @override
  String get loginEmail => 'Электронная Почта';

  @override
  String get loginEmailHint => 'Введите ваш адрес электронной почты';

  @override
  String get loginPassword => 'Пароль';

  @override
  String get loginPasswordHint => 'Введите ваш пароль';

  @override
  String get loginForgotPassword => 'Забыли пароль?';

  @override
  String get loginLoginButton => 'Войти';

  @override
  String get loginOr => 'или';

  @override
  String get loginGoogleLogin => 'Продолжить с Google';

  @override
  String get loginNeedAccount => 'Нужен аккаунт?';

  @override
  String get forgotPasswordTitle => 'Сбросить пароль';

  @override
  String get forgotPasswordSubtitle =>
      'Введите ваш зарегистрированный email, и мы отправим ссылку для сброса пароля.';

  @override
  String get forgotPasswordSendButton => 'Отправить email для сброса';

  @override
  String get forgotPasswordEmailSent =>
      'Email для сброса пароля отправлен. Пожалуйста, проверьте вашу почту.';

  @override
  String get registrationTitle => 'Создайте Ваш Аккаунт';

  @override
  String get registrationSubtitle => 'Создать новый аккаунт';

  @override
  String get registrationName => 'Полное Имя';

  @override
  String get registrationNameHint => 'Введите ваше имя и фамилию';

  @override
  String get registrationEmail => 'Электронная Почта';

  @override
  String get registrationEmailHint => 'Введите ваш адрес электронной почты';

  @override
  String get registrationPassword => 'Пароль';

  @override
  String get registrationPasswordHint => 'Создайте ваш пароль';

  @override
  String get registrationConfirmPassword => 'Подтвердить Пароль';

  @override
  String get registrationConfirmPasswordHint => 'Повторно введите ваш пароль';

  @override
  String get registrationTerms =>
      'Я принимаю Условия Использования и Политику Конфиденциальности.';

  @override
  String get registrationRegisterButton => 'Создать Аккаунт';

  @override
  String get registrationAlreadyHaveAccount => 'Уже есть аккаунт?';

  @override
  String get registrationLoginLink => 'Войти';

  @override
  String dashboardHelloParam(String name) {
    return 'Привет, $name';
  }

  @override
  String get dashboardHome => 'Главная';

  @override
  String get dashboardChatbot => 'ЧатБот';

  @override
  String get dashboardAnalysis => 'Анализ';

  @override
  String get dashboardMyAppointments => 'Мои Записи';

  @override
  String get dashboardResources => 'Ресурсы';

  @override
  String get dashboardCareGuide => 'Руководство по Уходу';

  @override
  String get dashboardCareGuideSubtitle =>
      'Инструкции по уходу после трансплантации';

  @override
  String get dashboardDefaultUserName => 'Гостевой пользователь';

  @override
  String get dashboardHairTransplantTitle => 'Пересадка Волос';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Изучите каждую технику пересадки';

  @override
  String get dashboardOnlineConsultationTitle => 'Онлайн Консультация';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'Получите бесплатную экспертную консультацию';

  @override
  String get dashboardDoctorsTitle => 'Наши Врачи';

  @override
  String get dashboardDoctorsSubtitle =>
      'Познакомьтесь с нашими специалистами-хирургами';

  @override
  String get dashboardAboutUsTitle => 'О Нас';

  @override
  String get dashboardAboutUsSubtitle => 'Узнайте о нашей клинике';

  @override
  String get dashboardContactTitle => 'Контакты';

  @override
  String get dashboardContactSubtitle => 'Свяжитесь с нами';

  @override
  String get dashboardProgressTracking => 'Отслеживание Прогресса';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Отслеживайте ваш прогресс лечения';

  @override
  String get dashboardPastAnalysesSubtitle => 'Ваши предыдущие фотоанализы';

  @override
  String get settingsProfile => 'Профиль';

  @override
  String get settingsPreferences => 'Настройки';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsLanguageSubtitle => 'Выберите ваш предпочитаемый язык';

  @override
  String get settingsDarkMode => 'Темный Режим';

  @override
  String get settingsDarkModeSubtitle => 'Включить темную тему';

  @override
  String get settingsNotifications => 'Уведомления';

  @override
  String get settingsNotificationsSubtitle => 'Включить все уведомления';

  @override
  String get settingsEmailNotifications => 'Уведомления по E-mail';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'Получать уведомления по электронной почте';

  @override
  String get settingsPushNotifications => 'Push-уведомления';

  @override
  String get settingsPushNotificationsSubtitle => 'Получать push-уведомления';

  @override
  String get settingsAccount => 'Аккаунт';

  @override
  String get settingsChangePassword => 'Изменить Пароль';

  @override
  String get settingsChangePasswordSubtitle => 'Обновите ваш пароль';

  @override
  String get settingsPrivacyPolicy => 'Политика Конфиденциальности';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Прочитайте нашу политику конфиденциальности';

  @override
  String get settingsTermsOfService => 'Условия Обслуживания';

  @override
  String get settingsTermsOfServiceSubtitle =>
      'Прочитайте наши условия обслуживания';

  @override
  String get settingsSupport => 'Поддержка';

  @override
  String get settingsHelpSupport => 'Помощь и Поддержка';

  @override
  String get settingsHelpSupportSubtitle =>
      'Получить помощь и связаться с поддержкой';

  @override
  String get settingsAddPhone => 'Добавить номер телефона';

  @override
  String get settingsThemeMode => 'Режим темы';

  @override
  String get settingsThemeDescriptionSystem => 'Следовать настройкам системы';

  @override
  String get settingsThemeDescriptionLight => 'Светлая тема';

  @override
  String get settingsThemeDescriptionDark => 'Темная тема';

  @override
  String get settingsThemeDialogTitle => 'Выберите режим темы';

  @override
  String get settingsThemeOptionSystem => 'Система';

  @override
  String get settingsThemeOptionSystemSubtitle =>
      'Адаптироваться к настройкам устройства';

  @override
  String get settingsThemeOptionLight => 'Светлая';

  @override
  String get settingsThemeOptionLightSubtitle => 'Светлая цветовая схема';

  @override
  String get settingsThemeOptionDark => 'Темная';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Темная цветовая схема';

  @override
  String get settingsKvkkFormTitle => 'Форма Запроса KVKK';

  @override
  String get settingsKvkkFormSubtitle =>
      'Подать запрос о ваших персональных данных';

  @override
  String get settingsGdprFormTitle => 'Контактная Форма GDPR';

  @override
  String get settingsGdprFormSubtitle =>
      'Информационное уведомление для KVKK и GDPR';

  @override
  String get settingsRecordsTitle => 'Мои Записи';

  @override
  String get settingsTreatmentHistoryTitle => 'История Лечения';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Просмотр ваших записей и операционных отчетов';

  @override
  String get settingsDocumentsTitle => 'Документы';

  @override
  String get settingsDocumentsSubtitle => 'Отчеты, рецепты и общие файлы';

  @override
  String get settingsInvoicesTitle => 'Счета';

  @override
  String get settingsInvoicesSubtitle => 'Управление платежами и счетами';

  @override
  String get settingsSupportCenterSubtitle => 'Поддержка 24/7 и каналы связи';

  @override
  String get settingsContactTitle => 'Контакты';

  @override
  String get settingsContactSubtitle => 'Адрес, телефон и варианты связи';

  @override
  String get settingsProfileLoginRequired =>
      'Пожалуйста, войдите, чтобы изменить фото профиля.';

  @override
  String get settingsProfilePhotoUpdated => 'Ваше фото профиля обновлено.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Ошибка обновления фото: $error';
  }

  @override
  String get supportCenterTitle => 'Центр Поддержки';

  @override
  String get supportCenterHeroTitle => 'Здесь для вас 24/7';

  @override
  String get supportCenterHeroDescription =>
      'Команда поддержки Smile Hair Clinic с вами на каждом этапе вашего лечения.';

  @override
  String get supportCenterQuickContact => 'Быстрая Связь';

  @override
  String get supportCenterWhatsappTitle => 'Чат через WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Мгновенно общайтесь с нашей командой поддержки';

  @override
  String get supportCenterCallTitle => 'Позвоните нам';

  @override
  String get supportCenterEmailTitle => 'Напишите нам';

  @override
  String get supportCenterKnowledgeBase => 'База Знаний';

  @override
  String get supportCenterFaqSubtitle => 'Вопросы до и после операции';

  @override
  String get supportCenterKnowledgeBaseTitle => 'База Знаний';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Все наши статьи о пересадке волос';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Поддержка Записей и Лечения';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Получите информацию о вашем плане лечения';

  @override
  String get supportCenterMessageSectionTitle => 'Отправьте нам сообщение';

  @override
  String get supportCenterMessageLabel => 'Ваше сообщение';

  @override
  String get supportCenterMessageHint => 'Напишите ваш вопрос или запрос...';

  @override
  String get supportCenterMessageEmpty => 'Пожалуйста, напишите сообщение';

  @override
  String get supportCenterMessageSuccess =>
      'Мы получили ваше сообщение. Скоро свяжемся с вами.';

  @override
  String get supportCenterSendButton => 'Отправить';

  @override
  String get treatmentHistoryTitle => 'История Лечения';

  @override
  String get treatmentHistoryLoginRequired =>
      'Вы должны войти, чтобы просмотреть эту функцию.';

  @override
  String get treatmentHistoryEmpty => 'У вас пока нет записанных процедур.';

  @override
  String get treatmentHistoryDatePending => 'Дата ожидается';

  @override
  String get treatmentHistoryDefaultType => 'Проверка';

  @override
  String get treatmentHistoryDoctorPending => 'Назначить';

  @override
  String get treatmentHistoryStatusCompleted => 'Завершено';

  @override
  String get treatmentHistoryStatusCancelled => 'Отменено';

  @override
  String get treatmentHistoryStatusInProgress => 'В процессе';

  @override
  String get treatmentHistoryStatusScheduled => 'Запланировано';

  @override
  String get settingsAbout => 'О Приложении';

  @override
  String get settingsAboutSubtitle => 'Версия и информация о приложении';

  @override
  String get settingsLogout => 'Выйти';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'Премиум Восстановление Волос';

  @override
  String get clinicProfileAbout => 'О Нас';

  @override
  String get clinicProfileDoctors => 'Врачи';

  @override
  String get clinicProfileGallery => 'Галерея';

  @override
  String get clinicProfileTreatments => 'Лечение';

  @override
  String get clinicProfileBookConsultation => 'Забронировать Консультацию';

  @override
  String get clinicProfileAboutTitle => 'О Нас';

  @override
  String get clinicProfileEthicsTitle => 'Наша Этика';

  @override
  String get clinicProfilePressTitle => 'В Прессе';

  @override
  String get clinicProfileContactTitle => 'Контактная Информация';

  @override
  String get clinicProfileDoctorsTitle => 'Наши Врачи';

  @override
  String get clinicProfileGalleryTitle => 'Галерея Результатов';

  @override
  String get clinicProfileHairSurgeon => 'Хирург по Трансплантации Волос';

  @override
  String get pastAnalysesTitle => 'Прошлые Анализы';

  @override
  String get faqTitle => 'Часто Задаваемые Вопросы';

  @override
  String get faqSubtitle => 'Для ваших вопросов';

  @override
  String get splashTagline => 'Специалист по Трансплантации Волос и Эстетике';

  @override
  String get captureFlowTitle => 'Самостоятельная Съемка';

  @override
  String get captureFlowSubtitle =>
      'Автоматическая съемка с 5 критических углов для волос и кожи головы.\nУбедитесь, что вы находитесь в хорошо освещенном помещении перед началом.';

  @override
  String get captureFlowStartCapture => 'Начать Съемку';

  @override
  String get captureFlowFaceDetection =>
      'Поместите ваше лицо в рамку и смотрите в камеру.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Позиция правильная, оставайтесь неподвижными ($seconds сек)';
  }

  @override
  String get captureFlowTurnRightMore =>
      'Поверните голову немного больше вправо.';

  @override
  String get captureFlowTooMuchRight =>
      'Вы повернули слишком много, слегка отрегулируйте влево.';

  @override
  String get captureFlowKeepHeadStill =>
      'Держите голову неподвижно и не двигайте плечами.';

  @override
  String get captureFlowTurnLeftMore =>
      'Поверните голову немного больше влево.';

  @override
  String get captureFlowTooMuchLeft =>
      'Вы повернули слишком много, слегка отрегулируйте вправо.';

  @override
  String get captureFlowCaptured => 'снято';

  @override
  String get captureFlowInitializingCamera => 'Инициализация камеры...';

  @override
  String get captureFlowCapturedPhotos => 'Снятые Фото';

  @override
  String get captureFlowEndSession => 'Завершить Сессию';

  @override
  String get captureFlowReviewPhotos => 'Просмотреть Фото';

  @override
  String get captureFlowPhotosCaptured => 'фото снято';

  @override
  String get captureFlowSelected => 'Выбрано';

  @override
  String get captureFlowContinueToAnalysis => 'Продолжить к Анализу';

  @override
  String get captureFlowNewCapture => 'Начать Новую Съемку';

  @override
  String get captureFlowPhotosFrom5Angles => 'Фото с 5 углов';

  @override
  String get captureStageFrontTitle => 'Вид спереди';

  @override
  String get captureStageFrontBaseInstruction =>
      'Смотрите прямо в камеру и держите голову неподвижно.';

  @override
  String get captureStageFrontReminder =>
      'Держите голову прямо и смотрите в камеру.';

  @override
  String get captureStageRight45Title => 'Право 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Поверните голову на 45 градусов вправо.';

  @override
  String get captureStageRight45Reminder => 'Поверните голову больше вправо.';

  @override
  String get captureStageLeft45Title => 'Лево 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Поверните голову на 45 градусов влево.';

  @override
  String get captureStageLeft45Reminder => 'Поверните голову больше влево.';

  @override
  String get captureStageVertexTitle => 'Вид сверху';

  @override
  String get captureStageVertexBaseInstruction =>
      'Держите телефон горизонтально над головой.';

  @override
  String get captureStageVertexReminder =>
      'Держите телефон плоско над головой.';

  @override
  String get captureStageDonorTitle => 'Донорская область';

  @override
  String get captureStageDonorBaseInstruction =>
      'Поверните голову и держите телефон за головой.';

  @override
  String get captureStageDonorReminder =>
      'Держите телефон устойчиво за головой.';

  @override
  String get photoCaptureFrontView => 'Вид Спереди';

  @override
  String get photoCapturePositionHead => 'Поместите голову в контур';

  @override
  String get photoCaptureFront => 'Спереди';

  @override
  String get photoCaptureTop => 'Сверху';

  @override
  String get photoCaptureLeft => 'Слева';

  @override
  String get photoCaptureRight => 'Справа';

  @override
  String get chatOnline => 'Онлайн';

  @override
  String get chatToday => '--- Сегодня ---';

  @override
  String get chatMessageHint => 'Введите ваше сообщение...';

  @override
  String get chatQuickRepliesAppointment => 'Забронировать встречу';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Мой план лечения';

  @override
  String get chatQuickRepliesFollowup => 'Запросить наблюдение';

  @override
  String get chatQuickRepliesPriceInfo => 'Информация о ценах';

  @override
  String progressPatientIdParam(String id) {
    return 'ID Пациента: $id';
  }

  @override
  String get progressStatistics => 'Статистика';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Месяцев После Операции';
  }

  @override
  String get progressProcedureDay => 'День Процедуры';

  @override
  String get progressInitialConsultation => 'Первичная Консультация';

  @override
  String get progressUploadPhoto => 'Загрузить Новое Фото';

  @override
  String get analysisCaptureAndAnalyze => 'Снять и Проанализировать';

  @override
  String get analysisPastAnalyses => 'Прошлые Анализы';

  @override
  String get analysisAnalysisDate1 => '15 октября 2023';

  @override
  String get analysisAnalysisDesc1 => 'Небольшое истончение в области макушки';

  @override
  String get analysisAnalysisDate2 => '12 июля 2023';

  @override
  String get analysisAnalysisDesc2 => 'Признаки воспаления на коже головы';

  @override
  String get analysisAnalysisDate3 => '5 апреля 2023';

  @override
  String get analysisAnalysisDesc3 => 'Общее здоровье кожи головы хорошее';

  @override
  String get analysisAnalysisDate4 => '20 января 2023';

  @override
  String get analysisAnalysisDesc4 => 'Первичный анализ для лечения';

  @override
  String get faqQuestion1 =>
      'Сколько времени занимает процедура трансплантации волос?';

  @override
  String get faqAnswer1 =>
      'Процедура трансплантации волос обычно занимает 4-8 часов в зависимости от количества трансплантируемых графтов. Поскольку во время процедуры используется местная анестезия, пациент не чувствует боли.';

  @override
  String get faqQuestion2 =>
      'Когда я могу вернуться к нормальной жизни после трансплантации волос?';

  @override
  String get faqAnswer2 =>
      'Вы можете выполнять легкие действия через 2-3 дня после трансплантации волос. Рекомендуется подождать 2 недели для интенсивных видов спорта и физических нагрузок. Возвращение на работу обычно возможно через 3-5 дней.';

  @override
  String get faqQuestion3 => 'Когда начинают расти пересаженные волосы?';

  @override
  String get faqAnswer3 =>
      'Пересаженные волосы выпадают в первые 2-3 недели (шоковое выпадение). Новые волосы начинают расти через 3-4 месяца, а полные результаты видны в течение 6-12 месяцев.';

  @override
  String get faqQuestion4 => 'Болезненна ли процедура трансплантации волос?';

  @override
  String get faqAnswer4 =>
      'Поскольку во время процедуры используется местная анестезия, боли не ощущается. Может быть легкая боль после процедуры, но это можно контролировать с помощью обезболивающих.';

  @override
  String get faqQuestion5 => 'Какова успешность трансплантации волос?';

  @override
  String get faqAnswer5 =>
      'Трансплантация волос имеет очень высокий процент успеха, обычно 95-98%. Успех зависит от здоровья пациента, качества донорской области и соблюдения послеоперационных инструкций по уходу.';

  @override
  String get faqQuestion6 => 'Могут ли женщины делать трансплантацию волос?';

  @override
  String get faqAnswer6 =>
      'Да, женщины могут делать трансплантацию волос. Женское облысение распространено и может лечиться процедурами трансплантации волос. Необходима консультация, чтобы определить, подходит ли пациент в качестве кандидата.';

  @override
  String get faqQuestion7 => 'Сколько графтов нужно для трансплантации волос?';

  @override
  String get faqAnswer7 =>
      'Количество необходимых графтов зависит от степени выпадения волос и желаемой плотности. Обычно для умеренного выпадения волос используется 1 500-3 000 графтов, в то время как для обширного выпадения волос может потребоваться 3 000-5 000 графтов.';

  @override
  String get faqQuestion8 =>
      'Есть ли возрастное ограничение для трансплантации волос?';

  @override
  String get faqAnswer8 =>
      'Строгого возрастного ограничения нет, но процедура обычно рекомендуется для пациентов старше 25 лет, когда модель выпадения волос более стабильна. Каждый случай оценивается индивидуально.';

  @override
  String get faqQuestion9 =>
      'Какое время восстановления после трансплантации волос?';

  @override
  String get faqAnswer9 =>
      'Большинство пациентов могут вернуться на работу в течение 3-5 дней. Корочки обычно отпадают в течение 7-10 дней. Полное восстановление и нормальная деятельность могут возобновиться через 2 недели.';

  @override
  String get faqQuestion10 =>
      'Являются ли результаты трансплантации волос постоянными?';

  @override
  String get faqAnswer10 =>
      'Да, пересаженные волосы постоянны, поскольку они взяты из донорской области, которая генетически устойчива к выпадению волос. Пересаженные волосы будут продолжать расти естественным образом до конца вашей жизни.';

  @override
  String get pastAnalysesListView => 'Вид Списка';

  @override
  String get pastAnalysesGridView => 'Вид Сетки';

  @override
  String get pastAnalysesDetailedView => 'Детальный Вид';

  @override
  String get pastAnalysesDensityModerate => 'Плотность: Умеренная';

  @override
  String get pastAnalysesDensityLow => 'Плотность: Низкая';

  @override
  String get privacyPolicyTitle =>
      'Политика обработки и защиты персональных данных';

  @override
  String get privacyPolicyDocumentDate => 'Дата документа:';

  @override
  String get privacyPolicyRevisionDate => 'Дата пересмотра:';

  @override
  String get privacyPolicyRevisionNumber => 'Номер пересмотра:';

  @override
  String get privacyPolicySection1 => 'I. ВВЕДЕНИЕ';

  @override
  String get privacyPolicySection1A => 'А. Цель и сфера применения';

  @override
  String get privacyPolicySection1AContent =>
      'Настоящая Политика регулирует принципы, принятые Smile Hair Clinic в отношении защиты и обработки персональных данных.\n\nВ рамках настоящей Политики Smile Hair Clinic предоставляет разъяснения относительно деятельности по обработке персональных данных и систем, принятых для защиты персональных данных. Это включает информирование и обеспечение прозрачности для Заинтересованных Лиц, в первую очередь включая Получателей Продуктов или Услуг, Сотрудников и Кандидатов в Сотрудники, Потенциальных Клиентов, Акционеров, Посетителей, Участников, Поставщиков и Третьих Лиц, установление и обеспечение стандартов в управлении персональными данными; определение и поддержка организационных целей и обязательств; установление механизмов контроля, совместимых с приемлемыми уровнями риска, соблюдение принципов и правил, установленных международными конвенциями, Конституцией, законами, нормативными актами, контрактами и другим законодательством, касающимся защиты персональных данных, и обеспечение наилучшей защиты основных прав и свобод Заинтересованного Лица. Кроме того, настоящая Политика охватывает все физические и электронные системы записи данных и среды, используемые для обработки персональных данных и персональных данных особой категории автоматически или как часть системы записи данных неавтоматическими средствами.';

  @override
  String get privacyPolicySection1B => 'Б. Определения';

  @override
  String get photoAnalysisTitle => 'Анализ Фото';

  @override
  String photosUploadedCount(String count) {
    return '$count фото загружено';
  }

  @override
  String get autoAnalysisStarting =>
      'Загружено 5 фото. Автоматический анализ начнется...';

  @override
  String stageUploaded(String stage) {
    return 'Угол $stage загружен';
  }

  @override
  String stageCaptured(String stage) {
    return 'Угол $stage сделан';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Ошибка загрузки фото: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Ошибка загрузки нескольких фото: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Ошибка съемки фото: $error';
  }

  @override
  String get imageSourceTitle => 'Источник Фото';

  @override
  String get imageSourceCamera => 'Камера';

  @override
  String get imageSourceGallery => 'Галерея';

  @override
  String get imageSourceMultiGallery => 'Выбрать несколько из галереи';

  @override
  String get promptNoPhotosForAnalysis =>
      'Сначала загрузите фото. Нажмите кнопку 📷 для загрузки.';

  @override
  String get analyzingPhotos => 'Ваши фото анализируются...';

  @override
  String get visualAnalysisHeader => '📸 Визуальный Анализ - Что я вижу:';

  @override
  String get importantWarningHeader => '⚠️ ВАЖНОЕ ПРЕДУПРЕЖДЕНИЕ:';

  @override
  String get differentPersonsDetected =>
      'На фото обнаружены разные люди! Все фото должны быть одного и того же человека.';

  @override
  String get pleaseCaptureSamePerson =>
      'Пожалуйста, сделайте фото одного человека с 5 разных углов.';

  @override
  String get detectedAnglesHeader => '🔍 Обнаруженные Углы:';

  @override
  String get analysisCompleted => '✅ Анализ завершен!';

  @override
  String get allPhotosLookGood => 'Все фото выглядят хорошо.';

  @override
  String get savedToFirebase => '✅ Фото сохранены в Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'ID анализа: $id';
  }

  @override
  String get savedLocationLabel =>
      'Место сохранения: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Результат Анализа';

  @override
  String get retakeRequiredAngles => '❌ Углы, которые нужно переснять:';

  @override
  String get errorDetailsHeader => 'Детали ошибки:';

  @override
  String get retakeTheseAnglesQuestion => 'Хотите переснять эти углы?';

  @override
  String get retakeFirstInvalidQuestion =>
      'Хотите переснять первый неверный угол?';

  @override
  String get retake => 'Переснять';

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
  String get uploadAndAnalyze => 'Загрузить и Проанализировать';

  @override
  String get captureWithFaceDetection => 'Съемка с Распознаванием Лица';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'Выбрать время';

  @override
  String get dateNotAvailable => 'Date not available';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get enableDailyMedicationReminder =>
      'Включить Ежедневное Напоминание о Лекарствах';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Быстрый Доступ';

  @override
  String get quickActions => 'Быстрые Действия';

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
  String get noUpcomingAppointments => 'Нет предстоящих встреч';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Бесплатная Консультация';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Полное Имя';

  @override
  String get fullNameHint => 'Имя Фамилия';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Напишите ваше сообщение здесь...';

  @override
  String get or => 'или';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'О Нас';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'Наши Ценности';

  @override
  String get professionalism => 'Профессионализм';

  @override
  String get professionalismDescription =>
      'Наши врачи-эксперты с международной сертификацией в своей области';

  @override
  String get patientSatisfaction => 'Удовлетворенность Пациента';

  @override
  String get patientSatisfactionDescription =>
      'Счастье наших пациентов всегда в приоритете';

  @override
  String get medicalEducation => 'Медицинское Образование';

  @override
  String get medicalEducationDescription =>
      'Каждый член нашей команды - профессионал с медицинским образованием';

  @override
  String get internationalService => 'Международный Сервис';

  @override
  String get internationalServiceDescription =>
      'Обслуживаем наших пациентов со всего мира';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Успешных\nопераций';

  @override
  String get patientsFromCountries => 'Пациенты из\nстран';

  @override
  String get expertDoctors => 'Врачей-\nэкспертов';

  @override
  String get patientSatisfactionRate => 'Удовлетворенность\nпациентов';

  @override
  String get experience => 'Опыт';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'О нас';

  @override
  String get expertiseAreas => 'Области экспертизы';

  @override
  String get interview => 'Интервью';

  @override
  String get contactUs => 'Свяжитесь с нами';

  @override
  String get call => 'Позвонить';

  @override
  String get workingHours => 'Часы работы';

  @override
  String get mondayFriday => 'Понедельник - Пятница';

  @override
  String get saturday => 'Суббота';

  @override
  String get sunday => 'Воскресенье';

  @override
  String get closed => 'Закрыто';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'Все';

  @override
  String get unread => 'Непрочитанные';

  @override
  String get scheduled => 'Запланировано';

  @override
  String get markAllAsRead => 'Отметить все как прочитанное';

  @override
  String get noNotificationsYet => 'Уведомлений пока нет';

  @override
  String get newNotificationsWillAppearHere =>
      'Новые уведомления появятся здесь';

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
    return 'Камера не найдена на устройстве: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'Не удалось открыть приложение телефона. Убедитесь, что приложение телефона установлено на вашем устройстве.';

  @override
  String get emailAppCannotOpen =>
      'Не удалось открыть почтовое приложение. Убедитесь, что почтовое приложение установлено на вашем устройстве.';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Наши врачи';

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
  String get doctor => 'Врач';

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
  String get yourDoctor => 'Ваш Врач';

  @override
  String get appointment => 'Встреча';

  @override
  String get soon => 'скоро';

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
    return '$minutes минут назад';
  }

  @override
  String get justNow => 'Только что';

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
  String get front => 'Спереди';

  @override
  String get right45 => 'Справа 45°';

  @override
  String get left45 => 'Слева 45°';

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
    return 'Не удалось отправить сообщение: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'Пациент';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'Пока нет сообщений';

  @override
  String get typeMessage => 'Введите сообщение...';

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
  String get pending => 'Ожидание';

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
  String get unknownDate => 'Неизвестная дата';

  @override
  String get january => 'Январь';

  @override
  String get february => 'Февраль';

  @override
  String get march => 'Март';

  @override
  String get april => 'Апрель';

  @override
  String get may => 'Май';

  @override
  String get june => 'Июнь';

  @override
  String get july => 'Июль';

  @override
  String get august => 'Август';

  @override
  String get september => 'Сентябрь';

  @override
  String get october => 'Октябрь';

  @override
  String get november => 'Ноябрь';

  @override
  String get december => 'Декабрь';

  @override
  String get analysisCompletedShort => 'Анализ завершен!';

  @override
  String get retakeDialogTitle => 'Требуется Пересъемка';

  @override
  String get retakeDialogBody =>
      'AI анализ показывает, что следующие углы нужно переснять:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'Хотите переснять первый неверный угол?';

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
  String get noSavedAnalyses => 'Пока нет сохраненных анализов.';

  @override
  String welcomeGreeting(String name) {
    return 'Добро пожаловать, $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'Вы должны войти, чтобы отправлять сообщения';

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
      'Все уведомления отмечены как прочитанные';

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
  String get contactAddress => 'Адрес';

  @override
  String get contactEmail => 'Электронная почта';

  @override
  String get contactPhone => 'Телефон';

  @override
  String get contactWhatsApp => 'Консультант WhatsApp';

  @override
  String get patientCareGuideTitle => 'Patient Care Guide';

  @override
  String get planningTab => 'Planning';

  @override
  String get operationTab => 'Operation';

  @override
  String get recoveryTab => 'Recovery';

  @override
  String get resourcesTab => 'Ресурсы';

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
  String get message => 'Сообщение';

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
  String get examplePhotoFrontTitle => 'Пример переднего угла';

  @override
  String get examplePhotoFrontInstructions =>
      '• Смотрите прямо в камеру\n• Держите подбородок ровно, голову прямо\n• Глаза должны смотреть в камеру\n• Лицо должно быть полностью видно';

  @override
  String get examplePhotoRight45Title => 'Пример правого угла 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• Поверните голову заметно ВПРАВО (~70–90°)\n• Держите подбородок ровно, голову прямо\n• Правая щека и висок должны быть видны\n• Плечи не должны двигаться';

  @override
  String get examplePhotoLeft45Title => 'Пример левого угла 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• Поверните голову заметно ВЛЕВО (~70–90°)\n• Держите подбородок ровно, голову прямо\n• Левая щека и висок должны быть видны\n• Плечи не должны двигаться';

  @override
  String get examplePhotoVertexTitle => 'Пример угла макушки';

  @override
  String get examplePhotoVertexInstructions =>
      '• Держите телефон горизонтально и ровно\n• Экран должен быть обращен вверх\n• Поместите телефон над головой\n• Вся кожа головы должна быть видна';

  @override
  String get examplePhotoDonorTitle => 'Пример области донора';

  @override
  String get examplePhotoDonorInstructions =>
      '• Держите телефон за головой\n• Затылок и шея должны быть видны\n• Держите телефон неподвижно\n• Освещение должно быть достаточным';

  @override
  String get camera => 'Камера';

  @override
  String get gallery => 'Галерея';

  @override
  String get deleteForMe => 'Удалить для меня';

  @override
  String get messageDeleted => 'Сообщение удалено';

  @override
  String get deleteForEveryone => 'Удалить для всех';

  @override
  String get deleteMessage => 'Удалить сообщение';

  @override
  String get deleteMessageReadWarning =>
      'Это сообщение было прочитано получателем. Вы все еще хотите удалить его?';

  @override
  String get deleteMessageConfirm =>
      'Это сообщение будет удалено для всех. Вы уверены?';

  @override
  String get messageDeletedForEveryone => 'Сообщение удалено для всех';

  @override
  String get userNotLoggedIn => 'Пользователь не вошел в систему';

  @override
  String get messagesLoadingError => 'Ошибка при загрузке сообщений';

  @override
  String get loadingMessages => 'Загрузка сообщений...';

  @override
  String get startConversation => 'Начните разговор, отправив сообщение';

  @override
  String get loadOlderMessages => 'Загрузить старые сообщения';

  @override
  String get sendPhoto => 'Отправить фото';

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
  String get needLoginForAnalysis => 'Вы должны войти для анализа';

  @override
  String openCaptureFlowError(String error) {
    return 'Ошибка открытия экрана съемки: $error';
  }

  @override
  String get sessionExpired =>
      'Срок вашей сессии истек. Пожалуйста, войдите снова.';

  @override
  String get photosAnalyzedAndSaved =>
      'Фото успешно проанализированы и сохранены!';

  @override
  String get photoNotFoundForAnalysis => 'Фотографии для анализа не найдены';

  @override
  String get noValidPhotosFound => 'No valid photos found';

  @override
  String get analysisPreparing => 'Подготовка фото...';

  @override
  String get photosUploading => 'Загрузка фото...';

  @override
  String get errorUploadingPhotos => 'An error occurred while uploading photos';

  @override
  String get geminiChecking => 'Проверка соединения с Gemini API...';

  @override
  String get geminiFailed =>
      'Ошибка соединения с Gemini API. Проверьте интернет-подключение.';

  @override
  String get aiAnalyzing => 'Выполняется AI анализ...';

  @override
  String get someAnglesNeedRetake => 'Некоторые углы нужно переснять...';

  @override
  String get analysisSaved => 'Анализ успешно сохранен!';

  @override
  String get analysisCompletedSuccessfully => 'Анализ успешно завершен!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count углов нужно переснять...';
  }

  @override
  String get errorDuringAnalysis => 'Ошибка во время анализа';

  @override
  String get geminiApiError =>
      'Ошибка соединения с Gemini API. Проверьте интернет-подключение.';

  @override
  String get firebaseError => 'Ошибка соединения с Firebase. Попробуйте снова.';

  @override
  String get photoProcessingError => 'Ошибка обработки фото. Попробуйте снова.';

  @override
  String get authErrorLoginAgain =>
      'Ошибка авторизации. Пожалуйста, войдите снова.';

  @override
  String get analysisSuccessfulTitle => 'Анализ Успешен';

  @override
  String get analysisResultsTitle => 'Результаты Анализа';

  @override
  String get detailedAnalysisHeader => 'Подробный Анализ:';

  @override
  String get retakeRequiredAnglesHeader => 'Углы, требующие пересъемки:';

  @override
  String dialogError(String error) {
    return 'Ошибка открытия диалога: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Baseline photo not found';

  @override
  String get noPhotosToUpdate => 'No photos to update found';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Ошибка во время анализа: $error';
  }

  @override
  String retakeError(String error) {
    return 'Ошибка во время пересъемки: $error';
  }

  @override
  String get aiSupport => 'Поддержка ИИ';

  @override
  String get myPhotos => 'Мои Фото';

  @override
  String get photoAnalysisChatbot => 'Чатбот Анализа Фото';

  @override
  String get disableMedicationReminder => 'Отключить Напоминание о Лекарствах';

  @override
  String get medicationReminderDisabled =>
      'Ежедневное напоминание о лекарствах было отключено';

  @override
  String get medicationTime => 'Время Приема Лекарств';

  @override
  String get selectMedicationReminderTime =>
      'Выберите время ежедневного напоминания о лекарствах';

  @override
  String get selectMedicationTime => 'Выберите Время Приема Лекарств';

  @override
  String medicationReminderSetAt(String time) {
    return 'Ежедневное напоминание о лекарствах установлено на $time';
  }

  @override
  String get noDateInfo => 'No date information';

  @override
  String get invalidDate => 'Неверная дата';

  @override
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

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
  String get hairTransplantTitle => 'Пересадка Волос';

  @override
  String get hairTransplantSectionCount => 'Разделы';

  @override
  String get hairTransplantVideo => 'Видео';

  @override
  String get hairTransplantFreeConsultation =>
      'Получить Бесплатную Консультацию';

  @override
  String get hairTransplantWatchVideo => 'Смотреть Видео';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Нажмите, чтобы посмотреть на YouTube';

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
    return 'Ошибка при анализе: $error';
  }

  @override
  String get myDocuments => 'Мои Документы';

  @override
  String get loginRequiredForDocuments =>
      'Вам необходимо войти в систему для просмотра документов';

  @override
  String get noDocumentsYet => 'Пока нет документов';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Произошла ошибка:\n$error';
  }

  @override
  String get datePending => 'В ожидании';

  @override
  String get chatSupportWelcomeMessage =>
      'Привет! Я ваш помощник ИИ. Чем могу помочь сегодня?';

  @override
  String get newChat => 'Новый Чат';

  @override
  String get chatSupportAiAssistantName => 'Помощник ИИ';

  @override
  String get historyTooltip => 'История';

  @override
  String get typingIndicator => 'ИИ печатает...';

  @override
  String get chatHistoryTitle => 'История Чатов';

  @override
  String get noSavedChats => 'Нет сохраненных чатов';

  @override
  String genericErrorTryAgain(String error) {
    return 'Произошла ошибка. Пожалуйста, попробуйте снова.\nОшибка: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp не может быть открыт. Убедитесь, что приложение WhatsApp установлено.';

  @override
  String whatsappOpenError(String error) {
    return 'Произошла ошибка при открытии WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Произошла ошибка при открытии экрана захвата: $error';
  }

  @override
  String get retakeAnalyzing => 'Повторно сделанное фото анализируется...';

  @override
  String get autoAnalysisOn => 'Автоматический Анализ: Включен';

  @override
  String get autoAnalysisOff => 'Автоматический Анализ: Выключен';

  @override
  String get clearPhotosTooltip => 'Очистить фото';

  @override
  String get messageHintAnalyze =>
      'Введите ваше сообщение или напишите \"Анализировать\"...';

  @override
  String get send => 'Отправить';

  @override
  String get aiAssistantName => 'Помощник по Анализу ИИ';

  @override
  String get expertTeam => 'Команда Экспертов';

  @override
  String get expertTeamDescription =>
      'Наша команда состоит из опытных специалистов по хирургии пересадки волос.';

  @override
  String get comingSoon => 'Скоро';

  @override
  String get loginToSendMessage =>
      'Пожалуйста, войдите в систему, чтобы отправить сообщение';

  @override
  String get doctorEmailMissing => 'Отсутствует электронная почта врача';

  @override
  String doctorNotFound(String name) {
    return 'Врач $name не найден';
  }

  @override
  String get messagingComingSoon => 'Функция обмена сообщениями скоро';

  @override
  String get years => 'лет';

  @override
  String get watchWashingVideo => 'Посмотреть Видео Мытья';

  @override
  String get preCareTip1Title => 'Выберите правильного хирурга';

  @override
  String get preCareTip1Body =>
      'Процедура Sapphire FUE требует опытного хирурга и многодисциплинарную команду. Работайте с врачами, которые реалистично объясняют ваши ожидания, планируют операцию от начала до конца и применяют протоколы Smile Hair.';

  @override
  String get preCareTip2Title => 'Поделитесь своей медицинской историей';

  @override
  String get preCareTip2Body =>
      'Поделитесь своими хроническими заболеваниями, регулярными лекарствами и аллергиями с командой, ничего не скрывая. Это минимизирует риски, которые могут возникнуть во время анестезии и хирургии.';

  @override
  String get preCareTip3Title => 'Разжижители крови и процесс одобрения';

  @override
  String get preCareTip3Body =>
      'Прекратите прием аспирина или подобных разжижителей крови как минимум за неделю до даты операции с одобрения вашего врача, выписавшего рецепт. Вы можете возобновить использование через два дня после процедуры.';

  @override
  String get preCareTip4Title => 'Скрининг инфекций';

  @override
  String get preCareTip4Body =>
      'Держите результаты анализов на гепатит B/C и ВИЧ в актуальном состоянии. Клиники без надлежащих условий операционной не могут выполнять операции при этих инфекциях, чтобы ваша поездка не была напрасной.';

  @override
  String get preCareTip5Title => 'Добавки и витамины';

  @override
  String get preCareTip5Body =>
      'Добавки, содержащие витамины B и E, увеличивают кровотечение; прекратите их прием за неделю до процедуры. При необходимости ваш врач запланирует поддерживающие процедуры.';

  @override
  String get preCareTip6Title => 'Алкоголь и курение';

  @override
  String get preCareTip6Body =>
      'Прекратите употребление алкоголя как минимум за неделю до операции и не употребляйте его в течение 14 дней после процедуры. Держитесь подальше от курения за 12 часов до и в течение двух недель после операции, так как это нарушает кровообращение.';

  @override
  String get preCareTip7Title => 'План багажа и одежды';

  @override
  String get preCareTip7Body =>
      'Выберите одежду с пуговицами или молнией для верхней части тела. Одежда с узким воротником может повредить трансплантаты. Приготовьте большую сумку, которая может нести набор для ухода, выданный после операции.';

  @override
  String get preCareTip8Title => 'Отдых и гигиена';

  @override
  String get preCareTip8Body =>
      'Хорошо выспитесь в день операции, съешьте питательный завтрак и примите душ перед приходом в клинику. Чистая кожа головы снижает риск заражения.';

  @override
  String get postCareTip1Title => 'Защитите трансплантаты';

  @override
  String get postCareTip1Body =>
      'В течение первых 7 дней будьте осторожны, чтобы не ударить голову нигде. Спите на спине, используя подушку для шеи, и предотвратите трение трансплантатов о подушку.';

  @override
  String get postCareTip2Title => 'Первая ночь и следующие дни';

  @override
  String get postCareTip2Body =>
      'Обязательно проведите первую ночь после операции отдыхая. Если вам нужно выйти, используйте зонт, который защищает от солнца и дождя.';

  @override
  String get postCareTip3Title => 'Соблюдайте план приема лекарств';

  @override
  String get postCareTip3Body =>
      'Используйте антибиотики, обезболивающие, противовоспалительные средства и спрей Пантенол точно по назначению. Убедитесь, что вы понимаете рецепт и инструкции по использованию перед уходом из команды клиники.';

  @override
  String get postCareTip4Title => 'Увлажнение и спреи';

  @override
  String get postCareTip4Body =>
      'Используйте только данный изотонический/Пантенол спрей до первого мытья. Наносите антибиотическую мазь на область донора в течение первых 5-7 дней.';

  @override
  String get postCareTip5Title => 'Протокол мытья';

  @override
  String get postCareTip5Body =>
      'Первое мытье проводится в клинике через 48 часов. Каждый день после этого наносите пену осторожно похлопывающими движениями, используйте теплую воду низкого давления и вытирайте бумажными полотенцами.';

  @override
  String get postCareTip6Title => 'Корочки и шоковое выпадение';

  @override
  String get postCareTip6Body =>
      'С 10-го дня удаляйте корочки легким давлением. Шоковое выпадение, происходящее между 2-4 неделями, является нормальным; новые волосы становятся видимыми с 3-го месяца.';

  @override
  String get postCareTip7Title => 'Активность и спорт';

  @override
  String get postCareTip7Body =>
      'Не занимайтесь спортом в течение первых двух недель, вы можете делать легкие прогулки после 3-4 дней. Избегайте бассейна, сауны и активностей, требующих сильного потоотделения, в течение как минимум 1 месяца.';

  @override
  String get postCareTip8Title => 'Жалобы на комфорт';

  @override
  String get postCareTip8Body =>
      'Если есть жжение или боль в области донора, используйте крем, содержащий стероиды, с одобрения клиники. Применяйте холодные компрессы кратковременно при отеке.';

  @override
  String get operationDayTimeline1Title => 'Размещение и трансфер';

  @override
  String get operationDayTimeline1Body =>
      'Команда Smile Gentle Care организует размещение в отелях 4-5 звезд. Весь транспорт планируется от прибытия в отель до трансферов в клинику.';

  @override
  String get operationDayTimeline2Title => 'Многоязычная поддержка';

  @override
  String get operationDayTimeline2Body =>
      'Профессиональные переводчики предоставляются для пациентов из разных стран мира. Вы информируетесь на своем языке на каждом этапе процесса.';

  @override
  String get operationDayTimeline3Title => 'Предоперационная подготовка';

  @override
  String get operationDayTimeline3Body =>
      'Подписываются информационные формы, рисуется линия волос, делаются фотографии и проверяются тесты на ВИЧ/ВГВ/ВГС и жизненные показатели.';

  @override
  String get operationDayTimeline4Title => 'Ход операции';

  @override
  String get operationDayTimeline4Body =>
      'Этапы процедуры продолжительностью 6-8 часов: планирование, забор трансплантатов, открытие каналов и имплантация. Ваши врачи делятся всем процессом с вами.';

  @override
  String get operationDayTimeline5Title => 'Обед и особые предпочтения';

  @override
  String get operationDayTimeline5Body =>
      'Вегетарианские, халяльные или кошерные меню готовятся по запросу. В операционных зонах доступны опции умного телевизора и музыки.';

  @override
  String get operationDayTimeline6Title => 'Уход на следующий день';

  @override
  String get operationDayTimeline6Body =>
      'Вы приходите в клинику для смены повязки, проверки ран и обучения первому мытью. После этого процесс отслеживается с помощью цифрового фото-отслеживания.';

  @override
  String get sterilizationMeasure1 =>
      'Ежедневно проводятся тесты на утечку вакуума для проверки целостности уплотнения стерилизаторов.';

  @override
  String get sterilizationMeasure2 =>
      'Ежедневно проводится проверка с помощью теста Боуи-Дика, чтобы убедиться, что пар достигает всех поверхностей равномерно.';

  @override
  String get sterilizationMeasure3 =>
      'Ультразвуковые тесты мойки документируют, что мы очищаем микро остатки.';

  @override
  String get sterilizationMeasure4 =>
      'Тесты биологических индикаторов проводятся каждые 15 дней, и сообщается, что размножения не было.';

  @override
  String get sterilizationMeasure5 =>
      'Стерильные и использованные инструменты хранятся отдельно в запертых ящиках; предотвращается перекрестное загрязнение.';

  @override
  String get sterilizationMeasure6 =>
      'Каждый набор отслеживается с этикетками номера автоклава, даты и срока годности.';

  @override
  String get sterilizationMeasure7 =>
      'Все процессы выполняются согласно Руководству DAS Министерства Здравоохранения, стандартам ВОЗ и AAMI ST79.';

  @override
  String get washStep1 =>
      'Не мойте волосы в течение первых 36-48 часов после операции; дождитесь первого мытья, которое будет проведено в клинике.';

  @override
  String get washStep2 =>
      'Нанесите лосьон или пену на области донора и реципиента кончиками пальцев похлопывающими движениями.';

  @override
  String get washStep3 =>
      'Вспеньте шампунь и осторожно распределите его на трансплантированную область вертикальными прикосновениями; избегайте круговых движений.';

  @override
  String get washStep4 =>
      'Используйте теплую воду низкого давления. В течение первых 14 дней безопаснее наливать воду из миски вместо душевой лейки.';

  @override
  String get washStep5 =>
      'Высушите область трансплантата, осторожно надавливая бумажными полотенцами, вы можете высушить область донора обычным полотенцем.';

  @override
  String get washStep6 =>
      'Если вам нужно использовать фен, используйте его только в холодном режиме и на расстоянии.';

  @override
  String get faq1Question => 'Сколько длится восстановление?';

  @override
  String get faq1Answer =>
      'Первые две недели - это чувствительный период; волосы проходят через разные стадии в течение 6-12 месяцев. Значительные результаты видны на 6-м месяце, окончательная плотность на 12-18 месяцах.';

  @override
  String get faq2Question => 'Как должны быть повязка и режим сна?';

  @override
  String get faq2Answer =>
      'Эластичная повязка может быть применена для уменьшения отека в области лба. Спите на спине с подушкой для шеи в слегка приподнятом положении в течение первых 7-10 дней.';

  @override
  String get faq3Question => 'Душ, мытье и использование продуктов';

  @override
  String get faq3Answer =>
      'Не мочите волосы в течение первых двух дней. Через 48 часов мойте один раз в день медицинским шампунем после первого мытья в клинике; держите время душа коротким, уменьшите пар.';

  @override
  String get faq4Question =>
      'Когда я могу сушить, расчесывать или красить волосы?';

  @override
  String get faq4Answer =>
      'В течение первого месяца рекомендуется только естественная сушка. Вы можете расчесывать область донора, но не трогайте область трансплантации в течение 2 недель. Держитесь подальше от химических красок в течение 6-8 недель.';

  @override
  String get faq5Question => 'Курение, алкоголь и упражнения';

  @override
  String get faq5Answer =>
      'Курение запрещено за 12 часов до и в течение 2 недель после операции. Алкоголь не должен использоваться в течение первых 14 дней. Легкие прогулки разрешены после 4-го дня, подождите 1 месяц для тяжелых видов спорта.';

  @override
  String get faq6Question =>
      'Шляпа, солнце, путешествие и возвращение на работу';

  @override
  String get faq6Answer =>
      'Не носите шляпу в течение первых 10 дней или предпочитайте очень свободные модели. Избегайте прямого солнца. Вы можете вернуться к офисной работе в течение 3-5 дней; подождите 2 недели для физической работы. Вы можете путешествовать, но защищайте трансплантаты.';

  @override
  String get heroCardSubtitle1 =>
      'Команда Smile Hair управляет всем процессом для вас, от предоперационной оценки до планирования поездки.';

  @override
  String get heroCardSubtitle2 =>
      'Получите комфортный опыт с трансферами, поддержкой переводчика и стерильными операционными.';

  @override
  String get heroCardSubtitle3 =>
      'Безопасно защищайте трансплантаты с запланированным использованием лекарств, правильным мытьем и ограничениями движения.';

  @override
  String get heroCardSubtitle4 =>
      'Отслеживайте весь процесс с часто задаваемыми вопросами, изображениями и цифровыми руководствами.';

  @override
  String get imageBannerCaption1 =>
      'Применяйте нежный уход с шампунями и лосьонами, которые вам дают с первого мытья.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
