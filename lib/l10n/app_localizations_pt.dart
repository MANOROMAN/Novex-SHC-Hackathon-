// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Smile Hair Clinic';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get close => 'Fechar';

  @override
  String get changePhoto => 'Alterar Foto';

  @override
  String get patientId => 'ID do Paciente';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get email => 'E-mail';

  @override
  String get phone => 'Telefone';

  @override
  String get address => 'Endereço';

  @override
  String get birthDate => 'Data de Nascimento';

  @override
  String get gender => 'Gênero';

  @override
  String get emergencyContact => 'Contato de Emergência';

  @override
  String get saveChanges => 'Salvar Alterações';

  @override
  String get nameRequired => 'O nome completo não pode estar vazio';

  @override
  String get emailInvalid => 'Por favor, insira um endereço de e-mail válido';

  @override
  String get phoneRequired => 'O número de telefone não pode estar vazio';

  @override
  String get addressRequired => 'O endereço não pode estar vazio';

  @override
  String get birthDateRequired => 'Por favor, selecione a data de nascimento';

  @override
  String get profileUpdatedSuccessfully =>
      'Informações do perfil atualizadas com sucesso';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get preferNotToSay => 'Prefiro não dizer';

  @override
  String get currentPassword => 'Senha Atual';

  @override
  String get newPassword => 'Nova Senha';

  @override
  String get confirmNewPassword => 'Confirmar Nova Senha';

  @override
  String get change => 'Alterar';

  @override
  String get passwordsDoNotMatch => 'As novas senhas não coincidem';

  @override
  String get passwordTooShort => 'A senha deve ter pelo menos 6 caracteres';

  @override
  String get passwordChangedSuccessfully => 'Senha alterada com sucesso';

  @override
  String get currentPasswordRequired => 'Por favor, insira sua senha atual';

  @override
  String get newPasswordRequired => 'Por favor, insira sua nova senha';

  @override
  String get photoChangeFeatureComingSoon =>
      'A funcionalidade de alteração de foto chegará em breve';

  @override
  String get description => 'Descrição';

  @override
  String version(String version) {
    return 'Versão $version';
  }

  @override
  String get viewAndManageNotifications => 'Ver e gerenciar notificações';

  @override
  String get privacyPolicyError =>
      'A página da política de privacidade não pôde ser aberta. Por favor, verifique sua conexão com a internet.';

  @override
  String get termsOfServiceError =>
      'A página dos termos de serviço não pôde ser aberta. Por favor, verifique sua conexão com a internet.';

  @override
  String anErrorOccurred(String error) {
    return 'Ocorreu um erro: $error';
  }

  @override
  String get appDescription =>
      'Um aplicativo móvel moderno projetado para serviços de transplante de cabelo e cuidados. Você pode analisar tirando suas próprias fotos, acompanhar seu processo de tratamento e entrar em contato com a clínica.';

  @override
  String get appCopyright =>
      '© 2024 Hair Clinic. Todos os direitos reservados.';

  @override
  String get emergencyContactHint => 'Nome - Telefone';

  @override
  String get appointmentDetails => 'Detalhes da Consulta';

  @override
  String get dateLabel => 'Data';

  @override
  String get timeLabel => 'Hora';

  @override
  String get doctorLabel => 'Médico';

  @override
  String get appointmentTypeLabel => 'Tipo de Consulta';

  @override
  String get locationLabel => 'Localização';

  @override
  String get phoneLabel => 'Telefone';

  @override
  String get followUpConsultation => 'Consulta de Acompanhamento';

  @override
  String get cancelAppointment => 'Cancelar Consulta';

  @override
  String get addReminder => 'Adicionar lembrete';

  @override
  String get appointmentReminderSet => 'Lembrete de consulta foi definido';

  @override
  String get cameraPermissionRequired =>
      'Não podemos continuar sem permissão da câmera. Por favor, conceda a permissão nas configurações.';

  @override
  String get sensorPermissionRequired =>
      'A permissão do sensor de movimento é necessária para fotos de cima e de trás.';

  @override
  String get recoveryProgress => 'Progresso da Recuperação';

  @override
  String dayOfTotal(String current, String total) {
    return 'Dia $current de $total';
  }

  @override
  String weekNumberHealingPhase(String week) {
    return 'Semana $week: Fase de Cicatrização';
  }

  @override
  String get todaysCareRoutine => 'Rotina de Cuidados de Hoje';

  @override
  String get takeMedicationMorning => 'Tomar medicamento (Manhã)';

  @override
  String get applyTopicalSolution => 'Aplicar solução tópica';

  @override
  String get takeMedicationEvening => 'Tomar medicamento (Noite)';

  @override
  String get upcomingAppointment => 'Próximo Compromisso';

  @override
  String get nextFollowUpConsultation =>
      'Sua próxima consulta de acompanhamento.';

  @override
  String get viewDetails => 'Ver Detalhes';

  @override
  String get notifications => 'Notificações';

  @override
  String get appointmentReminder => 'Lembrete de Consulta';

  @override
  String appointmentReminderMessage(String time) {
    return 'Você tem uma consulta amanhã às $time';
  }

  @override
  String hoursAgo(Object hours) {
    return 'Há $hours horas';
  }

  @override
  String get medicationReminder => 'Lembrete de Medicamento';

  @override
  String get morningMedicationReminder =>
      'Não esqueça de tomar seu medicamento da manhã';

  @override
  String get photoReminder => 'Lembrete de Foto';

  @override
  String get weeklyProgressPhotoReminder =>
      'Não esqueça de tirar sua foto de progresso semanal';

  @override
  String daysAgo(String days) {
    return 'Há $days dias';
  }

  @override
  String weeksAgo(String weeks) {
    return 'Há $weeks semanas';
  }

  @override
  String monthsAgo(String months) {
    return 'Há $months meses';
  }

  @override
  String yearsAgo(String years) {
    return 'Há $years anos';
  }

  @override
  String notificationOpened(String title) {
    return 'Notificação $title aberta';
  }

  @override
  String get appointmentCancellation => 'Cancelamento de Consulta';

  @override
  String get cancelAppointmentConfirmation =>
      'Tem certeza de que deseja cancelar esta consulta? Esta ação não pode ser desfeita.';

  @override
  String get appointmentCancelledSuccessfully =>
      'Consulta cancelada com sucesso';

  @override
  String get everyDay => 'Todos os dias';

  @override
  String get weekends => 'Fins de semana';

  @override
  String get weekdays => 'Dias úteis';

  @override
  String get mondayShort => 'Seg';

  @override
  String get tuesdayShort => 'Ter';

  @override
  String get wednesdayShort => 'Qua';

  @override
  String get thursdayShort => 'Qui';

  @override
  String get fridayShort => 'Sex';

  @override
  String get saturdayShort => 'Sáb';

  @override
  String get sundayShort => 'Dom';

  @override
  String get titleCannotBeEmpty => 'O título não pode estar vazio';

  @override
  String get messageCannotBeEmpty => 'A mensagem não pode estar vazia';

  @override
  String get pleaseEnterValidEmail =>
      'Por favor, insira um endereço de e-mail válido';

  @override
  String get selectAtLeastOneDay => 'Por favor, selecione pelo menos um dia';

  @override
  String get dailyEmailScheduled => 'E-mail diário foi agendado';

  @override
  String deleteTaskConfirmation(String title) {
    return 'Tem certeza de que deseja excluir a tarefa \"$title\"?';
  }

  @override
  String get taskDeleted => 'Tarefa excluída';

  @override
  String get deleteTask => 'Excluir Tarefa';

  @override
  String get newScheduledEmail => 'Novo E-mail Agendado';

  @override
  String get createDailyEmailTasks => 'Criar tarefas de e-mail diárias';

  @override
  String get titleLabel => 'Título';

  @override
  String get messageLabel => 'Sua Mensagem';

  @override
  String get recipientNameLabel => 'Nome do destinatário';

  @override
  String get delete => 'Excluir';

  @override
  String get daysLabel => 'Dias';

  @override
  String get clinicName => 'Smile Hair Clinic';

  @override
  String get clinicShortDescription =>
      'Uma das principais clínicas em Istambul, especializada em transplante capilar.';

  @override
  String get clinicAboutDescription =>
      'Smile Hair Clinic é uma das principais clínicas em Istambul, especializada em transplante capilar. Liderada pelos internacionalmente reconhecidos Dr. Gökay Bilgin e Dr. Mehmet Erdoğan, a satisfação do paciente é sempre priorizada na Smile Hair Clinic.';

  @override
  String get clinicAboutDescription2 =>
      'Todos os processos operacionais são acompanhados pessoalmente por médicos, e cada membro da equipe é composto por profissionais com treinamento médico. Até o momento, procedimentos bem-sucedidos de transplante capilar foram realizados em numerosos pacientes de todo o mundo.';

  @override
  String get clinicEthicsDescription =>
      'Como Smile Hair Clinic, servimos de acordo com nossos princípios de respeito aos direitos do paciente, transparência, honestidade e profissionalismo. Agimos em conformidade com as regras éticas em todos os processos de tratamento, protegemos a confidencialidade do paciente e visamos fornecer o serviço de mais alta qualidade.';

  @override
  String get clinicPressDescription =>
      'Smile Hair Clinic foi apresentada em vários meios de comunicação por seus resultados bem-sucedidos e satisfação do paciente. Apresentou em conferências internacionais de transplante capilar e foi pioneira no campo.';

  @override
  String get mediaOutlets => 'Meios de comunicação em que fomos apresentados:';

  @override
  String get clinicFoundingPartner => 'é sócio fundador da Smile Hair Clinic.';

  @override
  String get clinicTeamMember => 'trabalha na Smile Hair Clinic.';

  @override
  String get clinicExperiencedDoctor =>
      'é um médico experiente que trabalha na Smile Hair Clinic, priorizando a satisfação do paciente.';

  @override
  String get viewFaqPage => 'Ver página de perguntas frequentes';

  @override
  String get clinicDefaultLocation => 'Smile Hair Clinic, Istambul';

  @override
  String get chatWelcomeMessage =>
      'Bem-vindo! Como podemos ajudá-lo hoje? Nossa equipe geralmente responde em uma hora.';

  @override
  String get chatSampleMessage =>
      'Olá, gostaria de perguntar sobre meu plano de tratamento.';

  @override
  String cameraNotFoundWithType(String type) {
    return 'Camera not found on device: $type';
  }

  @override
  String get frontCamera => 'frontal';

  @override
  String get backCamera => 'traseira';

  @override
  String get patientNameSample => 'James Peterson';

  @override
  String get timelineView => 'Linha do tempo';

  @override
  String get visibleImprovementDescription =>
      'Melhoria visível na densidade em toda a coroa. O paciente relata alta satisfação.';

  @override
  String get procedureDetails => 'Tipo: Restauração FUE\nEnxertos: 2.450';

  @override
  String get scheduledEmails => 'E-mails agendados';

  @override
  String get noScheduledEmails => 'Nenhum e-mail agendado';

  @override
  String get sampleAppointmentDate => 'Ter, 9 nov, 10:30';

  @override
  String get sampleAppointmentDateFull => 'Terça-feira, 9 de novembro de 2023';

  @override
  String get sampleDoctorName => 'Dr. Ahmet Yılmaz';

  @override
  String get samplePhoneNumber => '+90 (212) 555 0123';

  @override
  String get samplePatientName => 'David';

  @override
  String get sampleCityCountry => 'Istambul, Turquia';

  @override
  String get sampleEmergencyContact => 'Ahmet Yılmaz - +90 555 987 6543';

  @override
  String get welcomeTitle => 'Smile Hair Clinic';

  @override
  String get welcomeSubtitle => 'Restauração e Cuidado Capilar';

  @override
  String get welcomeLogin => 'Entrar';

  @override
  String get welcomeRegister => 'Cadastrar';

  @override
  String get loginTitle => 'Bem-vindo de Volta';

  @override
  String get loginSubtitle => 'Entre na sua conta';

  @override
  String get loginEmail => 'E-mail';

  @override
  String get loginEmailHint => 'Digite seu endereço de e-mail';

  @override
  String get loginPassword => 'Senha';

  @override
  String get loginPasswordHint => 'Digite sua senha';

  @override
  String get loginForgotPassword => 'Esqueceu sua senha?';

  @override
  String get loginLoginButton => 'Entrar';

  @override
  String get loginOr => 'ou';

  @override
  String get loginGoogleLogin => 'Continuar com Google';

  @override
  String get loginNeedAccount => 'Ainda não tem uma conta?';

  @override
  String get forgotPasswordTitle => 'Redefina sua senha';

  @override
  String get forgotPasswordSubtitle =>
      'Digite seu e-mail cadastrado e enviaremos um link para redefinir sua senha.';

  @override
  String get forgotPasswordSendButton => 'Enviar e-mail de redefinição';

  @override
  String get forgotPasswordEmailSent =>
      'E-mail de redefinição enviado. Verifique sua caixa de entrada.';

  @override
  String get registrationTitle => 'Crie Sua Conta';

  @override
  String get registrationSubtitle => 'Criar uma nova conta';

  @override
  String get registrationName => 'Nome Completo';

  @override
  String get registrationNameHint => 'Digite seu nome e sobrenome';

  @override
  String get registrationEmail => 'E-mail';

  @override
  String get registrationEmailHint => 'Digite seu endereço de e-mail';

  @override
  String get registrationPassword => 'Senha';

  @override
  String get registrationPasswordHint => 'Crie sua senha';

  @override
  String get registrationConfirmPassword => 'Confirmar Senha';

  @override
  String get registrationConfirmPasswordHint => 'Digite sua senha novamente';

  @override
  String get registrationTerms =>
      'Aceito os Termos de Uso e a Política de Privacidade.';

  @override
  String get registrationRegisterButton => 'Criar Conta';

  @override
  String get registrationAlreadyHaveAccount => 'Já tem uma conta?';

  @override
  String get registrationLoginLink => 'Entrar';

  @override
  String dashboardHelloParam(String name) {
    return 'Olá, $name';
  }

  @override
  String get dashboardHome => 'Início';

  @override
  String get dashboardChatbot => 'ChatBot';

  @override
  String get dashboardAnalysis => 'Análise';

  @override
  String get dashboardMyAppointments => 'Minhas Consultas';

  @override
  String get dashboardResources => 'Recursos';

  @override
  String get dashboardCareGuide => 'Guia de Cuidados';

  @override
  String get dashboardCareGuideSubtitle =>
      'Instruções de cuidados pós-transplante';

  @override
  String get dashboardDefaultUserName => 'Usuário Convidado';

  @override
  String get dashboardHairTransplantTitle => 'Transplante de Cabelo';

  @override
  String get dashboardHairTransplantSubtitle =>
      'Explore cada técnica de transplante';

  @override
  String get dashboardOnlineConsultationTitle => 'Consulta Online';

  @override
  String get dashboardOnlineConsultationSubtitle =>
      'Obtenha aconselhamento especializado gratuito';

  @override
  String get dashboardDoctorsTitle => 'Nossos Médicos';

  @override
  String get dashboardDoctorsSubtitle =>
      'Conheça nossos cirurgiões especialistas';

  @override
  String get dashboardAboutUsTitle => 'Sobre Nós';

  @override
  String get dashboardAboutUsSubtitle => 'Saiba mais sobre nossa clínica';

  @override
  String get dashboardContactTitle => 'Contato';

  @override
  String get dashboardContactSubtitle => 'Entre em contato conosco';

  @override
  String get dashboardProgressTracking => 'Acompanhamento de Progresso';

  @override
  String get dashboardProgressTrackingSubtitle =>
      'Acompanhe seu progresso de tratamento';

  @override
  String get dashboardPastAnalysesSubtitle =>
      'Suas análises de fotos anteriores';

  @override
  String get settingsProfile => 'Perfil';

  @override
  String get settingsPreferences => 'Preferências';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageSubtitle => 'Selecione seu idioma preferido';

  @override
  String get settingsDarkMode => 'Modo Escuro';

  @override
  String get settingsDarkModeSubtitle => 'Ativar tema escuro';

  @override
  String get settingsNotifications => 'Notificações';

  @override
  String get settingsNotificationsSubtitle => 'Ativar todas as notificações';

  @override
  String get settingsEmailNotifications => 'Notificações por E-mail';

  @override
  String get settingsEmailNotificationsSubtitle =>
      'Receber notificações por e-mail';

  @override
  String get settingsPushNotifications => 'Notificações Push';

  @override
  String get settingsPushNotificationsSubtitle => 'Receber notificações push';

  @override
  String get settingsAccount => 'Conta';

  @override
  String get settingsChangePassword => 'Alterar Senha';

  @override
  String get settingsChangePasswordSubtitle => 'Atualize sua senha';

  @override
  String get settingsPrivacyPolicy => 'Política de Privacidade';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Leia nossa política de privacidade';

  @override
  String get settingsTermsOfService => 'Termos de Serviço';

  @override
  String get settingsTermsOfServiceSubtitle => 'Leia nossos termos de serviço';

  @override
  String get settingsSupport => 'Suporte';

  @override
  String get settingsHelpSupport => 'Ajuda e Suporte';

  @override
  String get settingsHelpSupportSubtitle =>
      'Obter ajuda e entrar em contato com suporte';

  @override
  String get settingsAddPhone => 'Adicionar número de telefone';

  @override
  String get settingsThemeMode => 'Modo de tema';

  @override
  String get settingsThemeDescriptionSystem =>
      'Seguir configurações do sistema';

  @override
  String get settingsThemeDescriptionLight => 'Tema claro';

  @override
  String get settingsThemeDescriptionDark => 'Tema escuro';

  @override
  String get settingsThemeDialogTitle => 'Escolha o modo de tema';

  @override
  String get settingsThemeOptionSystem => 'Sistema';

  @override
  String get settingsThemeOptionSystemSubtitle =>
      'Adaptar às configurações do dispositivo';

  @override
  String get settingsThemeOptionLight => 'Claro';

  @override
  String get settingsThemeOptionLightSubtitle => 'Esquema de cores claro';

  @override
  String get settingsThemeOptionDark => 'Escuro';

  @override
  String get settingsThemeOptionDarkSubtitle => 'Esquema de cores escuro';

  @override
  String get settingsKvkkFormTitle => 'Formulário de Solicitação KVKK';

  @override
  String get settingsKvkkFormSubtitle =>
      'Enviar solicitação sobre seus dados pessoais';

  @override
  String get settingsGdprFormTitle => 'Formulário de Contato GDPR';

  @override
  String get settingsGdprFormSubtitle => 'Aviso de informação para KVKK e GDPR';

  @override
  String get settingsRecordsTitle => 'Meus Registros';

  @override
  String get settingsTreatmentHistoryTitle => 'Histórico de Tratamento';

  @override
  String get settingsTreatmentHistorySubtitle =>
      'Ver suas consultas e registros de operações';

  @override
  String get settingsDocumentsTitle => 'Documentos';

  @override
  String get settingsDocumentsSubtitle =>
      'Relatórios, receitas e arquivos compartilhados';

  @override
  String get settingsInvoicesTitle => 'Faturas';

  @override
  String get settingsInvoicesSubtitle => 'Gerenciar pagamentos e faturas';

  @override
  String get settingsSupportCenterSubtitle =>
      'Suporte 24/7 e canais de contato';

  @override
  String get settingsContactTitle => 'Contato';

  @override
  String get settingsContactSubtitle =>
      'Endereço, telefone e opções de contato';

  @override
  String get settingsProfileLoginRequired =>
      'Por favor, faça login para alterar sua foto de perfil.';

  @override
  String get settingsProfilePhotoUpdated =>
      'Sua foto de perfil foi atualizada.';

  @override
  String settingsProfilePhotoUpdateError(String error) {
    return 'Erro ao atualizar foto: $error';
  }

  @override
  String get supportCenterTitle => 'Centro de Suporte';

  @override
  String get supportCenterHeroTitle => 'Aqui para você 24/7';

  @override
  String get supportCenterHeroDescription =>
      'A equipe de suporte da Smile Hair Clinic está com você em cada etapa da sua jornada de tratamento.';

  @override
  String get supportCenterQuickContact => 'Contato Rápido';

  @override
  String get supportCenterWhatsappTitle => 'Conversar via WhatsApp';

  @override
  String get supportCenterWhatsappSubtitle =>
      'Fale com nossa equipe de suporte ao vivo instantaneamente';

  @override
  String get supportCenterCallTitle => 'Ligue para nós';

  @override
  String get supportCenterEmailTitle => 'Envie-nos um e-mail';

  @override
  String get supportCenterKnowledgeBase => 'Central de Conhecimento';

  @override
  String get supportCenterFaqSubtitle => 'Perguntas antes e depois da cirurgia';

  @override
  String get supportCenterKnowledgeBaseTitle => 'Base de Conhecimento';

  @override
  String get supportCenterKnowledgeBaseSubtitle =>
      'Todos os nossos artigos sobre transplante capilar';

  @override
  String get supportCenterAppointmentSupportTitle =>
      'Suporte de Consultas e Tratamento';

  @override
  String get supportCenterAppointmentSupportSubtitle =>
      'Obtenha informações sobre seu plano de tratamento';

  @override
  String get supportCenterMessageSectionTitle => 'Envie-nos uma mensagem';

  @override
  String get supportCenterMessageLabel => 'Sua mensagem';

  @override
  String get supportCenterMessageHint =>
      'Escreva sua pergunta ou solicitação...';

  @override
  String get supportCenterMessageEmpty => 'Por favor, escreva uma mensagem';

  @override
  String get supportCenterMessageSuccess =>
      'Recebemos sua mensagem. Retornaremos em breve.';

  @override
  String get supportCenterSendButton => 'Enviar';

  @override
  String get treatmentHistoryTitle => 'Histórico de Tratamento';

  @override
  String get treatmentHistoryLoginRequired =>
      'Você deve fazer login para visualizar este recurso.';

  @override
  String get treatmentHistoryEmpty =>
      'Você ainda não possui tratamentos registrados.';

  @override
  String get treatmentHistoryDatePending => 'Data pendente';

  @override
  String get treatmentHistoryDefaultType => 'Verificação';

  @override
  String get treatmentHistoryDoctorPending => 'A designar';

  @override
  String get treatmentHistoryStatusCompleted => 'Concluído';

  @override
  String get treatmentHistoryStatusCancelled => 'Cancelado';

  @override
  String get treatmentHistoryStatusInProgress => 'Em andamento';

  @override
  String get treatmentHistoryStatusScheduled => 'Agendado';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsAboutSubtitle => 'Versão e informações do aplicativo';

  @override
  String get settingsLogout => 'Sair';

  @override
  String get clinicProfileTitle => 'Smile Hair Clinic';

  @override
  String get clinicProfilePremiumRestoration => 'Restauração Premium Capilar';

  @override
  String get clinicProfileAbout => 'Sobre';

  @override
  String get clinicProfileDoctors => 'Médicos';

  @override
  String get clinicProfileGallery => 'Galeria';

  @override
  String get clinicProfileTreatments => 'Tratamentos';

  @override
  String get clinicProfileBookConsultation => 'Agendar Consulta';

  @override
  String get clinicProfileAboutTitle => 'Sobre Nós';

  @override
  String get clinicProfileEthicsTitle => 'Nossa Ética';

  @override
  String get clinicProfilePressTitle => 'Na Imprensa';

  @override
  String get clinicProfileContactTitle => 'Informações de Contato';

  @override
  String get clinicProfileDoctorsTitle => 'Nossos Médicos';

  @override
  String get clinicProfileGalleryTitle => 'Galeria de Resultados';

  @override
  String get clinicProfileHairSurgeon => 'Cirurgião de Transplante Capilar';

  @override
  String get pastAnalysesTitle => 'Análises Anteriores';

  @override
  String get faqTitle => 'Perguntas Frequentes';

  @override
  String get faqSubtitle => 'Para suas perguntas';

  @override
  String get splashTagline => 'Especialista em Transplante Capilar e Estética';

  @override
  String get captureFlowTitle => 'Self Capture';

  @override
  String get captureFlowSubtitle =>
      'Captura automática de 5 ângulos críticos para cabelo e couro cabeludo.\nCertifique-se de estar em um ambiente bem iluminado antes de começar.';

  @override
  String get captureFlowStartCapture => 'Iniciar Captura';

  @override
  String get captureFlowFaceDetection =>
      'Posicione seu rosto no quadro e olhe para a câmera.';

  @override
  String captureFlowPositionCorrect(String seconds) {
    return 'Posição correta, mantenha-se parado ($seconds seg)';
  }

  @override
  String get captureFlowTurnRightMore =>
      'Vire sua cabeça um pouco mais para a direita.';

  @override
  String get captureFlowTooMuchRight =>
      'Você virou demais, ajuste ligeiramente para a esquerda.';

  @override
  String get captureFlowKeepHeadStill =>
      'Mantenha sua cabeça parada e não mova os ombros.';

  @override
  String get captureFlowTurnLeftMore =>
      'Vire sua cabeça um pouco mais para a esquerda.';

  @override
  String get captureFlowTooMuchLeft =>
      'Você virou demais, ajuste ligeiramente para a direita.';

  @override
  String get captureFlowCaptured => 'capturado';

  @override
  String get captureFlowInitializingCamera => 'Inicializando câmera...';

  @override
  String get captureFlowCapturedPhotos => 'Fotos Capturadas';

  @override
  String get captureFlowEndSession => 'Encerrar Sessão';

  @override
  String get captureFlowReviewPhotos => 'Revisar Fotos';

  @override
  String get captureFlowPhotosCaptured => 'fotos capturadas';

  @override
  String get captureFlowSelected => 'Selecionado';

  @override
  String get captureFlowContinueToAnalysis => 'Continuar para Análise';

  @override
  String get captureFlowNewCapture => 'Iniciar Nova Captura';

  @override
  String get captureFlowPhotosFrom5Angles => 'Fotos de 5 ângulos';

  @override
  String get captureStageFrontTitle => 'Vista frontal';

  @override
  String get captureStageFrontBaseInstruction =>
      'Olhe diretamente para a câmera e mantenha a cabeça imóvel.';

  @override
  String get captureStageFrontReminder =>
      'Mantenha a cabeça reta e olhe para a câmera.';

  @override
  String get captureStageRight45Title => 'Direita 45°';

  @override
  String get captureStageRight45BaseInstruction =>
      'Vire a cabeça 45 graus para a direita.';

  @override
  String get captureStageRight45Reminder =>
      'Vire a cabeça mais para a direita.';

  @override
  String get captureStageLeft45Title => 'Esquerda 45°';

  @override
  String get captureStageLeft45BaseInstruction =>
      'Vire a cabeça 45 graus para a esquerda.';

  @override
  String get captureStageLeft45Reminder =>
      'Vire a cabeça mais para a esquerda.';

  @override
  String get captureStageVertexTitle => 'Vista superior';

  @override
  String get captureStageVertexBaseInstruction =>
      'Segure seu telefone horizontalmente acima da cabeça.';

  @override
  String get captureStageVertexReminder =>
      'Segure seu telefone plano acima da cabeça.';

  @override
  String get captureStageDonorTitle => 'Área doadora';

  @override
  String get captureStageDonorBaseInstruction =>
      'Vire a cabeça e segure o telefone atrás da cabeça.';

  @override
  String get captureStageDonorReminder =>
      'Segure o telefone estável atrás da cabeça.';

  @override
  String get photoCaptureFrontView => 'Vista Frontal';

  @override
  String get photoCapturePositionHead =>
      'Posicione sua cabeça dentro do contorno';

  @override
  String get photoCaptureFront => 'Frente';

  @override
  String get photoCaptureTop => 'Topo';

  @override
  String get photoCaptureLeft => 'Esquerda';

  @override
  String get photoCaptureRight => 'Direita';

  @override
  String get chatOnline => 'Online';

  @override
  String get chatToday => '--- Hoje ---';

  @override
  String get chatMessageHint => 'Digite sua mensagem...';

  @override
  String get chatQuickRepliesAppointment => 'Agendar consulta';

  @override
  String get chatQuickRepliesTreatmentPlan => 'Meu plano de tratamento';

  @override
  String get chatQuickRepliesFollowup => 'Solicitar acompanhamento';

  @override
  String get chatQuickRepliesPriceInfo => 'Informações de preços';

  @override
  String progressPatientIdParam(String id) {
    return 'ID do Paciente: $id';
  }

  @override
  String get progressStatistics => 'Estatísticas';

  @override
  String progressMonthsPostOpParam(String months) {
    return '$months Meses Pós-Operatório';
  }

  @override
  String get progressProcedureDay => 'Dia do Procedimento';

  @override
  String get progressInitialConsultation => 'Consulta Inicial';

  @override
  String get progressUploadPhoto => 'Enviar Nova Foto';

  @override
  String get analysisCaptureAndAnalyze => 'Capturar e Analisar';

  @override
  String get analysisPastAnalyses => 'Análises Anteriores';

  @override
  String get analysisAnalysisDate1 => '15 de outubro de 2023';

  @override
  String get analysisAnalysisDesc1 => 'Leve afinamento na área da coroa';

  @override
  String get analysisAnalysisDate2 => '12 de julho de 2023';

  @override
  String get analysisAnalysisDesc2 => 'Sinais de inflamação no couro cabeludo';

  @override
  String get analysisAnalysisDate3 => '5 de abril de 2023';

  @override
  String get analysisAnalysisDesc3 =>
      'A saúde geral do couro cabeludo está boa';

  @override
  String get analysisAnalysisDate4 => '20 de janeiro de 2023';

  @override
  String get analysisAnalysisDesc4 => 'Análise inicial para tratamento';

  @override
  String get faqQuestion1 =>
      'Quanto tempo leva o procedimento de transplante capilar?';

  @override
  String get faqAnswer1 =>
      'O procedimento de transplante capilar geralmente leva 4-8 horas dependendo do número de enxertos a serem transplantados. Como anestesia local é usada durante o procedimento, o paciente não sente dor.';

  @override
  String get faqQuestion2 =>
      'Quando posso voltar à vida normal após o transplante capilar?';

  @override
  String get faqAnswer2 =>
      'Você pode fazer atividades leves 2-3 dias após o transplante capilar. É recomendado esperar 2 semanas para esportes pesados e atividades físicas. O retorno ao trabalho geralmente é possível 3-5 dias depois.';

  @override
  String get faqQuestion3 =>
      'Quando os cabelos transplantados começam a crescer?';

  @override
  String get faqAnswer3 =>
      'Os cabelos transplantados caem nas primeiras 2-3 semanas (queda por choque). Novos cabelos começam a crescer 3-4 meses depois e resultados completos são vistos dentro de 6-12 meses.';

  @override
  String get faqQuestion4 =>
      'O procedimento de transplante capilar é doloroso?';

  @override
  String get faqAnswer4 =>
      'Como anestesia local é usada durante o procedimento, nenhuma dor é sentida. Pode haver dor leve após o procedimento, mas isso pode ser controlado com analgésicos.';

  @override
  String get faqQuestion5 => 'Qual é a taxa de sucesso do transplante capilar?';

  @override
  String get faqAnswer5 =>
      'O transplante capilar tem uma taxa de sucesso muito alta, tipicamente de 95-98%. O sucesso depende da saúde do paciente, da qualidade da área doadora e de seguir as instruções de cuidados pós-operatórios.';

  @override
  String get faqQuestion6 => 'As mulheres podem fazer transplante capilar?';

  @override
  String get faqAnswer6 =>
      'Sim, as mulheres podem fazer transplante capilar. A queda de cabelo de padrão feminino é comum e pode ser tratada com procedimentos de transplante capilar. É necessária uma consulta para determinar se o paciente é um candidato adequado.';

  @override
  String get faqQuestion7 =>
      'Quantos enxertos são necessários para um transplante capilar?';

  @override
  String get faqAnswer7 =>
      'O número de enxertos necessários depende da extensão da queda de cabelo e da densidade desejada. Tipicamente, 1.500-3.000 enxertos são usados para queda de cabelo moderada, enquanto 3.000-5.000 enxertos podem ser necessários para queda de cabelo extensa.';

  @override
  String get faqQuestion8 =>
      'Há um limite de idade para o transplante capilar?';

  @override
  String get faqAnswer8 =>
      'Não há um limite de idade rigoroso, mas o procedimento geralmente é recomendado para pacientes com mais de 25 anos quando o padrão de queda de cabelo é mais estável. Cada caso é avaliado individualmente.';

  @override
  String get faqQuestion9 =>
      'Qual é o tempo de recuperação após o transplante capilar?';

  @override
  String get faqAnswer9 =>
      'A maioria dos pacientes pode retornar ao trabalho em 3-5 dias. As crostas tipicamente caem em 7-10 dias. A recuperação completa e as atividades normais podem ser retomadas após 2 semanas.';

  @override
  String get faqQuestion10 =>
      'Os resultados do transplante capilar são permanentes?';

  @override
  String get faqAnswer10 =>
      'Sim, o cabelo transplantado é permanente porque é retirado da área doadora que é geneticamente resistente à queda de cabelo. O cabelo transplantado continuará crescendo naturalmente pelo resto de sua vida.';

  @override
  String get pastAnalysesListView => 'Vista de Lista';

  @override
  String get pastAnalysesGridView => 'Vista de Grade';

  @override
  String get pastAnalysesDetailedView => 'Vista Detalhada';

  @override
  String get pastAnalysesDensityModerate => 'Densidade: Moderada';

  @override
  String get pastAnalysesDensityLow => 'Densidade: Baixa';

  @override
  String get privacyPolicyTitle =>
      'Política de Processamento e Proteção de Dados Pessoais';

  @override
  String get privacyPolicyDocumentDate => 'Data do Documento:';

  @override
  String get privacyPolicyRevisionDate => 'Data de Revisão:';

  @override
  String get privacyPolicyRevisionNumber => 'Número de Revisão:';

  @override
  String get privacyPolicySection1 => 'I. INTRODUÇÃO';

  @override
  String get privacyPolicySection1A => 'A. Objetivo e Escopo';

  @override
  String get privacyPolicySection1AContent =>
      'Esta Política regula os princípios adotados pela Smile Hair Clinic em relação à proteção e ao processamento de dados pessoais.\n\nNo âmbito desta Política, a Smile Hair Clinic fornece explicações sobre as atividades de processamento de dados pessoais e os sistemas adotados para a proteção de dados pessoais. Isso inclui informar e garantir transparência para Pessoas Relevantes, principalmente incluindo Receptores de Produtos ou Serviços, Funcionários e Candidatos a Funcionários, Clientes Potenciais, Acionistas, Visitantes, Participantes, Fornecedores e Terceiros, estabelecer e garantir padrões na gestão de dados pessoais; determinar e apoiar objetivos e obrigações organizacionais; estabelecer mecanismos de controle compatíveis com níveis de risco aceitáveis, conformidade com os princípios e regras estabelecidos por convenções internacionais, a Constituição, leis, regulamentos, contratos e outra legislação sobre a proteção de dados pessoais, e garantir a melhor proteção dos direitos e liberdades fundamentais da Pessoa Relevante. Além disso, esta Política abrange todos os sistemas e ambientes de registro de dados físicos e eletrônicos usados para processar dados pessoais e dados pessoais de categoria especial automaticamente ou como parte de um sistema de registro de dados por meios não automáticos.';

  @override
  String get privacyPolicySection1B => 'B. Definições';

  @override
  String get photoAnalysisTitle => 'Análise de Fotos';

  @override
  String photosUploadedCount(String count) {
    return '$count fotos carregadas';
  }

  @override
  String get autoAnalysisStarting =>
      '5 fotos carregadas. A análise automática será iniciada...';

  @override
  String stageUploaded(String stage) {
    return 'Ângulo $stage carregado';
  }

  @override
  String stageCaptured(String stage) {
    return 'Ângulo $stage capturado';
  }

  @override
  String errorLoadingPhoto(String error) {
    return 'Erro ao carregar foto: $error';
  }

  @override
  String errorLoadingMultiplePhotos(String error) {
    return 'Erro ao carregar várias fotos: $error';
  }

  @override
  String errorCapturingPhoto(String error) {
    return 'Erro ao capturar foto: $error';
  }

  @override
  String get imageSourceTitle => 'Fonte da Foto';

  @override
  String get imageSourceCamera => 'Câmera';

  @override
  String get imageSourceGallery => 'Galeria';

  @override
  String get imageSourceMultiGallery => 'Selecionar várias da galeria';

  @override
  String get promptNoPhotosForAnalysis =>
      'Por favor, carregue uma foto primeiro. Toque no botão 📷 para carregar.';

  @override
  String get analyzingPhotos => 'Suas fotos estão sendo analisadas...';

  @override
  String get visualAnalysisHeader => '📸 Análise Visual - O que eu vejo:';

  @override
  String get importantWarningHeader => '⚠️ AVISO IMPORTANTE:';

  @override
  String get differentPersonsDetected =>
      'Pessoas diferentes detectadas nas fotos! Todas as fotos devem ser da mesma pessoa.';

  @override
  String get pleaseCaptureSamePerson =>
      'Por favor, capture fotos da mesma pessoa de 5 ângulos diferentes.';

  @override
  String get detectedAnglesHeader => '🔍 Ângulos Detectados:';

  @override
  String get analysisCompleted => '✅ Análise concluída!';

  @override
  String get allPhotosLookGood => 'Todas as fotos parecem boas.';

  @override
  String get savedToFirebase => '✅ As fotos foram salvas no Firebase!';

  @override
  String analysisIdLabel(String id) {
    return 'ID da Análise: $id';
  }

  @override
  String get savedLocationLabel => 'Local Salvo: Firebase Storage & Firestore';

  @override
  String get analysisResultHeader => '⚠️ Resultado da Análise';

  @override
  String get retakeRequiredAngles => '❌ Ângulos que precisam ser refeitos:';

  @override
  String get errorDetailsHeader => 'Detalhes do erro:';

  @override
  String get retakeTheseAnglesQuestion =>
      'Você gostaria de refazer esses ângulos?';

  @override
  String get retakeFirstInvalidQuestion =>
      'Você gostaria de refazer o primeiro ângulo inválido?';

  @override
  String get retake => 'Refazer';

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
  String get uploadAndAnalyze => 'Enviar e Analisar';

  @override
  String get captureWithFaceDetection => 'Capturar com Detecção Facial';

  @override
  String errorSavingMedicationTime(String error) {
    return 'Failed to save medication time: $error';
  }

  @override
  String get selectTime => 'Selecionar hora';

  @override
  String get dateNotAvailable => 'Date not available';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get enableDailyMedicationReminder =>
      'Ativar Lembrete Diário de Medicamentos';

  @override
  String get dailyMedication => 'Daily Medication';

  @override
  String dailyMedicationReminderSet(String time) {
    return 'Daily medication reminder set for $time';
  }

  @override
  String get quickAccess => 'Acesso Rápido';

  @override
  String get quickActions => 'Ações Rápidas';

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
  String get noUpcomingAppointments => 'Nenhum compromisso próximo';

  @override
  String get onlineConsultation => 'Online Consultation';

  @override
  String get freeConsultation => 'Consulta Gratuita';

  @override
  String get freeConsultationSubtitle => 'Contact us to get more information';

  @override
  String get fullNameLabel => 'Nome Completo';

  @override
  String get fullNameHint => 'Nome Sobrenome';

  @override
  String get emailExample => 'example@email.com';

  @override
  String get phoneHint => '5XX XXX XX XX';

  @override
  String get messageHint => 'Escreva sua mensagem aqui...';

  @override
  String get or => 'ou';

  @override
  String get messageSentSuccessfully =>
      'Your message has been sent successfully!';

  @override
  String get aboutUsTitle => 'Sobre Nós';

  @override
  String get whoWeAre => 'Who We Are?';

  @override
  String get aboutUsDescription =>
      'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.';

  @override
  String get ourValues => 'Nossos Valores';

  @override
  String get professionalism => 'Profissionalismo';

  @override
  String get professionalismDescription =>
      'Nossos médicos especialistas certificados internacionalmente';

  @override
  String get patientSatisfaction => 'Satisfação do Paciente';

  @override
  String get patientSatisfactionDescription =>
      'A felicidade de nossos pacientes é sempre nossa prioridade';

  @override
  String get medicalEducation => 'Educação Médica';

  @override
  String get medicalEducationDescription =>
      'Cada membro de nossa equipe é composto por profissionais com formação médica';

  @override
  String get internationalService => 'Serviço Internacional';

  @override
  String get internationalServiceDescription =>
      'Atendendo nossos pacientes de todo o mundo';

  @override
  String get byNumbers => 'By Numbers';

  @override
  String get successfulOperations => 'Operações\nBem-sucedidas';

  @override
  String get patientsFromCountries => 'Pacientes de\nPaíses';

  @override
  String get expertDoctors => 'Médicos\nEspecialistas';

  @override
  String get patientSatisfactionRate => 'Satisfação do\nPaciente';

  @override
  String get experience => 'Experiência';

  @override
  String get successfulOperation => 'Successful Operation';

  @override
  String get about => 'Sobre';

  @override
  String get expertiseAreas => 'Áreas de Especialização';

  @override
  String get interview => 'Entrevista';

  @override
  String get contactUs => 'Fale Conosco';

  @override
  String get call => 'Ligar';

  @override
  String get workingHours => 'Horário de Funcionamento';

  @override
  String get mondayFriday => 'Segunda - Sexta';

  @override
  String get saturday => 'Sábado';

  @override
  String get sunday => 'Domingo';

  @override
  String get closed => 'Fechado';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get all => 'Todas';

  @override
  String get unread => 'Não Lidas';

  @override
  String get scheduled => 'Agendadas';

  @override
  String get markAllAsRead => 'Marcar Tudo como Lido';

  @override
  String get noNotificationsYet => 'Ainda sem notificações';

  @override
  String get newNotificationsWillAppearHere =>
      'Novas notificações aparecerão aqui';

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
    return 'Câmera não encontrada no dispositivo: $type';
  }

  @override
  String get phoneAppCannotOpen =>
      'Não foi possível abrir o aplicativo de telefone. Certifique-se de que o aplicativo de telefone esteja instalado no seu dispositivo.';

  @override
  String get emailAppCannotOpen =>
      'Não foi possível abrir o aplicativo de e-mail. Certifique-se de que o aplicativo de e-mail esteja instalado no seu dispositivo.';

  @override
  String get mapCannotOpen =>
      'Map cannot be opened. Please check your internet connection.';

  @override
  String get noPhotosSelectedYet => 'No photos selected yet';

  @override
  String get addPhotosFromGalleryOrCamera =>
      'Add photos from gallery or camera';

  @override
  String get ourDoctors => 'Nossos Médicos';

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
  String get doctor => 'Médico';

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
  String get yourDoctor => 'Seu Médico';

  @override
  String get appointment => 'Compromisso';

  @override
  String get soon => 'em breve';

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
    return 'Há $minutes minutos';
  }

  @override
  String get justNow => 'Agora mesmo';

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
  String get right45 => 'Direita 45°';

  @override
  String get left45 => 'Esquerda 45°';

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
    return 'Não foi possível enviar mensagem: $error';
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
  String get noMessages => 'Ainda não há mensagens';

  @override
  String get typeMessage => 'Digite uma mensagem...';

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
  String get pending => 'Pendente';

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
  String get unknownDate => 'Data Desconhecida';

  @override
  String get january => 'Janeiro';

  @override
  String get february => 'Fevereiro';

  @override
  String get march => 'Março';

  @override
  String get april => 'Abril';

  @override
  String get may => 'Maio';

  @override
  String get june => 'Junho';

  @override
  String get july => 'Julho';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Setembro';

  @override
  String get october => 'Outubro';

  @override
  String get november => 'Novembro';

  @override
  String get december => 'Dezembro';

  @override
  String get analysisCompletedShort => 'Análise concluída!';

  @override
  String get retakeDialogTitle => 'Refazer Necessário';

  @override
  String get retakeDialogBody =>
      'A análise de IA indica que os seguintes ângulos precisam ser refeitos:';

  @override
  String get retakeFirstInvalidQuestionShort =>
      'Você gostaria de refazer o primeiro ângulo inválido?';

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
  String get noSavedAnalyses => 'Nenhuma análise salva ainda.';

  @override
  String welcomeGreeting(String name) {
    return 'Bem-vindo, $name';
  }

  @override
  String get loginRequiredForMessaging =>
      'Você deve fazer login para enviar mensagens';

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
      'Todas as notificações marcadas como lidas';

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
  String get contactAddress => 'Endereço';

  @override
  String get contactEmail => 'E-mail';

  @override
  String get contactPhone => 'Telefone';

  @override
  String get contactWhatsApp => 'Consultor WhatsApp';

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
  String get personalizedPlanning => 'Planejamento Personalizado';

  @override
  String get contactAndQuickSupport => 'Contact & Quick Support';

  @override
  String get preOperationPreparation => 'Pre-Operation Preparation';

  @override
  String get operationDayFlow => 'Fluxo do Dia da Operação';

  @override
  String get operationDayExperience => 'Operation Day Experience';

  @override
  String get sterilizationAndHygieneStandards =>
      'Sterilization & Hygiene Standards';

  @override
  String get recoveryJourney => 'Jornada de Recuperação';

  @override
  String get postOperationCare => 'Post-Operation Care';

  @override
  String get hairWashingProtocol => 'Hair Washing Protocol';

  @override
  String get knowledgeBase => 'Base de Conhecimentos';

  @override
  String get frequentlyAskedQuestions => 'Perguntas Frequentes';

  @override
  String get visualGuide => 'Guia Visual';

  @override
  String get tapToSeeDetails => 'Toque para ver detalhes';

  @override
  String get connectionCannotOpen =>
      'A conexão não pôde ser aberta. Por favor, verifique sua conexão com a internet ou certifique-se de que o aplicativo está instalado.';

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
  String get message => 'Mensagem';

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
  String get examplePhotoFrontTitle => 'Exemplo de Ângulo Frontal';

  @override
  String get examplePhotoFrontInstructions =>
      '• Olhe diretamente para a câmera\n• Mantenha o queixo reto, cabeça ereta\n• Os olhos devem olhar para a câmera\n• O rosto deve estar completamente visível';

  @override
  String get examplePhotoRight45Title => 'Exemplo de Ângulo Direito 45°';

  @override
  String get examplePhotoRight45Instructions =>
      '• Vire a cabeça significativamente para a DIREITA (~70–90°)\n• Mantenha o queixo reto, cabeça ereta\n• A bochecha direita e a têmpora devem estar visíveis\n• Os ombros não devem se mover';

  @override
  String get examplePhotoLeft45Title => 'Exemplo de Ângulo Esquerdo 45°';

  @override
  String get examplePhotoLeft45Instructions =>
      '• Vire a cabeça significativamente para a ESQUERDA (~70–90°)\n• Mantenha o queixo reto, cabeça ereta\n• A bochecha esquerda e a têmpora devem estar visíveis\n• Os ombros não devem se mover';

  @override
  String get examplePhotoVertexTitle => 'Exemplo de Ângulo do Vértice';

  @override
  String get examplePhotoVertexInstructions =>
      '• Segure o telefone horizontalmente e plano\n• A tela deve estar voltada para cima\n• Coloque o telefone acima da cabeça\n• Todo o couro cabeludo deve estar visível';

  @override
  String get examplePhotoDonorTitle => 'Exemplo de Área Doadora';

  @override
  String get examplePhotoDonorInstructions =>
      '• Segure o telefone atrás da cabeça\n• A parte de trás da cabeça e o pescoço devem estar visíveis\n• Mantenha o telefone estável\n• A iluminação deve ser suficiente';

  @override
  String get camera => 'Câmera';

  @override
  String get gallery => 'Galeria';

  @override
  String get deleteForMe => 'Excluir para mim';

  @override
  String get messageDeleted => 'Mensagem excluída';

  @override
  String get deleteForEveryone => 'Excluir para todos';

  @override
  String get deleteMessage => 'Excluir mensagem';

  @override
  String get deleteMessageReadWarning =>
      'Esta mensagem foi lida pelo destinatário. Ainda deseja excluí-la?';

  @override
  String get deleteMessageConfirm =>
      'Esta mensagem será excluída para todos. Tem certeza?';

  @override
  String get messageDeletedForEveryone => 'Mensagem excluída para todos';

  @override
  String get userNotLoggedIn => 'Usuário não conectado';

  @override
  String get messagesLoadingError => 'Ocorreu um erro ao carregar as mensagens';

  @override
  String get loadingMessages => 'Carregando mensagens...';

  @override
  String get startConversation => 'Inicie uma conversa enviando uma mensagem';

  @override
  String get loadOlderMessages => 'Carregar mensagens antigas';

  @override
  String get sendPhoto => 'Enviar foto';

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
  String get needLoginForAnalysis => 'Você deve fazer login para analisar';

  @override
  String openCaptureFlowError(String error) {
    return 'Erro ao abrir tela de captura: $error';
  }

  @override
  String get sessionExpired =>
      'Sua sessão expirou. Por favor, faça login novamente.';

  @override
  String get photosAnalyzedAndSaved => 'Fotos analisadas e salvas com sucesso!';

  @override
  String get photoNotFoundForAnalysis => 'Nenhuma foto encontrada para análise';

  @override
  String get noValidPhotosFound => 'No valid photos found';

  @override
  String get analysisPreparing => 'Preparando fotos...';

  @override
  String get photosUploading => 'Carregando fotos...';

  @override
  String get errorUploadingPhotos => 'An error occurred while uploading photos';

  @override
  String get geminiChecking => 'Verificando conexão com Gemini API...';

  @override
  String get geminiFailed =>
      'Falha na conexão com Gemini API. Verifique sua conexão com a internet.';

  @override
  String get aiAnalyzing => 'Realizando análise de IA...';

  @override
  String get someAnglesNeedRetake => 'Alguns ângulos precisam ser refeitos...';

  @override
  String get analysisSaved => 'Análise salva com sucesso!';

  @override
  String get analysisCompletedSuccessfully => 'Análise concluída com sucesso!';

  @override
  String invalidAnglesCountNeedRetake(String count) {
    return '$count ângulos precisam ser refeitos...';
  }

  @override
  String get errorDuringAnalysis => 'Erro durante a análise';

  @override
  String get geminiApiError =>
      'Erro de conexão com Gemini API. Verifique sua conexão com a internet.';

  @override
  String get firebaseError => 'Erro de conexão com Firebase. Tente novamente.';

  @override
  String get photoProcessingError =>
      'Erro no processamento da foto. Tente novamente.';

  @override
  String get authErrorLoginAgain =>
      'Erro de autorização. Por favor, faça login novamente.';

  @override
  String get analysisSuccessfulTitle => 'Análise Bem-sucedida';

  @override
  String get analysisResultsTitle => 'Resultados da Análise';

  @override
  String get detailedAnalysisHeader => 'Análise Detalhada:';

  @override
  String get retakeRequiredAnglesHeader => 'Ângulos que Requerem Refazer:';

  @override
  String dialogError(String error) {
    return 'Erro ao abrir diálogo: $error';
  }

  @override
  String get baselinePhotoNotFound => 'Baseline photo not found';

  @override
  String get noPhotosToUpdate => 'No photos to update found';

  @override
  String analysisErrorDuringRetake(String error) {
    return 'Erro durante a análise: $error';
  }

  @override
  String retakeError(String error) {
    return 'Erro durante refazer: $error';
  }

  @override
  String get aiSupport => 'Suporte de IA';

  @override
  String get myPhotos => 'Minhas Fotos';

  @override
  String get photoAnalysisChatbot => 'Chatbot de Análise de Fotos';

  @override
  String get disableMedicationReminder => 'Desativar Lembrete de Medicamentos';

  @override
  String get medicationReminderDisabled =>
      'O lembrete diário de medicamentos foi desativado';

  @override
  String get medicationTime => 'Horário dos Medicamentos';

  @override
  String get selectMedicationReminderTime =>
      'Selecione o horário do seu lembrete diário de medicamentos';

  @override
  String get selectMedicationTime => 'Selecionar Horário dos Medicamentos';

  @override
  String medicationReminderSetAt(String time) {
    return 'Lembrete diário de medicamentos definido para $time';
  }

  @override
  String get noDateInfo => 'No date information';

  @override
  String get invalidDate => 'Data inválida';

  @override
  String get today => 'Hoje';

  @override
  String get yesterday => 'Ontem';

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
  String get hairTransplantTitle => 'Transplante de Cabelo';

  @override
  String get hairTransplantSectionCount => 'Seções';

  @override
  String get hairTransplantVideo => 'Vídeo';

  @override
  String get hairTransplantFreeConsultation => 'Obter Consulta Gratuita';

  @override
  String get hairTransplantWatchVideo => 'Assistir Vídeo';

  @override
  String get hairTransplantWatchVideoSubtitle =>
      'Clique para assistir no YouTube';

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
    return 'Erro durante a análise: $error';
  }

  @override
  String get myDocuments => 'Meus Documentos';

  @override
  String get loginRequiredForDocuments =>
      'Você precisa fazer login para visualizar documentos';

  @override
  String get noDocumentsYet => 'Ainda não há documentos';

  @override
  String errorOccurredWithNewLine(String error) {
    return 'Ocorreu um erro:\n$error';
  }

  @override
  String get datePending => 'Pendente';

  @override
  String get chatSupportWelcomeMessage =>
      'Olá! Sou seu assistente de IA. Como posso ajudá-lo hoje?';

  @override
  String get newChat => 'Nova Conversa';

  @override
  String get chatSupportAiAssistantName => 'Assistente de IA';

  @override
  String get historyTooltip => 'Histórico';

  @override
  String get typingIndicator => 'A IA está digitando...';

  @override
  String get chatHistoryTitle => 'Histórico de Conversas';

  @override
  String get noSavedChats => 'Nenhuma conversa salva';

  @override
  String genericErrorTryAgain(String error) {
    return 'Ocorreu um erro. Por favor, tente novamente.\nErro: $error';
  }

  @override
  String get whatsappCannotOpen =>
      'WhatsApp não pôde ser aberto. Certifique-se de que o aplicativo WhatsApp está instalado.';

  @override
  String whatsappOpenError(String error) {
    return 'Ocorreu um erro ao abrir o WhatsApp: $error';
  }

  @override
  String openCaptureScreenError(String error) {
    return 'Ocorreu um erro ao abrir a tela de captura: $error';
  }

  @override
  String get retakeAnalyzing => 'A foto refeita está sendo analisada...';

  @override
  String get autoAnalysisOn => 'Análise Automática: Ativada';

  @override
  String get autoAnalysisOff => 'Análise Automática: Desativada';

  @override
  String get clearPhotosTooltip => 'Limpar fotos';

  @override
  String get messageHintAnalyze =>
      'Digite sua mensagem ou escreva \"Analisar\"...';

  @override
  String get send => 'Enviar';

  @override
  String get aiAssistantName => 'Assistente de Análise de IA';

  @override
  String get expertTeam => 'Equipe de Especialistas';

  @override
  String get expertTeamDescription =>
      'Nossa equipe é composta por especialistas experientes em cirurgia de transplante capilar.';

  @override
  String get comingSoon => 'Em Breve';

  @override
  String get loginToSendMessage =>
      'Por favor, faça login para enviar uma mensagem';

  @override
  String get doctorEmailMissing => 'O e-mail do médico está faltando';

  @override
  String doctorNotFound(String name) {
    return 'Médico $name não encontrado';
  }

  @override
  String get messagingComingSoon => 'Recurso de mensagens em breve';

  @override
  String get years => 'anos';

  @override
  String get watchWashingVideo => 'Assistir Vídeo de Lavagem';

  @override
  String get preCareTip1Title => 'Escolha o cirurgião certo';

  @override
  String get preCareTip1Body =>
      'O procedimento Sapphire FUE requer um cirurgião experiente e uma equipe multidisciplinar. Trabalhe com médicos que expliquem suas expectativas de forma realista, planejem a operação de ponta a ponta e apliquem os protocolos Smile Hair.';

  @override
  String get preCareTip2Title => 'Compartilhe seu histórico médico';

  @override
  String get preCareTip2Body =>
      'Compartilhe suas doenças crônicas, medicamentos regulares e alergias com a equipe sem esconder. Isso minimiza os riscos que podem ocorrer durante a anestesia e a cirurgia.';

  @override
  String get preCareTip3Title => 'Anticoagulantes e processo de aprovação';

  @override
  String get preCareTip3Body =>
      'Pare de tomar aspirina ou anticoagulantes similares pelo menos uma semana antes da data da operação com a aprovação do seu médico prescritor. Você pode retomar o uso dois dias após o procedimento.';

  @override
  String get preCareTip4Title => 'Triagem de infecções';

  @override
  String get preCareTip4Body =>
      'Mantenha os resultados dos seus testes de Hepatite B/C e HIV atualizados. Clínicas sem condições adequadas de sala de cirurgia não podem realizar operações para essas infecções, para que sua viagem não seja desperdiçada.';

  @override
  String get preCareTip5Title => 'Suplementos e vitaminas';

  @override
  String get preCareTip5Body =>
      'Suplementos contendo vitaminas B e E aumentam o sangramento; pare com eles uma semana antes do procedimento. Se necessário, seu médico planejará tratamentos de suporte.';

  @override
  String get preCareTip6Title => 'Álcool e tabaco';

  @override
  String get preCareTip6Body =>
      'Pare com o álcool pelo menos uma semana antes da operação e não consuma por 14 dias após o procedimento. Fique longe do tabaco 12 horas antes e por duas semanas após a operação, pois interrompe a circulação sanguínea.';

  @override
  String get preCareTip7Title => 'Plano de bagagem e roupas';

  @override
  String get preCareTip7Body =>
      'Escolha roupas com botões ou zíper para a parte superior do corpo. Roupas com gola apertada podem danificar os enxertos. Prepare uma bolsa grande que possa carregar o kit de cuidados dado após a operação.';

  @override
  String get preCareTip8Title => 'Descanso e higiene';

  @override
  String get preCareTip8Body =>
      'Durma bem no dia da operação, tome um café da manhã nutritivo e tome banho antes de vir à clínica. O couro cabeludo limpo reduz o risco de infecção.';

  @override
  String get postCareTip1Title => 'Proteja os enxertos';

  @override
  String get postCareTip1Body =>
      'Nos primeiros 7 dias, tenha cuidado para não bater a cabeça em lugar nenhum. Durma de costas usando um travesseiro para o pescoço e evite que os enxertos esfreguem contra o travesseiro.';

  @override
  String get postCareTip2Title => 'Primeira noite e dias seguintes';

  @override
  String get postCareTip2Body =>
      'Definitivamente passe a primeira noite após a operação descansando. Se precisar sair, use um guarda-chuva que proteja do sol e da chuva.';

  @override
  String get postCareTip3Title => 'Siga o plano de medicação';

  @override
  String get postCareTip3Body =>
      'Use antibióticos, analgésicos, anti-inflamatórios e spray Pantenol exatamente como prescrito. Certifique-se de entender a prescrição e as instruções de uso antes de deixar a equipe da clínica.';

  @override
  String get postCareTip4Title => 'Hidratação e sprays';

  @override
  String get postCareTip4Body =>
      'Use apenas o spray isotônico/Pantenol dado até a primeira lavagem. Aplique creme antibiótico na área doadora nos primeiros 5-7 dias.';

  @override
  String get postCareTip5Title => 'Protocolo de lavagem';

  @override
  String get postCareTip5Body =>
      'A primeira lavagem é feita na clínica 48 horas depois. Todos os dias depois, aplique a espuma suavemente com movimentos de toque, use água morna de baixa pressão e seque com toalhas de papel.';

  @override
  String get postCareTip6Title => 'Crostas e perda por choque';

  @override
  String get postCareTip6Body =>
      'A partir do dia 10, remova as crostas com pressão leve. A perda por choque experimentada entre as semanas 2-4 é normal; novos cabelos se tornam visíveis a partir do mês 3.';

  @override
  String get postCareTip7Title => 'Atividade e esportes';

  @override
  String get postCareTip7Body =>
      'Não faça esportes nas primeiras duas semanas, você pode fazer caminhadas leves após 3-4 dias. Evite piscina, sauna e atividades que exijam suor intenso por pelo menos 1 mês.';

  @override
  String get postCareTip8Title => 'Reclamações de conforto';

  @override
  String get postCareTip8Body =>
      'Se houver queimação ou dor na área doadora, use creme contendo esteroides com aprovação da clínica. Aplique compressas frias brevemente para o inchaço.';

  @override
  String get operationDayTimeline1Title => 'Hospedagem e transfer';

  @override
  String get operationDayTimeline1Body =>
      'A equipe Smile Gentle Care organiza hospedagem em hotéis 4-5 estrelas. Todo o transporte é planejado desde a chegada ao hotel até as transferências para a clínica.';

  @override
  String get operationDayTimeline2Title => 'Suporte multilíngue';

  @override
  String get operationDayTimeline2Body =>
      'Tradutores profissionais são fornecidos para pacientes de diferentes países ao redor do mundo. Você é informado em seu próprio idioma em cada etapa do processo.';

  @override
  String get operationDayTimeline3Title => 'Preparação pré-operatória';

  @override
  String get operationDayTimeline3Body =>
      'Formulários de informação são assinados, sua linha do cabelo é desenhada, fotos são tiradas e testes de HIV/HBV/HCV e sinais vitais são verificados.';

  @override
  String get operationDayTimeline4Title => 'Fluxo da operação';

  @override
  String get operationDayTimeline4Body =>
      'Etapas do procedimento de 6-8 horas: planejamento, coleta de enxertos, abertura de canais e implantação. Seus médicos compartilham todo o processo com você.';

  @override
  String get operationDayTimeline5Title => 'Almoço e preferências especiais';

  @override
  String get operationDayTimeline5Body =>
      'Menus vegetarianos, halal ou kosher são preparados sob solicitação. Opções de TV inteligente e música estão disponíveis nas áreas de operação.';

  @override
  String get operationDayTimeline6Title => 'Cuidado no dia seguinte';

  @override
  String get operationDayTimeline6Body =>
      'Você vem à clínica para troca de curativo, verificação de feridas e treinamento da primeira lavagem. Depois, o processo é monitorado com rastreamento fotográfico digital.';

  @override
  String get sterilizationMeasure1 =>
      'Testes diários de vazamento de vácuo são realizados para verificar a integridade da vedação dos esterilizadores.';

  @override
  String get sterilizationMeasure2 =>
      'Verificação diária é feita com o teste Bowie-Dick para garantir que o vapor atinja todas as superfícies igualmente.';

  @override
  String get sterilizationMeasure3 =>
      'Testes de lavagem ultrassônica documentam que limpamos micro resíduos.';

  @override
  String get sterilizationMeasure4 =>
      'Testes de indicadores biológicos são realizados a cada 15 dias e é relatado que não há reprodução.';

  @override
  String get sterilizationMeasure5 =>
      'Instrumentos estéreis e usados são armazenados separadamente em caixas trancadas; contaminação cruzada é prevenida.';

  @override
  String get sterilizationMeasure6 =>
      'Cada conjunto é rastreado com etiquetas de número de autoclave, data e data de validade.';

  @override
  String get sterilizationMeasure7 =>
      'Todos os processos são realizados de acordo com o Guia DAS do Ministério da Saúde, padrões da OMS e AAMI ST79.';

  @override
  String get washStep1 =>
      'Não lave seu cabelo nas primeiras 36-48 horas após a operação; aguarde a primeira lavagem que será feita na clínica.';

  @override
  String get washStep2 =>
      'Aplique loção ou espuma tanto na área doadora quanto na receptora com as pontas dos dedos em movimentos de toque.';

  @override
  String get washStep3 =>
      'Faça espuma do shampoo e espalhe suavemente na área transplantada com toques verticais; evite movimentos circulares.';

  @override
  String get washStep4 =>
      'Use água morna de baixa pressão. Nos primeiros 14 dias, é mais seguro derramar água com uma tigela em vez de um chuveiro.';

  @override
  String get washStep5 =>
      'Seque a área do enxerto pressionando suavemente com toalhas de papel, você pode secar a área doadora com uma toalha normal.';

  @override
  String get washStep6 =>
      'Se precisar usar um secador de cabelo, use apenas no modo frio e à distância.';

  @override
  String get faq1Question => 'Quanto tempo leva a recuperação?';

  @override
  String get faq1Answer =>
      'As primeiras duas semanas são um período sensível; o cabelo passa por diferentes estágios por 6-12 meses. Resultados significativos são vistos no mês 6, densidade final nos meses 12-18.';

  @override
  String get faq2Question => 'Como devem ser a bandagem e o horário de sono?';

  @override
  String get faq2Answer =>
      'Bandagem elástica pode ser aplicada para reduzir o inchaço na área da testa. Durma de costas com um travesseiro para o pescoço em posição ligeiramente elevada nos primeiros 7-10 dias.';

  @override
  String get faq3Question => 'Banho, lavagem e uso de produtos';

  @override
  String get faq3Answer =>
      'Não molhe seu cabelo nos primeiros dois dias. Após 48 horas, lave uma vez por dia com shampoo médico após a primeira lavagem na clínica; mantenha o tempo de banho curto, reduza o vapor.';

  @override
  String get faq4Question =>
      'Quando posso secar, pentear ou tingir meu cabelo?';

  @override
  String get faq4Answer =>
      'Apenas secagem natural é recomendada no primeiro mês. Você pode pentear a área doadora, mas não toque na área de transplante por 2 semanas. Fique longe de tinturas químicas por 6-8 semanas.';

  @override
  String get faq5Question => 'Tabaco, álcool e exercício';

  @override
  String get faq5Answer =>
      'Fumar é proibido 12 horas antes e 2 semanas após a operação. O álcool não deve ser usado nos primeiros 14 dias. Caminhadas leves são permitidas após o dia 4, aguarde 1 mês para esportes pesados.';

  @override
  String get faq6Question => 'Chapéu, sol, viagem e retorno ao trabalho';

  @override
  String get faq6Answer =>
      'Não use chapéu nos primeiros 10 dias ou prefira modelos muito soltos. Evite o sol direto. Você pode retornar ao trabalho de escritório em 3-5 dias; aguarde 2 semanas para trabalho físico. Você pode viajar, mas proteja os enxertos.';

  @override
  String get heroCardSubtitle1 =>
      'A equipe Smile Hair gerencia todo o processo para você, desde a avaliação pré-operatória até o planejamento da viagem.';

  @override
  String get heroCardSubtitle2 =>
      'Experimente uma experiência confortável com transferências, suporte de tradutor e salas de cirurgia estéreis.';

  @override
  String get heroCardSubtitle3 =>
      'Proteja os enxertos com segurança com o uso planejado de medicamentos, lavagem adequada e restrições de movimento.';

  @override
  String get heroCardSubtitle4 =>
      'Rastreie todo o processo com perguntas frequentes, imagens e guias digitais.';

  @override
  String get imageBannerCaption1 =>
      'Aplique cuidados suaves com os shampoos e loções dados a você desde a primeira lavagem.';

  @override
  String get clinicAddress =>
      'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey';

  @override
  String get emailSubject => 'Smile Hair Clinic Contact';
}
