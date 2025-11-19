# Novex-SHC-Hackathon-
# Smile Hair Clinic - Mobile Application

A comprehensive mobile application for hair transplant clinic management, patient care, and AI-powered photo analysis.

## 🚀 Technologies

- **Flutter** - Cross-platform mobile development framework
- **Firebase** - Backend services (Authentication, Firestore, Storage, Cloud Functions)
- **Google ML Kit** - Face detection and image analysis
- **AI Analysis Service** - Custom photo analysis for hair transplant procedures
- **Multi-language Support** - 12 languages (Turkish, English, Arabic, German, Spanish, French, Italian, Portuguese, Russian, Hebrew, Albanian, and more)

## ✨ Key Features

### Patient Features
- **AI-Powered Photo Analysis**: Capture photos from 5 critical angles and get instant AI analysis
- **Face Detection Capture**: Automatic face detection for guided photo capture
- **Upload & Analyze**: Upload existing photos from gallery for analysis
- **Past Analyses History**: View and track analysis history
- **Doctor Messaging**: Direct communication with assigned doctors
- **Appointment Management**: Schedule and manage appointments
- **Notifications**: Real-time notifications for appointments, medications, and updates
- **Multi-language Support**: Full localization in 12 languages

### Doctor Features
- **Patient Management**: View and manage patient profiles
- **Photo Analysis Review**: Review and approve/reject patient photo analyses
- **Messaging System**: Communicate with patients
- **Appointment Management**: Manage patient appointments
- **Dashboard**: Comprehensive overview of clinic operations

### Technical Features
- **Offline Support**: Core features work offline
- **Real-time Sync**: Firebase Firestore for real-time data synchronization
- **Secure Authentication**: Firebase Auth with email/password and Google Sign-In
- **Push Notifications**: Firebase Cloud Messaging for notifications
- **Image Processing**: Advanced image analysis using AI/ML
- **Voice Guidance**: Text-to-speech for photo capture guidance

## 📱 Screenshots

The application includes modern, user-friendly interfaces for:
- Patient dashboard with quick actions
- Photo capture with face detection
- AI analysis results
- Doctor profiles and details
- Hair transplant procedure information
- Appointment scheduling
- Messaging interface

## 🛠️ Setup

1. Clone the repository
2. Install Flutter dependencies: `flutter pub get`
3. Configure Firebase:
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Set up Firebase Authentication
   - Configure Firestore database
4. Run the application: `flutter run`

## 📦 Dependencies

Key dependencies include:
- `firebase_core`, `firebase_auth`, `cloud_firestore`
- `google_mlkit_face_detection`
- `camera`, `image_picker`
- `flutter_localizations`
- `shared_preferences`
- `url_launcher`

## 🎯 Use Cases

- **Patients**: Track hair transplant progress, communicate with doctors, schedule appointments
- **Doctors**: Manage patients, review analyses, provide consultations
- **Clinics**: Streamline operations, improve patient care, enhance communication

## 🌍 Localization

The application supports 12 languages with full localization of:
- UI elements and navigation
- Content pages (About Us, Contact, Hair Transplant procedures)
- Doctor profiles and information
- Analysis results and guidance
- Notifications and messages

## 📄 License

This project is developed for Smile Hair Clinic.
