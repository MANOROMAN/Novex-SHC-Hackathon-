import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'package:self_capture/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
// import removed: seed helpers not used at startup

// Import screens - NEW MODERN DESIGNS
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/chat_support_screen.dart';
import 'screens/photo_analysis_chat_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/clinic_profile_screen.dart';
import 'screens/upload_and_analyze_screen.dart';
import 'screens/face_detection_multi_angle_capture_screen.dart';
import 'screens/past_analyses_history_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/terms_of_service_screen.dart';
import 'screens/doctors_screen.dart';
import 'screens/about_us_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/online_consultation_screen.dart';
import 'screens/hair_transplant_list_screen.dart';
import 'screens/treatment_history_screen.dart';
import 'screens/documents_screen.dart';
import 'screens/invoices_screen.dart';
import 'screens/support_center_screen.dart';
import 'screens/patient_care_screen.dart';
import 'screens/email_verification_screen.dart';
import 'screens/doctor_login_screen.dart';
// import removed: old doctor dashboard
import 'screens/doctor_dashboard_shell.dart';
import 'screens/doctor_chat_screen.dart';
import 'screens/doctor_patient_detail_screen.dart';
import 'screens/doctor_image_viewer_screen.dart';
import 'screens/patient_detail_screen.dart';
// import removed: seed screen is not part of initial flow

// Import screens - Still using old designs (will update later)
import 'screens/patient_dashboard_screen.dart';
import 'screens/photo_capture_screen.dart';
import 'screens/capture_flow_screen.dart';
import 'screens/chat_conversation_screen.dart';
import 'screens/patient_messages_screen.dart';
import 'screens/patient_appointments_screen.dart';
import 'screens/doctor_appointments_screen.dart';
import 'theme/app_theme.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Global error handler - Unhandled exception'ları yakala
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('Flutter Error: ${details.exception}');
    debugPrint('Stack trace: ${details.stack}');
  };

  // Platform exception handler
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Platform Error: $error');
    debugPrint('Stack trace: $stack');
    return true; // Error handled
  };

  // Firebase başlat
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase App Check - Debug provider ile aktif (Sadece Android)
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  // Seed flow removed before splash

  // Hide system navigation bars for immersive experience
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  // Lock screen orientation to portrait only (prevent design breaks)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(SelfCaptureApp(key: SelfCaptureApp.navigatorKey));
}

class SelfCaptureApp extends StatefulWidget {
  const SelfCaptureApp({super.key});

  @override
  State<SelfCaptureApp> createState() => SelfCaptureAppState();
  
  static final GlobalKey<SelfCaptureAppState> navigatorKey = GlobalKey<SelfCaptureAppState>();
}

class SelfCaptureAppState extends State<SelfCaptureApp> with WidgetsBindingObserver {

