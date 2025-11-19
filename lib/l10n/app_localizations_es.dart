// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get close => 'Cerrar';

  @override
  String get changePhoto => 'Cambiar Foto';

  @override
  String get patientId => 'ID de Paciente';

  @override
  String get fullName => 'Nombre Completo';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get phone => 'Teléfono';

  @override
  String get address => 'Dirección';

  @override
  String get birthDate => 'Fecha de Nacimiento';

  @override
  String get gender => 'Género';

  @override
  String get emergencyContact => 'Contacto de Emergencia';

  @override
  String get saveChanges => 'Guardar Cambios';

  @override
  String get nameRequired => 'El nombre completo no puede estar vacío';

  @override
  String get emailInvalid =>
      'Por favor ingrese una dirección de correo electrónico válida';

  @override
  String get phoneRequired => 'El número de teléfono no puede estar vacío';

  @override
  String get addressRequired => 'La dirección no puede estar vacía';

  @override
  String get birthDateRequired => 'Por favor seleccione la fecha de nacimiento';

  @override
  String get profileUpdatedSuccessfully =>
      'Información del perfil actualizada exitosamente';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get preferNotToSay => 'Prefiero no decir';

  @override
  String get currentPassword => 'Contraseña Actual';

  @override
  String get newPassword => 'Nueva Contraseña';

  @override
  String get confirmNewPassword => 'Confirmar Nueva Contraseña';

  @override
  String get change => 'Cambiar';

  @override
  String get passwordsDoNotMatch => 'Las nuevas contraseñas no coinciden';

  @override
  String get passwordTooShort =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get passwordChangedSuccessfully => 'Contraseña cambiada exitosamente';

  @override
  String get currentPasswordRequired =>
      'Por favor ingrese su contraseña actual';

  @override
  String get newPasswordRequired => 'Por favor ingrese su nueva contraseña';

  @override
  String get photoChangeFeatureComingSoon =>
      'La función de cambio de foto llegará pronto';

  @override
  String get description => 'Descripción';

  @override
  String version(String version) {
    return 'Versión $version';
  }

  @override
  String get viewAndManageNotifications => 'Ver y gestionar notificaciones';

  @override
  String get privacyPolicyError =>
      'No se pudo abrir la página de política de privacidad. Por favor verifique su conexión a internet.';

  @override
  String get termsOfServiceError =>
      'No se pudo abrir la página de términos de servicio. Por favor verifique su conexión a internet.';

  @override
  String anErrorOccurred(String error) {
    return 'Ocurrió un error: $error';
  }

  @override
  String get appDescription =>
      'Una aplicación móvil moderna diseñada para servicios de trasplante de cabello y cuidado. Puede analizar tomando sus propias fotos, rastrear su proceso de tratamiento y contactar con la clínica.';

  @override
  String get appCopyright =>
      '© 2024 Hair Clinic. Todos los derechos reservados.';

  @override
  String get emergencyContactHint => 'Nombre - Teléfono';

  @override
  String get appointmentDetails => 'Detalles de la Cita';

  @override
  String get dateLabel => 'Fecha';

  @override
  String get timeLabel => 'Hora';

  @override
  String get doctorLabel => 'Doctor';

  @override
  String get appointmentTypeLabel => 'Tipo de Cita';

  @override
  String get locationLabel => 'Ubicación';

  @override
  String get phoneLabel => 'Teléfono';

  @override
  String get followUpConsultation => 'Consulta de Seguimiento';

  @override
  String get cancelAppointment => 'Cancelar Cita';

  @override
  String get addReminder => 'Agregar Recordatorio';

  @override
  String get appointmentReminderSet =>
      'Recordatorio de cita ha sido establecido';

  @override
  String get cameraPermissionRequired =>
      'No podemos continuar sin permiso de cámara. Por favor, otorgue el permiso desde la configuración.';

  @override
  String get sensorPermissionRequired =>
      'Se requiere permiso del sensor de movimiento para tomas desde arriba y atrás.';

  @override
  String get recoveryProgress => 'Progreso de Recuperación';

  @override
  String dayOfTotal(String current, String total) {
    return 'Día $current de $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Semana $week: Fase de Cicatrización';
  }

  @override
  String get todaysCareRoutine => 'Rutina de Cuidado de Hoy';

  @override
  String get takeMedicationMorning => 'Tomar medicamento (Mañana)';

  @override
  String get applyTopicalSolution => 'Aplicar solución tópica';

  @override
  String get takeMedicationEvening => 'Tomar medicamento (Noche)';

  @override
  String get upcomingAppointment => 'Próxima Cita';

  @override
  String get nextFollowUpConsultation => 'Tu próxima consulta de seguimiento.';

  @override
  String get viewDetails => 'Ver Detalles';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get appointmentReminder => 'Recordatorio de Cita';

  @override
  String appointmentReminderMessage(String time) {
    return 'Tienes una cita mañana a las $time';
  }

  @override
  String hoursAgo(Object hours) {
    return 'hace $hours horas';
  }

  @override
  String get medicationReminder => 'Recordatorio de Medicamento';

  @override
  String get morningMedicationReminder =>
      'No olvides tomar tu medicamento de la mañana';

  @override
  String get photoReminder => 'Recordatorio de Foto';

  @override
  String get weeklyProgressPhotoReminder =>
      'No olvides tomar tu foto de progreso semanal';

  @override
  String daysAgo(String days) {
    return 'hace $days días';
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
    return 'Notificación $title abierta';
  }

  @override
  String get appointmentCancellation => 'Cancelación de Cita';

  @override
  String get cancelAppointmentConfirmation =>
      '¿Estás seguro de que deseas cancelar esta cita? Esta acción no se puede deshacer.';

  @override
  String get appointmentCancelledSuccessfully => 'Cita cancelada exitosamente';

  @override
  String get everyDay => 'Todos los días';

  @override
  String get weekends => 'Fines de semana';

  @override
  String get weekdays => 'Días laborables';

  @override
  String get mondayShort => 'Lun';

  @override
  String get tuesdayShort => 'Mar';

  @override
  String get wednesdayShort => 'Mié';

  @override
  String get thursdayShort => 'Jue';

  @override
  String get fridayShort => 'Vie';

  @override
  String get saturdayShort => 'Sáb';

  @override
  String get sundayShort => 'Dom';

  @override
  String get titleCannotBeEmpty => 'El título no puede estar vacío';

  @override
  String get messageCannotBeEmpty => 'El mensaje no puede estar vacío';

  @override
  String get pleaseEnterValidEmail =>
      'Por favor ingrese una dirección de correo electrónico válida';

  @override
  String get selectAtLeastOneDay => 'Por favor seleccione al menos un día';

  @override
  String get dailyEmailScheduled => 'Correo diario ha sido programado';

  @override
  String deleteTaskConfirmation(String title) {
    return '¿Estás seguro de que deseas eliminar la tarea \"$title\"?';
  }

  @override
  String get taskDeleted => 'Tarea eliminada';

  @override
  String get deleteTask => 'Eliminar Tarea';

  @override
  String get newScheduledEmail => 'Nuevo Correo Programado';

  @override
  String get createDailyEmailTasks => 'Crear tareas de correo diarias';

  @override
  String get titleLabel => 'Título';

  @override
  String get messageLabel => 'Tu Mensaje';

  @override
  String get recipientNameLabel => 'Nombre del destinatario';

  @override
  String get delete => 'Eliminar';

  @override
  String get daysLabel => 'Días';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'Una de las principales clínicas en Estambul, especializada en trasplante capilar.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic es una de las principales clínicas en Estambul, especializada en trasplante capilar. Dirigida por los reconocidos internacionalmente Dr. Gökay Bilgin y Dr. Mehmet Erdoğan, la satisfacción del paciente siempre es prioritaria en Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'Todos los procesos operativos son seguidos personalmente por médicos, y cada miembro del equipo está formado por profesionales con formación médica. Hasta la fecha, se han realizado procedimientos exitosos de trasplante capilar en numerosos pacientes de todo el mundo.';

  @override
  String get clinicEthicsDescription =>
      'Como Smile Hair Clinic, servimos de acuerdo con nuestros principios de respeto por los derechos del paciente, transparencia, honestidad y profesionalismo. Actuamos en cumplimiento de las reglas éticas en todos los procesos de tratamiento, protegemos la confidencialidad del paciente y buscamos brindar el servicio de más alta calidad.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic ha aparecido en varios medios de comunicación por sus exitosos resultados y satisfacción del paciente. Ha presentado en conferencias internacionales de trasplante capilar y ha sido pionera en el campo.';

  @override
  String get mediaOutlets => 'Medios en los que hemos aparecido:';

  @override
  String get clinicFoundingPartner => 'es socio fundador de Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'trabaja en Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'es un médico experimentado que trabaja en Smile Hair Clinic, priorizando la satisfacción del paciente.';

  @override
  String get viewFaqPage => 'Ver página de preguntas frecuentes';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Estambul';

  @override
  String get chatWelcomeMessage =>
      '¡Bienvenido! ¿Cómo podemos ayudarle hoy? Nuestro equipo suele responder en una hora.';

  @override
  String get chatSampleMessage =>
      'Hola, me gustaría preguntar sobre mi plan de tratamiento.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'frontal';

  @override
  String get backCamera => 'trasera';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Línea de tiempo';

  @override
  String get visibleImprovementDescription =>
      'Mejora visible en la densidad en toda la corona. El paciente reporta alta satisfacción.';

  @override
  String get procedureDetails => 'Tipo: Restauración FUE\nInjertos: 2,450';

  @override
  String get scheduledEmails => 'Correos programados';

  @override
  String get noScheduledEmails => 'No hay correos programados';

  @override
  String get sampleAppointmentDate => 'Mar, 9 Nov, 10:30';

  @override
  String get sampleAppointmentDateFull => 'Martes, 9 de noviembre de 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'Estambul, Turquía';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Restauración y Cuidado del Cabello';

  @override
  String get welcomeLogin => 'Iniciar Sesión';

  @override
  String get welcomeRegister => 'Registrarse';

  @override
  String get loginTitle => 'Bienvenido de Nuevo';

  @override
  String get loginSubtitle => 'Inicia sesión en tu cuenta';

  @override
  String get loginEmail => 'Correo Electrónico';

  @override
  String get loginEmailHint => 'Ingresa tu dirección de correo electrónico';

  @override
  String get loginPassword => 'Contraseña';

  @override
  String get loginPasswordHint => 'Ingresa tu contraseña';

  @override
  String get loginForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get loginLoginButton => 'Iniciar Sesión';

  @override
  String get loginOr => 'o';

  @override
  String get loginGoogleLogin => 'Continuar con Google';

  @override
  String get loginNeedAccount => '¿No tienes una cuenta?';

  @override
  String get forgotPasswordTitle => 'Restablece tu contraseña';

  @override
  String get forgotPasswordSubtitle =>
      'Ingresa tu correo registrado y te enviaremos un enlace para restablecerla.';

  @override
  String get forgotPasswordSendButton => 'Enviar correo de restablecimiento';

  @override
  String get forgotPasswordEmailSent =>
      'Correo de restablecimiento enviado. Revisa tu bandeja de entrada.';

  @override
  String get registrationTitle => 'Crea Tu Cuenta';

  @override
  String get registrationSubtitle => 'Crea una nueva cuenta';

  @override
  String get registrationName => 'Nombre Completo';

  @override
  String get registrationNameHint => 'Ingresa tu nombre y apellido';

  @override
  String get registrationEmail => 'Correo Electrónico';

  @override
  String get registrationEmailHint =>
      'Ingresa tu dirección de correo electrónico';

  @override
  String get registrationPassword => 'Contraseña';

  @override
  String get registrationPasswordHint => 'Crea tu contraseña';

  @override
  String get registrationConfirmPassword => 'Confirmar Contraseña';

  @override
  String get registrationConfirmPasswordHint =>
      'Vuelve a ingresar tu contraseña';

  @override
  String get registrationTerms =>
      'Acepto los Términos de Uso y la Política de Privacidad.';

  @override
  String get registrationRegisterButton => 'Crear Cuenta';

  @override
  String get registrationAlreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get registrationLoginLink => 'Iniciar Sesión';

  @override
  String dashboardHelloParam(String name) {
    return 'Hola, $name';
  }

  @override
  String get dashboardHome => 'Inicio';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Análisis';

  @override
  String get dashboardMyAppointments => 'Mis Citas';

  @override
  String get dashboardResources => 'Recursos';

  @override
  String get dashboardCareGuide => 'Guía de Cuidado';

  @override
  String get dashboardCareGuideSubtitle =>
      'Instrucciones de cuidado post-trasplante';

  @override
  String get dashboardDefaultUserName => 'Usuario Invitado';

  @override
  String get dashboardHairTransplantTitle => 'Trasplante de Cabello';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Explora cada técnica de trasplante';

  @override
  String get dashboardOnlineConsultationTitle => 'Consulta Online';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'Obtén asesoramiento experto gratuito';

  @override
  String get dashboardDoctorsTitle => 'Nuestros Doctores';

  @override
  String get dashboardDoctorsSubtitle =>
      'Conoce a nuestros cirujanos especialistas';

  @override
  String get dashboardAboutUsTitle => 'Acerca de Nosotros';

  @override
  String get dashboardAboutUsSubtitle => 'Aprende sobre nuestra clínica';

  @override
  String get dashboardContactTitle => 'Contacto';

  @override
  String get dashboardContactSubtitle => 'Ponte en contacto con nosotros';

  @override
  String get dashboardProgressTracking => 'Seguimiento de Progreso';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Rastrea tu progreso de tratamiento';

  @override
  String get dashboardPastAnalysesSubtitle =>
      'Tus análisis de fotos anteriores';

  @override
  String get settingsProfile => 'Perfil';

  @override
  String get settingsPreferences => 'Preferencias';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageSubtitle => 'Selecciona tu idioma preferido';

  @override
  String get settingsDarkMode => 'Modo Oscuro';

  @override
  String get settingsDarkModeSubtitle => 'Activar tema oscuro';

  @override
  String get settingsNotifications => 'Notificaciones';

  @override
  String get settingsNotificationsSubtitle =>
      'Activar todas las notificaciones';

  @override
  String get settingsEmailNotifications => 'Notificaciones por Correo';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'Recibir notificaciones por correo';

  @override
  String get settingsPushNotifications => 'Notificaciones Push';

  @override
  String get settingsPushNotificationsSubtitle => 'Recibir notificaciones push';

  @override
  String get settingsAccount => 'Cuenta';

  @override
  String get settingsChangePassword => 'Cambiar Contraseña';

  @override
  String get settingsChangePasswordSubtitle => 'Actualiza tu contraseña';

  @override
  String get settingsPrivacyPolicy => 'Política de Privacidad';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Lee nuestra política de privacidad';

  @override
  String get settingsTermsOfService => 'Términos de Servicio';

  @override
  String get settingsTermsOfServiceSubtitle =>
      'Lee nuestros términos de servicio';

  @override
  String get settingsSupport => 'Soporte';

  @override
  String get settingsHelpSupport => 'Ayuda y Soporte';

  @override
  String get settingsHelpSupportSubtitle =>
      'Obtén ayuda y contacta con soporte';

  @override
  String get settingsAddPhone => 'Agregar número de teléfono';

  @override
  String get settingsThemeMode => 'Modo de Tema';

  @override
  String get settingsThemeDescriptionSystem =>
      'Seguir configuración del sistema';

  @override
  String get settingsThemeDescriptionLight => 'Tema claro';

  @override
  String get settingsThemeDescriptionDark => 'Tema oscuro';

  @override
  String get settingsThemeDialogTitle => 'Elegir Modo de Tema';

  @override
  String get settingsThemeOptionSystem => 'Sistema';

  @override
  String get settingsThemeOptionSystemSubtitle =>
      'Coincidir con la configuración del dispositivo';

  @override
  String get settingsThemeOptionLight => 'Claro';

  @override
  String get settingsThemeOptionLightSubtitle => 'Tema de colores brillantes';

  @override
  String get settingsThemeOptionDark => 'Oscuro';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Tema de colores tenues';

  @override
  String get settingsKvkkFormTitle => 'Formulario de Solicitud KVKK';

  @override
  String get settingsKvkkFormSubtitle =>
      'Enviar una solicitud sobre sus datos personales';

  @override
  String get settingsGdprFormTitle => 'Formulario de Contacto GDPR';

  @override
  String get settingsGdprFormSubtitle => 'Aviso informativo para KVKK y GDPR';

  @override
  String get settingsRecordsTitle => 'Mis Registros';

  @override
  String get settingsTreatmentHistoryTitle => 'Historial de Tratamiento';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Ver sus citas y registros quirúrgicos';

  @override
  String get settingsDocumentsTitle => 'Documentos';

  @override
  String get settingsDocumentsSubtitle =>
      'Informes, recetas y archivos compartidos';

  @override
  String get settingsInvoicesTitle => 'Facturas';

  @override
  String get settingsInvoicesSubtitle => 'Gestionar sus pagos y facturas';

  @override
  String get settingsSupportCenterSubtitle =>
      'Soporte 24/7 y canales de contacto';

  @override
  String get settingsContactTitle => 'Contacto';

  @override
  String get settingsContactSubtitle =>
      'Dirección, teléfono y opciones de contacto';

  @override
  String get settingsProfileLoginRequired =>
      'Inicie sesión para cambiar su foto de perfil.';

  @override
  String get settingsProfilePhotoUpdated =>
      'Su foto de perfil se ha actualizado.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Error al actualizar la foto: $error';
  }

  @override
  String get supportCenterTitle => 'Centro de Soporte';

  @override
  String get supportCenterHeroTitle => 'Aquí para ti 24/7';

  @override
  String get supportCenterHeroDescription =>
      'El equipo de soporte de Smile Hair Clinic está contigo en cada paso de tu proceso de tratamiento.';

  @override
  String get supportCenterQuickContact => 'Contacto Rápido';

  @override
  String get supportCenterWhatsappTitle => 'Chatear por WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Habla con nuestro equipo de soporte en vivo al instante';

  @override
  String get supportCenterCallTitle => 'Llámanos';

  @override
  String get supportCenterEmailTitle => 'Envíanos un correo';

  @override
  String get supportCenterKnowledgeBase => 'Centro de Conocimientos';

  @override
  String get supportCenterFaqSubtitle =>
      'Preguntas antes y después de la operación';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Base de Conocimientos';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Todos nuestros artículos sobre trasplante capilar';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Soporte de Citas y Tratamiento';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Obtener información sobre su plan de tratamiento';

  @override
  String get supportCenterMessageSectionTitle => 'Envíanos un mensaje';

  @override
  String get supportCenterMessageLabel => 'Tu mensaje';

  @override
  String get supportCenterMessageHint => 'Escribe tu pregunta o solicitud...';

  @override
  String get supportCenterMessageEmpty => 'Por favor escribe un mensaje';

  @override
  String get supportCenterMessageSuccess =>
      'Recibimos tu mensaje. Te responderemos pronto.';

  @override
  String get supportCenterSendButton => 'Enviar';

  @override
  String get treatmentHistoryTitle => 'Historial de Tratamiento';

  @override
  String get treatmentHistoryLoginRequired =>
      'Debe iniciar sesión para ver esta función.';

  @override
  String get treatmentHistoryEmpty =>
      'Aún no tiene ningún historial de tratamiento registrado.';

  @override
  String get treatmentHistoryDatePending => 'Fecha pendiente';

  @override
  String get treatmentHistoryDefaultType => 'Revisión';

  @override
  String get treatmentHistoryDoctorPending => 'Por asignar';

  @override
  String get treatmentHistoryStatusCompleted => 'Completado';

  @override
  String get treatmentHistoryStatusCancelled => 'Cancelado';

  @override
  String get treatmentHistoryStatusInProgress => 'En progreso';

  @override
  String get treatmentHistoryStatusScheduled => 'Programado';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsAboutSubtitle => 'Versión e información de la aplicación';

  @override
  String get settingsLogout => 'Cerrar Sesión';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration =>
      'Restauración Premium del Cabello';

  @override
  String get clinicProfileAbout => 'Acerca de';

  @override
  String get clinicProfileDoctors => 'Doctores';

  @override
  String get clinicProfileGallery => 'Galería';

  @override
  String get clinicProfileTreatments => 'Tratamientos';

  @override
  String get clinicProfileBookConsultation => 'Reservar Consulta';

  @override
  String get clinicProfileAboutTitle => 'Acerca de Nosotros';

  @override
  String get clinicProfileEthicsTitle => 'Nuestra Ética';

  @override
  String get clinicProfilePressTitle => 'En la Prensa';

  @override
  String get clinicProfileContactTitle => 'Información de Contacto';

  @override
  String get clinicProfileDoctorsTitle => 'Nuestros Doctores';

  @override
  String get clinicProfileGalleryTitle => 'Galería de Resultados';

  @override
  String get clinicProfileHairSurgeon => 'Cirujano de Trasplante de Cabello';

  @override
  String get pastAnalysesTitle => 'Análisis Anteriores';

  @override
  String get faqTitle => 'Preguntas Frecuentes';

  @override
  String get faqSubtitle => 'Para tus preguntas';

  @override
  String get splashTagline =>
      'Especialista en Trasplante de Cabello y Estética';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Captura automática desde 5 ángulos críticos para cabello y cuero cabelludo.\nAsegúrate de estar en un ambiente bien iluminado antes de comenzar.';

  @override
  String get captureFlowStartCapture => 'Iniciar Captura';

  @override
  String get captureFlowFaceDetection =>
      'Posiciona tu cara en el marco y mira a la cámara.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Posición correcta, mantén quieto ($seconds seg)';
  }

  @override
  String get captureFlowTurnRightMore =>
      'Gira tu cabeza un poco más hacia la derecha.';

  @override
  String get captureFlowTooMuchRight =>
      'Giraste demasiado, ajusta ligeramente hacia la izquierda.';

  @override
  String get captureFlowKeepHeadStill =>
      'Mantén tu cabeza quieta y no muevas los hombros.';

  @override
  String get captureFlowTurnLeftMore =>
      'Gira tu cabeza un poco más hacia la izquierda.';

  @override
  String get captureFlowTooMuchLeft =>
      'Giraste demasiado, ajusta ligeramente hacia la derecha.';

  @override
  String get captureFlowCaptured => 'capturado';

  @override
  String get captureFlowInitializingCamera => 'Inicializando cámara...';

  @override
  String get captureFlowCapturedPhotos => 'Fotos Capturadas';

  @override
  String get captureFlowEndSession => 'Finalizar Sesión';

  @override
  String get captureFlowReviewPhotos => 'Revisar Fotos';

  @override
  String get captureFlowPhotosCaptured => 'fotos capturadas';

  @override
  String get captureFlowSelected => 'Seleccionado';

  @override
  String get captureFlowContinueToAnalysis => 'Continuar al Análisis';

  @override
  String get captureFlowNewCapture => 'Iniciar Nueva Captura';

  @override
  String get captureFlowPhotosFrom5Angles => 'Fotos desde 5 ángulos';

  @override
  String get captureStageFrontTitle => 'Vista frontal';

  @override
  String get captureStageFrontBaseInstruction =>
      'Mire directamente a la cámara y mantenga la cabeza quieta.';

  @override
  String get captureStageFrontReminder =>
      'Mantenga la cabeza recta y mire a la cámara.';

  @override
  String get captureStageRight45Title => 'Derecha 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Gire la cabeza 45 grados hacia la derecha.';

  @override
  String get captureStageRight45Reminder =>
      'Gire la cabeza más hacia la derecha.';

  @override
  String get captureStageLeft45Title => 'Izquierda 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Gire la cabeza 45 grados hacia la izquierda.';

  @override
  String get captureStageLeft45Reminder =>
      'Gire la cabeza más hacia la izquierda.';

  @override
  String get captureStageVertexTitle => 'Vista superior';

  @override
  String get captureStageVertexBaseInstruction =>
      'Mantenga su teléfono horizontalmente sobre su cabeza.';

  @override
  String get captureStageVertexReminder =>
      'Mantenga su teléfono plano sobre su cabeza.';

  @override
  String get captureStageDonorTitle => 'Área donante';

  @override
  String get captureStageDonorBaseInstruction =>
      'Gire la cabeza y mantenga el teléfono detrás de su cabeza.';

  @override
  String get captureStageDonorReminder =>
      'Mantenga el teléfono estable detrás de su cabeza.';

  @override
  String get photoCaptureFrontView => 'Vista Frontal';

  @override
  String get photoCapturePositionHead =>
      'Posiciona tu cabeza dentro del contorno';

  @override
  String get photoCaptureFront => 'Frente';

  @override
  String get photoCaptureTop => 'Arriba';

  @override
  String get photoCaptureLeft => 'Izquierda';

  @override
  String get photoCaptureRight => 'Derecha';

  @override
  String get chatOnline => 'En línea';

  @override
  String get chatToday => '--- Hoy ---';

  @override
  String get chatMessageHint => 'Escribe tu mensaje...';

  @override
  String get chatQuickRepliesAppointment => 'Reservar cita';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Mi plan de tratamiento';

  @override
  String get chatQuickRepliesFollowup => 'Solicitar seguimiento';

  @override
  String get chatQuickRepliesPriceInfo => 'Información de precios';

  @override
  String progressPatientIdParam(String id) {
    return 'ID de Paciente: $id';
  }

  @override
  String get progressStatistics => 'Estadísticas';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Meses Post-Operación';
  }

  @override
  String get progressProcedureDay => 'Día del Procedimiento';

  @override
  String get progressInitialConsultation => 'Consulta Inicial';

  @override
  String get progressUploadPhoto => 'Subir Nueva Foto';

  @override
  String get analysisCaptureAndAnalyze => 'Capturar y Analizar';

  @override
  String get analysisPastAnalyses => 'Análisis Anteriores';

  @override
  String get analysisAnalysisDate1 => '15 de octubre de 2023';

  @override
  String get analysisAnalysisDesc1 =>
      'Ligero adelgazamiento en el área de la corona';

  @override
  String get analysisAnalysisDate2 => '12 de julio de 2023';

  @override
  String get analysisAnalysisDesc2 =>
      'Signos de inflamación en el cuero cabelludo';

  @override
  String get analysisAnalysisDate3 => '5 de abril de 2023';

  @override
  String get analysisAnalysisDesc3 =>
      'La salud general del cuero cabelludo es buena';

  @override
  String get analysisAnalysisDate4 => '20 de enero de 2023';

  @override
  String get analysisAnalysisDesc4 => 'Análisis inicial para tratamiento';

  @override
  String get faqQuestion1 =>
      '¿Cuánto tiempo dura el procedimiento de trasplante capilar?';

  @override
  String get faqAnswer1 =>
      'El procedimiento de trasplante capilar típicamente toma 4-8 horas dependiendo del número de injertos a trasplantar. Dado que se usa anestesia local durante el procedimiento, el paciente no siente dolor.';

  @override
  String get faqQuestion2 =>
      '¿Cuándo puedo volver a la vida normal después del trasplante capilar?';

  @override
  String get faqAnswer2 =>
      'Puedes hacer actividades ligeras 2-3 días después del trasplante capilar. Se recomienda esperar 2 semanas para deportes pesados y actividades físicas. El regreso al trabajo generalmente es posible 3-5 días después.';

  @override
  String get faqQuestion3 =>
      '¿Cuándo comienzan a crecer los cabellos trasplantados?';

  @override
  String get faqAnswer3 =>
      'Los cabellos trasplantados se caen en las primeras 2-3 semanas (pérdida por shock). Los nuevos cabellos comienzan a crecer 3-4 meses después y los resultados completos se ven dentro de 6-12 meses.';

  @override
  String get faqQuestion4 =>
      '¿Es doloroso el procedimiento de trasplante capilar?';

  @override
  String get faqAnswer4 =>
      'Dado que se usa anestesia local durante el procedimiento, no se siente dolor. Puede haber dolor leve después del procedimiento, pero esto puede controlarse con analgésicos.';

  @override
  String get faqQuestion5 =>
      '¿Cuál es la tasa de éxito del trasplante de cabello?';

  @override
  String get faqAnswer5 =>
      'El trasplante de cabello tiene una tasa de éxito muy alta, típicamente del 95-98%. El éxito depende de la salud del paciente, la calidad del área donante y seguir las instrucciones de cuidado postoperatorio.';

  @override
  String get faqQuestion6 =>
      '¿Pueden las mujeres someterse a un trasplante de cabello?';

  @override
  String get faqAnswer6 =>
      'Sí, las mujeres pueden someterse a un trasplante de cabello. La pérdida de cabello de patrón femenino es común y puede tratarse con procedimientos de trasplante de cabello. Se necesita una consulta para determinar si el paciente es un candidato adecuado.';

  @override
  String get faqQuestion7 =>
      '¿Cuántos injertos se necesitan para un trasplante de cabello?';

  @override
  String get faqAnswer7 =>
      'El número de injertos necesarios depende de la extensión de la pérdida de cabello y la densidad deseada. Típicamente, se usan 1.500-3.000 injertos para pérdida de cabello moderada, mientras que pueden necesitarse 3.000-5.000 injertos para pérdida de cabello extensa.';

  @override
  String get faqQuestion8 =>
      '¿Hay un límite de edad para el trasplante de cabello?';

  @override
  String get faqAnswer8 =>
      'No hay un límite de edad estricto, pero el procedimiento generalmente se recomienda para pacientes mayores de 25 años cuando el patrón de pérdida de cabello es más estable. Cada caso se evalúa individualmente.';

  @override
  String get faqQuestion9 =>
      '¿Cuál es el tiempo de recuperación después del trasplante de cabello?';

  @override
  String get faqAnswer9 =>
      'La mayoría de los pacientes pueden volver al trabajo en 3-5 días. Las costras típicamente se caen en 7-10 días. La recuperación completa y las actividades normales pueden reanudarse después de 2 semanas.';

  @override
  String get faqQuestion10 =>
      '¿Son permanentes los resultados del trasplante de cabello?';

  @override
  String get faqAnswer10 =>
      'Sí, el cabello trasplantado es permanente porque se toma del área donante que es genéticamente resistente a la pérdida de cabello. El cabello trasplantado continuará creciendo naturalmente por el resto de su vida.';

  @override
  String get pastAnalysesListView => 'Vista de Lista';

  @override
  String get pastAnalysesGridView => 'Vista de Cuadrícula';

  @override
  String get pastAnalysesDetailedView => 'Vista Detallada';

  @override
  String get pastAnalysesDensityModerate => 'Densidad: Moderada';

  @override
  String get pastAnalysesDensityLow => 'Densidad: Baja';

  @override
  String get privacyPolicyTitle =>
      'Política de Procesamiento y Protección de Datos Personales';

  @override
  String get privacyPolicyDocumentDate => 'Fecha del Documento:';

  @override
  String get privacyPolicyRevisionDate => 'Fecha de Revisión:';

  @override
  String get privacyPolicyRevisionNumber => 'Número de Revisión:';

  @override
  String get privacyPolicySection1 => 'I. INTRODUCCIÓN';

  @override
  String get privacyPolicySection1A => 'A. Propósito y Alcance';

  @override
  String get privacyPolicySection1AContent =>
      'Esta Política regula los principios adoptados por Smile Hair Clinic con respecto a la protección y el procesamiento de datos personales.\n\nDentro del alcance de esta Política, Smile Hair Clinic proporciona explicaciones con respecto a las actividades de procesamiento de datos personales y los sistemas adoptados para la protección de datos personales. Esto incluye informar y garantizar la transparencia para las Personas Relevantes, principalmente incluyendo Receptores de Productos o Servicios, Empleados y Candidatos a Empleados, Clientes Potenciales, Accionistas, Visitantes, Participantes, Proveedores y Terceros, establecer y garantizar estándares en la gestión de datos personales; determinar y apoyar objetivos y obligaciones organizacionales; establecer mecanismos de control compatibles con niveles de riesgo aceptables, cumplimiento con los principios y reglas establecidos por convenciones internacionales, la Constitución, leyes, regulaciones, contratos y otra legislación con respecto a la protección de datos personales, y garantizar la mejor protección de los derechos y libertades fundamentales de la Persona Relevante. Además, esta Política cubre todos los sistemas y entornos de registro de datos físicos y electrónicos utilizados para procesar datos personales y datos personales de categoría especial automáticamente o como parte de un sistema de registro de datos por medios no automáticos.';

  @override
  String get privacyPolicySection1B => 'B. Definiciones';

  @override
  String get photoAnalysisTitle => 'Análisis de Foto';

  @override
  String photosUploadedCount(String count) {
    return '$count fotos subidas';
  }

  @override
  String get autoAnalysisStarting =>
      '5 fotos subidas. Iniciando análisis automático...';

  @override
  String stageUploaded(String stage) {
    return 'Ángulo $stage subido';
  }

  @override
  String stageCaptured(String stage) {
    return 'Ángulo $stage capturado';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Ocurrió un error al cargar la foto: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Ocurrió un error al cargar varias fotos: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Ocurrió un error al capturar la foto: $error';
  }

  @override
  String get imageSourceTitle => 'Fuente de Foto';

  @override
  String get imageSourceCamera => 'Cámara';

  @override
  String get imageSourceGallery => 'Galería';

  @override
  String get imageSourceMultiGallery => 'Seleccionar Múltiple de Galería';

  @override
  String get promptNoPhotosForAnalysis =>
      'Por favor sube una foto primero. Toca el botón 📷 para subir.';

  @override
  String get analyzingPhotos => 'Tus fotos están siendo analizadas...';

  @override
  String get visualAnalysisHeader => '📸 Análisis Visual - Lo Que Veo:';

  @override
  String get importantWarningHeader => '⚠️ ADVERTENCIA IMPORTANTE:';

  @override
  String get differentPersonsDetected =>
      '¡Se detectaron diferentes personas en las fotos! Todas las fotos deben pertenecer a la misma persona.';

  @override
  String get pleaseCaptureSamePerson =>
      'Por favor tome fotos de la misma persona desde 5 ángulos diferentes.';

  @override
  String get detectedAnglesHeader => '🔍 Ángulos Detectados:';

  @override
  String get analysisCompleted => '✅ ¡Análisis Completado!';

  @override
  String get allPhotosLookGood => 'Todas las fotos parecen adecuadas.';

  @override
  String get savedToFirebase => '✅ ¡Las fotos se han guardado en Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'ID de Análisis: $id';
  }

  @override
  String get savedLocationLabel =>
      'Ubicación Guardada: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Resultado del Análisis';

  @override
  String get retakeRequiredAngles => '❌ Ángulos que necesitan ser retomados:';

  @override
  String get errorDetailsHeader => 'Detalles del Error:';

  @override
  String get retakeTheseAnglesQuestion => '¿Desea retomar estos ángulos?';

  @override
  String get retakeFirstInvalidQuestion =>
      '¿Desea retomar el primer ángulo inválido?';

  @override
  String get retake => 'Retomar';

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
  String get uploadAndAnalyze => 'Subir y Analizar';

  @override
  String get captureWithFaceDetection => 'Capturar con Detección Facial';

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
      'Activar Recordatorio Diario de Medicamentos';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Acceso Rápido';

  @override
  String get quickActions => 'Acciones Rápidas';

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
  String get noUpcomingAppointments => 'No hay citas próximas';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Consulta Gratuita';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Nombre Completo';

  @override
  String get fullNameHint => 'Nombre Apellido';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Escribe tu mensaje aquí...';

  @override
  String get or => 'o';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'Acerca de Nosotros';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'Nuestros Valores';

  @override
  String get professionalism => 'Profesionalismo';

  @override
  String get professionalismDescription =>
      'Nuestros médicos expertos certificados internacionalmente en su campo';

  @override
  String get patientSatisfaction => 'Satisfacción del Paciente';

  @override
  String get patientSatisfactionDescription =>
      'La felicidad de nuestros pacientes es siempre nuestra prioridad';

  @override
  String get medicalEducation => 'Educación Médica';

  @override
  String get medicalEducationDescription =>
      'Cada miembro de nuestro equipo está formado por profesionales con formación médica';

  @override
  String get internationalService => 'Servicio Internacional';

  @override
  String get internationalServiceDescription =>
      'Sirviendo a nuestros pacientes de todo el mundo';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Operaciones\nExitosas';

  @override
  String get patientsFromCountries => 'Pacientes de\nPaíses';

  @override
  String get expertDoctors => 'Doctores\nExpertos';

  @override
  String get patientSatisfactionRate => 'Satisfacción del\nPaciente';

  @override
  String get experience => 'Experiencia';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'Acerca de';

  @override
  String get expertiseAreas => 'Áreas de Especialización';

  @override
  String get interview => 'Entrevista';

  @override
  String get contactUs => 'Contáctanos';

  @override
  String get call => 'Llamar';

  @override
  String get workingHours => 'Horario de Trabajo';

  @override
  String get mondayFriday => 'Lunes - Viernes';

  @override
  String get saturday => 'Sábado';

  @override
  String get sunday => 'Domingo';

  @override
  String get closed => 'Cerrado';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'Todo';

  @override
  String get unread => 'No leído';

  @override
  String get scheduled => 'Programado';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get noNotificationsYet => 'Aún no hay notificaciones';

  @override
  String get newNotificationsWillAppearHere =>
      'Las nuevas notificaciones aparecerán aquí';

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
    return 'Cámara no encontrada en el dispositivo: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'La aplicación de teléfono no se puede abrir';

  @override
  String get emailAppCannotOpen => 'La aplicación de correo no se puede abrir';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Nuestros Doctores';

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
  String get yourDoctor => 'Su Doctor';

  @override
  String get appointment => 'Cita';

  @override
  String get soon => 'pronto';

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
  String get front => 'Frente';

  @override
  String get right45 => 'Derecha 45°';

  @override
  String get left45 => 'Izquierda 45°';

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
    return 'El mensaje no pudo ser enviado: $error';
  }

  @override
  String messagesWithTitle(Object title) {
    return 'Messages - $title';
  }

  @override
  String get patient => 'Paciente';

  @override
  String get patientInfoMissing => 'Patient information missing';

  @override
  String get noMessages => 'Aún no hay mensajes';

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
  String get pending => 'Pendiente';

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
  String get unknownDate => 'Fecha desconocida';

  @override
  String get january => 'Enero';

  @override
  String get february => 'Febrero';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Abril';

  @override
  String get may => 'Mayo';

  @override
  String get june => 'Junio';

  @override
  String get july => 'Julio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Septiembre';

  @override
  String get october => 'Octubre';

  @override
  String get november => 'Noviembre';

  @override
  String get december => 'Diciembre';

  @override
  String get analysisCompletedShort => '¡Análisis completado!';

  @override
  String get retakeDialogTitle => 'Retoma Requerida';

  @override
  String get retakeDialogBody =>
      'El análisis IA indica que los siguientes ángulos necesitan ser retomados:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      '¿Desea retomar el primer ángulo inválido?';

  @override
  String get noExistingPhotosFound => 'No se encontraron fotos existentes';

  @override
  String get noValidPhotosToUpload => 'No hay fotos válidas para subir';

  @override
  String errorOccurred(String error) {
    return 'Ocurrió un error: $error';
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
  String get noSavedAnalyses => 'Aún no hay análisis guardados.';

  @override
  String welcomeGreeting(String name) {
    return 'Bienvenido, $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'Debe iniciar sesión para enviar mensajes';

  @override
  String get chatWithMyDoctor => 'Chat with my doctor';

  @override
  String get analysisSavedSuccessfully => '¡Análisis guardado exitosamente!';

  @override
  String get allPhotosAnalyzedAndSaved =>
      'Todas las fotos analizadas y guardadas exitosamente.';

  @override
  String get reanalyzing => 'Re-analyzing...';

  @override
  String get someAnglesNotCapturedCorrectly =>
      'Algunos ángulos no fueron capturados correctamente';

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
      'Todas las notificaciones se han marcado como leídas';

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
  String get contactAddress => 'Dirección';

  @override
  String get contactEmail => 'Correo electrónico';

  @override
  String get contactPhone => 'Teléfono';

  @override
  String get contactWhatsApp => 'Consultor WhatsApp';

  @override
  String get patientCareGuideTitle => 'Guía de Cuidado del Paciente';

  @override
  String get planningTab => 'Planificación';

  @override
  String get operationTab => 'Operación';

  @override
  String get recoveryTab => 'Recuperación';

  @override
  String get resourcesTab => 'Recursos';

  @override
  String get personalizedPlanning => 'Planificación Personalizada';

  @override
  String get contactAndQuickSupport => 'Contacto y Soporte Rápido';

  @override
  String get preOperationPreparation => 'Preparación Pre-Operación';

  @override
  String get operationDayFlow => 'Flujo del Día de la Operación';

  @override
  String get operationDayExperience => 'Experiencia del Día de Operación';

  @override
  String get sterilizationAndHygieneStandards =>
      'Estándares de Esterilización e Higiene';

  @override
  String get recoveryJourney => 'Viaje de Recuperación';

  @override
  String get postOperationCare => 'Cuidado Post-Operación';

  @override
  String get hairWashingProtocol => 'Protocolo de Lavado de Cabello';

  @override
  String get knowledgeBase => 'Base de Conocimientos';

  @override
  String get frequentlyAskedQuestions => 'Preguntas Frecuentes';

  @override
  String get visualGuide => 'Guía Visual';

  @override
  String get tapToSeeDetails => 'Toca para ver detalles';

  @override
  String get connectionCannotOpen =>
      'No se pudo abrir la conexión. Por favor, verifica tu conexión a internet o asegúrate de que la aplicación esté instalada.';

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
  String get message => 'Mensaje';

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
  String get examplePhotoFrontTitle => 'Ejemplo de Ángulo Frontal';

  @override
  String get examplePhotoFrontInstructions =>
      '• Mire directamente a la cámara\n• Mantenga la barbilla recta, la cabeza erguida\n• Los ojos deben mirar a la cámara\n• La cara debe ser completamente visible';

  @override
  String get examplePhotoRight45Title => 'Ejemplo de Ángulo Derecho 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• Gire la cabeza notablemente hacia la DERECHA (~70–90°)\n• Mantenga la barbilla recta, la cabeza erguida\n• La mejilla derecha y la sien deben ser visibles\n• Los hombros no deben moverse';

  @override
  String get examplePhotoLeft45Title => 'Ejemplo de Ángulo Izquierdo 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• Gire la cabeza notablemente hacia la IZQUIERDA (~70–90°)\n• Mantenga la barbilla recta, la cabeza erguida\n• La mejilla izquierda y la sien deben ser visibles\n• Los hombros no deben moverse';

  @override
  String get examplePhotoVertexTitle => 'Ejemplo de Ángulo del Vértice';

  @override
  String get examplePhotoVertexInstructions =>
      '• Sostenga el teléfono horizontalmente y plano\n• La pantalla debe estar orientada hacia arriba\n• Coloque el teléfono sobre su cabeza\n• Todo el cuero cabelludo debe ser visible';

  @override
  String get examplePhotoDonorTitle => 'Ejemplo de Área Donante';

  @override
  String get examplePhotoDonorInstructions =>
      '• Sostenga el teléfono detrás de su cabeza\n• La parte posterior de la cabeza y el cuello deben ser visibles\n• Mantenga el teléfono estable\n• La iluminación debe ser suficiente';

  @override
  String get camera => 'Cámara';

  @override
  String get gallery => 'Galería';

  @override
  String get deleteForMe => 'Eliminar para mí';

  @override
  String get messageDeleted => 'Mensaje eliminado';

  @override
  String get deleteForEveryone => 'Eliminar para todos';

  @override
  String get deleteMessage => 'Eliminar Mensaje';

  @override
  String get deleteMessageReadWarning =>
      'Este mensaje ha sido leído por el destinatario. ¿Aún desea eliminarlo?';

  @override
  String get deleteMessageConfirm =>
      'Este mensaje se eliminará para todos. ¿Está seguro?';

  @override
  String get messageDeletedForEveryone => 'Mensaje eliminado para todos';

  @override
  String get userNotLoggedIn => 'El usuario no ha iniciado sesión';

  @override
  String get messagesLoadingError => 'Ocurrió un error al cargar los mensajes';

  @override
  String get loadingMessages => 'Cargando mensajes...';

  @override
  String get startConversation => 'Inicia una conversación enviando un mensaje';

  @override
  String get loadOlderMessages => 'Cargar mensajes antiguos';

  @override
  String get sendPhoto => 'Enviar Foto';

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
  String get needLoginForAnalysis => 'Debe iniciar sesión para analizar';

  @override
  String openCaptureFlowError(String error) {
    return 'Ocurrió un error al abrir la pantalla de captura: $error';
  }

  @override
  String get sessionExpired =>
      'Su sesión ha expirado. Inicie sesión nuevamente.';

  @override
  String get photosAnalyzedAndSaved =>
      '¡Fotos analizadas y guardadas exitosamente!';

  @override
  String get photoNotFoundForAnalysis =>
      'No se encontraron fotos para el análisis';

  @override
  String get noValidPhotosFound => 'No se encontraron fotos válidas';

  @override
  String get analysisPreparing => 'Preparando fotos...';

  @override
  String get photosUploading => 'Subiendo fotos...';

  @override
  String get errorUploadingPhotos => 'Error al subir fotos';

  @override
  String get geminiChecking => 'Verificando conexión API Gemini...';

  @override
  String get geminiFailed =>
      'Conexión API Gemini falló. Verifique su conexión a internet.';

  @override
  String get aiAnalyzing => 'Realizando análisis IA...';

  @override
  String get someAnglesNeedRetake =>
      'Algunos ángulos necesitan ser retomados...';

  @override
  String get analysisSaved => '¡Análisis guardado exitosamente!';

  @override
  String get analysisCompletedSuccessfully =>
      '¡Análisis completado exitosamente!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count ángulos necesitan ser retomados...';
  }

  @override
  String get errorDuringAnalysis => 'Ocurrió un error durante el análisis';

  @override
  String get geminiApiError =>
      'Error de conexión API Gemini. Verifique su conexión a internet.';

  @override
  String get firebaseError =>
      'Error de conexión Firebase. Por favor intente de nuevo.';

  @override
  String get photoProcessingError =>
      'Error de procesamiento de foto. Por favor intente de nuevo.';

  @override
  String get authErrorLoginAgain =>
      'Error de autorización. Inicie sesión nuevamente.';

  @override
  String get analysisSuccessfulTitle => 'Análisis Exitoso';

  @override
  String get analysisResultsTitle => 'Resultados del Análisis';

  @override
  String get detailedAnalysisHeader => 'Análisis Detallado:';

  @override
  String get retakeRequiredAnglesHeader => 'Ángulos a Retomar:';

  @override
  String dialogError(String error) {
    return 'Ocurrió un error al abrir el diálogo: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Foto de referencia no encontrada';

  @override
  String get noPhotosToUpdate => 'No hay fotos para actualizar';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Ocurrió un error durante el análisis: $error';
  }

  @override
  String retakeError(String error) {
    return 'Ocurrió un error durante la retoma: $error';
  }

  @override
  String get aiSupport => 'Soporte de IA';

  @override
  String get myPhotos => 'Mis Fotos';

  @override
  String get photoAnalysisChatbot => 'Chatbot de Análisis de Fotos';

  @override
  String get disableMedicationReminder =>
      'Desactivar Recordatorio de Medicamentos';

  @override
  String get medicationReminderDisabled =>
      'El recordatorio diario de medicamentos ha sido desactivado';

  @override
  String get medicationTime => 'Hora de Medicamentos';

  @override
  String get selectMedicationReminderTime =>
      'Seleccione la hora de su recordatorio diario de medicamentos';

  @override
  String get selectMedicationTime => 'Seleccionar Hora de Medicamentos';

  @override
  String medicationReminderSetAt(String time) {
    return 'Recordatorio diario de medicamentos configurado para $time';
  }

  @override
  String get noDateInfo => 'Sin información de fecha';

  @override
  String get invalidDate => 'Fecha inválida';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String get valid => 'Válido';

  @override
  String get samePerson => 'Misma persona';

  @override
  String get differentPersonSuspicion => 'Sospecha de persona diferente';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get profileSettings => 'Profile Settings';

  @override
  String get specialty => 'Specialty';

  @override
  String get hairTransplantTitle => 'Trasplante de Cabello';

  @override
  String get hairTransplantSectionCount => 'Secciones';

  @override
  String get hairTransplantVideo => 'Video';

  @override
  String get hairTransplantFreeConsultation => 'Obtener Consulta Gratuita';

  @override
  String get hairTransplantWatchVideo => 'Ver Video';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Haga clic para ver en YouTube';

  @override
  String get photosSavedSuccessfully => '¡Fotos guardadas exitosamente!';

  @override
  String errorDuringRetake(String error) {
    return 'Ocurrió un error durante la retoma: $error';
  }

  @override
  String errorOpeningCaptureScreen(String error) {
    return 'Error al abrir pantalla de captura: $error';
  }

  @override
  String errorDuringAnalysisShort(String error) {
    return 'Error durante el análisis: $error';
  }

  @override
  String get myDocuments => 'Mis Documentos';

  @override
  String get loginRequiredForDocuments =>
      'Necesita iniciar sesión para ver documentos';

  @override
  String get noDocumentsYet => 'Aún no hay documentos';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Ocurrió un error:\n$error';
  }

  @override
  String get datePending => 'Pendiente';

  @override
  String get chatSupportWelcomeMessage =>
      '¡Hola! Soy su asistente de IA. ¿Cómo puedo ayudarle hoy?';

  @override
  String get newChat => 'Nuevo Chat';

  @override
  String get chatSupportAiAssistantName => 'Asistente de IA';

  @override
  String get historyTooltip => 'Historial';

  @override
  String get typingIndicator => 'La IA está escribiendo...';

  @override
  String get chatHistoryTitle => 'Historial de Chat';

  @override
  String get noSavedChats => 'No hay chats guardados';

  @override
  String genericErrorTryAgain(String error) {
    return 'Ocurrió un error. Por favor, intente de nuevo.\nError: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'No se pudo abrir WhatsApp. Por favor, asegúrese de que la aplicación WhatsApp esté instalada.';

  @override
  String whatsappOpenError(String error) {
    return 'Ocurrió un error al abrir WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Ocurrió un error al abrir la pantalla de captura: $error';
  }

  @override
  String get retakeAnalyzing => 'La foto retomada se está analizando...';

  @override
  String get autoAnalysisOn => 'Análisis Automático: Activado';

  @override
  String get autoAnalysisOff => 'Análisis Automático: Desactivado';

  @override
  String get clearPhotosTooltip => 'Limpiar fotos';

  @override
  String get messageHintAnalyze =>
      'Escriba su mensaje o escriba \"Analizar\"...';

  @override
  String get send => 'Enviar';

  @override
  String get aiAssistantName => 'Asistente de Análisis de IA';

  @override
  String get expertTeam => 'Equipo de Expertos';

  @override
  String get expertTeamDescription =>
      'Nuestro equipo está formado por especialistas experimentados en cirugía de trasplante capilar.';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get loginToSendMessage =>
      'Por favor, inicie sesión para enviar un mensaje';

  @override
  String get doctorEmailMissing => 'Falta el correo electrónico del médico';

  @override
  String doctorNotFound(String name) {
    return 'Médico $name no encontrado';
  }

  @override
  String get messagingComingSoon => 'Función de mensajería próximamente';

  @override
  String get years => 'años';

  @override
  String get watchWashingVideo => 'Ver Video de Lavado';

  @override
  String get preCareTip1Title => 'Elija el cirujano correcto';

  @override
  String get preCareTip1Body =>
      'El procedimiento Sapphire FUE requiere un cirujano experimentado y un equipo multidisciplinario. Trabaje con médicos que expliquen sus expectativas de manera realista, planifiquen la operación de extremo a extremo y apliquen los protocolos de Smile Hair.';

  @override
  String get preCareTip2Title => 'Comparta su historial médico';

  @override
  String get preCareTip2Body =>
      'Comparta sus enfermedades crónicas, medicamentos regulares y alergias con el equipo sin ocultar. Esto minimiza los riesgos que pueden ocurrir durante la anestesia y la cirugía.';

  @override
  String get preCareTip3Title => 'Anticoagulantes y proceso de aprobación';

  @override
  String get preCareTip3Body =>
      'Deje de tomar aspirina o anticoagulantes similares al menos una semana antes de la fecha de la operación con la aprobación de su médico que le recetó. Puede reanudar el uso dos días después del procedimiento.';

  @override
  String get preCareTip4Title => 'Detección de infecciones';

  @override
  String get preCareTip4Body =>
      'Mantenga actualizados los resultados de sus pruebas de Hepatitis B/C y VIH. Las clínicas sin condiciones adecuadas de quirófano no pueden realizar operaciones para estas infecciones, para que su viaje no sea en vano.';

  @override
  String get preCareTip5Title => 'Suplementos y vitaminas';

  @override
  String get preCareTip5Body =>
      'Los suplementos que contienen vitaminas B y E aumentan el sangrado; déjelos una semana antes del procedimiento. Si es necesario, su médico planificará tratamientos de apoyo.';

  @override
  String get preCareTip6Title => 'Alcohol y tabaco';

  @override
  String get preCareTip6Body =>
      'Deje el alcohol al menos una semana antes de la operación y no lo consuma durante 14 días después del procedimiento. Manténgase alejado del tabaco 12 horas antes y durante dos semanas después de la operación, ya que interrumpe la circulación sanguínea.';

  @override
  String get preCareTip7Title => 'Plan de equipaje y ropa';

  @override
  String get preCareTip7Body =>
      'Elija ropa con botones o cremallera para la parte superior del cuerpo. La ropa de cuello ajustado puede dañar los injertos. Prepare una bolsa grande que pueda llevar el kit de cuidado dado después de la operación.';

  @override
  String get preCareTip8Title => 'Descanso e higiene';

  @override
  String get preCareTip8Body =>
      'Duerma bien el día de la operación, desayune nutritivamente y dúchese antes de venir a la clínica. El cuero cabelludo limpio reduce el riesgo de infección.';

  @override
  String get postCareTip1Title => 'Proteja los injertos';

  @override
  String get postCareTip1Body =>
      'Durante los primeros 7 días, tenga cuidado de no golpear su cabeza en ningún lugar. Duerma boca arriba usando una almohada para el cuello y evite que los injertos se froten contra la almohada.';

  @override
  String get postCareTip2Title => 'Primera noche y días siguientes';

  @override
  String get postCareTip2Body =>
      'Definitivamente pase la primera noche después de la operación descansando. Si necesita salir, use un paraguas que proteja del sol y la lluvia.';

  @override
  String get postCareTip3Title => 'Cumpla con el plan de medicación';

  @override
  String get postCareTip3Body =>
      'Use antibióticos, analgésicos, antiinflamatorios y spray de Pantenol exactamente como se prescribe. Asegúrese de entender la receta y las instrucciones de uso antes de dejar el equipo de la clínica.';

  @override
  String get postCareTip4Title => 'Hidratación y sprays';

  @override
  String get postCareTip4Body =>
      'Use solo el spray isotónico/Pantenol dado hasta el primer lavado. Aplique crema antibiótica en el área donante durante los primeros 5-7 días.';

  @override
  String get postCareTip5Title => 'Protocolo de lavado';

  @override
  String get postCareTip5Body =>
      'El primer lavado se realiza en la clínica 48 horas después. Todos los días después, aplique la espuma suavemente con movimientos de toque, use agua tibia de baja presión y seque con toallas de papel.';

  @override
  String get postCareTip6Title => 'Costras y pérdida por shock';

  @override
  String get postCareTip6Body =>
      'A partir del día 10, elimine las costras con presión ligera. La pérdida por shock experimentada entre las semanas 2-4 es normal; el cabello nuevo se vuelve visible a partir del mes 3.';

  @override
  String get postCareTip7Title => 'Actividad y deportes';

  @override
  String get postCareTip7Body =>
      'No haga deporte durante las primeras dos semanas, puede hacer caminatas ligeras después de 3-4 días. Evite la piscina, sauna y actividades que requieran sudoración intensa durante al menos 1 mes.';

  @override
  String get postCareTip8Title => 'Quejas de comodidad';

  @override
  String get postCareTip8Body =>
      'Si hay ardor o dolor en el área donante, use crema con esteroides con la aprobación de la clínica. Aplique compresas frías brevemente para la hinchazón.';

  @override
  String get operationDayTimeline1Title => 'Alojamiento y traslado';

  @override
  String get operationDayTimeline1Body =>
      'El equipo de Smile Gentle Care organiza alojamiento en hoteles de 4-5 estrellas. Todo el transporte está planificado desde la llegada al hotel hasta los traslados a la clínica.';

  @override
  String get operationDayTimeline2Title => 'Soporte multilingüe';

  @override
  String get operationDayTimeline2Body =>
      'Se proporcionan traductores profesionales para pacientes de diferentes países del mundo. Se le informa en su propio idioma en cada paso del proceso.';

  @override
  String get operationDayTimeline3Title => 'Preparación preoperatoria';

  @override
  String get operationDayTimeline3Body =>
      'Se firman los formularios de información, se dibuja su línea del cabello, se toman fotos y se verifican las pruebas de VIH/VHB/VHC y los signos vitales.';

  @override
  String get operationDayTimeline4Title => 'Flujo de operación';

  @override
  String get operationDayTimeline4Body =>
      'Pasos del procedimiento de 6-8 horas: planificación, extracción de injertos, apertura de canales e implantación. Sus médicos comparten todo el proceso con usted.';

  @override
  String get operationDayTimeline5Title => 'Almuerzo y preferencias especiales';

  @override
  String get operationDayTimeline5Body =>
      'Los menús vegetarianos, halal o kosher se preparan según solicitud. Hay opciones de TV inteligente y música en las áreas de operación.';

  @override
  String get operationDayTimeline6Title => 'Cuidado al día siguiente';

  @override
  String get operationDayTimeline6Body =>
      'Viene a la clínica para cambio de vendaje, control de heridas y entrenamiento del primer lavado. Después, el proceso se monitorea con seguimiento fotográfico digital.';

  @override
  String get sterilizationMeasure1 =>
      'Se realizan pruebas diarias de fuga de vacío para verificar la integridad del sello de los esterilizadores.';

  @override
  String get sterilizationMeasure2 =>
      'Se realiza verificación diaria con la prueba Bowie-Dick para asegurar que el vapor llegue a todas las superficies por igual.';

  @override
  String get sterilizationMeasure3 =>
      'Las pruebas de lavado ultrasónico documentan que limpiamos micro residuos.';

  @override
  String get sterilizationMeasure4 =>
      'Se realizan pruebas de indicadores biológicos cada 15 días y se informa que no hay reproducción.';

  @override
  String get sterilizationMeasure5 =>
      'Los instrumentos estériles y usados se almacenan por separado en cajas cerradas; se previene la contaminación cruzada.';

  @override
  String get sterilizationMeasure6 =>
      'Cada conjunto se rastrea con etiquetas de número de autoclave, fecha y fecha de vencimiento.';

  @override
  String get sterilizationMeasure7 =>
      'Todos los procesos se llevan a cabo según la Guía DAS del Ministerio de Salud, estándares de la OMS y AAMI ST79.';

  @override
  String get washStep1 =>
      'No lave su cabello durante las primeras 36-48 horas después de la operación; espere el primer lavado que se realizará en la clínica.';

  @override
  String get washStep2 =>
      'Aplique loción o espuma tanto en el área donante como en la receptora con las yemas de los dedos en movimientos de toque.';

  @override
  String get washStep3 =>
      'Haga espuma del champú y extiéndalo suavemente al área transplantada con toques verticales; evite movimientos circulares.';

  @override
  String get washStep4 =>
      'Use agua tibia de baja presión. Durante los primeros 14 días, es más seguro verter agua con un tazón en lugar de una ducha.';

  @override
  String get washStep5 =>
      'Seca el área del injerto presionando suavemente con toallas de papel, puede secar el área donante con una toalla normal.';

  @override
  String get washStep6 =>
      'Si necesita usar un secador de pelo, úselo solo en modo frío y desde la distancia.';

  @override
  String get faq1Question => '¿Cuánto dura la recuperación?';

  @override
  String get faq1Answer =>
      'Las primeras dos semanas son un período sensible; el cabello pasa por diferentes etapas durante 6-12 meses. Se ven resultados significativos en el mes 6, densidad final en los meses 12-18.';

  @override
  String get faq2Question =>
      '¿Cómo deben ser el vendaje y el horario de sueño?';

  @override
  String get faq2Answer =>
      'Se puede aplicar vendaje elástico para reducir la hinchazón en el área de la frente. Duerma boca arriba con una almohada para el cuello en posición ligeramente elevada durante los primeros 7-10 días.';

  @override
  String get faq3Question => 'Ducha, lavado y uso de productos';

  @override
  String get faq3Answer =>
      'No moje su cabello durante los primeros dos días. Después de 48 horas, lávese una vez al día con champú médico después del primer lavado en la clínica; mantenga el tiempo de ducha corto, reduzca el vapor.';

  @override
  String get faq4Question => '¿Cuándo puedo secar, peinar o teñir mi cabello?';

  @override
  String get faq4Answer =>
      'Solo se recomienda el secado natural dentro del primer mes. Puede peinar el área donante pero no toque el área de trasplante durante 2 semanas. Manténgase alejado de los tintes químicos durante 6-8 semanas.';

  @override
  String get faq5Question => 'Tabaco, alcohol y ejercicio';

  @override
  String get faq5Answer =>
      'Fumar está prohibido 12 horas antes y 2 semanas después de la operación. El alcohol no debe usarse durante los primeros 14 días. Se permiten caminatas ligeras después del día 4, espere 1 mes para deportes pesados.';

  @override
  String get faq6Question => 'Sombrero, sol, viaje y regreso al trabajo';

  @override
  String get faq6Answer =>
      'No use sombrero durante los primeros 10 días o prefiera modelos muy sueltos. Evite el sol directo. Puede regresar al trabajo de oficina dentro de 3-5 días; espere 2 semanas para trabajo físico. Puede viajar pero proteja los injertos.';

  @override
  String get heroCardSubtitle1 =>
      'El equipo de Smile Hair gestiona todo el proceso para usted, desde la evaluación preoperatoria hasta la planificación del viaje.';

  @override
  String get heroCardSubtitle2 =>
      'Experimente una experiencia cómoda con traslados, apoyo de traductor y quirófanos estériles.';

  @override
  String get heroCardSubtitle3 =>
      'Proteja los injertos de forma segura con el uso planificado de medicamentos, lavado adecuado y restricciones de movimiento.';

  @override
  String get heroCardSubtitle4 =>
      'Rastree todo el proceso con preguntas frecuentes, imágenes y guías digitales.';

  @override
  String get imageBannerCaption1 =>
      'Aplique cuidado suave con los champús y lociones que se le dan desde el primer lavado.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
