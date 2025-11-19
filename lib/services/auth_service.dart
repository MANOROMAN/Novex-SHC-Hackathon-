import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Firebase Authentication servisi
class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Mevcut kullanıcı
  User? get currentUser => _auth.currentUser;

  /// Auth state stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Kullanıcı giriş yapmış mı kontrolü
  bool get isAuthenticated => currentUser != null;

  /// Email ve şifre ile giriş
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Google ile giriş
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Google Sign-In'i yapılandır - scopes ekle
      // Persistent login için signOut() çağrısı kaldırıldı
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // Kullanıcı girişi iptal etti
        return null;
      }

      // Kimlik doğrulama bilgilerini alma
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


      // idToken kontrolü
      if (googleAuth.idToken == null) {
        throw Exception('Google Sign-In başarısız: idToken alınamadı. Lütfen Firebase Console\'da SHA-1 fingerprint\'in eklendiğinden emin olun.');
      }

      // Firebase credential oluşturma
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase ile giriş
      final UserCredential userCredential = await _auth.signInWithCredential(credential);


      // Token'ı yenile
      await userCredential.user?.getIdToken(true);

      // Firestore'da kullanıcı profili oluştur/güncelle
      try {
        await _createOrUpdateUserProfile(userCredential.user!, googleUser.displayName);
      } catch (e) {
        print('Firestore kullanıcı profili oluşturma hatası: $e');
        // Firestore hatası olsa bile giriş başarılı sayılır
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth hatası: ${e.code} - ${e.message}');
      if (e.code == 'account-exists-with-different-credential') {
        throw Exception('Bu e-posta adresi farklı bir giriş yöntemiyle kayıtlı. Lütfen e-posta/şifre ile giriş yapmayı deneyin.');
      }
      rethrow;
    } catch (e) {
      print('Google giriş hatası: $e');
      // ApiException:10 hatası için daha açıklayıcı mesaj
      if (e.toString().contains('ApiException:10') || e.toString().contains('sign_in_failed')) {
        throw Exception('Google Sign-In yapılandırma hatası. Lütfen Firebase Console\'da SHA-1 fingerprint\'in eklendiğinden ve Google Cloud Console\'da OAuth client\'ın doğru yapılandırıldığından emin olun.');
      }
      rethrow;
    }
  }

  /// Email ve şifre ile kayıt (Alias)
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    return await createUserWithEmailAndPassword(
      email: email,
      password: password,
      displayName: displayName,
    );
  }

  /// Email ve şifre ile kayıt
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
    bool sendVerificationEmail = true,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Kullanıcı profili güncelle
    if (displayName != null && displayName.isNotEmpty) {
      await userCredential.user?.updateDisplayName(displayName);
    }

    // Firestore'da kullanıcı profili oluştur
    await _createUserProfile(userCredential.user!, displayName);

    // Email verification gönder
    if (sendVerificationEmail && userCredential.user != null) {
      try {
        final user = userCredential.user!;
        // Email zaten doğrulanmış mı kontrol et
        await user.reload(); // Önce kullanıcı bilgilerini yenile
        final reloadedUser = _auth.currentUser;
        
        if (reloadedUser == null) {
          print('HATA: Kullanıcı reload sonrası bulunamadı');
          throw Exception('Kullanıcı bilgileri yüklenemedi');
        }
        
        if (!reloadedUser.emailVerified) {
          print('Email verification gönderiliyor: ${reloadedUser.email}');
          // Email verification gönder
          await reloadedUser.sendEmailVerification();
          print('✅ Email verification başarıyla gönderildi: ${reloadedUser.email}');
        } else {
          print('ℹ️ Email zaten doğrulanmış: ${reloadedUser.email}');
        }
      } on FirebaseAuthException catch (e) {
        print('❌ FirebaseAuthException - Email verification hatası:');
        print('   Code: ${e.code}');
        print('   Message: ${e.message}');
        print('   Email: ${userCredential.user?.email}');
        // Hata bilgisini üst seviyeye ilet ama kayıt başarılı sayılır
        rethrow;
      } catch (e, stackTrace) {
        print('❌ Email verification gönderilirken genel hata:');
        print('   Error: $e');
        print('   StackTrace: $stackTrace');
        print('   Email: ${userCredential.user?.email}');
        // Hata olsa bile kayıt başarılı sayılır, ama hata bilgisini ilet
        rethrow;
      }
    }

    return userCredential;
  }

  /// Firestore'da kullanıcı profili oluştur/güncelle (Google giriş için)
  Future<void> _createOrUpdateUserProfile(User user, String? displayName) async {

    try {
      final userDoc = _firestore.collection('users').doc(user.uid);
      final docSnapshot = await userDoc.get();

      final userName = displayName ?? user.displayName ?? user.email?.split('@')[0] ?? 'Kullanıcı';

      if (!docSnapshot.exists) {
        // Yeni kullanıcı oluştur
        final userProfile = {
          'uid': user.uid,
          'email': user.email ?? '',
          'displayName': userName,
          'photoURL': user.photoURL ?? '',
          'createdAt': FieldValue.serverTimestamp(),
          'lastLoginAt': FieldValue.serverTimestamp(),
          'loginMethod': 'google',
          'profile': {
            'name': userName,
            'phone': '',
            'address': '',
            'birthDate': '',
            'gender': '',
            'patientId': '',
            'emergencyContact': '',
          },
          'settings': {
            'notificationsEnabled': true,
            'emailNotifications': true,
            'pushNotifications': true,
            'language': 'tr',
            'theme': 'default',
          },
        };

        await userDoc.set(userProfile, SetOptions(merge: false));
      } else {
        // Mevcut kullanıcıyı güncelle
        final updateData = <String, dynamic>{
          'lastLoginAt': FieldValue.serverTimestamp(),
        };
        
        if (user.displayName != null && user.displayName!.isNotEmpty) {
          updateData['displayName'] = userName;
          updateData['profile.name'] = userName;
        }
        
        if (user.photoURL != null && user.photoURL!.isNotEmpty) {
          updateData['photoURL'] = user.photoURL;
        }
        
        await userDoc.update(updateData);
      }
    } catch (e) {
      print('Firestore kullanıcı profili oluşturma/güncelleme hatası: $e');
      rethrow;
    }
  }

  /// Firestore'da kullanıcı profili oluştur (Private)
  Future<void> _createUserProfile(User user, String? displayName) async {
    final userProfile = {
      'uid': user.uid,
      'email': user.email,
      'displayName': displayName ?? '',
      'photoURL': user.photoURL,
      'createdAt': FieldValue.serverTimestamp(),
      'lastLoginAt': FieldValue.serverTimestamp(),
      'profile': {
        'name': displayName ?? '',
        'phone': '',
        'address': '',
        'birthDate': '',
        'gender': '',
        'patientId': '',
        'emergencyContact': '',
      },
      'settings': {
        'notificationsEnabled': true,
        'emailNotifications': true,
        'pushNotifications': true,
        'language': 'tr',
        'theme': 'default',
      },
    };

    await _firestore.collection('users').doc(user.uid).set(userProfile);
  }

  /// Kullanıcı profili oluştur (Public - Registration için)
  Future<void> createUserProfile({
    required String displayName,
    required String email,
    String? phoneNumber,
  }) async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');

    await _firestore.collection('users').doc(currentUser!.uid).update({
      'displayName': displayName,
      'profile.name': displayName,
      'profile.phone': phoneNumber ?? '',
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Kullanıcı profili güncelle
  Future<void> updateUserProfile(Map<String, dynamic> profileData) async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');

    await _firestore.collection('users').doc(currentUser!.uid).update({
      'profile': profileData,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Kullanıcı ayarları güncelle
  Future<void> updateUserSettings(Map<String, dynamic> settings) async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');

    await _firestore.collection('users').doc(currentUser!.uid).update({
      'settings': settings,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Kullanıcı profili getir
  Future<Map<String, dynamic>?> getUserProfile() async {
    if (!isAuthenticated) return null;

    final doc = await _firestore.collection('users').doc(currentUser!.uid).get();
    return doc.data();
  }

  /// Kullanıcı profili stream
  Stream<DocumentSnapshot> get userProfileStream {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');
    return _firestore.collection('users').doc(currentUser!.uid).snapshots();
  }

  /// Şifre sıfırlama emaili gönder
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      print('📧 Şifre sıfırlama emaili gönderiliyor: $email');
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      print('✅ Şifre sıfırlama emaili başarıyla gönderildi: $email');
    } catch (e) {
      print('❌ Şifre sıfırlama emaili gönderilirken hata: $e');
      rethrow;
    }
  }

  /// Şifre sıfırlama kodunu doğrula ve yeni şifre belirle
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    try {
      await _auth.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
    } catch (e) {
      print('Şifre sıfırlama onaylama hatası: $e');
      rethrow;
    }
  }

  /// Şifre sıfırlama kodunu doğrula (kod geçerli mi kontrol)
  Future<void> verifyPasswordResetCode(String code) async {
    try {
      await _auth.verifyPasswordResetCode(code);
    } catch (e) {
      print('Şifre sıfırlama kodu doğrulama hatası: $e');
      rethrow;
    }
  }

  /// Email verification gönder
  Future<void> sendEmailVerification() async {
    if (!isAuthenticated) {
      print('❌ HATA: Kullanıcı giriş yapmamış');
      throw Exception('Kullanıcı giriş yapmamış');
    }
    
    final user = currentUser!;
    print('📧 Email verification gönderiliyor: ${user.email}');
    
    // Kullanıcı bilgilerini yenile
    await user.reload();
    final currentUserReloaded = _auth.currentUser;
    
    if (currentUserReloaded == null) {
      print('❌ HATA: Kullanıcı reload sonrası bulunamadı');
      throw Exception('Kullanıcı bulunamadı');
    }
    
    if (currentUserReloaded.emailVerified) {
      print('ℹ️ Email zaten doğrulanmış: ${currentUserReloaded.email}');
      throw Exception('Email zaten doğrulanmış');
    }

    try {
      print('📤 Email verification gönderiliyor: ${currentUserReloaded.email}');
      await currentUserReloaded.sendEmailVerification();
      print('✅ Email verification başarıyla gönderildi: ${currentUserReloaded.email}');
    } on FirebaseAuthException catch (e) {
      print('❌ FirebaseAuthException - Email verification hatası:');
      print('   Code: ${e.code}');
      print('   Message: ${e.message}');
      print('   Email: ${currentUserReloaded.email}');
      rethrow;
    } catch (e, stackTrace) {
      print('❌ Email verification gönderilirken genel hata:');
      print('   Error: $e');
      print('   StackTrace: $stackTrace');
      print('   Email: ${currentUserReloaded.email}');
      rethrow;
    }
  }

  /// Email doğrulama durumunu kontrol et
  Future<bool> checkEmailVerification() async {
    if (!isAuthenticated) return false;
    
    // Kullanıcı bilgilerini yenile
    await currentUser!.reload();
    
    // Güncel kullanıcı bilgisini al
    final user = _auth.currentUser;
    return user?.emailVerified ?? false;
  }

  /// Email doğrulama linkini işle
  Future<void> verifyEmail(String actionCode) async {
    try {
      await _auth.applyActionCode(actionCode);
    } catch (e) {
      print('Email doğrulama hatası: $e');
      rethrow;
    }
  }

  /// Email adresini güncelle
  Future<void> updateEmail(String newEmail) async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');
    
    final user = currentUser!;
    
    // Yeni email adresini güncelle (verifyBeforeUpdateEmail kullanarak)
    // Bu metod yeni email'e doğrulama linki gönderir
    await user.verifyBeforeUpdateEmail(newEmail);

    // Firestore'da email'i güncelle (email doğrulandıktan sonra)
    // Not: Email doğrulama linkine tıklandığında otomatik güncellenir
    // Email doğrulandıktan sonra reload() yaparak güncel email'i alabilirsiniz
  }

  /// Şifre güncelle
  Future<void> updatePassword(String newPassword) async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');
    await currentUser!.updatePassword(newPassword);
  }

  /// Kullanıcı adı güncelle
  Future<void> updateDisplayName(String displayName) async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');
    await currentUser!.updateDisplayName(displayName);

    // Firestore'da da güncelle
    await _firestore.collection('users').doc(currentUser!.uid).update({
      'displayName': displayName,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Profil fotoğrafı güncelle
  Future<void> updateProfilePhoto(String photoUrl) async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');

    await currentUser!.updatePhotoURL(photoUrl);

    await _firestore.collection('users').doc(currentUser!.uid).set({
      'photoURL': photoUrl,
      'profile': {
        'photoUrl': photoUrl,
      },
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  /// Çıkış yap
  Future<void> signOut() async {
    await _googleSignIn.signOut(); // Google hesabından çıkış
    await _auth.signOut();
  }

  /// Hesap sil
  Future<void> deleteAccount() async {
    if (!isAuthenticated) throw Exception('Kullanıcı giriş yapmamış');

    // Firestore verilerini sil
    await _firestore.collection('users').doc(currentUser!.uid).delete();

    // Firebase Auth hesabını sil
    await currentUser!.delete();
  }

  /// Son giriş zamanını güncelle
  Future<void> updateLastLoginTime() async {
    if (!isAuthenticated) return;

    await _firestore.collection('users').doc(currentUser!.uid).update({
      'lastLoginAt': FieldValue.serverTimestamp(),
    });
  }
}


