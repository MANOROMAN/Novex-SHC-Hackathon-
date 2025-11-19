import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('es'),
    Locale('fr'),
    Locale('he'),
    Locale('it'),
    Locale('en'),
    Locale('pt'),
    Locale('ru'),
    Locale('sq'),
    Locale('tr')
  ];

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic'**
  String get appName;

  /// Edit profile screen title
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Save button text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Cancel button in appointment cancellation
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Change profile photo button
  ///
  /// In en, this message translates to:
  /// **'Change Photo'**
  String get changePhoto;

  /// Patient ID label
  ///
  /// In en, this message translates to:
  /// **'Patient ID'**
  String get patientId;

  /// Full name field label
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Phone field label
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Address field label
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Date of birth field label
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birthDate;

  /// Gender field label
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// Emergency contact field label
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get emergencyContact;

  /// Save changes button
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// Validation error for empty name
  ///
  /// In en, this message translates to:
  /// **'Full name cannot be empty'**
  String get nameRequired;

  /// Validation error for invalid email
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get emailInvalid;

  /// Validation error for empty phone
  ///
  /// In en, this message translates to:
  /// **'Phone number cannot be empty'**
  String get phoneRequired;

  /// Validation error for empty address
  ///
  /// In en, this message translates to:
  /// **'Address cannot be empty'**
  String get addressRequired;

  /// Validation error for empty birth date
  ///
  /// In en, this message translates to:
  /// **'Please select date of birth'**
  String get birthDateRequired;

  /// Success message after profile update
  ///
  /// In en, this message translates to:
  /// **'Profile information updated successfully'**
  String get profileUpdatedSuccessfully;

  /// Male gender
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// Gender option: Female
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// Gender option: Prefer not to say
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get preferNotToSay;

  /// Current password field
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// New password field
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Confirm new password field
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// Change button
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// Password mismatch error
  ///
  /// In en, this message translates to:
  /// **'New passwords do not match'**
  String get passwordsDoNotMatch;

  /// Password length validation
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// Success message after password change
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccessfully;

  /// Validation error for empty current password
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password'**
  String get currentPasswordRequired;

  /// Validation error for empty new password
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password'**
  String get newPasswordRequired;

  /// Message for upcoming photo change feature
  ///
  /// In en, this message translates to:
  /// **'Photo change feature coming soon'**
  String get photoChangeFeatureComingSoon;

  /// Description label in about dialog
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// App version with parameter
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(String version);

  /// Subtitle for notifications settings
  ///
  /// In en, this message translates to:
  /// **'View and manage notifications'**
  String get viewAndManageNotifications;

  /// Error message when privacy policy cannot be opened
  ///
  /// In en, this message translates to:
  /// **'Privacy policy page could not be opened. Please check your internet connection.'**
  String get privacyPolicyError;

  /// Error message when terms of service cannot be opened
  ///
  /// In en, this message translates to:
  /// **'Terms of service page could not be opened. Please check your internet connection.'**
  String get termsOfServiceError;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'An error occurred: {error}'**
  String anErrorOccurred(String error);

  /// About dialog app description
  ///
  /// In en, this message translates to:
  /// **'A modern mobile application designed for hair transplant and care services. You can analyze by taking your own photos, track your treatment process and contact the clinic.'**
  String get appDescription;

  /// About dialog copyright text
  ///
  /// In en, this message translates to:
  /// **'© 2024 Hair Clinic. All rights reserved.'**
  String get appCopyright;

  /// Emergency contact field hint
  ///
  /// In en, this message translates to:
  /// **'Name - Phone'**
  String get emergencyContactHint;

  /// Appointment details modal title
  ///
  /// In en, this message translates to:
  /// **'Appointment Details'**
  String get appointmentDetails;

  /// Date label in appointment details
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateLabel;

  /// Time field label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeLabel;

  /// Doctor label in appointment details
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctorLabel;

  /// Appointment type label in appointment details
  ///
  /// In en, this message translates to:
  /// **'Appointment Type'**
  String get appointmentTypeLabel;

  /// Location label in appointment details
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// Phone label in appointment details
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneLabel;

  /// Follow-up consultation appointment type
  ///
  /// In en, this message translates to:
  /// **'Follow-up Consultation'**
  String get followUpConsultation;

  /// Cancel appointment title
  ///
  /// In en, this message translates to:
  /// **'Cancel Appointment'**
  String get cancelAppointment;

  /// Add reminder button
  ///
  /// In en, this message translates to:
  /// **'Add Reminder'**
  String get addReminder;

  /// Success message when appointment reminder is set
  ///
  /// In en, this message translates to:
  /// **'Appointment reminder has been set'**
  String get appointmentReminderSet;

  /// Camera permission error message
  ///
  /// In en, this message translates to:
  /// **'We cannot continue without camera permission. Please grant permission from settings.'**
  String get cameraPermissionRequired;

  /// Sensor permission error message
  ///
  /// In en, this message translates to:
  /// **'Motion sensor permission is required for top and back angle shots.'**
  String get sensorPermissionRequired;

  /// Recovery progress label
  ///
  /// In en, this message translates to:
  /// **'Recovery Progress'**
  String get recoveryProgress;

  /// Day count display
  ///
  /// In en, this message translates to:
  /// **'Day {current} of {total}'**
  String dayOfTotal(String current, String total);

  /// Week and healing phase display
  ///
  /// In en, this message translates to:
  /// **'Week {week}: Healing Phase'**
  String weekNumberHealingPhase(String week);

  /// Today's care routine title
  ///
  /// In en, this message translates to:
  /// **'Today\'s Care Routine'**
  String get todaysCareRoutine;

  /// Morning medication task
  ///
  /// In en, this message translates to:
  /// **'Take medication (Morning)'**
  String get takeMedicationMorning;

  /// Topical solution task
  ///
  /// In en, this message translates to:
  /// **'Apply topical solution'**
  String get applyTopicalSolution;

  /// Evening medication task
  ///
  /// In en, this message translates to:
  /// **'Take medication (Evening)'**
  String get takeMedicationEvening;

  /// Upcoming appointment label
  ///
  /// In en, this message translates to:
  /// **'Upcoming Appointment'**
  String get upcomingAppointment;

  /// Description for next appointment
  ///
  /// In en, this message translates to:
  /// **'Your next follow-up consultation.'**
  String get nextFollowUpConsultation;

  /// Button to view details
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// Notifications button/title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Appointment reminder notification type
  ///
  /// In en, this message translates to:
  /// **'Appointment Reminder'**
  String get appointmentReminder;

  /// Appointment reminder message
  ///
  /// In en, this message translates to:
  /// **'You have an appointment tomorrow at {time}'**
  String appointmentReminderMessage(String time);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours ago'**
  String hoursAgo(Object hours);

  /// Medication reminder notification type
  ///
  /// In en, this message translates to:
  /// **'Medication Reminder'**
  String get medicationReminder;

  /// Morning medication reminder message
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to take your morning medication'**
  String get morningMedicationReminder;

  /// Photo reminder notification type
  ///
  /// In en, this message translates to:
  /// **'Photo Reminder'**
  String get photoReminder;

  /// Weekly progress photo reminder message
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to take your weekly progress photo'**
  String get weeklyProgressPhotoReminder;

  /// Days ago display
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String daysAgo(String days);

  /// Weeks ago display
  ///
  /// In en, this message translates to:
  /// **'{weeks} weeks ago'**
  String weeksAgo(String weeks);

  /// Months ago display
  ///
  /// In en, this message translates to:
  /// **'{months} months ago'**
  String monthsAgo(String months);

  /// Years ago display
  ///
  /// In en, this message translates to:
  /// **'{years} years ago'**
  String yearsAgo(String years);

  /// Notification opened message
  ///
  /// In en, this message translates to:
  /// **'{title} notification opened'**
  String notificationOpened(String title);

  /// Appointment cancellation dialog title
  ///
  /// In en, this message translates to:
  /// **'Appointment Cancellation'**
  String get appointmentCancellation;

  /// Appointment cancellation confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this appointment? This action cannot be undone.'**
  String get cancelAppointmentConfirmation;

  /// Success message after appointment cancellation
  ///
  /// In en, this message translates to:
  /// **'Appointment cancelled successfully'**
  String get appointmentCancelledSuccessfully;

  /// Every day display for notification schedule
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get everyDay;

  /// Weekends display for notification schedule
  ///
  /// In en, this message translates to:
  /// **'Weekends'**
  String get weekends;

  /// Weekdays display for notification schedule
  ///
  /// In en, this message translates to:
  /// **'Weekdays'**
  String get weekdays;

  /// Monday short name
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mondayShort;

  /// Tuesday short name
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesdayShort;

  /// Wednesday short name
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesdayShort;

  /// Thursday short name
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursdayShort;

  /// Friday short name
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fridayShort;

  /// Saturday short name
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturdayShort;

  /// Sunday short name
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sundayShort;

  /// Validation error for empty title
  ///
  /// In en, this message translates to:
  /// **'Title cannot be empty'**
  String get titleCannotBeEmpty;

  /// Validation error for empty message
  ///
  /// In en, this message translates to:
  /// **'Message cannot be empty'**
  String get messageCannotBeEmpty;

  /// Validation error for invalid email
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterValidEmail;

  /// Validation error for no day selected
  ///
  /// In en, this message translates to:
  /// **'Please select at least one day'**
  String get selectAtLeastOneDay;

  /// Success message when daily email is scheduled
  ///
  /// In en, this message translates to:
  /// **'Daily email has been scheduled'**
  String get dailyEmailScheduled;

  /// Delete task confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the task \"{title}\"?'**
  String deleteTaskConfirmation(String title);

  /// Success message when task is deleted
  ///
  /// In en, this message translates to:
  /// **'Task deleted'**
  String get taskDeleted;

  /// Delete task button
  ///
  /// In en, this message translates to:
  /// **'Delete Task'**
  String get deleteTask;

  /// New scheduled email button/title
  ///
  /// In en, this message translates to:
  /// **'New Scheduled Email'**
  String get newScheduledEmail;

  /// Subtitle for scheduled emails screen
  ///
  /// In en, this message translates to:
  /// **'Create daily email tasks'**
  String get createDailyEmailTasks;

  /// Title field label
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// Message field label
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get messageLabel;

  /// Recipient name field label
  ///
  /// In en, this message translates to:
  /// **'Recipient Name'**
  String get recipientNameLabel;

  /// Delete button
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Days label for scheduling
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get daysLabel;

  /// Clinic name
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic'**
  String get clinicName;

  /// Short clinic description
  ///
  /// In en, this message translates to:
  /// **'One of Turkey\'s leading clinics in Istanbul, specializing in hair transplantation.'**
  String get clinicShortDescription;

  /// About clinic description
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic is one of Turkey\'s leading clinics in Istanbul, specializing in hair transplantation. Led by internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.'**
  String get clinicAboutDescription;

  /// Second paragraph of about clinic description
  ///
  /// In en, this message translates to:
  /// **'All operational processes are personally followed by doctors, and every team member consists of professionals with medical training. To date, successful hair transplantation procedures have been performed on numerous patients from all around the world.'**
  String get clinicAboutDescription2;

  /// Clinic ethics description
  ///
  /// In en, this message translates to:
  /// **'As Smile Hair Clinic, we serve in accordance with our principles of respect for patient rights, transparency, honesty, and professionalism. We act in compliance with ethical rules in all treatment processes, protect patient confidentiality, and aim to provide the highest quality service.'**
  String get clinicEthicsDescription;

  /// Clinic press description
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic has been featured in various media outlets for its successful results and patient satisfaction. It has presented at international hair transplantation conferences and has been a pioneer in the field.'**
  String get clinicPressDescription;

  /// Media outlets section title
  ///
  /// In en, this message translates to:
  /// **'Media Outlets We\'ve Been Featured In:'**
  String get mediaOutlets;

  /// Founding partner description
  ///
  /// In en, this message translates to:
  /// **'is a founding partner of Smile Hair Clinic.'**
  String get clinicFoundingPartner;

  /// Team member description
  ///
  /// In en, this message translates to:
  /// **'works at Smile Hair Clinic.'**
  String get clinicTeamMember;

  /// Experienced doctor description
  ///
  /// In en, this message translates to:
  /// **'is an experienced physician working at Smile Hair Clinic, prioritizing patient satisfaction.'**
  String get clinicExperiencedDoctor;

  /// View FAQ page button text
  ///
  /// In en, this message translates to:
  /// **'View FAQ Page'**
  String get viewFaqPage;

  /// Default clinic location
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic, Istanbul'**
  String get clinicDefaultLocation;

  /// Chat welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome! How can we help you today? Our team usually responds within an hour.'**
  String get chatWelcomeMessage;

  /// Sample chat message
  ///
  /// In en, this message translates to:
  /// **'Hello, I would like to ask about my treatment plan.'**
  String get chatSampleMessage;

  /// Camera not found error message with type
  ///
  /// In en, this message translates to:
  /// **'Camera not found on device: {type}'**
  String cameraNotFoundWithType(String type);

  /// Front camera type
  ///
  /// In en, this message translates to:
  /// **'front'**
  String get frontCamera;

  /// Back camera type
  ///
  /// In en, this message translates to:
  /// **'back'**
  String get backCamera;

  /// Sample patient name
  ///
  /// In en, this message translates to:
  /// **'James Peterson'**
  String get patientNameSample;

  /// Timeline view label
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timelineView;

  /// Timeline item description for improvement
  ///
  /// In en, this message translates to:
  /// **'Visible improvement in density across the crown. Patient reports high satisfaction.'**
  String get visibleImprovementDescription;

  /// Procedure details text
  ///
  /// In en, this message translates to:
  /// **'Type: FUE Restoration\nGrafts: 2,450'**
  String get procedureDetails;

  /// Scheduled emails screen title
  ///
  /// In en, this message translates to:
  /// **'Scheduled Emails'**
  String get scheduledEmails;

  /// No scheduled emails empty state
  ///
  /// In en, this message translates to:
  /// **'No scheduled emails'**
  String get noScheduledEmails;

  /// Sample appointment date
  ///
  /// In en, this message translates to:
  /// **'Tue, Nov 9, 10:30 AM'**
  String get sampleAppointmentDate;

  /// Sample appointment date full format
  ///
  /// In en, this message translates to:
  /// **'Tuesday, November 9, 2023'**
  String get sampleAppointmentDateFull;

  /// Sample doctor name
  ///
  /// In en, this message translates to:
  /// **'Dr. Ahmet Yılmaz'**
  String get sampleDoctorName;

  /// Sample phone number
  ///
  /// In en, this message translates to:
  /// **'+90 (212) 555 0123'**
  String get samplePhoneNumber;

  /// Sample patient name
  ///
  /// In en, this message translates to:
  /// **'David'**
  String get samplePatientName;

  /// Sample city and country
  ///
  /// In en, this message translates to:
  /// **'Istanbul, Turkey'**
  String get sampleCityCountry;

  /// Sample emergency contact
  ///
  /// In en, this message translates to:
  /// **'Ahmet Yılmaz - +90 555 987 6543'**
  String get sampleEmergencyContact;

  /// Welcome screen title
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic'**
  String get welcomeTitle;

  /// Welcome screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Hair Restoration & Care'**
  String get welcomeSubtitle;

  /// Login button on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get welcomeLogin;

  /// Register button on welcome screen
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get welcomeRegister;

  /// Login screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginTitle;

  /// Login screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get loginSubtitle;

  /// Email field label on login
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmail;

  /// Email field hint on login
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get loginEmailHint;

  /// Password field label on login
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPassword;

  /// Password field hint on login
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordHint;

  /// Forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get loginForgotPassword;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginLoginButton;

  /// Or separator on login
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get loginOr;

  /// Google login button
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginGoogleLogin;

  /// Prompt shown to users without an account on the login screen
  ///
  /// In en, this message translates to:
  /// **'Need an account?'**
  String get loginNeedAccount;

  /// Forgot password screen title
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get forgotPasswordTitle;

  /// Forgot password screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email and we will send a link to reset your password.'**
  String get forgotPasswordSubtitle;

  /// Forgot password button text
  ///
  /// In en, this message translates to:
  /// **'Send reset email'**
  String get forgotPasswordSendButton;

  /// Message after successfully sending forgot password email
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent. Please check your inbox.'**
  String get forgotPasswordEmailSent;

  /// Registration screen title
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get registrationTitle;

  /// Registration screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get registrationSubtitle;

  /// Name field label on registration
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get registrationName;

  /// Name field hint on registration
  ///
  /// In en, this message translates to:
  /// **'Enter your first and last name'**
  String get registrationNameHint;

  /// Email field label on registration
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registrationEmail;

  /// Email field hint on registration
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get registrationEmailHint;

  /// Password field label on registration
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registrationPassword;

  /// Password field hint on registration
  ///
  /// In en, this message translates to:
  /// **'Create your password'**
  String get registrationPasswordHint;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get registrationConfirmPassword;

  /// Confirm password field hint
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get registrationConfirmPasswordHint;

  /// Terms acceptance text
  ///
  /// In en, this message translates to:
  /// **'I accept the Terms of Use and Privacy Policy.'**
  String get registrationTerms;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registrationRegisterButton;

  /// Already have account text
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get registrationAlreadyHaveAccount;

  /// Login link text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get registrationLoginLink;

  /// Dashboard greeting with name parameter
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String dashboardHelloParam(String name);

  /// Home navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get dashboardHome;

  /// ChatBot navigation item
  ///
  /// In en, this message translates to:
  /// **'ChatBot'**
  String get dashboardChatbot;

  /// Analysis navigation item
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get dashboardAnalysis;

  /// Quick action label to open appointments
  ///
  /// In en, this message translates to:
  /// **'My Appointments'**
  String get dashboardMyAppointments;

  /// Resources navigation item
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get dashboardResources;

  /// Care guide resource
  ///
  /// In en, this message translates to:
  /// **'Care Guide'**
  String get dashboardCareGuide;

  /// Care guide subtitle
  ///
  /// In en, this message translates to:
  /// **'Post-transplant care instructions'**
  String get dashboardCareGuideSubtitle;

  /// Fallback display name when user profile has no name
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get dashboardDefaultUserName;

  /// Hair transplant resource card title
  ///
  /// In en, this message translates to:
  /// **'Hair Transplant'**
  String get dashboardHairTransplantTitle;

  /// Hair transplant resource card subtitle
  ///
  /// In en, this message translates to:
  /// **'Explore every transplant technique'**
  String get dashboardHairTransplantSubtitle;

  /// Online consultation resource card title
  ///
  /// In en, this message translates to:
  /// **'Online Consultation'**
  String get dashboardOnlineConsultationTitle;

  /// Online consultation resource card subtitle
  ///
  /// In en, this message translates to:
  /// **'Get free expert advice'**
  String get dashboardOnlineConsultationSubtitle;

  /// Doctors resource card title
  ///
  /// In en, this message translates to:
  /// **'Our Doctors'**
  String get dashboardDoctorsTitle;

  /// Doctors resource card subtitle
  ///
  /// In en, this message translates to:
  /// **'Meet our specialist surgeons'**
  String get dashboardDoctorsSubtitle;

  /// About us resource card title
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get dashboardAboutUsTitle;

  /// About us resource card subtitle
  ///
  /// In en, this message translates to:
  /// **'Learn about our clinic'**
  String get dashboardAboutUsSubtitle;

  /// Contact resource card title
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get dashboardContactTitle;

  /// Contact resource card subtitle
  ///
  /// In en, this message translates to:
  /// **'Get in touch with us'**
  String get dashboardContactSubtitle;

  /// Progress tracking resource
  ///
  /// In en, this message translates to:
  /// **'Progress Tracking'**
  String get dashboardProgressTracking;

  /// Progress tracking subtitle
  ///
  /// In en, this message translates to:
  /// **'Track your treatment progress'**
  String get dashboardProgressTrackingSubtitle;

  /// Past analyses subtitle
  ///
  /// In en, this message translates to:
  /// **'Your previous photo analyses'**
  String get dashboardPastAnalysesSubtitle;

  /// Settings profile section
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// Settings preferences section
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get settingsPreferences;

  /// Language setting
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// Language setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get settingsLanguageSubtitle;

  /// Dark mode setting
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkMode;

  /// Dark mode setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Enable dark theme'**
  String get settingsDarkModeSubtitle;

  /// Notifications setting
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// Notifications setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Enable all notifications'**
  String get settingsNotificationsSubtitle;

  /// Email notifications setting
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get settingsEmailNotifications;

  /// Email notifications subtitle
  ///
  /// In en, this message translates to:
  /// **'Receive notifications via email'**
  String get settingsEmailNotificationsSubtitle;

  /// Push notifications setting
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get settingsPushNotifications;

  /// Push notifications subtitle
  ///
  /// In en, this message translates to:
  /// **'Receive push notifications'**
  String get settingsPushNotificationsSubtitle;

  /// Settings account section
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// Change password setting
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePassword;

  /// Change password subtitle
  ///
  /// In en, this message translates to:
  /// **'Update your password'**
  String get settingsChangePasswordSubtitle;

  /// Privacy policy setting
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// Privacy policy subtitle
  ///
  /// In en, this message translates to:
  /// **'Read our privacy policy'**
  String get settingsPrivacyPolicySubtitle;

  /// Terms of service setting
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get settingsTermsOfService;

  /// Terms of service subtitle
  ///
  /// In en, this message translates to:
  /// **'Read our terms of service'**
  String get settingsTermsOfServiceSubtitle;

  /// Settings support section
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get settingsSupport;

  /// Help and support setting
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settingsHelpSupport;

  /// Help and support subtitle
  ///
  /// In en, this message translates to:
  /// **'Get help and contact support'**
  String get settingsHelpSupportSubtitle;

  /// Placeholder when phone number is empty
  ///
  /// In en, this message translates to:
  /// **'Add phone number'**
  String get settingsAddPhone;

  /// Theme mode tile title
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get settingsThemeMode;

  /// Theme mode description for system
  ///
  /// In en, this message translates to:
  /// **'Follow system settings'**
  String get settingsThemeDescriptionSystem;

  /// Theme mode description for light
  ///
  /// In en, this message translates to:
  /// **'Light theme'**
  String get settingsThemeDescriptionLight;

  /// Theme mode description for dark
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get settingsThemeDescriptionDark;

  /// Theme selector dialog title
  ///
  /// In en, this message translates to:
  /// **'Choose Theme Mode'**
  String get settingsThemeDialogTitle;

  /// Theme selector option: system
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeOptionSystem;

  /// Theme selector option subtitle: system
  ///
  /// In en, this message translates to:
  /// **'Match device settings'**
  String get settingsThemeOptionSystemSubtitle;

  /// Theme selector option: light
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeOptionLight;

  /// Theme selector option subtitle: light
  ///
  /// In en, this message translates to:
  /// **'Bright color theme'**
  String get settingsThemeOptionLightSubtitle;

  /// Theme selector option: dark
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeOptionDark;

  /// Theme selector option subtitle: dark
  ///
  /// In en, this message translates to:
  /// **'Dim color theme'**
  String get settingsThemeOptionDarkSubtitle;

  /// KVKK form card title
  ///
  /// In en, this message translates to:
  /// **'KVKK Application Form'**
  String get settingsKvkkFormTitle;

  /// KVKK form card subtitle
  ///
  /// In en, this message translates to:
  /// **'Submit a request about your personal data'**
  String get settingsKvkkFormSubtitle;

  /// GDPR form card title
  ///
  /// In en, this message translates to:
  /// **'GDPR Contact Form'**
  String get settingsGdprFormTitle;

  /// GDPR form card subtitle
  ///
  /// In en, this message translates to:
  /// **'Information notice for KVKK and GDPR'**
  String get settingsGdprFormSubtitle;

  /// Records section title
  ///
  /// In en, this message translates to:
  /// **'My Records'**
  String get settingsRecordsTitle;

  /// Treatment history card title
  ///
  /// In en, this message translates to:
  /// **'Treatment History'**
  String get settingsTreatmentHistoryTitle;

  /// Treatment history card subtitle
  ///
  /// In en, this message translates to:
  /// **'View your appointments and surgery records'**
  String get settingsTreatmentHistorySubtitle;

  /// Documents card title
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get settingsDocumentsTitle;

  /// Documents card subtitle
  ///
  /// In en, this message translates to:
  /// **'Reports, prescriptions and shared files'**
  String get settingsDocumentsSubtitle;

  /// Invoices card title
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get settingsInvoicesTitle;

  /// Invoices card subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage your payments and invoices'**
  String get settingsInvoicesSubtitle;

  /// Support center card subtitle
  ///
  /// In en, this message translates to:
  /// **'24/7 support and contact channels'**
  String get settingsSupportCenterSubtitle;

  /// Contact card title
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get settingsContactTitle;

  /// Contact card subtitle
  ///
  /// In en, this message translates to:
  /// **'Address, phone and contact options'**
  String get settingsContactSubtitle;

  /// Message when user must log in before changing profile photo
  ///
  /// In en, this message translates to:
  /// **'Please sign in to change your profile photo.'**
  String get settingsProfileLoginRequired;

  /// Profile photo updated confirmation
  ///
  /// In en, this message translates to:
  /// **'Your profile photo has been updated.'**
  String get settingsProfilePhotoUpdated;

  /// Profile photo update error message
  ///
  /// In en, this message translates to:
  /// **'Error while updating the photo: {error}'**
  String settingsProfilePhotoUpdateError(String error);

  /// Support center screen title
  ///
  /// In en, this message translates to:
  /// **'Support Center'**
  String get supportCenterTitle;

  /// Support center hero heading
  ///
  /// In en, this message translates to:
  /// **'Here for you 24/7'**
  String get supportCenterHeroTitle;

  /// Support center hero description
  ///
  /// In en, this message translates to:
  /// **'The Smile Hair Clinic support team is with you at every step of your treatment journey.'**
  String get supportCenterHeroDescription;

  /// Quick contact section title
  ///
  /// In en, this message translates to:
  /// **'Quick Contact'**
  String get supportCenterQuickContact;

  /// WhatsApp action title
  ///
  /// In en, this message translates to:
  /// **'Chat via WhatsApp'**
  String get supportCenterWhatsappTitle;

  /// WhatsApp action subtitle
  ///
  /// In en, this message translates to:
  /// **'Talk to our live support team instantly'**
  String get supportCenterWhatsappSubtitle;

  /// Call action title
  ///
  /// In en, this message translates to:
  /// **'Call us'**
  String get supportCenterCallTitle;

  /// Email action title
  ///
  /// In en, this message translates to:
  /// **'Send us an email'**
  String get supportCenterEmailTitle;

  /// Knowledge center section title
  ///
  /// In en, this message translates to:
  /// **'Knowledge Center'**
  String get supportCenterKnowledgeBase;

  /// FAQ link subtitle
  ///
  /// In en, this message translates to:
  /// **'Questions before and after the operation'**
  String get supportCenterFaqSubtitle;

  /// Knowledge base link title
  ///
  /// In en, this message translates to:
  /// **'Knowledge Base'**
  String get supportCenterKnowledgeBaseTitle;

  /// Knowledge base link subtitle
  ///
  /// In en, this message translates to:
  /// **'All of our hair transplant articles'**
  String get supportCenterKnowledgeBaseSubtitle;

  /// Appointment support link title
  ///
  /// In en, this message translates to:
  /// **'Appointment & Treatment Support'**
  String get supportCenterAppointmentSupportTitle;

  /// Appointment support link subtitle
  ///
  /// In en, this message translates to:
  /// **'Get information about your treatment plan'**
  String get supportCenterAppointmentSupportSubtitle;

  /// Message section title
  ///
  /// In en, this message translates to:
  /// **'Send us a message'**
  String get supportCenterMessageSectionTitle;

  /// Message field label
  ///
  /// In en, this message translates to:
  /// **'Your message'**
  String get supportCenterMessageLabel;

  /// Message hint text
  ///
  /// In en, this message translates to:
  /// **'Write your question or request...'**
  String get supportCenterMessageHint;

  /// Empty message validation error
  ///
  /// In en, this message translates to:
  /// **'Please write a message'**
  String get supportCenterMessageEmpty;

  /// Message sent confirmation
  ///
  /// In en, this message translates to:
  /// **'We received your message. We will get back to you shortly.'**
  String get supportCenterMessageSuccess;

  /// Send button label
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get supportCenterSendButton;

  /// Treatment history screen title
  ///
  /// In en, this message translates to:
  /// **'Treatment History'**
  String get treatmentHistoryTitle;

  /// Message shown when user must log in
  ///
  /// In en, this message translates to:
  /// **'You need to sign in to view this feature.'**
  String get treatmentHistoryLoginRequired;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any recorded treatment history yet.'**
  String get treatmentHistoryEmpty;

  /// Placeholder when appointment date missing
  ///
  /// In en, this message translates to:
  /// **'Date pending'**
  String get treatmentHistoryDatePending;

  /// Default appointment type text
  ///
  /// In en, this message translates to:
  /// **'Check-up'**
  String get treatmentHistoryDefaultType;

  /// Placeholder when doctor is not assigned
  ///
  /// In en, this message translates to:
  /// **'To be assigned'**
  String get treatmentHistoryDoctorPending;

  /// Status label completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get treatmentHistoryStatusCompleted;

  /// Status label cancelled
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get treatmentHistoryStatusCancelled;

  /// Status label in progress
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get treatmentHistoryStatusInProgress;

  /// Status label scheduled
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get treatmentHistoryStatusScheduled;

  /// About setting
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// About subtitle
  ///
  /// In en, this message translates to:
  /// **'App version and information'**
  String get settingsAboutSubtitle;

  /// Logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsLogout;

  /// Clinic profile title
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic'**
  String get clinicProfileTitle;

  /// Clinic premium restoration text
  ///
  /// In en, this message translates to:
  /// **'Premium Hair Restoration'**
  String get clinicProfilePremiumRestoration;

  /// About tab
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get clinicProfileAbout;

  /// Doctors tab
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get clinicProfileDoctors;

  /// Gallery tab
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get clinicProfileGallery;

  /// Treatments tab
  ///
  /// In en, this message translates to:
  /// **'Treatments'**
  String get clinicProfileTreatments;

  /// Book consultation button
  ///
  /// In en, this message translates to:
  /// **'Book Consultation'**
  String get clinicProfileBookConsultation;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get clinicProfileAboutTitle;

  /// Ethics section title
  ///
  /// In en, this message translates to:
  /// **'Our Ethics'**
  String get clinicProfileEthicsTitle;

  /// Press section title
  ///
  /// In en, this message translates to:
  /// **'In the Press'**
  String get clinicProfilePressTitle;

  /// Contact section title
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get clinicProfileContactTitle;

  /// Doctors section title
  ///
  /// In en, this message translates to:
  /// **'Our Doctors'**
  String get clinicProfileDoctorsTitle;

  /// Gallery section title
  ///
  /// In en, this message translates to:
  /// **'Results Gallery'**
  String get clinicProfileGalleryTitle;

  /// Hair surgeon specialty
  ///
  /// In en, this message translates to:
  /// **'Hair Surgeon'**
  String get clinicProfileHairSurgeon;

  /// Past analyses screen title
  ///
  /// In en, this message translates to:
  /// **'Past Analyses'**
  String get pastAnalysesTitle;

  /// FAQ screen title
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqTitle;

  /// FAQ screen subtitle
  ///
  /// In en, this message translates to:
  /// **'For your questions'**
  String get faqSubtitle;

  /// Splash screen tagline
  ///
  /// In en, this message translates to:
  /// **'Hair Transplant and Aesthetic Specialist'**
  String get splashTagline;

  /// Capture flow screen title
  ///
  /// In en, this message translates to:
  /// **'Self Capture'**
  String get captureFlowTitle;

  /// Capture flow screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Automatic capture from 5 critical angles for hair and scalp.\nMake sure you are in a well-lit environment before starting.'**
  String get captureFlowSubtitle;

  /// Start capture button
  ///
  /// In en, this message translates to:
  /// **'Start Capture'**
  String get captureFlowStartCapture;

  /// Face detection instruction
  ///
  /// In en, this message translates to:
  /// **'Position your face in the frame and look at the camera.'**
  String get captureFlowFaceDetection;

  /// Position correct message with seconds
  ///
  /// In en, this message translates to:
  /// **'Position correct, hold still ({seconds} sec)'**
  String captureFlowPositionCorrect(String seconds);

  /// Turn right more instruction
  ///
  /// In en, this message translates to:
  /// **'Turn your head a bit more to the right.'**
  String get captureFlowTurnRightMore;

  /// Too much right adjustment
  ///
  /// In en, this message translates to:
  /// **'You turned a bit too much, adjust slightly to the left.'**
  String get captureFlowTooMuchRight;

  /// Keep head still instruction
  ///
  /// In en, this message translates to:
  /// **'Keep your head still and don\'t move your shoulders.'**
  String get captureFlowKeepHeadStill;

  /// Turn left more instruction
  ///
  /// In en, this message translates to:
  /// **'Turn your head a bit more to the left.'**
  String get captureFlowTurnLeftMore;

  /// Too much left adjustment
  ///
  /// In en, this message translates to:
  /// **'You turned a bit too much, adjust slightly to the right.'**
  String get captureFlowTooMuchLeft;

  /// Captured text
  ///
  /// In en, this message translates to:
  /// **'captured'**
  String get captureFlowCaptured;

  /// Initializing camera message
  ///
  /// In en, this message translates to:
  /// **'Initializing camera...'**
  String get captureFlowInitializingCamera;

  /// Captured photos title
  ///
  /// In en, this message translates to:
  /// **'Captured Photos'**
  String get captureFlowCapturedPhotos;

  /// End session button
  ///
  /// In en, this message translates to:
  /// **'End Session'**
  String get captureFlowEndSession;

  /// Review photos button
  ///
  /// In en, this message translates to:
  /// **'Review Photos'**
  String get captureFlowReviewPhotos;

  /// Photos captured text
  ///
  /// In en, this message translates to:
  /// **'photos captured'**
  String get captureFlowPhotosCaptured;

  /// Selected text
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get captureFlowSelected;

  /// Continue to analysis button
  ///
  /// In en, this message translates to:
  /// **'Continue to Analysis'**
  String get captureFlowContinueToAnalysis;

  /// New capture button
  ///
  /// In en, this message translates to:
  /// **'Start New Capture'**
  String get captureFlowNewCapture;

  /// Photos from 5 angles text
  ///
  /// In en, this message translates to:
  /// **'Photos from 5 angles'**
  String get captureFlowPhotosFrom5Angles;

  /// Front stage title
  ///
  /// In en, this message translates to:
  /// **'Front View'**
  String get captureStageFrontTitle;

  /// Front stage base instruction
  ///
  /// In en, this message translates to:
  /// **'Look straight at the camera and keep your head still.'**
  String get captureStageFrontBaseInstruction;

  /// Front stage reminder
  ///
  /// In en, this message translates to:
  /// **'Keep your head straight and look at the camera.'**
  String get captureStageFrontReminder;

  /// Right 45 stage title
  ///
  /// In en, this message translates to:
  /// **'Right 45°'**
  String get captureStageRight45Title;

  /// Right 45 stage base instruction
  ///
  /// In en, this message translates to:
  /// **'Turn your head 45 degrees to the right.'**
  String get captureStageRight45BaseInstruction;

  /// Right 45 stage reminder
  ///
  /// In en, this message translates to:
  /// **'Turn your head more to the right.'**
  String get captureStageRight45Reminder;

  /// Left 45 stage title
  ///
  /// In en, this message translates to:
  /// **'Left 45°'**
  String get captureStageLeft45Title;

  /// Left 45 stage base instruction
  ///
  /// In en, this message translates to:
  /// **'Turn your head 45 degrees to the left.'**
  String get captureStageLeft45BaseInstruction;

  /// Left 45 stage reminder
  ///
  /// In en, this message translates to:
  /// **'Turn your head more to the left.'**
  String get captureStageLeft45Reminder;

  /// Vertex stage title
  ///
  /// In en, this message translates to:
  /// **'Top View'**
  String get captureStageVertexTitle;

  /// Vertex stage base instruction
  ///
  /// In en, this message translates to:
  /// **'Hold your phone horizontally above your head.'**
  String get captureStageVertexBaseInstruction;

  /// Vertex stage reminder
  ///
  /// In en, this message translates to:
  /// **'Hold your phone flat above your head.'**
  String get captureStageVertexReminder;

  /// Donor stage title
  ///
  /// In en, this message translates to:
  /// **'Donor Area'**
  String get captureStageDonorTitle;

  /// Donor stage base instruction
  ///
  /// In en, this message translates to:
  /// **'Turn your head and hold the phone behind your head.'**
  String get captureStageDonorBaseInstruction;

  /// Donor stage reminder
  ///
  /// In en, this message translates to:
  /// **'Hold the phone steady behind your head.'**
  String get captureStageDonorReminder;

  /// Front view label
  ///
  /// In en, this message translates to:
  /// **'Front View'**
  String get photoCaptureFrontView;

  /// Position head instruction
  ///
  /// In en, this message translates to:
  /// **'Position your head within the outline'**
  String get photoCapturePositionHead;

  /// Front label
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get photoCaptureFront;

  /// Top label
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get photoCaptureTop;

  /// Left label
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get photoCaptureLeft;

  /// Right label
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get photoCaptureRight;

  /// Online status
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get chatOnline;

  /// Today separator
  ///
  /// In en, this message translates to:
  /// **'--- Today ---'**
  String get chatToday;

  /// Message hint text
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get chatMessageHint;

  /// Quick reply: appointment
  ///
  /// In en, this message translates to:
  /// **'Book appointment'**
  String get chatQuickRepliesAppointment;

  /// Quick reply: treatment plan
  ///
  /// In en, this message translates to:
  /// **'My treatment plan'**
  String get chatQuickRepliesTreatmentPlan;

  /// Quick reply: follow-up
  ///
  /// In en, this message translates to:
  /// **'Request follow-up'**
  String get chatQuickRepliesFollowup;

  /// Quick reply: price info
  ///
  /// In en, this message translates to:
  /// **'Price information'**
  String get chatQuickRepliesPriceInfo;

  /// Patient ID with parameter
  ///
  /// In en, this message translates to:
  /// **'Patient ID: {id}'**
  String progressPatientIdParam(String id);

  /// Statistics label
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get progressStatistics;

  /// Months post-op with parameter
  ///
  /// In en, this message translates to:
  /// **'{months} Months Post-Op'**
  String progressMonthsPostOpParam(String months);

  /// Procedure day label
  ///
  /// In en, this message translates to:
  /// **'Procedure Day'**
  String get progressProcedureDay;

  /// Initial consultation label
  ///
  /// In en, this message translates to:
  /// **'Initial Consultation'**
  String get progressInitialConsultation;

  /// Upload photo button
  ///
  /// In en, this message translates to:
  /// **'Upload New Photo'**
  String get progressUploadPhoto;

  /// Capture and analyze button
  ///
  /// In en, this message translates to:
  /// **'Capture and Analyze'**
  String get analysisCaptureAndAnalyze;

  /// Past analyses label
  ///
  /// In en, this message translates to:
  /// **'Past Analyses'**
  String get analysisPastAnalyses;

  /// Analysis date 1
  ///
  /// In en, this message translates to:
  /// **'October 15, 2023'**
  String get analysisAnalysisDate1;

  /// Analysis description 1
  ///
  /// In en, this message translates to:
  /// **'Slight thinning in the crown area'**
  String get analysisAnalysisDesc1;

  /// Analysis date 2
  ///
  /// In en, this message translates to:
  /// **'July 12, 2023'**
  String get analysisAnalysisDate2;

  /// Analysis description 2
  ///
  /// In en, this message translates to:
  /// **'Signs of inflammation on the scalp'**
  String get analysisAnalysisDesc2;

  /// Analysis date 3
  ///
  /// In en, this message translates to:
  /// **'April 05, 2023'**
  String get analysisAnalysisDate3;

  /// Analysis description 3
  ///
  /// In en, this message translates to:
  /// **'Overall scalp health is good'**
  String get analysisAnalysisDesc3;

  /// Analysis date 4
  ///
  /// In en, this message translates to:
  /// **'January 20, 2023'**
  String get analysisAnalysisDate4;

  /// Analysis description 4
  ///
  /// In en, this message translates to:
  /// **'Initial analysis for treatment'**
  String get analysisAnalysisDesc4;

  /// FAQ question 1
  ///
  /// In en, this message translates to:
  /// **'How long does the hair transplant procedure take?'**
  String get faqQuestion1;

  /// FAQ answer 1
  ///
  /// In en, this message translates to:
  /// **'The hair transplant procedure typically takes 4-8 hours depending on the number of grafts to be transplanted. Since local anesthesia is used during the procedure, the patient does not feel pain.'**
  String get faqAnswer1;

  /// FAQ question 2
  ///
  /// In en, this message translates to:
  /// **'When can I return to normal life after hair transplant?'**
  String get faqQuestion2;

  /// FAQ answer 2
  ///
  /// In en, this message translates to:
  /// **'You can do light activities 2-3 days after hair transplant. It is recommended to wait 2 weeks for heavy sports and physical activities. Return to work is usually possible 3-5 days later.'**
  String get faqAnswer2;

  /// FAQ question 3
  ///
  /// In en, this message translates to:
  /// **'When do the transplanted hairs start to grow?'**
  String get faqQuestion3;

  /// FAQ answer 3
  ///
  /// In en, this message translates to:
  /// **'Transplanted hairs fall out in the first 2-3 weeks (shock loss). New hairs start to grow 3-4 months later and full results are seen within 6-12 months.'**
  String get faqAnswer3;

  /// FAQ question 4
  ///
  /// In en, this message translates to:
  /// **'Is the hair transplant procedure painful?'**
  String get faqQuestion4;

  /// FAQ answer 4
  ///
  /// In en, this message translates to:
  /// **'Since local anesthesia is used during the procedure, no pain is felt. There may be mild pain after the procedure, but this can be controlled with painkillers.'**
  String get faqAnswer4;

  /// FAQ question 5
  ///
  /// In en, this message translates to:
  /// **'What is the success rate of hair transplant?'**
  String get faqQuestion5;

  /// FAQ answer 5
  ///
  /// In en, this message translates to:
  /// **'Hair transplant has a very high success rate, typically 95-98%. The success depends on the patient\'s health, the quality of the donor area, and following post-operative care instructions.'**
  String get faqAnswer5;

  /// FAQ question 6
  ///
  /// In en, this message translates to:
  /// **'Can women have hair transplant?'**
  String get faqQuestion6;

  /// FAQ answer 6
  ///
  /// In en, this message translates to:
  /// **'Yes, women can have hair transplant. Female pattern hair loss is common and can be treated with hair transplant procedures. A consultation is needed to determine if the patient is a suitable candidate.'**
  String get faqAnswer6;

  /// FAQ question 7
  ///
  /// In en, this message translates to:
  /// **'How many grafts are needed for a hair transplant?'**
  String get faqQuestion7;

  /// FAQ answer 7
  ///
  /// In en, this message translates to:
  /// **'The number of grafts needed depends on the extent of hair loss and the desired density. Typically, 1,500-3,000 grafts are used for moderate hair loss, while 3,000-5,000 grafts may be needed for extensive hair loss.'**
  String get faqAnswer7;

  /// FAQ question 8
  ///
  /// In en, this message translates to:
  /// **'Is there an age limit for hair transplant?'**
  String get faqQuestion8;

  /// FAQ answer 8
  ///
  /// In en, this message translates to:
  /// **'There is no strict age limit, but the procedure is generally recommended for patients over 25 years old when hair loss pattern is more stable. Each case is evaluated individually.'**
  String get faqAnswer8;

  /// FAQ question 9
  ///
  /// In en, this message translates to:
  /// **'What is the recovery time after hair transplant?'**
  String get faqQuestion9;

  /// FAQ answer 9
  ///
  /// In en, this message translates to:
  /// **'Most patients can return to work within 3-5 days. The scabs typically fall off within 7-10 days. Full recovery and normal activities can resume after 2 weeks.'**
  String get faqAnswer9;

  /// FAQ question 10
  ///
  /// In en, this message translates to:
  /// **'Are the results of hair transplant permanent?'**
  String get faqQuestion10;

  /// FAQ answer 10
  ///
  /// In en, this message translates to:
  /// **'Yes, the transplanted hair is permanent because it is taken from the donor area which is genetically resistant to hair loss. The transplanted hair will continue to grow naturally for the rest of your life.'**
  String get faqAnswer10;

  /// List view label
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get pastAnalysesListView;

  /// Grid view label
  ///
  /// In en, this message translates to:
  /// **'Grid View'**
  String get pastAnalysesGridView;

  /// Detailed view label
  ///
  /// In en, this message translates to:
  /// **'Detailed View'**
  String get pastAnalysesDetailedView;

  /// Density moderate label
  ///
  /// In en, this message translates to:
  /// **'Density: Moderate'**
  String get pastAnalysesDensityModerate;

  /// Density low label
  ///
  /// In en, this message translates to:
  /// **'Density: Low'**
  String get pastAnalysesDensityLow;

  /// Privacy policy document title
  ///
  /// In en, this message translates to:
  /// **'Personal Data Processing and Protection Policy'**
  String get privacyPolicyTitle;

  /// Privacy policy document date label
  ///
  /// In en, this message translates to:
  /// **'Document Date:'**
  String get privacyPolicyDocumentDate;

  /// Privacy policy revision date label
  ///
  /// In en, this message translates to:
  /// **'Revision Date:'**
  String get privacyPolicyRevisionDate;

  /// Privacy policy revision number label
  ///
  /// In en, this message translates to:
  /// **'Revision Number:'**
  String get privacyPolicyRevisionNumber;

  /// Privacy policy section 1 title
  ///
  /// In en, this message translates to:
  /// **'I. INTRODUCTION'**
  String get privacyPolicySection1;

  /// Privacy policy section 1A title
  ///
  /// In en, this message translates to:
  /// **'A. Purpose and Scope'**
  String get privacyPolicySection1A;

  /// Privacy policy section 1A content
  ///
  /// In en, this message translates to:
  /// **'This Policy regulates the principles adopted by Smile Hair Clinic regarding the protection and processing of personal data.\n\nWithin the scope of this Policy, Smile Hair Clinic provides explanations regarding the processing activities of personal data and the systems adopted for the protection of personal data. This includes informing and ensuring transparency for Relevant Persons, primarily including Product or Service Recipients, Employees and Employee Candidates, Potential Customers, Shareholders, Visitors, Participants, Suppliers and Third Parties, establishing and ensuring standards in the management of personal data; determining and supporting organizational goals and obligations; establishing control mechanisms compatible with acceptable risk levels, compliance with principles and rules brought by international conventions, the Constitution, laws, regulations, contracts and other legislation regarding the protection of personal data, and ensuring the best protection of the fundamental rights and freedoms of the Relevant Person. Additionally, this Policy covers all physical and electronic data recording systems and environments used for processing personal and special category personal data automatically or as part of a data recording system by non-automatic means.'**
  String get privacyPolicySection1AContent;

  /// Privacy policy section 1B title
  ///
  /// In en, this message translates to:
  /// **'B. Definitions'**
  String get privacyPolicySection1B;

  /// App bar title for photo analysis chat
  ///
  /// In en, this message translates to:
  /// **'Photo Analysis'**
  String get photoAnalysisTitle;

  /// Subtitle showing number of uploaded photos
  ///
  /// In en, this message translates to:
  /// **'{count} photos uploaded'**
  String photosUploadedCount(String count);

  /// Auto analysis starting message
  ///
  /// In en, this message translates to:
  /// **'5 photos uploaded. Starting automatic analysis...'**
  String get autoAnalysisStarting;

  /// Message when a stage photo is uploaded
  ///
  /// In en, this message translates to:
  /// **'{stage} angle uploaded'**
  String stageUploaded(String stage);

  /// Message when a stage photo is captured
  ///
  /// In en, this message translates to:
  /// **'{stage} angle captured'**
  String stageCaptured(String stage);

  /// Error when picking a single image
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading the photo: {error}'**
  String errorLoadingPhoto(String error);

  /// Error when picking multiple images
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading multiple photos: {error}'**
  String errorLoadingMultiplePhotos(String error);

  /// Error when taking a photo with camera
  ///
  /// In en, this message translates to:
  /// **'An error occurred while capturing the photo: {error}'**
  String errorCapturingPhoto(String error);

  /// Image source dialog title
  ///
  /// In en, this message translates to:
  /// **'Photo Source'**
  String get imageSourceTitle;

  /// Image source: Camera
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get imageSourceCamera;

  /// Image source: Gallery
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get imageSourceGallery;

  /// Image source: Multiple gallery selection
  ///
  /// In en, this message translates to:
  /// **'Select Multiple from Gallery'**
  String get imageSourceMultiGallery;

  /// Prompt to upload photo before analysis
  ///
  /// In en, this message translates to:
  /// **'Please upload a photo first. Tap the 📷 button to upload.'**
  String get promptNoPhotosForAnalysis;

  /// Typing/analyzing indicator text
  ///
  /// In en, this message translates to:
  /// **'Your photos are being analyzed...'**
  String get analyzingPhotos;

  /// Header for visual analysis section
  ///
  /// In en, this message translates to:
  /// **'📸 Visual Analysis - What I See:'**
  String get visualAnalysisHeader;

  /// Header for important warning section
  ///
  /// In en, this message translates to:
  /// **'⚠️ IMPORTANT WARNING:'**
  String get importantWarningHeader;

  /// Different persons detected message
  ///
  /// In en, this message translates to:
  /// **'Different persons were detected in the photos! All photos must belong to the same person.'**
  String get differentPersonsDetected;

  /// Instruction to capture same person
  ///
  /// In en, this message translates to:
  /// **'Please take photos of the same person from 5 different angles.'**
  String get pleaseCaptureSamePerson;

  /// Detected angles header
  ///
  /// In en, this message translates to:
  /// **'📐 Detected Angles:'**
  String get detectedAnglesHeader;

  /// Analysis completed message
  ///
  /// In en, this message translates to:
  /// **'Analysis completed'**
  String get analysisCompleted;

  /// All photos look good message
  ///
  /// In en, this message translates to:
  /// **'All photos look suitable.'**
  String get allPhotosLookGood;

  /// Saved to Firebase message
  ///
  /// In en, this message translates to:
  /// **'✅ Photos have been saved to Firebase!'**
  String get savedToFirebase;

  /// Label for analysis ID
  ///
  /// In en, this message translates to:
  /// **'Analysis ID: {id}'**
  String analysisIdLabel(String id);

  /// Saved location info
  ///
  /// In en, this message translates to:
  /// **'Saved Location: Firebase Storage & Firestore'**
  String get savedLocationLabel;

  /// Analysis result header
  ///
  /// In en, this message translates to:
  /// **'⚠️ Analysis Result'**
  String get analysisResultHeader;

  /// Label for list of angles to retake
  ///
  /// In en, this message translates to:
  /// **'❌ Angles that need to be retaken:'**
  String get retakeRequiredAngles;

  /// Header for error details list
  ///
  /// In en, this message translates to:
  /// **'Error Details:'**
  String get errorDetailsHeader;

  /// Prompt asking to retake
  ///
  /// In en, this message translates to:
  /// **'Would you like to retake these angles?'**
  String get retakeTheseAnglesQuestion;

  /// Retake first invalid question
  ///
  /// In en, this message translates to:
  /// **'Would you like to retake the first invalid angle?'**
  String get retakeFirstInvalidQuestion;

  /// Retake button
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get retake;

  /// Title for AI analysis section
  ///
  /// In en, this message translates to:
  /// **'AI Analysis'**
  String get aiAnalysisTitle;

  /// Description for AI analysis section
  ///
  /// In en, this message translates to:
  /// **'The AI analyzes your photos and provides feedback on your hair transplant progress.'**
  String get aiAnalysisDescription;

  /// AI analysis in progress status
  ///
  /// In en, this message translates to:
  /// **'AI analysis in progress...'**
  String get aiAnalysisInProgress;

  /// AI analysis completed message
  ///
  /// In en, this message translates to:
  /// **'AI analysis completed. Please check the results.'**
  String get aiAnalysisCompleted;

  /// Error message for AI analysis
  ///
  /// In en, this message translates to:
  /// **'Error occurred during AI analysis: {error}'**
  String aiAnalysisError(String error);

  /// Button to upload and analyze photos
  ///
  /// In en, this message translates to:
  /// **'Upload and Analyze'**
  String get uploadAndAnalyze;

  /// Button to capture photos with face detection
  ///
  /// In en, this message translates to:
  /// **'Capture with Face Detection'**
  String get captureWithFaceDetection;

  /// Error when saving medication time
  ///
  /// In en, this message translates to:
  /// **'Failed to save medication time: {error}'**
  String errorSavingMedicationTime(String error);

  /// Button to select time
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// When date is not available
  ///
  /// In en, this message translates to:
  /// **'Date not available'**
  String get dateNotAvailable;

  /// Button to set reminder
  ///
  /// In en, this message translates to:
  /// **'Set Reminder'**
  String get setReminder;

  /// Button to enable daily medication reminder
  ///
  /// In en, this message translates to:
  /// **'Enable Daily Medication Reminder'**
  String get enableDailyMedicationReminder;

  /// Label for daily medication
  ///
  /// In en, this message translates to:
  /// **'Daily Medication'**
  String get dailyMedication;

  /// Message when daily medication reminder is set
  ///
  /// In en, this message translates to:
  /// **'Daily medication reminder set for {time}'**
  String dailyMedicationReminderSet(String time);

  /// Quick access section title
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get quickAccess;

  /// Quick actions section title
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// Analysis step: Preparation
  ///
  /// In en, this message translates to:
  /// **'Preparation'**
  String get preparation;

  /// Analysis step: Uploading
  ///
  /// In en, this message translates to:
  /// **'Uploading'**
  String get uploading;

  /// Analysis step: AI Analysis
  ///
  /// In en, this message translates to:
  /// **'AI Analysis'**
  String get aiAnalysis;

  /// Analysis step: Saving
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get saving;

  /// Analysis step: Done
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Front angle label with English term
  ///
  /// In en, this message translates to:
  /// **'Front (Front)'**
  String get frontAngle;

  /// Right 45 angle label with English term
  ///
  /// In en, this message translates to:
  /// **'Right 45° (Right45)'**
  String get right45Angle;

  /// Left 45 angle label with English term
  ///
  /// In en, this message translates to:
  /// **'Left 45° (Left45)'**
  String get left45Angle;

  /// Vertex angle label with English term
  ///
  /// In en, this message translates to:
  /// **'Vertex (Vertex)'**
  String get vertexAngle;

  /// Donor angle label with English term
  ///
  /// In en, this message translates to:
  /// **'Donor (Donor)'**
  String get donorAngle;

  /// OK button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @noUpcomingAppointments.
  ///
  /// In en, this message translates to:
  /// **'No Upcoming Appointments'**
  String get noUpcomingAppointments;

  /// Online consultation screen title
  ///
  /// In en, this message translates to:
  /// **'Online Consultation'**
  String get onlineConsultation;

  /// Free consultation header title
  ///
  /// In en, this message translates to:
  /// **'Free Consultation'**
  String get freeConsultation;

  /// Free consultation subtitle
  ///
  /// In en, this message translates to:
  /// **'Contact us to get more information'**
  String get freeConsultationSubtitle;

  /// Full name field label with required indicator
  ///
  /// In en, this message translates to:
  /// **'Full Name *'**
  String get fullNameLabel;

  /// Full name field hint
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameHint;

  /// Email field example
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get emailExample;

  /// Phone number field hint
  ///
  /// In en, this message translates to:
  /// **'5XX XXX XX XX'**
  String get phoneHint;

  /// Message field hint
  ///
  /// In en, this message translates to:
  /// **'Write your message here...'**
  String get messageHint;

  /// Divider text between options
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// Success message when form is submitted
  ///
  /// In en, this message translates to:
  /// **'Your message has been sent successfully!'**
  String get messageSentSuccessfully;

  /// About us screen title
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUsTitle;

  /// About us section title
  ///
  /// In en, this message translates to:
  /// **'Who We Are?'**
  String get whoWeAre;

  /// About us main description
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic is one of the leading clinics in Istanbul, Turkey, providing hair transplant services. Under the leadership of internationally recognized Dr. Gökay Bilgin and Dr. Mehmet Erdoğan, patient satisfaction is always prioritized at Smile Hair Clinic.\n\nAll operation processes are personally followed by doctors, and every member of the team consists of professionals with medical training. Successful hair transplant applications have been performed for many patients from all over the world.'**
  String get aboutUsDescription;

  /// Our values section title
  ///
  /// In en, this message translates to:
  /// **'Our Values'**
  String get ourValues;

  /// Professionalism value title
  ///
  /// In en, this message translates to:
  /// **'Professionalism'**
  String get professionalism;

  /// Professionalism value description
  ///
  /// In en, this message translates to:
  /// **'Our internationally certified expert doctors'**
  String get professionalismDescription;

  /// Patient satisfaction value title
  ///
  /// In en, this message translates to:
  /// **'Patient Satisfaction'**
  String get patientSatisfaction;

  /// Patient satisfaction value description
  ///
  /// In en, this message translates to:
  /// **'Our priority is always our patients\' happiness'**
  String get patientSatisfactionDescription;

  /// Medical education value title
  ///
  /// In en, this message translates to:
  /// **'Medical Education'**
  String get medicalEducation;

  /// Medical education value description
  ///
  /// In en, this message translates to:
  /// **'Every member of our team consists of professionals with medical training'**
  String get medicalEducationDescription;

  /// International service value title
  ///
  /// In en, this message translates to:
  /// **'International Service'**
  String get internationalService;

  /// International service value description
  ///
  /// In en, this message translates to:
  /// **'Serving patients from all over the world'**
  String get internationalServiceDescription;

  /// Statistics section title
  ///
  /// In en, this message translates to:
  /// **'By Numbers'**
  String get byNumbers;

  /// Successful operations stat label
  ///
  /// In en, this message translates to:
  /// **'Successful\nOperations'**
  String get successfulOperations;

  /// Patients from countries stat label
  ///
  /// In en, this message translates to:
  /// **'Patients from\nCountries'**
  String get patientsFromCountries;

  /// Expert doctors stat label
  ///
  /// In en, this message translates to:
  /// **'Expert\nDoctors'**
  String get expertDoctors;

  /// Patient satisfaction rate stat label
  ///
  /// In en, this message translates to:
  /// **'Patient\nSatisfaction'**
  String get patientSatisfactionRate;

  /// Experience label
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// Successful operation label
  ///
  /// In en, this message translates to:
  /// **'Successful Operation'**
  String get successfulOperation;

  /// About label
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Expertise areas section title
  ///
  /// In en, this message translates to:
  /// **'Areas of Expertise'**
  String get expertiseAreas;

  /// Interview section title
  ///
  /// In en, this message translates to:
  /// **'Interview'**
  String get interview;

  /// Contact us header title
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// Call button text
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// Working hours section title
  ///
  /// In en, this message translates to:
  /// **'Working Hours'**
  String get workingHours;

  /// Monday to Friday text
  ///
  /// In en, this message translates to:
  /// **'Monday - Friday'**
  String get mondayFriday;

  /// Saturday full name
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// Sunday full name
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// Closed text
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// Notifications screen title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// All tab label
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Unread tab label
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// Scheduled tab label
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get scheduled;

  /// Mark all notifications as read button
  ///
  /// In en, this message translates to:
  /// **'Mark All as Read'**
  String get markAllAsRead;

  /// No notifications empty state
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotificationsYet;

  /// New notifications empty state subtitle
  ///
  /// In en, this message translates to:
  /// **'New notifications will appear here'**
  String get newNotificationsWillAppearHere;

  /// Capture and analyze screen title
  ///
  /// In en, this message translates to:
  /// **'Capture and Analyze'**
  String get captureAndAnalyze;

  /// Capture and analyze subtitle
  ///
  /// In en, this message translates to:
  /// **'Capture photos from 5 critical angles and analyze them'**
  String get captureAndAnalyzeSubtitle;

  /// Upload and analyze subtitle
  ///
  /// In en, this message translates to:
  /// **'Upload photos from your gallery and analyze them'**
  String get uploadAndAnalyzeSubtitle;

  /// Capture with face detection subtitle
  ///
  /// In en, this message translates to:
  /// **'Automatic capture with face detection technology'**
  String get captureWithFaceDetectionSubtitle;

  /// Show face to camera status
  ///
  /// In en, this message translates to:
  /// **'Show your face to the camera...'**
  String get showFaceToCamera;

  /// Camera not found error
  ///
  /// In en, this message translates to:
  /// **'Camera not found'**
  String cameraNotFound(Object type);

  /// Phone app cannot open error
  ///
  /// In en, this message translates to:
  /// **'Phone app cannot be opened. Please make sure the phone app is installed on your device.'**
  String get phoneAppCannotOpen;

  /// Email app cannot open error
  ///
  /// In en, this message translates to:
  /// **'Email app cannot be opened. Please make sure the email app is installed on your device.'**
  String get emailAppCannotOpen;

  /// Map cannot open error
  ///
  /// In en, this message translates to:
  /// **'Map cannot be opened. Please check your internet connection.'**
  String get mapCannotOpen;

  /// No photos selected empty state
  ///
  /// In en, this message translates to:
  /// **'No photos selected yet'**
  String get noPhotosSelectedYet;

  /// Add photos from gallery or camera hint
  ///
  /// In en, this message translates to:
  /// **'Add photos from gallery or camera'**
  String get addPhotosFromGalleryOrCamera;

  /// No description provided for @ourDoctors.
  ///
  /// In en, this message translates to:
  /// **'Our Doctors'**
  String get ourDoctors;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @timeNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Time not available'**
  String get timeNotAvailable;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// No description provided for @doctorNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Dr. Sarah Johnson'**
  String get doctorNamePlaceholder;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @consultationTypePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Follow-up Consultation'**
  String get consultationTypePlaceholder;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @yourDoctor.
  ///
  /// In en, this message translates to:
  /// **'Your Doctor'**
  String get yourDoctor;

  /// No description provided for @appointment.
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get appointment;

  /// No description provided for @soon.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get soon;

  /// No description provided for @reminderAdded.
  ///
  /// In en, this message translates to:
  /// **'Reminder added'**
  String get reminderAdded;

  /// No description provided for @reminderAddError.
  ///
  /// In en, this message translates to:
  /// **'Could not add reminder: {error}'**
  String reminderAddError(Object error);

  /// No description provided for @appointmentWith.
  ///
  /// In en, this message translates to:
  /// **'{doctorName} with {type}'**
  String appointmentWith(Object doctorName, Object type);

  /// No description provided for @cameraInitError.
  ///
  /// In en, this message translates to:
  /// **'Error initializing camera: {error}'**
  String cameraInitError(Object error);

  /// No description provided for @cameraRefreshError.
  ///
  /// In en, this message translates to:
  /// **'Could not refresh camera: {error}'**
  String cameraRefreshError(Object error);

  /// No description provided for @photoCaptureError.
  ///
  /// In en, this message translates to:
  /// **'Error capturing photo: {error}'**
  String photoCaptureError(Object error);

  /// No description provided for @panoramaComplete.
  ///
  /// In en, this message translates to:
  /// **'Panoramic capture complete.'**
  String get panoramaComplete;

  /// No description provided for @panoramaVertexInstruction.
  ///
  /// In en, this message translates to:
  /// **'Hold phone above your head, horizontal with screen facing down.'**
  String get panoramaVertexInstruction;

  /// No description provided for @sensorDataWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for sensor data...'**
  String get sensorDataWaiting;

  /// Panorama continue to donor instruction
  ///
  /// In en, this message translates to:
  /// **'Continue towards the back of the head'**
  String panoramaContinueToDonor(Object degrees);

  /// No description provided for @panoramaHoldSteady.
  ///
  /// In en, this message translates to:
  /// **'Hold phone steady, capturing back photo.'**
  String get panoramaHoldSteady;

  /// No description provided for @turnHeadRightInstruction.
  ///
  /// In en, this message translates to:
  /// **'Turn your head significantly to the RIGHT (approx 70–90°). Keep chin level.'**
  String get turnHeadRightInstruction;

  /// No description provided for @turnHeadLeftCorrection.
  ///
  /// In en, this message translates to:
  /// **'Turned too much; come back LEFT a bit. Keep chin level.'**
  String get turnHeadLeftCorrection;

  /// No description provided for @holdSteadyNearTarget.
  ///
  /// In en, this message translates to:
  /// **'Don\'t move, very close to alignment. Stay steady.'**
  String get holdSteadyNearTarget;

  /// No description provided for @turnHeadLeftInstruction.
  ///
  /// In en, this message translates to:
  /// **'Turn your head significantly to the LEFT (approx 70–90°). Keep chin level.'**
  String get turnHeadLeftInstruction;

  /// No description provided for @turnHeadRightCorrection.
  ///
  /// In en, this message translates to:
  /// **'Turned too much; come back RIGHT a bit. Keep chin level.'**
  String get turnHeadRightCorrection;

  /// No description provided for @holdPhoneFlatInstruction.
  ///
  /// In en, this message translates to:
  /// **'Hold phone COMPLETELY FLAT! Screen must face up.'**
  String get holdPhoneFlatInstruction;

  /// No description provided for @holdPhoneFlatter.
  ///
  /// In en, this message translates to:
  /// **'Hold phone a bit flatter. Screen must face exactly up.'**
  String get holdPhoneFlatter;

  /// No description provided for @dontTiltForward.
  ///
  /// In en, this message translates to:
  /// **'Hold phone flatter, don\'t tilt forward.'**
  String get dontTiltForward;

  /// No description provided for @dontTiltBackward.
  ///
  /// In en, this message translates to:
  /// **'Hold phone flatter, don\'t tilt backward.'**
  String get dontTiltBackward;

  /// No description provided for @dontTiltRight.
  ///
  /// In en, this message translates to:
  /// **'Hold phone flatter, don\'t tilt right.'**
  String get dontTiltRight;

  /// No description provided for @dontTiltLeft.
  ///
  /// In en, this message translates to:
  /// **'Hold phone flatter, don\'t tilt left.'**
  String get dontTiltLeft;

  /// No description provided for @perfectHoldStill.
  ///
  /// In en, this message translates to:
  /// **'Perfect! Hold still... ({seconds} sec)'**
  String perfectHoldStill(Object seconds);

  /// No description provided for @donorInstruction.
  ///
  /// In en, this message translates to:
  /// **'Hold phone behind your head to capture donor area. Hold still...'**
  String get donorInstruction;

  /// No description provided for @dontTiltUpOrDown.
  ///
  /// In en, this message translates to:
  /// **'Hold phone straight, don\'t tilt up/down.'**
  String get dontTiltUpOrDown;

  /// No description provided for @dontTiltSideToSide.
  ///
  /// In en, this message translates to:
  /// **'Hold phone straight, don\'t tilt side to side.'**
  String get dontTiltSideToSide;

  /// No description provided for @movePhoneBack.
  ///
  /// In en, this message translates to:
  /// **'Move phone completely to the back, must be in opposite direction.'**
  String get movePhoneBack;

  /// No description provided for @positionCorrectHoldStill.
  ///
  /// In en, this message translates to:
  /// **'Position correct, hold still ({seconds} sec)'**
  String positionCorrectHoldStill(Object seconds);

  /// No description provided for @holdStill.
  ///
  /// In en, this message translates to:
  /// **'Hold still.'**
  String get holdStill;

  /// No description provided for @lookStraight.
  ///
  /// In en, this message translates to:
  /// **'Look straight. Keep your head level.'**
  String get lookStraight;

  /// No description provided for @turnHeadRight.
  ///
  /// In en, this message translates to:
  /// **'Turn your head to the right. Keep chin level.'**
  String get turnHeadRight;

  /// No description provided for @turnHeadLeft.
  ///
  /// In en, this message translates to:
  /// **'Turn your head to the left. Keep chin level.'**
  String get turnHeadLeft;

  /// No description provided for @holdPhoneFlat.
  ///
  /// In en, this message translates to:
  /// **'Hold the phone flat above your head, screen up.'**
  String get holdPhoneFlat;

  /// No description provided for @movePhoneBehind.
  ///
  /// In en, this message translates to:
  /// **'Move the phone behind your head and keep it steady.'**
  String get movePhoneBehind;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @firstPhotoCaptured.
  ///
  /// In en, this message translates to:
  /// **'1st Photo Captured'**
  String get firstPhotoCaptured;

  /// No description provided for @turkishTR.
  ///
  /// In en, this message translates to:
  /// **'Turkish (TR)'**
  String get turkishTR;

  /// No description provided for @englishEN.
  ///
  /// In en, this message translates to:
  /// **'English (EN)'**
  String get englishEN;

  /// No description provided for @voiceLanguage.
  ///
  /// In en, this message translates to:
  /// **'Voice Language'**
  String get voiceLanguage;

  /// My messages title
  ///
  /// In en, this message translates to:
  /// **'My Messages'**
  String get myMessages;

  /// No description provided for @doctorSessionNotFound.
  ///
  /// In en, this message translates to:
  /// **'Doctor session not found.'**
  String get doctorSessionNotFound;

  /// No description provided for @newMessage.
  ///
  /// In en, this message translates to:
  /// **'New Message'**
  String get newMessage;

  /// No description provided for @errorWithDetails.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorWithDetails(Object error);

  /// No messages yet message
  ///
  /// In en, this message translates to:
  /// **'No messages yet.'**
  String get noMessagesYet;

  /// No description provided for @startNewMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Click + button to start a new message'**
  String get startNewMessageHint;

  /// No description provided for @doctorInfoNotFoundLoginAgain.
  ///
  /// In en, this message translates to:
  /// **'Doctor information not found. Please log in again.'**
  String get doctorInfoNotFoundLoginAgain;

  /// No description provided for @noPatientsFound.
  ///
  /// In en, this message translates to:
  /// **'No patients found.'**
  String get noPatientsFound;

  /// No description provided for @selectPatient.
  ///
  /// In en, this message translates to:
  /// **'Select Patient'**
  String get selectPatient;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @patientOrDoctorInfoNotFound.
  ///
  /// In en, this message translates to:
  /// **'Patient or doctor information not found'**
  String get patientOrDoctorInfoNotFound;

  /// No description provided for @doctorFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctorFallbackName;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String minutesAgo(Object minutes);

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @refreshingList.
  ///
  /// In en, this message translates to:
  /// **'Refreshing list...'**
  String get refreshingList;

  /// No description provided for @todaysAppointments.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Appointments'**
  String get todaysAppointments;

  /// No description provided for @appointmentCount.
  ///
  /// In en, this message translates to:
  /// **'appointment'**
  String get appointmentCount;

  /// No description provided for @appointmentDataLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load appointment data'**
  String get appointmentDataLoadFailed;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @noPendingAppointments.
  ///
  /// In en, this message translates to:
  /// **'No pending appointments'**
  String get noPendingAppointments;

  /// No description provided for @appointmentsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Appointments will appear here when patients create them'**
  String get appointmentsWillAppearHere;

  /// No description provided for @noConfirmedAppointments.
  ///
  /// In en, this message translates to:
  /// **'No confirmed appointments'**
  String get noConfirmedAppointments;

  /// No description provided for @confirmedAppointmentsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Confirmed appointments will appear here'**
  String get confirmedAppointmentsWillAppearHere;

  /// No description provided for @noCompletedAppointments.
  ///
  /// In en, this message translates to:
  /// **'No completed appointments'**
  String get noCompletedAppointments;

  /// No description provided for @completedAppointmentsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Completed appointments will appear here'**
  String get completedAppointmentsWillAppearHere;

  /// No description provided for @noCancelledAppointments.
  ///
  /// In en, this message translates to:
  /// **'No cancelled appointments'**
  String get noCancelledAppointments;

  /// No description provided for @cancelledAppointmentsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Cancelled appointments will appear here'**
  String get cancelledAppointmentsWillAppearHere;

  /// No description provided for @photosCount.
  ///
  /// In en, this message translates to:
  /// **'Photos ({count})'**
  String photosCount(Object count);

  /// No description provided for @front.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get front;

  /// No description provided for @right45.
  ///
  /// In en, this message translates to:
  /// **'Right 45°'**
  String get right45;

  /// No description provided for @left45.
  ///
  /// In en, this message translates to:
  /// **'Left 45°'**
  String get left45;

  /// No description provided for @top.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get top;

  /// No description provided for @donorArea.
  ///
  /// In en, this message translates to:
  /// **'Donor Area'**
  String get donorArea;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @markAsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark as Completed'**
  String get markAsCompleted;

  /// No description provided for @appointmentApproved.
  ///
  /// In en, this message translates to:
  /// **'Appointment Approved'**
  String get appointmentApproved;

  /// No description provided for @appointmentApprovedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your appointment with {doctorName} on {date} has been approved.'**
  String appointmentApprovedMessage(Object doctorName, Object date);

  /// No description provided for @appointmentApprovedNotification.
  ///
  /// In en, this message translates to:
  /// **'Appointment approved and patient notified'**
  String get appointmentApprovedNotification;

  /// No description provided for @appointmentApprovalError.
  ///
  /// In en, this message translates to:
  /// **'Error approving appointment'**
  String get appointmentApprovalError;

  /// No description provided for @appointmentApprovalPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to approve appointment. Please check Firebase Firestore rules.'**
  String get appointmentApprovalPermissionDenied;

  /// No description provided for @appointmentNotFound.
  ///
  /// In en, this message translates to:
  /// **'Appointment not found. Please refresh the page.'**
  String get appointmentNotFound;

  /// No description provided for @firebaseUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Firebase service is currently unavailable. Please check your internet connection.'**
  String get firebaseUnavailable;

  /// No description provided for @rejectAppointment.
  ///
  /// In en, this message translates to:
  /// **'Reject Appointment'**
  String get rejectAppointment;

  /// No description provided for @rejectionReason.
  ///
  /// In en, this message translates to:
  /// **'Rejection Reason'**
  String get rejectionReason;

  /// No description provided for @rejectionReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter the reason for rejection'**
  String get rejectionReasonHint;

  /// No description provided for @appointmentRejected.
  ///
  /// In en, this message translates to:
  /// **'Appointment Rejected'**
  String get appointmentRejected;

  /// No description provided for @appointmentRejectedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your appointment with {doctorName} on {date} has been rejected. Reason: {reason}'**
  String appointmentRejectedMessage(
      Object doctorName, Object date, Object reason);

  /// No description provided for @appointmentRejectedNotification.
  ///
  /// In en, this message translates to:
  /// **'Appointment rejected and patient notified'**
  String get appointmentRejectedNotification;

  /// No description provided for @appointmentRejectionError.
  ///
  /// In en, this message translates to:
  /// **'Error rejecting appointment'**
  String get appointmentRejectionError;

  /// No description provided for @appointmentRejectionPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to reject appointment. Please check Firebase Firestore rules.'**
  String get appointmentRejectionPermissionDenied;

  /// No description provided for @completeAppointment.
  ///
  /// In en, this message translates to:
  /// **'Complete Appointment'**
  String get completeAppointment;

  /// No description provided for @completeAppointmentConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to mark this appointment as completed?'**
  String get completeAppointmentConfirmation;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @appointmentCompleted.
  ///
  /// In en, this message translates to:
  /// **'Appointment Completed'**
  String get appointmentCompleted;

  /// No description provided for @appointmentCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your appointment with {doctorName} on {date} has been completed.'**
  String appointmentCompletedMessage(Object doctorName, Object date);

  /// No description provided for @appointmentCompletedNotification.
  ///
  /// In en, this message translates to:
  /// **'Appointment completed and patient notified'**
  String get appointmentCompletedNotification;

  /// No description provided for @appointmentCompletionError.
  ///
  /// In en, this message translates to:
  /// **'Error completing appointment'**
  String get appointmentCompletionError;

  /// No description provided for @appointmentCompletionPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to complete appointment. Please check Firebase Firestore rules.'**
  String get appointmentCompletionPermissionDenied;

  /// No description provided for @appointmentNote.
  ///
  /// In en, this message translates to:
  /// **'Appointment Note'**
  String get appointmentNote;

  /// No description provided for @noteVisibleToPatient.
  ///
  /// In en, this message translates to:
  /// **'Description / note visible to patient'**
  String get noteVisibleToPatient;

  /// No description provided for @appointmentNoteMessage.
  ///
  /// In en, this message translates to:
  /// **'{doctorName} added a note to your appointment: {note}'**
  String appointmentNoteMessage(Object doctorName, Object note);

  /// No description provided for @noteSavedNotification.
  ///
  /// In en, this message translates to:
  /// **'Note saved and patient notified'**
  String get noteSavedNotification;

  /// No description provided for @noteAddError.
  ///
  /// In en, this message translates to:
  /// **'Error adding note'**
  String get noteAddError;

  /// No description provided for @noteAddPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to add note. Please check Firebase Firestore rules.'**
  String get noteAddPermissionDenied;

  /// No description provided for @deleteAppointment.
  ///
  /// In en, this message translates to:
  /// **'Delete Appointment'**
  String get deleteAppointment;

  /// No description provided for @deleteAppointmentConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently delete this appointment? This action cannot be undone.'**
  String get deleteAppointmentConfirmation;

  /// No description provided for @appointmentCancelledMessage.
  ///
  /// In en, this message translates to:
  /// **'Your appointment with {doctorName} on {date} has been cancelled.'**
  String appointmentCancelledMessage(Object doctorName, Object date);

  /// No description provided for @appointmentDeletedNotification.
  ///
  /// In en, this message translates to:
  /// **'Appointment deleted and patient notified'**
  String get appointmentDeletedNotification;

  /// No description provided for @appointmentDeletionError.
  ///
  /// In en, this message translates to:
  /// **'Error deleting appointment'**
  String get appointmentDeletionError;

  /// No description provided for @appointmentDeletionPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to delete appointment. Please check Firebase Firestore rules.'**
  String get appointmentDeletionPermissionDenied;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNote;

  /// No description provided for @emptyNote.
  ///
  /// In en, this message translates to:
  /// **'(empty note)'**
  String get emptyNote;

  /// No description provided for @doctorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Dr. Unknown'**
  String get doctorUnknown;

  /// No description provided for @loginRequiredToSend.
  ///
  /// In en, this message translates to:
  /// **'You must be logged in as a doctor to send messages'**
  String get loginRequiredToSend;

  /// No description provided for @messageSendError.
  ///
  /// In en, this message translates to:
  /// **'Message could not be sent: {error}'**
  String messageSendError(Object error);

  /// No description provided for @messagesWithTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages - {title}'**
  String messagesWithTitle(Object title);

  /// No description provided for @patient.
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get patient;

  /// No description provided for @patientInfoMissing.
  ///
  /// In en, this message translates to:
  /// **'Patient information missing'**
  String get patientInfoMissing;

  /// No description provided for @noMessages.
  ///
  /// In en, this message translates to:
  /// **'No messages'**
  String get noMessages;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeMessage;

  /// No description provided for @doctorPanel.
  ///
  /// In en, this message translates to:
  /// **'Doctor Panel'**
  String get doctorPanel;

  /// No description provided for @myPatients.
  ///
  /// In en, this message translates to:
  /// **'My Patients'**
  String get myPatients;

  /// No description provided for @appointments.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointments;

  /// No description provided for @approvals.
  ///
  /// In en, this message translates to:
  /// **'Approvals'**
  String get approvals;

  /// Messages label
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @aiAssistant.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get aiAssistant;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @doctorInfoNotFound.
  ///
  /// In en, this message translates to:
  /// **'Doctor information not found.'**
  String get doctorInfoNotFound;

  /// No description provided for @aiAssistantDescription.
  ///
  /// In en, this message translates to:
  /// **'Get AI-powered answers to your medical questions'**
  String get aiAssistantDescription;

  /// No description provided for @chatWithAI.
  ///
  /// In en, this message translates to:
  /// **'Chat with AI'**
  String get chatWithAI;

  /// No description provided for @logoutDoctor.
  ///
  /// In en, this message translates to:
  /// **'Log Out (Doctor)'**
  String get logoutDoctor;

  /// No description provided for @errorWithDetail.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorWithDetail(Object error);

  /// No description provided for @noDate.
  ///
  /// In en, this message translates to:
  /// **'No date'**
  String get noDate;

  /// No description provided for @statusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get statusApproved;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @photoReview.
  ///
  /// In en, this message translates to:
  /// **'Photo Review'**
  String get photoReview;

  /// No description provided for @reviewAndApproveAnalyses.
  ///
  /// In en, this message translates to:
  /// **'Review and approve analyses'**
  String get reviewAndApproveAnalyses;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @noCompletedAnalyses.
  ///
  /// In en, this message translates to:
  /// **'No completed analyses yet'**
  String get noCompletedAnalyses;

  /// No description provided for @analysesWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Will appear here when patients complete photo analysis'**
  String get analysesWillAppearHere;

  /// No description provided for @analysisProcess.
  ///
  /// In en, this message translates to:
  /// **'Analysis process:\n• Patient takes photo\n• AI analyzes it\n• Valid analyses are listed here'**
  String get analysisProcess;

  /// No description provided for @noApprovedPhotos.
  ///
  /// In en, this message translates to:
  /// **'No approved photos yet'**
  String get noApprovedPhotos;

  /// No description provided for @approvedPhotosWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Photos you approved will appear here'**
  String get approvedPhotosWillAppearHere;

  /// No description provided for @photoCountSuffix.
  ///
  /// In en, this message translates to:
  /// **'photos'**
  String get photoCountSuffix;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get processing;

  /// No description provided for @photoApproved.
  ///
  /// In en, this message translates to:
  /// **'✅ Photo approved'**
  String get photoApproved;

  /// No description provided for @approvalFailed.
  ///
  /// In en, this message translates to:
  /// **'❌ Approval failed'**
  String get approvalFailed;

  /// No description provided for @approvalPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Approval permission denied. Please check Firebase rules.'**
  String get approvalPermissionDenied;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your internet connection.'**
  String get networkError;

  /// No description provided for @photoRejected.
  ///
  /// In en, this message translates to:
  /// **'❌ Photo rejected. Notification sent to patient.'**
  String get photoRejected;

  /// No description provided for @rejectionFailed.
  ///
  /// In en, this message translates to:
  /// **'❌ Rejection failed'**
  String get rejectionFailed;

  /// No description provided for @rejectionPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Rejection permission denied. Please check Firebase rules.'**
  String get rejectionPermissionDenied;

  /// Message shown when a sample patient is added
  ///
  /// In en, this message translates to:
  /// **'Patient added: {name}'**
  String patientAdded(String name);

  /// No description provided for @allSamplePatientsAdded.
  ///
  /// In en, this message translates to:
  /// **'All sample patients and analyses added!'**
  String get allSamplePatientsAdded;

  /// Error message when adding a patient fails
  ///
  /// In en, this message translates to:
  /// **'Error adding patient: {error}'**
  String patientAddError(String error);

  /// Error message when fetching patient list fails
  ///
  /// In en, this message translates to:
  /// **'Could not fetch Firebase patient list: {error}'**
  String firebasePatientListError(String error);

  /// No description provided for @analysisPhoto.
  ///
  /// In en, this message translates to:
  /// **'Analysis Photo'**
  String get analysisPhoto;

  /// No description provided for @scalpHealthGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get scalpHealthGood;

  /// No description provided for @recommendationContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue current treatment'**
  String get recommendationContinue;

  /// No description provided for @sampleAnalysisData.
  ///
  /// In en, this message translates to:
  /// **'Sample analysis data'**
  String get sampleAnalysisData;

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error: '**
  String get errorPrefix;

  /// Generic error title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @profileLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load profile information'**
  String get profileLoadError;

  /// No description provided for @profileReadPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to read profile information'**
  String get profileReadPermissionDenied;

  /// No description provided for @firebaseServiceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Firebase service is unavailable'**
  String get firebaseServiceUnavailable;

  /// No description provided for @profileSaveError.
  ///
  /// In en, this message translates to:
  /// **'Could not save profile information'**
  String get profileSaveError;

  /// No description provided for @profileSavePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to save profile information'**
  String get profileSavePermissionDenied;

  /// Error message when saving fails
  ///
  /// In en, this message translates to:
  /// **'Save error: {error}'**
  String saveError(String error);

  /// No description provided for @profileSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile saved successfully'**
  String get profileSavedSuccessfully;

  /// No description provided for @photoUploadedSaveRequired.
  ///
  /// In en, this message translates to:
  /// **'Photo uploaded. Please click Save button to make changes permanent.'**
  String get photoUploadedSaveRequired;

  /// No description provided for @photoUploadError.
  ///
  /// In en, this message translates to:
  /// **'Photo upload error'**
  String get photoUploadError;

  /// No description provided for @photoUploadPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied to upload photo'**
  String get photoUploadPermissionDenied;

  /// No description provided for @photoUploadUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized to upload photo'**
  String get photoUploadUnauthorized;

  /// No description provided for @photoUploadCancelled.
  ///
  /// In en, this message translates to:
  /// **'Photo upload cancelled'**
  String get photoUploadCancelled;

  /// No description provided for @doctorLoginNotFound.
  ///
  /// In en, this message translates to:
  /// **'Doctor login information not found'**
  String get doctorLoginNotFound;

  /// Label for doctor ID
  ///
  /// In en, this message translates to:
  /// **'Doctor ID: {id}'**
  String doctorIdLabel(String id);

  /// No description provided for @patientInfoLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load patient information'**
  String get patientInfoLoadError;

  /// No description provided for @analysesLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load analyses'**
  String get analysesLoadError;

  /// No description provided for @noAnalysesFound.
  ///
  /// In en, this message translates to:
  /// **'No analyses found'**
  String get noAnalysesFound;

  /// No description provided for @imageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Image not found'**
  String get imageNotFound;

  /// No description provided for @tryAgainFromPatientList.
  ///
  /// In en, this message translates to:
  /// **'Please try again from the patient list'**
  String get tryAgainFromPatientList;

  /// Remember me checkbox label
  ///
  /// In en, this message translates to:
  /// **'Keep me signed in'**
  String get rememberMe;

  /// Doctor login button text
  ///
  /// In en, this message translates to:
  /// **'Doctor Login'**
  String get doctorLogin;

  /// Signing in loading text
  ///
  /// In en, this message translates to:
  /// **'Signing in...'**
  String get signingIn;

  /// Validation error when email or password is empty
  ///
  /// In en, this message translates to:
  /// **'Email and password fields must be filled.'**
  String get emailAndPasswordRequired;

  /// Google sign in error message
  ///
  /// In en, this message translates to:
  /// **'Google sign in failed: {error}'**
  String googleSignInFailed(String error);

  /// Invalid email format error
  ///
  /// In en, this message translates to:
  /// **'Invalid email format.'**
  String get invalidEmailFormat;

  /// Account disabled error
  ///
  /// In en, this message translates to:
  /// **'This account has been disabled.'**
  String get accountDisabled;

  /// User not found error
  ///
  /// In en, this message translates to:
  /// **'No user found with this email address.'**
  String get userNotFound;

  /// Wrong password error
  ///
  /// In en, this message translates to:
  /// **'Wrong password.'**
  String get wrongPassword;

  /// Too many requests error
  ///
  /// In en, this message translates to:
  /// **'Too many failed login attempts. Please try again later.'**
  String get tooManyRequests;

  /// Generic login error
  ///
  /// In en, this message translates to:
  /// **'An error occurred while logging in. Please try again.'**
  String get loginError;

  /// Email already in use error
  ///
  /// In en, this message translates to:
  /// **'This email address has already been used.'**
  String get emailAlreadyInUse;

  /// Weak password error
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters.'**
  String get weakPassword;

  /// Generic registration error
  ///
  /// In en, this message translates to:
  /// **'An error occurred while registering. Please try again.'**
  String get registrationError;

  /// Terms acceptance prefix text
  ///
  /// In en, this message translates to:
  /// **'By registering, you accept the '**
  String get acceptTermsPrefix;

  /// Terms of service link text
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceLink;

  /// And conjunction
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// Privacy policy link text
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyLink;

  /// Terms acceptance suffix text
  ///
  /// In en, this message translates to:
  /// **' texts.'**
  String get acceptTermsSuffix;

  /// Login required message
  ///
  /// In en, this message translates to:
  /// **'You need to sign in'**
  String get loginRequired;

  /// No analyses yet message
  ///
  /// In en, this message translates to:
  /// **'No Analyses Yet'**
  String get noAnalysesYet;

  /// Go to main page instruction
  ///
  /// In en, this message translates to:
  /// **'Go to the main page to make your first analysis'**
  String get goToMainPage;

  /// Unknown date placeholder
  ///
  /// In en, this message translates to:
  /// **'Unknown Date'**
  String get unknownDate;

  /// January month name
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// February month name
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// March month name
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// April month name
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// May month name
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// June month name
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// July month name
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// August month name
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// September month name
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// October month name
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// November month name
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// December month name
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// Short completed status
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get analysisCompletedShort;

  /// Retake dialog title
  ///
  /// In en, this message translates to:
  /// **'Retake Required'**
  String get retakeDialogTitle;

  /// Retake dialog body text
  ///
  /// In en, this message translates to:
  /// **'According to AI analysis, the following angles need to be retaken:'**
  String get retakeDialogBody;

  /// Retake first invalid question
  ///
  /// In en, this message translates to:
  /// **'Would you like to retake the first invalid angle?'**
  String get retakeFirstInvalidQuestionShort;

  /// No existing photos found message
  ///
  /// In en, this message translates to:
  /// **'No existing photos found'**
  String get noExistingPhotosFound;

  /// No valid photos to upload error
  ///
  /// In en, this message translates to:
  /// **'No valid photos to upload found'**
  String get noValidPhotosToUpload;

  /// Generic error message with error parameter
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorOccurred(String error);

  /// Upload and analyze screen title
  ///
  /// In en, this message translates to:
  /// **'Upload and Analyze'**
  String get uploadAndAnalyzeTitle;

  /// Loading text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// OK understood button
  ///
  /// In en, this message translates to:
  /// **'OK, Understood'**
  String get okUnderstood;

  /// Pending status text
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingStatus;

  /// Monday full name
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// Tuesday full name
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// Wednesday full name
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// Thursday full name
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// Friday full name
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// Active status
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Inactive status
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No title placeholder
  ///
  /// In en, this message translates to:
  /// **'No Title'**
  String get noTitle;

  /// Photo selection dialog title
  ///
  /// In en, this message translates to:
  /// **'Photo {current}/{total} - Select Angle'**
  String photoSelectAngle(String current, String total);

  /// Already selected stage indicator
  ///
  /// In en, this message translates to:
  /// **'Already selected'**
  String get alreadySelected;

  /// Important warning header
  ///
  /// In en, this message translates to:
  /// **'⚠️ IMPORTANT WARNING:'**
  String get importantWarning;

  /// Some photos need retake message
  ///
  /// In en, this message translates to:
  /// **'Some photos need to be retaken.'**
  String get somePhotosNeedRetake;

  /// Angles that need retake header
  ///
  /// In en, this message translates to:
  /// **'Angles that need to be retaken:'**
  String get anglesThatNeedRetake;

  /// Note when user has photos
  ///
  /// In en, this message translates to:
  /// **'Note: User has {count} photos uploaded. You can ask questions about photo analysis.'**
  String userHasPhotosNote(String count);

  /// Note when user has no photos
  ///
  /// In en, this message translates to:
  /// **'Note: User has no photos yet. You can help with photo upload.'**
  String get userNoPhotosNote;

  /// Front short name
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get frontShort;

  /// Right 45 short name
  ///
  /// In en, this message translates to:
  /// **'Right 45°'**
  String get right45Short;

  /// Left 45 short name
  ///
  /// In en, this message translates to:
  /// **'Left 45°'**
  String get left45Short;

  /// Vertex short name
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get vertexShort;

  /// Donor short name
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get donorShort;

  /// Retake required dialog title
  ///
  /// In en, this message translates to:
  /// **'Retake Required'**
  String get retakeRequired;

  /// Retake button text
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get retakeButton;

  /// Analysis waiting for approval message
  ///
  /// In en, this message translates to:
  /// **'Analysis is waiting for doctor approval.'**
  String get analysisWaitingDoctorApproval;

  /// Instruction to write analyze
  ///
  /// In en, this message translates to:
  /// **'Or write \"Analyze\" to start manual analysis'**
  String get orWriteAnalyze;

  /// Analysis completed success message
  ///
  /// In en, this message translates to:
  /// **'✅ Analysis Completed!'**
  String get analysisCompletedSuccess;

  /// Detected angles label
  ///
  /// In en, this message translates to:
  /// **'📐 Detected Angles:'**
  String get detectedAnglesLabel;

  /// Past analyses title
  ///
  /// In en, this message translates to:
  /// **'Past Analyses'**
  String get pastAnalyses;

  /// No saved analyses message
  ///
  /// In en, this message translates to:
  /// **'No saved analyses yet.'**
  String get noSavedAnalyses;

  /// Welcome greeting with name
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeGreeting(String name);

  /// Login required for messaging
  ///
  /// In en, this message translates to:
  /// **'You must sign in to send messages'**
  String get loginRequiredForMessaging;

  /// Chat with doctor button
  ///
  /// In en, this message translates to:
  /// **'Chat with my doctor'**
  String get chatWithMyDoctor;

  /// Analysis saved successfully message
  ///
  /// In en, this message translates to:
  /// **'Analysis saved successfully!'**
  String get analysisSavedSuccessfully;

  /// All photos analyzed and saved message
  ///
  /// In en, this message translates to:
  /// **'All photos have been successfully analyzed and saved.'**
  String get allPhotosAnalyzedAndSaved;

  /// Re-analyzing status
  ///
  /// In en, this message translates to:
  /// **'Re-analyzing...'**
  String get reanalyzing;

  /// Some angles not captured correctly message
  ///
  /// In en, this message translates to:
  /// **'Some angles were not captured correctly'**
  String get someAnglesNotCapturedCorrectly;

  /// Photos uploading status
  ///
  /// In en, this message translates to:
  /// **'Uploading photos...'**
  String get photosUploadingStatus;

  /// Temporary record and analysis screen title
  ///
  /// In en, this message translates to:
  /// **'Temporary Record and Analysis'**
  String get temporaryRecordAndAnalysis;

  /// Captured photos label
  ///
  /// In en, this message translates to:
  /// **'Captured Photos'**
  String get capturedPhotos;

  /// Angles that need retake header
  ///
  /// In en, this message translates to:
  /// **'Angles That Need to Be Retaken:'**
  String get anglesThatNeedRetakeHeader;

  /// My appointments label
  ///
  /// In en, this message translates to:
  /// **'My Appointments'**
  String get myAppointments;

  /// Face detection capture screen title
  ///
  /// In en, this message translates to:
  /// **'Face Detection Capture'**
  String get faceDetectionCapture;

  /// Show face to camera instruction
  ///
  /// In en, this message translates to:
  /// **'Please show your face to the camera'**
  String get showYourFaceToCamera;

  /// Camera could not start error
  ///
  /// In en, this message translates to:
  /// **'Camera could not start: {error}'**
  String cameraCouldNotStart(String error);

  /// Face detected message
  ///
  /// In en, this message translates to:
  /// **'Face detected! Counting starts...'**
  String get faceDetected;

  /// Photo capturing status
  ///
  /// In en, this message translates to:
  /// **'Capturing photo...'**
  String get photoCapturing;

  /// Photo captured status
  ///
  /// In en, this message translates to:
  /// **'Photo captured!'**
  String get photoCaptured;

  /// Photo could not capture error
  ///
  /// In en, this message translates to:
  /// **'Photo could not be captured: {error}'**
  String photoCouldNotCapture(String error);

  /// Photo preparing status
  ///
  /// In en, this message translates to:
  /// **'Photo preparing...'**
  String get photoPreparing;

  /// Photo uploading status
  ///
  /// In en, this message translates to:
  /// **'Photo uploading...'**
  String get photoUploading;

  /// AI analysis in progress status
  ///
  /// In en, this message translates to:
  /// **'AI analysis in progress...'**
  String get aiAnalysisInProgressStatus;

  /// Results saving status
  ///
  /// In en, this message translates to:
  /// **'Saving results...'**
  String get resultsSaving;

  /// Analysis successful message
  ///
  /// In en, this message translates to:
  /// **'Analysis Successful!'**
  String get analysisSuccessful;

  /// Analyze button text
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get analyzeButton;

  /// Update button text
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Confirm cancel appointment message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this appointment?'**
  String get confirmCancelAppointment;

  /// Cancel reason optional label
  ///
  /// In en, this message translates to:
  /// **'Cancel Reason (optional)'**
  String get cancelReasonOptional;

  /// Cancel reason example hint
  ///
  /// In en, this message translates to:
  /// **'E.g.: Personal reasons'**
  String get cancelReasonExample;

  /// Appointment cancelled message
  ///
  /// In en, this message translates to:
  /// **'Appointment cancelled'**
  String get appointmentCancelled;

  /// New appointment title
  ///
  /// In en, this message translates to:
  /// **'New Appointment'**
  String get newAppointment;

  /// Notes optional label
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get notesOptional;

  /// Appointment notes hint
  ///
  /// In en, this message translates to:
  /// **'Notes about the appointment...'**
  String get appointmentNotesHint;

  /// Create appointment button
  ///
  /// In en, this message translates to:
  /// **'Create Appointment'**
  String get createAppointment;

  /// Update appointment title
  ///
  /// In en, this message translates to:
  /// **'Update Appointment'**
  String get updateAppointment;

  /// Current date label
  ///
  /// In en, this message translates to:
  /// **'Current Date:'**
  String get currentDate;

  /// Appointment created waiting approval message
  ///
  /// In en, this message translates to:
  /// **'✅ Appointment created! Waiting for approval.'**
  String get appointmentCreatedWaitingApproval;

  /// Error selecting photo
  ///
  /// In en, this message translates to:
  /// **'An error occurred while selecting photo: {error}'**
  String errorSelectingPhoto(String error);

  /// Please select at least one photo message
  ///
  /// In en, this message translates to:
  /// **'Please select at least one photo'**
  String get pleaseSelectAtLeastOnePhoto;

  /// No valid photo found message
  ///
  /// In en, this message translates to:
  /// **'No valid photo found'**
  String get noValidPhotoFound;

  /// Photos analyzed and saved successfully message
  ///
  /// In en, this message translates to:
  /// **'Photos have been successfully analyzed and saved!'**
  String get photosAnalyzedAndSavedSuccessfully;

  /// All notifications marked as read message
  ///
  /// In en, this message translates to:
  /// **'All notifications marked as read'**
  String get allNotificationsMarkedAsRead;

  /// Select new date label
  ///
  /// In en, this message translates to:
  /// **'Select New Date'**
  String get selectNewDate;

  /// Document default title
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get document;

  /// Default document description
  ///
  /// In en, this message translates to:
  /// **'No description available'**
  String get defaultDocumentDescription;

  /// Download button
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// View document button
  ///
  /// In en, this message translates to:
  /// **'View Document'**
  String get viewDocument;

  /// Contact address title
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get contactAddress;

  /// Contact email title
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// Contact phone title
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhone;

  /// Contact WhatsApp title
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get contactWhatsApp;

  /// Patient care guide title
  ///
  /// In en, this message translates to:
  /// **'Patient Care Guide'**
  String get patientCareGuideTitle;

  /// Planning tab
  ///
  /// In en, this message translates to:
  /// **'Planning'**
  String get planningTab;

  /// Operation tab
  ///
  /// In en, this message translates to:
  /// **'Operation'**
  String get operationTab;

  /// Recovery tab
  ///
  /// In en, this message translates to:
  /// **'Recovery'**
  String get recoveryTab;

  /// Resources tab
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resourcesTab;

  /// Personalized planning section
  ///
  /// In en, this message translates to:
  /// **'Personalized Planning'**
  String get personalizedPlanning;

  /// Contact and quick support section
  ///
  /// In en, this message translates to:
  /// **'Contact & Quick Support'**
  String get contactAndQuickSupport;

  /// Pre-operation preparation section
  ///
  /// In en, this message translates to:
  /// **'Pre-Operation Preparation'**
  String get preOperationPreparation;

  /// Operation day flow section
  ///
  /// In en, this message translates to:
  /// **'Operation Day Flow'**
  String get operationDayFlow;

  /// Operation day experience section
  ///
  /// In en, this message translates to:
  /// **'Operation Day Experience'**
  String get operationDayExperience;

  /// Sterilization and hygiene standards section
  ///
  /// In en, this message translates to:
  /// **'Sterilization & Hygiene Standards'**
  String get sterilizationAndHygieneStandards;

  /// Recovery journey section
  ///
  /// In en, this message translates to:
  /// **'Recovery Journey'**
  String get recoveryJourney;

  /// Post-operation care section
  ///
  /// In en, this message translates to:
  /// **'Post-Operation Care'**
  String get postOperationCare;

  /// Hair washing protocol section
  ///
  /// In en, this message translates to:
  /// **'Hair Washing Protocol'**
  String get hairWashingProtocol;

  /// Knowledge base section
  ///
  /// In en, this message translates to:
  /// **'Knowledge Base'**
  String get knowledgeBase;

  /// Frequently asked questions section
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get frequentlyAskedQuestions;

  /// Visual guide section
  ///
  /// In en, this message translates to:
  /// **'Visual Guide'**
  String get visualGuide;

  /// Tap to see details hint
  ///
  /// In en, this message translates to:
  /// **'Tap to see details'**
  String get tapToSeeDetails;

  /// Connection cannot be opened error
  ///
  /// In en, this message translates to:
  /// **'Connection cannot be opened'**
  String get connectionCannotOpen;

  /// Please enter doctor email error
  ///
  /// In en, this message translates to:
  /// **'Please enter your doctor email'**
  String get pleaseEnterDoctorEmail;

  /// Email and code required error
  ///
  /// In en, this message translates to:
  /// **'Email and code are required'**
  String get emailAndCodeRequired;

  /// Code must be 6 digits error
  ///
  /// In en, this message translates to:
  /// **'Code must be 6 digits'**
  String get codeMustBe6Digits;

  /// Code invalid or expired error
  ///
  /// In en, this message translates to:
  /// **'Code is invalid or expired. Please check console logs.'**
  String get codeInvalidOrExpired;

  /// Verification failed error
  ///
  /// In en, this message translates to:
  /// **'Verification failed: {error}'**
  String verificationFailed(String error);

  /// Doctor login description
  ///
  /// In en, this message translates to:
  /// **'Enter your registered doctor email, request verification code and login.'**
  String get doctorLoginDescription;

  /// Doctor email label
  ///
  /// In en, this message translates to:
  /// **'Doctor Email'**
  String get doctorEmail;

  /// Doctor email hint
  ///
  /// In en, this message translates to:
  /// **'doctor@example.com'**
  String get doctorEmailHint;

  /// Verification code label
  ///
  /// In en, this message translates to:
  /// **'6-Digit Verification Code'**
  String get verificationCode;

  /// Verification code hint
  ///
  /// In en, this message translates to:
  /// **'000000'**
  String get verificationCodeHint;

  /// Sending status
  ///
  /// In en, this message translates to:
  /// **'Sending...'**
  String get sending;

  /// Request code button
  ///
  /// In en, this message translates to:
  /// **'Request Code'**
  String get requestCode;

  /// Login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Messages label
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get message;

  /// Photos label
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photo;

  /// Patient ID not found error
  ///
  /// In en, this message translates to:
  /// **'Patient ID not found'**
  String get patientIdNotFound;

  /// Analyses label
  ///
  /// In en, this message translates to:
  /// **'Analyses'**
  String get analyses;

  /// Approved status
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// Rejected status
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// Example photo front title
  ///
  /// In en, this message translates to:
  /// **'Front View Example'**
  String get examplePhotoFrontTitle;

  /// Example photo front instructions
  ///
  /// In en, this message translates to:
  /// **'Look straight at the camera'**
  String get examplePhotoFrontInstructions;

  /// Example photo right 45 title
  ///
  /// In en, this message translates to:
  /// **'Right 45° View Example'**
  String get examplePhotoRight45Title;

  /// Example photo right 45 instructions
  ///
  /// In en, this message translates to:
  /// **'Turn your head 45° to the right'**
  String get examplePhotoRight45Instructions;

  /// Example photo left 45 title
  ///
  /// In en, this message translates to:
  /// **'Left 45° View Example'**
  String get examplePhotoLeft45Title;

  /// Example photo left 45 instructions
  ///
  /// In en, this message translates to:
  /// **'Turn your head 45° to the left'**
  String get examplePhotoLeft45Instructions;

  /// Example photo vertex title
  ///
  /// In en, this message translates to:
  /// **'Top View Example'**
  String get examplePhotoVertexTitle;

  /// Example photo vertex instructions
  ///
  /// In en, this message translates to:
  /// **'Hold phone above your head'**
  String get examplePhotoVertexInstructions;

  /// Example photo donor title
  ///
  /// In en, this message translates to:
  /// **'Back View Example'**
  String get examplePhotoDonorTitle;

  /// Example photo donor instructions
  ///
  /// In en, this message translates to:
  /// **'Move phone behind your head'**
  String get examplePhotoDonorInstructions;

  /// Camera option
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Gallery option
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// Delete for me option
  ///
  /// In en, this message translates to:
  /// **'Delete for Me'**
  String get deleteForMe;

  /// Message deleted notification
  ///
  /// In en, this message translates to:
  /// **'Message deleted'**
  String get messageDeleted;

  /// Delete for everyone option
  ///
  /// In en, this message translates to:
  /// **'Delete for Everyone'**
  String get deleteForEveryone;

  /// Delete message dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Message'**
  String get deleteMessage;

  /// Delete message read warning
  ///
  /// In en, this message translates to:
  /// **'This message has been read by the recipient. Do you want to delete it anyway?'**
  String get deleteMessageReadWarning;

  /// Delete message confirmation
  ///
  /// In en, this message translates to:
  /// **'This message will be deleted for everyone. Are you sure?'**
  String get deleteMessageConfirm;

  /// Message deleted for everyone notification
  ///
  /// In en, this message translates to:
  /// **'Message deleted for everyone'**
  String get messageDeletedForEveryone;

  /// User not logged in error
  ///
  /// In en, this message translates to:
  /// **'User is not logged in'**
  String get userNotLoggedIn;

  /// Messages loading error
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading messages'**
  String get messagesLoadingError;

  /// Loading messages status
  ///
  /// In en, this message translates to:
  /// **'Loading messages...'**
  String get loadingMessages;

  /// Start conversation message
  ///
  /// In en, this message translates to:
  /// **'Start a conversation by sending a message'**
  String get startConversation;

  /// Load older messages button
  ///
  /// In en, this message translates to:
  /// **'Load Older Messages'**
  String get loadOlderMessages;

  /// Send photo tooltip
  ///
  /// In en, this message translates to:
  /// **'Send Photo'**
  String get sendPhoto;

  /// Appointment management title
  ///
  /// In en, this message translates to:
  /// **'Appointment Management'**
  String get appointmentManagement;

  /// Pending approval status
  ///
  /// In en, this message translates to:
  /// **'Pending Approval'**
  String get pendingApproval;

  /// Cancelled status
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// Photos with count
  ///
  /// In en, this message translates to:
  /// **'Photos ({count})'**
  String photos(String count);

  /// Need login for analysis message
  ///
  /// In en, this message translates to:
  /// **'You need to login for analysis'**
  String get needLoginForAnalysis;

  /// Open capture flow error
  ///
  /// In en, this message translates to:
  /// **'An error occurred while opening capture screen: {error}'**
  String openCaptureFlowError(String error);

  /// Session expired message
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please login again.'**
  String get sessionExpired;

  /// Photos analyzed and saved message
  ///
  /// In en, this message translates to:
  /// **'Photos have been successfully analyzed and saved!'**
  String get photosAnalyzedAndSaved;

  /// Photo not found for analysis message
  ///
  /// In en, this message translates to:
  /// **'No photos found for analysis'**
  String get photoNotFoundForAnalysis;

  /// No valid photos found message
  ///
  /// In en, this message translates to:
  /// **'No valid photos found'**
  String get noValidPhotosFound;

  /// Analysis preparing status
  ///
  /// In en, this message translates to:
  /// **'Preparing photos...'**
  String get analysisPreparing;

  /// Photos uploading status
  ///
  /// In en, this message translates to:
  /// **'Uploading photos...'**
  String get photosUploading;

  /// Error uploading photos
  ///
  /// In en, this message translates to:
  /// **'An error occurred while uploading photos'**
  String get errorUploadingPhotos;

  /// Gemini checking status
  ///
  /// In en, this message translates to:
  /// **'Checking Gemini API connection...'**
  String get geminiChecking;

  /// Gemini failed error
  ///
  /// In en, this message translates to:
  /// **'Gemini API connection failed. Please check your internet connection.'**
  String get geminiFailed;

  /// AI analyzing status
  ///
  /// In en, this message translates to:
  /// **'AI analysis in progress...'**
  String get aiAnalyzing;

  /// Some angles need retake message
  ///
  /// In en, this message translates to:
  /// **'Some angles need to be retaken...'**
  String get someAnglesNeedRetake;

  /// Analysis saved message
  ///
  /// In en, this message translates to:
  /// **'Analysis saved successfully!'**
  String get analysisSaved;

  /// Analysis completed successfully message
  ///
  /// In en, this message translates to:
  /// **'Analysis completed successfully!'**
  String get analysisCompletedSuccessfully;

  /// Invalid angles count need retake
  ///
  /// In en, this message translates to:
  /// **'{count} angles need to be retaken...'**
  String invalidAnglesCountNeedRetake(String count);

  /// Error during analysis
  ///
  /// In en, this message translates to:
  /// **'An error occurred during analysis'**
  String get errorDuringAnalysis;

  /// Gemini API error
  ///
  /// In en, this message translates to:
  /// **'Gemini API connection error. Please check your internet connection.'**
  String get geminiApiError;

  /// Firebase error
  ///
  /// In en, this message translates to:
  /// **'Firebase connection error. Please try again.'**
  String get firebaseError;

  /// Photo processing error
  ///
  /// In en, this message translates to:
  /// **'Photo processing error. Please try again.'**
  String get photoProcessingError;

  /// Auth error login again
  ///
  /// In en, this message translates to:
  /// **'Authorization error. Please login again.'**
  String get authErrorLoginAgain;

  /// Analysis successful title
  ///
  /// In en, this message translates to:
  /// **'Analysis Successful'**
  String get analysisSuccessfulTitle;

  /// Analysis results title
  ///
  /// In en, this message translates to:
  /// **'Analysis Results'**
  String get analysisResultsTitle;

  /// Detailed analysis header
  ///
  /// In en, this message translates to:
  /// **'Detailed Analysis:'**
  String get detailedAnalysisHeader;

  /// Retake required angles header
  ///
  /// In en, this message translates to:
  /// **'Angles That Need Retake:'**
  String get retakeRequiredAnglesHeader;

  /// Dialog error
  ///
  /// In en, this message translates to:
  /// **'An error occurred while opening dialog: {error}'**
  String dialogError(String error);

  /// Baseline photo not found error
  ///
  /// In en, this message translates to:
  /// **'Baseline photo not found'**
  String get baselinePhotoNotFound;

  /// No photos to update error
  ///
  /// In en, this message translates to:
  /// **'No photos to update found'**
  String get noPhotosToUpdate;

  /// Analysis error during retake
  ///
  /// In en, this message translates to:
  /// **'An error occurred during retake analysis: {error}'**
  String analysisErrorDuringRetake(String error);

  /// Retake error
  ///
  /// In en, this message translates to:
  /// **'An error occurred during retake: {error}'**
  String retakeError(String error);

  /// AI support label
  ///
  /// In en, this message translates to:
  /// **'AI Support'**
  String get aiSupport;

  /// My photos label
  ///
  /// In en, this message translates to:
  /// **'My Photos'**
  String get myPhotos;

  /// Photo analysis chatbot label
  ///
  /// In en, this message translates to:
  /// **'Photo Analysis Chatbot'**
  String get photoAnalysisChatbot;

  /// Disable medication reminder label
  ///
  /// In en, this message translates to:
  /// **'Disable Medication Reminder'**
  String get disableMedicationReminder;

  /// Medication reminder disabled message
  ///
  /// In en, this message translates to:
  /// **'Daily medication reminder has been disabled'**
  String get medicationReminderDisabled;

  /// Medication time label
  ///
  /// In en, this message translates to:
  /// **'Medication Time'**
  String get medicationTime;

  /// Select medication reminder time title
  ///
  /// In en, this message translates to:
  /// **'Select Daily Medication Reminder Time'**
  String get selectMedicationReminderTime;

  /// Select medication time help text
  ///
  /// In en, this message translates to:
  /// **'Select Medication Time'**
  String get selectMedicationTime;

  /// Medication reminder set at message
  ///
  /// In en, this message translates to:
  /// **'Daily medication reminder set for {time}'**
  String medicationReminderSetAt(String time);

  /// No date info message
  ///
  /// In en, this message translates to:
  /// **'No date information'**
  String get noDateInfo;

  /// Invalid date message
  ///
  /// In en, this message translates to:
  /// **'Invalid date'**
  String get invalidDate;

  /// Today label
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Yesterday label
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// Valid status
  ///
  /// In en, this message translates to:
  /// **'Valid'**
  String get valid;

  /// Same person status
  ///
  /// In en, this message translates to:
  /// **'Same person'**
  String get samePerson;

  /// Different person suspicion status
  ///
  /// In en, this message translates to:
  /// **'Different person suspicion'**
  String get differentPersonSuspicion;

  /// Logout confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmation;

  /// Profile settings title
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get profileSettings;

  /// Specialty label
  ///
  /// In en, this message translates to:
  /// **'Specialty'**
  String get specialty;

  /// Hair transplant page title
  ///
  /// In en, this message translates to:
  /// **'Hair Transplant'**
  String get hairTransplantTitle;

  /// Hair transplant section count label
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get hairTransplantSectionCount;

  /// Hair transplant video label
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get hairTransplantVideo;

  /// Hair transplant free consultation button
  ///
  /// In en, this message translates to:
  /// **'Get Free Consultation'**
  String get hairTransplantFreeConsultation;

  /// Hair transplant watch video button
  ///
  /// In en, this message translates to:
  /// **'Watch Video'**
  String get hairTransplantWatchVideo;

  /// Hair transplant watch video subtitle
  ///
  /// In en, this message translates to:
  /// **'Watch the hair transplant procedure video'**
  String get hairTransplantWatchVideoSubtitle;

  /// Photos saved successfully message
  ///
  /// In en, this message translates to:
  /// **'Photos saved successfully!'**
  String get photosSavedSuccessfully;

  /// Error during retake
  ///
  /// In en, this message translates to:
  /// **'An error occurred during retake: {error}'**
  String errorDuringRetake(String error);

  /// Error opening capture screen
  ///
  /// In en, this message translates to:
  /// **'An error occurred while opening capture screen: {error}'**
  String errorOpeningCaptureScreen(String error);

  /// Error during analysis short
  ///
  /// In en, this message translates to:
  /// **'Error during analysis: {error}'**
  String errorDuringAnalysisShort(String error);

  /// My documents title
  ///
  /// In en, this message translates to:
  /// **'My Documents'**
  String get myDocuments;

  /// Login required for documents
  ///
  /// In en, this message translates to:
  /// **'You need to login to view documents'**
  String get loginRequiredForDocuments;

  /// No documents yet message
  ///
  /// In en, this message translates to:
  /// **'No documents yet'**
  String get noDocumentsYet;

  /// Error occurred with new line
  ///
  /// In en, this message translates to:
  /// **'An error occurred:\n{error}'**
  String errorOccurredWithNewLine(String error);

  /// Date pending status
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get datePending;

  /// Chat support welcome message
  ///
  /// In en, this message translates to:
  /// **'Hello! I\'m your AI assistant. How can I help you today?'**
  String get chatSupportWelcomeMessage;

  /// New chat button
  ///
  /// In en, this message translates to:
  /// **'New Chat'**
  String get newChat;

  /// Chat support AI assistant name
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get chatSupportAiAssistantName;

  /// History tooltip
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTooltip;

  /// Typing indicator
  ///
  /// In en, this message translates to:
  /// **'AI is typing...'**
  String get typingIndicator;

  /// Chat history title
  ///
  /// In en, this message translates to:
  /// **'Chat History'**
  String get chatHistoryTitle;

  /// No saved chats message
  ///
  /// In en, this message translates to:
  /// **'No saved chats'**
  String get noSavedChats;

  /// Generic error try again
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.\nError: {error}'**
  String genericErrorTryAgain(String error);

  /// WhatsApp cannot open message
  ///
  /// In en, this message translates to:
  /// **'WhatsApp could not be opened. Please make sure the WhatsApp app is installed.'**
  String get whatsappCannotOpen;

  /// WhatsApp open error
  ///
  /// In en, this message translates to:
  /// **'An error occurred while opening WhatsApp: {error}'**
  String whatsappOpenError(String error);

  /// Open capture screen error
  ///
  /// In en, this message translates to:
  /// **'An error occurred while opening the capture screen: {error}'**
  String openCaptureScreenError(String error);

  /// Retake analyzing status
  ///
  /// In en, this message translates to:
  /// **'The retaken photo is being analyzed...'**
  String get retakeAnalyzing;

  /// Auto analysis on
  ///
  /// In en, this message translates to:
  /// **'Auto Analysis: On'**
  String get autoAnalysisOn;

  /// Auto analysis off
  ///
  /// In en, this message translates to:
  /// **'Auto Analysis: Off'**
  String get autoAnalysisOff;

  /// Clear photos tooltip
  ///
  /// In en, this message translates to:
  /// **'Clear photos'**
  String get clearPhotosTooltip;

  /// Message hint analyze
  ///
  /// In en, this message translates to:
  /// **'Type your message or write \"Analyze\"...'**
  String get messageHintAnalyze;

  /// Send button
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// AI assistant name
  ///
  /// In en, this message translates to:
  /// **'AI Analysis Assistant'**
  String get aiAssistantName;

  /// Expert team title
  ///
  /// In en, this message translates to:
  /// **'Expert Team'**
  String get expertTeam;

  /// Expert team description
  ///
  /// In en, this message translates to:
  /// **'Our team consists of experienced specialists in hair transplant surgery.'**
  String get expertTeamDescription;

  /// Coming soon message
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// Login to send message
  ///
  /// In en, this message translates to:
  /// **'Please login to send a message'**
  String get loginToSendMessage;

  /// Doctor email missing
  ///
  /// In en, this message translates to:
  /// **'Doctor email is missing'**
  String get doctorEmailMissing;

  /// Doctor not found
  ///
  /// In en, this message translates to:
  /// **'Doctor {name} not found'**
  String doctorNotFound(String name);

  /// Messaging coming soon
  ///
  /// In en, this message translates to:
  /// **'Messaging feature coming soon'**
  String get messagingComingSoon;

  /// Years text
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// Watch washing video button
  ///
  /// In en, this message translates to:
  /// **'Watch Washing Video'**
  String get watchWashingVideo;

  /// No description provided for @preCareTip1Title.
  ///
  /// In en, this message translates to:
  /// **'Choose the right surgeon'**
  String get preCareTip1Title;

  /// No description provided for @preCareTip1Body.
  ///
  /// In en, this message translates to:
  /// **'Sapphire FUE procedure requires an experienced surgeon and multidisciplinary team. Work with doctors who realistically explain your expectations, plan the operation end-to-end, and apply Smile Hair protocols.'**
  String get preCareTip1Body;

  /// No description provided for @preCareTip2Title.
  ///
  /// In en, this message translates to:
  /// **'Share your medical history'**
  String get preCareTip2Title;

  /// No description provided for @preCareTip2Body.
  ///
  /// In en, this message translates to:
  /// **'Share your chronic diseases, regular medications, and allergies with the team without hiding. This minimizes risks that may occur during anesthesia and surgery.'**
  String get preCareTip2Body;

  /// No description provided for @preCareTip3Title.
  ///
  /// In en, this message translates to:
  /// **'Blood thinners and approval process'**
  String get preCareTip3Title;

  /// No description provided for @preCareTip3Body.
  ///
  /// In en, this message translates to:
  /// **'Stop aspirin or similar blood thinners at least one week before the operation date with your prescribing doctor\'s approval. You can resume use two days after the procedure.'**
  String get preCareTip3Body;

  /// No description provided for @preCareTip4Title.
  ///
  /// In en, this message translates to:
  /// **'Infection screening'**
  String get preCareTip4Title;

  /// No description provided for @preCareTip4Body.
  ///
  /// In en, this message translates to:
  /// **'Keep your Hepatitis B/C and HIV test results up to date. Clinics without proper operating room conditions cannot perform operations for these infections, so your trip won\'t be wasted.'**
  String get preCareTip4Body;

  /// No description provided for @preCareTip5Title.
  ///
  /// In en, this message translates to:
  /// **'Supplements and vitamins'**
  String get preCareTip5Title;

  /// No description provided for @preCareTip5Body.
  ///
  /// In en, this message translates to:
  /// **'Supplements containing vitamins B and E increase bleeding; stop them one week before the procedure. If necessary, your doctor will plan supportive treatments.'**
  String get preCareTip5Body;

  /// No description provided for @preCareTip6Title.
  ///
  /// In en, this message translates to:
  /// **'Alcohol and smoking'**
  String get preCareTip6Title;

  /// No description provided for @preCareTip6Body.
  ///
  /// In en, this message translates to:
  /// **'Stop alcohol at least one week before the operation and do not consume it for 14 days after the procedure. Stay away from smoking 12 hours before and for two weeks after the operation, as it disrupts blood circulation.'**
  String get preCareTip6Body;

  /// No description provided for @preCareTip7Title.
  ///
  /// In en, this message translates to:
  /// **'Luggage and clothing plan'**
  String get preCareTip7Title;

  /// No description provided for @preCareTip7Body.
  ///
  /// In en, this message translates to:
  /// **'Choose buttoned or zippered clothing for your upper body. Tight-necked clothing can damage grafts. Prepare a large bag that can carry the care kit given after the operation.'**
  String get preCareTip7Body;

  /// No description provided for @preCareTip8Title.
  ///
  /// In en, this message translates to:
  /// **'Rest and hygiene'**
  String get preCareTip8Title;

  /// No description provided for @preCareTip8Body.
  ///
  /// In en, this message translates to:
  /// **'Get good sleep on the operation day, have a nutritious breakfast, and shower before coming to the clinic. Clean scalp reduces infection risk.'**
  String get preCareTip8Body;

  /// No description provided for @postCareTip1Title.
  ///
  /// In en, this message translates to:
  /// **'Protect the grafts'**
  String get postCareTip1Title;

  /// No description provided for @postCareTip1Body.
  ///
  /// In en, this message translates to:
  /// **'For the first 7 days, be careful not to hit your head anywhere. Sleep on your back using a neck pillow and prevent grafts from rubbing against the pillow.'**
  String get postCareTip1Body;

  /// No description provided for @postCareTip2Title.
  ///
  /// In en, this message translates to:
  /// **'First night and following days'**
  String get postCareTip2Title;

  /// No description provided for @postCareTip2Body.
  ///
  /// In en, this message translates to:
  /// **'Definitely spend the first night after the operation resting. If you need to go out, use an umbrella that protects from sun and rain.'**
  String get postCareTip2Body;

  /// No description provided for @postCareTip3Title.
  ///
  /// In en, this message translates to:
  /// **'Stick to the medication plan'**
  String get postCareTip3Title;

  /// No description provided for @postCareTip3Body.
  ///
  /// In en, this message translates to:
  /// **'Use antibiotics, painkillers, anti-inflammatory, and Panthenol spray exactly as prescribed. Make sure you understand the prescription and usage instructions before leaving the clinic team.'**
  String get postCareTip3Body;

  /// No description provided for @postCareTip4Title.
  ///
  /// In en, this message translates to:
  /// **'Moisturizing and sprays'**
  String get postCareTip4Title;

  /// No description provided for @postCareTip4Body.
  ///
  /// In en, this message translates to:
  /// **'Use only the given isotonic/Panthenol spray until the first wash. Apply antibiotic cream to the donor area for the first 5-7 days.'**
  String get postCareTip4Body;

  /// No description provided for @postCareTip5Title.
  ///
  /// In en, this message translates to:
  /// **'Washing protocol'**
  String get postCareTip5Title;

  /// No description provided for @postCareTip5Body.
  ///
  /// In en, this message translates to:
  /// **'The first wash is done at the clinic 48 hours later. Every day after, gently apply the foam with patting movements, use low-pressure warm water, and dry with paper towels.'**
  String get postCareTip5Body;

  /// No description provided for @postCareTip6Title.
  ///
  /// In en, this message translates to:
  /// **'Scabs and shock loss'**
  String get postCareTip6Title;

  /// No description provided for @postCareTip6Body.
  ///
  /// In en, this message translates to:
  /// **'From day 10, remove scabs with light pressure. Shock loss experienced between weeks 2-4 is normal; new hair becomes visible from month 3.'**
  String get postCareTip6Body;

  /// No description provided for @postCareTip7Title.
  ///
  /// In en, this message translates to:
  /// **'Activity and sports'**
  String get postCareTip7Title;

  /// No description provided for @postCareTip7Body.
  ///
  /// In en, this message translates to:
  /// **'Do not do sports for the first two weeks, you can do light walking after 3-4 days. Avoid pool, sauna, and activities that require heavy sweating for at least 1 month.'**
  String get postCareTip7Body;

  /// No description provided for @postCareTip8Title.
  ///
  /// In en, this message translates to:
  /// **'Comfort complaints'**
  String get postCareTip8Title;

  /// No description provided for @postCareTip8Body.
  ///
  /// In en, this message translates to:
  /// **'If there is burning or pain in the donor area, use steroid-containing cream with clinic approval. Apply cold compresses briefly for swelling.'**
  String get postCareTip8Body;

  /// No description provided for @operationDayTimeline1Title.
  ///
  /// In en, this message translates to:
  /// **'Accommodation and transfer'**
  String get operationDayTimeline1Title;

  /// No description provided for @operationDayTimeline1Body.
  ///
  /// In en, this message translates to:
  /// **'Smile Gentle Care team arranges 4-5 star hotel accommodation. All transportation is planned from arrival at the hotel to transfers to the clinic.'**
  String get operationDayTimeline1Body;

  /// No description provided for @operationDayTimeline2Title.
  ///
  /// In en, this message translates to:
  /// **'Multilingual support'**
  String get operationDayTimeline2Title;

  /// No description provided for @operationDayTimeline2Body.
  ///
  /// In en, this message translates to:
  /// **'Professional translators are provided for patients from different countries around the world. You are informed in your own language at every step of the process.'**
  String get operationDayTimeline2Body;

  /// No description provided for @operationDayTimeline3Title.
  ///
  /// In en, this message translates to:
  /// **'Pre-operation preparation'**
  String get operationDayTimeline3Title;

  /// No description provided for @operationDayTimeline3Body.
  ///
  /// In en, this message translates to:
  /// **'Information forms are signed, your hairline is drawn, photos are taken, and HIV/HBV/HCV tests and vital signs are checked.'**
  String get operationDayTimeline3Body;

  /// No description provided for @operationDayTimeline4Title.
  ///
  /// In en, this message translates to:
  /// **'Operation flow'**
  String get operationDayTimeline4Title;

  /// No description provided for @operationDayTimeline4Body.
  ///
  /// In en, this message translates to:
  /// **'Steps of the 6-8 hour procedure: planning, graft harvesting, channel opening, and implantation. Your doctors share the entire process with you.'**
  String get operationDayTimeline4Body;

  /// No description provided for @operationDayTimeline5Title.
  ///
  /// In en, this message translates to:
  /// **'Lunch and special preferences'**
  String get operationDayTimeline5Title;

  /// No description provided for @operationDayTimeline5Body.
  ///
  /// In en, this message translates to:
  /// **'Vegetarian, halal, or kosher menus are prepared upon request. Smart TV and music options are available in operation areas.'**
  String get operationDayTimeline5Body;

  /// No description provided for @operationDayTimeline6Title.
  ///
  /// In en, this message translates to:
  /// **'Next day care'**
  String get operationDayTimeline6Title;

  /// No description provided for @operationDayTimeline6Body.
  ///
  /// In en, this message translates to:
  /// **'You come to the clinic for bandage change, wound check, and first wash training. Afterwards, the process is monitored with digital photo tracking.'**
  String get operationDayTimeline6Body;

  /// No description provided for @sterilizationMeasure1.
  ///
  /// In en, this message translates to:
  /// **'Daily vacuum leak tests are performed to check the seal integrity of sterilizers.'**
  String get sterilizationMeasure1;

  /// No description provided for @sterilizationMeasure2.
  ///
  /// In en, this message translates to:
  /// **'Daily verification is done with Bowie-Dick test to ensure steam reaches all surfaces equally.'**
  String get sterilizationMeasure2;

  /// No description provided for @sterilizationMeasure3.
  ///
  /// In en, this message translates to:
  /// **'Ultrasonic washing tests document that we clean micro residues.'**
  String get sterilizationMeasure3;

  /// No description provided for @sterilizationMeasure4.
  ///
  /// In en, this message translates to:
  /// **'Biological indicator tests are performed every 15 days and it is reported that there is no reproduction.'**
  String get sterilizationMeasure4;

  /// No description provided for @sterilizationMeasure5.
  ///
  /// In en, this message translates to:
  /// **'Sterile and used instruments are stored separately in locked boxes; cross-contamination is prevented.'**
  String get sterilizationMeasure5;

  /// No description provided for @sterilizationMeasure6.
  ///
  /// In en, this message translates to:
  /// **'Each set is tracked with autoclave number, date, and expiration date labels.'**
  String get sterilizationMeasure6;

  /// No description provided for @sterilizationMeasure7.
  ///
  /// In en, this message translates to:
  /// **'All processes are carried out according to Ministry of Health DAS Guide, WHO and AAMI ST79 standards.'**
  String get sterilizationMeasure7;

  /// No description provided for @washStep1.
  ///
  /// In en, this message translates to:
  /// **'Do not wash your hair for the first 36-48 hours after the operation; wait for the first wash to be done at the clinic.'**
  String get washStep1;

  /// No description provided for @washStep2.
  ///
  /// In en, this message translates to:
  /// **'Apply lotion or foam to both donor and recipient areas with your fingertips in patting movements.'**
  String get washStep2;

  /// No description provided for @washStep3.
  ///
  /// In en, this message translates to:
  /// **'Foam the shampoo and gently spread it to the transplanted area with vertical touches; avoid circular movements.'**
  String get washStep3;

  /// No description provided for @washStep4.
  ///
  /// In en, this message translates to:
  /// **'Use warm and low-pressure water. For the first 14 days, it is safer to pour water with a bowl instead of a shower head.'**
  String get washStep4;

  /// No description provided for @washStep5.
  ///
  /// In en, this message translates to:
  /// **'Dry the graft area by gently pressing with paper towels, you can dry the donor area with a normal towel.'**
  String get washStep5;

  /// No description provided for @washStep6.
  ///
  /// In en, this message translates to:
  /// **'If you need to use a hair dryer, use it only in cold mode and from a distance.'**
  String get washStep6;

  /// No description provided for @faq1Question.
  ///
  /// In en, this message translates to:
  /// **'How long does recovery take?'**
  String get faq1Question;

  /// No description provided for @faq1Answer.
  ///
  /// In en, this message translates to:
  /// **'The first two weeks are a sensitive period; hair goes through different stages for 6-12 months. Significant results are seen at month 6, final density at months 12-18.'**
  String get faq1Answer;

  /// No description provided for @faq2Question.
  ///
  /// In en, this message translates to:
  /// **'How should bandage and sleep schedule be?'**
  String get faq2Question;

  /// No description provided for @faq2Answer.
  ///
  /// In en, this message translates to:
  /// **'Elastic bandage can be applied to reduce swelling in the forehead area. Sleep on your back with a neck pillow in a slightly elevated position for the first 7-10 days.'**
  String get faq2Answer;

  /// No description provided for @faq3Question.
  ///
  /// In en, this message translates to:
  /// **'Shower, washing and product use'**
  String get faq3Question;

  /// No description provided for @faq3Answer.
  ///
  /// In en, this message translates to:
  /// **'Do not wet your hair for the first two days. After 48 hours, wash once a day with medical shampoo after the first wash at the clinic; keep shower time short, reduce steam.'**
  String get faq3Answer;

  /// No description provided for @faq4Question.
  ///
  /// In en, this message translates to:
  /// **'When can I dry, comb, or dye my hair?'**
  String get faq4Question;

  /// No description provided for @faq4Answer.
  ///
  /// In en, this message translates to:
  /// **'Only natural drying is recommended within the first month. You can comb the donor area but do not touch the transplant area for 2 weeks. Stay away from chemical dyes for 6-8 weeks.'**
  String get faq4Answer;

  /// No description provided for @faq5Question.
  ///
  /// In en, this message translates to:
  /// **'Smoking, alcohol and exercise'**
  String get faq5Question;

  /// No description provided for @faq5Answer.
  ///
  /// In en, this message translates to:
  /// **'Smoking is prohibited 12 hours before and 2 weeks after the operation. Alcohol should not be used for the first 14 days. Light walks are allowed after day 4, wait 1 month for heavy sports.'**
  String get faq5Answer;

  /// No description provided for @faq6Question.
  ///
  /// In en, this message translates to:
  /// **'Hat, sun, travel and return to work'**
  String get faq6Question;

  /// No description provided for @faq6Answer.
  ///
  /// In en, this message translates to:
  /// **'Do not wear a hat for the first 10 days or prefer very loose models. Avoid direct sun. You can return to office work within 3-5 days; wait 2 weeks for physical work. You can travel but protect the grafts.'**
  String get faq6Answer;

  /// No description provided for @heroCardSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Smile Hair team manages the entire process for you, from pre-operation evaluation to travel planning.'**
  String get heroCardSubtitle1;

  /// No description provided for @heroCardSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Experience a comfortable experience with transfers, translator support and sterile operating rooms.'**
  String get heroCardSubtitle2;

  /// No description provided for @heroCardSubtitle3.
  ///
  /// In en, this message translates to:
  /// **'Safely protect grafts with planned medication use, proper washing and movement restrictions.'**
  String get heroCardSubtitle3;

  /// No description provided for @heroCardSubtitle4.
  ///
  /// In en, this message translates to:
  /// **'Track the entire process with frequently asked questions, visuals and digital guides.'**
  String get heroCardSubtitle4;

  /// Image banner caption for washing
  ///
  /// In en, this message translates to:
  /// **'Apply gentle care with the shampoo and lotions given to you from the first wash.'**
  String get imageBannerCaption1;

  /// Clinic physical address
  ///
  /// In en, this message translates to:
  /// **'Tatlısu, Alptekin Cd. No:15, 34774 Ümraniye/İstanbul, Turkey'**
  String get clinicAddress;

  /// Email subject for contact form
  ///
  /// In en, this message translates to:
  /// **'Smile Hair Clinic Contact'**
  String get emailSubject;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'es',
        'fr',
        'he',
        'it',
        'en',
        'pt',
        'ru',
        'sq',
        'tr'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'it':
      return AppLocalizationsIt();
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sq':
      return AppLocalizationsSq();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