  AppThemeMode _appThemeMode = AppThemeMode.light; // Varsayılan aydınlık tema
  Locale _locale = const Locale('tr');
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadThemePreference();
    _loadLocalePreference();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    // Sadece uygulama tamamen kapatılırken otomatik çıkış yap
    if (state == AppLifecycleState.detached) {
      _signOutOnExit();
    }
  }

  Future<void> _signOutOnExit() async {
    try {
      // AuthService ile çıkış yap
      final authService = AuthService();
      if (authService.isAuthenticated) {
        await authService.signOut();
      }
      
      debugPrint('✅ Uygulama kapatılırken otomatik çıkış yapıldı');
    } catch (e) {
      debugPrint('❌ Otomatik çıkış hatası: $e');
    }
  }

  Future<void> _loadThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeIndex = prefs.getInt('theme_mode');
      if (themeModeIndex != null && themeModeIndex >= 0 && themeModeIndex < AppThemeMode.values.length) {
        setState(() {
          _appThemeMode = AppThemeMode.values[themeModeIndex];
        });
      }
    } catch (e) {
      // Hata durumunda varsayılan aydınlık tema kullan
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _saveThemePreference(AppThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('theme_mode', mode.index);
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  void _changeAppThemeMode(AppThemeMode mode) {
    setState(() {
      _appThemeMode = mode;
    });

    _saveThemePreference(mode);
  }

  void setLocale(Locale locale) {
    if (_locale != locale) {
    setState(() {
      _locale = locale;
    });
      // Dil tercihini kaydet
      _saveLocalePreference(locale);
    }
  }

  Future<void> _saveLocalePreference(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale_language', locale.languageCode);
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  Future<void> _loadLocalePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('locale_language');
      // İlk açılışta dil tercihi yoksa Türkçe kullan, varsa ayarlardaki tercihi kullan
      if (languageCode != null && languageCode.isNotEmpty) {
        setState(() {
          _locale = Locale(languageCode);
        });
      } else {
        // İlk açılışta her zaman Türkçe
        setState(() {
          _locale = const Locale('tr');
        });
      }
    } catch (e) {
      // Hata durumunda varsayılan Türkçe kullan
      setState(() {
        _locale = const Locale('tr');
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (_isLoading) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    final brightness = MediaQuery.of(context).platformBrightness;
    final currentTheme = AppTheme.getThemeByMode(_appThemeMode, brightness);
    
    return AppThemeModeNotifier(
      appThemeMode: _appThemeMode,
      onAppThemeModeChanged: _changeAppThemeMode,
      child: MaterialApp(
        title: 'Hair Clinic App',
        debugShowCheckedModeBanner: false,
        theme: currentTheme,
        themeMode: ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case '/doctor-login':
            return MaterialPageRoute(builder: (_) => const DoctorLoginScreen());
          case '/doctor-dashboard':
            return MaterialPageRoute(builder: (_) => const DoctorDashboardShell());
          case '/doctor-chat':
            return MaterialPageRoute(
              builder: (context) {
                final args = (settings.arguments as Map?) ?? {};
                final pid = (args['patientId'] as String?) ?? '';
                final pname = (args['patientName'] as String?);
                return DoctorChatScreen(patientId: pid, patientName: pname);
              },
            );
          case '/doctor-patient-detail':
            return MaterialPageRoute(
              builder: (context) {
                final args = (settings.arguments as Map?) ?? {};
                final pid = (args['patientId'] as String?) ?? '';
                final pname = (args['patientName'] as String?);
                return DoctorPatientDetailScreen(patientId: pid, patientName: pname);
              },
            );
          case '/doctor-image-viewer':
            return MaterialPageRoute(
              builder: (context) {
                final args = (settings.arguments as Map?) ?? {};
                final url = (args['imageUrl'] as String?) ?? '';
                return DoctorImageViewerScreen(imageUrl: url);
              },
            );
          case '/messages':
            // Eğer args varsa direkt conversation'a git, yoksa mesaj listesine
            return MaterialPageRoute(
              builder: (context) {
                final args = (settings.arguments as Map?);
                
                // Args varsa direkt conversation ekranına git
                if (args != null && args.containsKey('doctorId') && args.containsKey('patientId')) {
                  final doctorId = (args['doctorId'] as String?) ?? '';
                  final doctorName = (args['doctorName'] as String?) ?? '';
                  final patientId = (args['patientId'] as String?) ?? '';
                  final patientName = (args['patientName'] as String?) ?? '';
                  final userRole = (args['userRole'] as String?) ?? 'patient';
                  
                  // Validate required fields
                  if (doctorId.isEmpty || patientId.isEmpty) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Hata')),
                      body: const Center(
                        child: Text('Mesajlaşma için gerekli bilgiler eksik.'),
                      ),
                    );
                  }
                  
                  return ChatConversationScreen(
                    doctorId: doctorId,
                    doctorName: doctorName,
                    patientId: patientId,
                    patientName: patientName,
                    userRole: userRole,
                  );
                }
                
                // Args yoksa hasta mesaj listesi
                return const PatientMessagesScreen();
              },
            );
          case '/patient-detail':
            return MaterialPageRoute(builder: (_) => const PatientDetailScreen());
          case '/registration':
            return MaterialPageRoute(builder: (_) => const RegistrationScreen());
          case '/forgot-password':
            return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
          case '/dashboard':
            return MaterialPageRoute(builder: (_) => const PatientDashboardScreen());
          case '/photo-capture':
            return MaterialPageRoute(builder: (_) => const PhotoCaptureScreen());
          case '/upload-and-analyze':
            return MaterialPageRoute(builder: (_) => const UploadAndAnalyzeScreen());
          case '/face-detection-capture':
            return MaterialPageRoute(builder: (_) => const FaceDetectionMultiAngleCapture());
          case '/clinic-profile':
            return MaterialPageRoute(builder: (_) => const ClinicProfileScreen());
          case '/chat-support':
            return MaterialPageRoute(builder: (_) => const ChatSupportScreen());
          case '/photo-analysis-chat':
            return MaterialPageRoute(builder: (_) => const PhotoAnalysisChatScreen());
          case '/past-analyses':
            return MaterialPageRoute(builder: (_) => const PastAnalysesHistoryScreen());
          case '/capture-flow':
            return MaterialPageRoute(builder: (_) => const CaptureFlowScreen());
          case '/faq':
            return MaterialPageRoute(builder: (_) => const FAQScreen());
          case '/settings':
            return MaterialPageRoute(builder: (_) => const SettingsScreen());
          case '/notifications':
            return MaterialPageRoute(builder: (_) => const NotificationsScreen());
          case '/privacy-policy':
            return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
          case '/terms-of-service':
            return MaterialPageRoute(builder: (_) => const TermsOfServiceScreen());
          case '/doctors':
            return MaterialPageRoute(builder: (_) => const DoctorsScreen());
          case '/appointments':
            return MaterialPageRoute(builder: (_) => const PatientAppointmentsScreen());
          case '/doctor-appointments':
            return MaterialPageRoute(
              builder: (context) {
                final args = (settings.arguments as Map?) ?? {};
                final doctorId = (args['doctorId'] as String?) ?? '';
                final doctorName = (args['doctorName'] as String?) ?? 'Doktor';
                return DoctorAppointmentsScreen(
                  doctorId: doctorId,
                  doctorName: doctorName,
                );
              },
            );
          case '/about-us':
            return MaterialPageRoute(builder: (_) => const AboutUsScreen());
          case '/contact':
            return MaterialPageRoute(builder: (_) => const ContactScreen());
          case '/email-verification':
            return MaterialPageRoute(builder: (_) => const EmailVerificationScreen());
          case '/online-consultation':
            return MaterialPageRoute(builder: (_) => const OnlineConsultationScreen());
          case '/hair-transplant':
            return MaterialPageRoute(builder: (_) => const HairTransplantListScreen());
          case '/treatment-history':
            return MaterialPageRoute(builder: (_) => TreatmentHistoryScreen());
          case '/documents':
            return MaterialPageRoute(builder: (_) => DocumentsScreen());
          case '/invoices':
            return MaterialPageRoute(builder: (_) => InvoicesScreen());
          case '/support-center':
            return MaterialPageRoute(builder: (_) => const SupportCenterScreen());
          case '/patient-care':
            return MaterialPageRoute(builder: (_) => const PatientCareScreen());
          default:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      },
    ),
    );
  }
}

