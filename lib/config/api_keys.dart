/// API Keys Configuration
/// 
/// IMPORTANT: Replace the placeholder values with your actual API keys.
/// You can set these via environment variables during build:
/// flutter run --dart-define=GEMINI_ANALYSIS_API_KEY=your_key_here
/// 
/// Or set the defaultValue below with your actual keys (for local development only).
class ApiKeys {
  // Google Gemini API Key for AI Analysis Service
  // Get your key from: https://makersuite.google.com/app/apikey
  static const String geminiAnalysisApiKey = String.fromEnvironment(
    'GEMINI_ANALYSIS_API_KEY',
    defaultValue: 'YOUR_GEMINI_ANALYSIS_API_KEY_HERE',
  );

  // Google Gemini API Key for AI Chat Service
  // Get your key from: https://makersuite.google.com/app/apikey
  static const String geminiChatApiKey = String.fromEnvironment(
    'GEMINI_CHAT_API_KEY',
    defaultValue: 'YOUR_GEMINI_CHAT_API_KEY_HERE',
  );

  // Firebase API Key
  // Get your key from: Firebase Console > Project Settings > General
  static const String firebaseApiKey = String.fromEnvironment(
    'FIREBASE_API_KEY',
    defaultValue: 'YOUR_FIREBASE_API_KEY_HERE',
  );
}

