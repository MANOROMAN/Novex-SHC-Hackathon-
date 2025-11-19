/// API Keys Configuration Example
/// 
/// Copy this file to api_keys.dart and fill in your actual API keys.
/// The api_keys.dart file is in .gitignore and will not be committed.
class ApiKeys {
  // Google Gemini API Key for AI Analysis Service
  static const String geminiAnalysisApiKey = String.fromEnvironment(
    'GEMINI_ANALYSIS_API_KEY',
    defaultValue: 'YOUR_GEMINI_ANALYSIS_API_KEY_HERE',
  );

  // Google Gemini API Key for AI Chat Service
  static const String geminiChatApiKey = String.fromEnvironment(
    'GEMINI_CHAT_API_KEY',
    defaultValue: 'YOUR_GEMINI_CHAT_API_KEY_HERE',
  );

  // Firebase API Key
  static const String firebaseApiKey = String.fromEnvironment(
    'FIREBASE_API_KEY',
    defaultValue: 'YOUR_FIREBASE_API_KEY_HERE',
  );
}