class AppThemeModeNotifier extends InheritedWidget {
  final AppThemeMode appThemeMode;
  final ValueChanged<AppThemeMode> onAppThemeModeChanged;

  const AppThemeModeNotifier({super.key, 
    required this.appThemeMode,
    required this.onAppThemeModeChanged,
    required super.child,
  });

  static AppThemeModeNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppThemeModeNotifier>();
  }

  @override
  bool updateShouldNotify(AppThemeModeNotifier oldWidget) {
    return oldWidget.appThemeMode != appThemeMode;
  }

  // Geriye dönük uyumluluk için eski ThemeModeNotifier'a erişim
  @Deprecated('Use appThemeMode instead')
  ThemeMode get themeMode {
    switch (appThemeMode) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }
}

// Geriye dönük uyumluluk için eski ThemeModeNotifier
@Deprecated('Use AppThemeModeNotifier instead')
class ThemeModeNotifier extends InheritedWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const ThemeModeNotifier({super.key, 
    required this.themeMode,
    required this.onThemeModeChanged,
    required super.child,
  });

  static ThemeModeNotifier? of(BuildContext context) {
    final notifier = AppThemeModeNotifier.of(context);
    if (notifier == null) return null;
    return ThemeModeNotifier(
      themeMode: notifier.themeMode,
      onThemeModeChanged: (mode) {
        notifier.onAppThemeModeChanged(
          mode == ThemeMode.dark 
              ? AppThemeMode.dark 
              : AppThemeMode.light,
        );
      },
      child: notifier.child,
    );
  }

  @override
  bool updateShouldNotify(ThemeModeNotifier oldWidget) {
    return oldWidget.themeMode != themeMode;
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool _requesting = false;
  String? _error;

  Future<void> _startFlow() async {
    setState(() {
      _requesting = true;
      _error = null;
    });

    final status = await Permission.camera.request();
    if (!status.isGranted) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _requesting = false;
        _error = l10n?.cameraPermissionRequired ?? 'Camera permission is required.';
      });
      return;
    }

    final motionStatus = await Permission.sensors.request();
    if (!motionStatus.isGranted) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _requesting = false;
        _error = l10n?.sensorPermissionRequired ?? 'Motion sensor permission is required.';
      });
      return;
    }

    if (!mounted) return;
    setState(() {
      _requesting = false;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CaptureFlowScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Builder(
                builder: (context) {
                  final l10n = AppLocalizations.of(context);
                  return Column(
                    children: [
                      Text(
                        l10n?.captureFlowTitle ?? 'Self Capture',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n?.captureFlowSubtitle ?? 'Automatic capture from 5 critical angles for hair and scalp.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              FilledButton(
                onPressed: _requesting ? null : _startFlow,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: Colors.indigoAccent,
                ),
                child: _requesting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Builder(
                        builder: (context) {
                          final l10n = AppLocalizations.of(context);
                          return Text(
                            l10n?.captureFlowStartCapture ?? 'Start Capture',
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          );
                        },
                      ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(
                  _error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}


