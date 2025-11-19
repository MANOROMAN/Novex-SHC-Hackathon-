import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import 'dart:io';
import '../services/auth_service.dart';
import '../services/doctor_auth_service.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';

/// Doktor profil ayarları sayfası
class DoctorProfileSettingsScreen extends StatefulWidget {
  const DoctorProfileSettingsScreen({super.key});

  @override
  State<DoctorProfileSettingsScreen> createState() => _DoctorProfileSettingsScreenState();
}

class _DoctorProfileSettingsScreenState extends State<DoctorProfileSettingsScreen> {
  final AuthService _authService = AuthService();
  final DoctorAuthService _doctorAuthService = DoctorAuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageService _storageService = StorageService();
  final ImagePicker _imagePicker = ImagePicker();
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();
  
  bool _isLoading = true;
  bool _isSaving = false;
  bool _isUploadingPhoto = false;
  String? _doctorPhotoUrl;
  bool _hasLoadedProfile = false;
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasLoadedProfile) {
      _hasLoadedProfile = true;
      // Build sırasında showSnackBar çağrılamaz, post-frame callback kullan
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _loadDoctorProfile();
      });
    }
  }
  
  Future<void> _loadDoctorProfile() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _isLoading = true);
    
    try {
      debugPrint('📥 Doktor profil bilgileri yükleniyor...');
      
      // Doktor ID'sini DoctorAuthService'den al (manuel auth kullanıyoruz)
      final doctorId = await _doctorAuthService.getStoredDoctorId();
      if (doctorId == null || doctorId.isEmpty) {
        throw Exception(l10n.doctorLoginNotFound);
      }
      
      debugPrint('   Doctor ID: $doctorId');
      
      // Doktor bilgilerini Firestore'dan al (doctorId ile)
      debugPrint('📥 Firestore\'dan doktor bilgileri çekiliyor...');
      final docSnapshot = await _firestore
          .collection('doctors')
          .doc(doctorId)
          .get();
      
      if (docSnapshot.exists) {
        final data = docSnapshot.data() ?? {};
        debugPrint('✅ Doktor kaydı bulundu');
        debugPrint('   Name: ${data['name']}');
        debugPrint('   Email: ${data['email']}');
        debugPrint('   Active: ${data['active']}');
        
        _nameController.text = data['name'] ?? '';
        _emailController.text = data['email'] ?? '';
        _phoneController.text = data['phone'] ?? '';
        _specialtyController.text = data['specialty'] ?? '';
        _doctorPhotoUrl = data['photoURL'];
      } else {
        debugPrint('⚠️ Doktor kaydı bulunamadı, SharedPreferences\'dan bilgiler alınıyor');
        // Yeni doktor kaydı - email'den bilgileri al
        final prefs = await SharedPreferences.getInstance();
        final doctorEmail = prefs.getString('doctor_email') ?? '';
        final doctorName = prefs.getString('doctor_name') ?? '';
        _nameController.text = doctorName;
        _emailController.text = doctorEmail;
      }
    } on FirebaseException catch (e) {
      debugPrint('❌ Firebase Firestore hatası:');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      
      String errorMessage = l10n.profileLoadError;
      if (e.code == 'permission-denied') {
        errorMessage = l10n.profileReadPermissionDenied;
      } else if (e.code == 'unavailable') {
        errorMessage = l10n.firebaseServiceUnavailable;
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.errorPrefix}$errorMessage'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Profil yükleme hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.errorPrefix}${l10n.profileLoadError}: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  Future<void> _saveProfile() async {
    final l10n = AppLocalizations.of(context)!;
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.nameRequired),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    setState(() => _isSaving = true);
    
    try {
      debugPrint('💾 Doktor profil kaydediliyor...');
      
      // Doktor ID'sini DoctorAuthService'den al
      final doctorId = await _doctorAuthService.getStoredDoctorId();
      if (doctorId == null || doctorId.isEmpty) {
        throw Exception(l10n.doctorLoginNotFound);
      }
      
      debugPrint('   Doctor ID: $doctorId');
      debugPrint('   Name: ${_nameController.text.trim()}');
      debugPrint('   Email: ${_emailController.text.trim()}');
      
      // Firestore'da doktor bilgilerini güncelle
      final updateData = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'specialty': _specialtyController.text.trim(),
        'updatedAt': FieldValue.serverTimestamp(),
        'active': true, // Aktif olarak işaretle
      };
      
      // Fotoğraf URL'i varsa ekle
      if (_doctorPhotoUrl != null && _doctorPhotoUrl!.isNotEmpty) {
        updateData['photoURL'] = _doctorPhotoUrl!;
        debugPrint('   Photo URL: ${_doctorPhotoUrl}');
      }
      
      debugPrint('📝 Firestore\'a yazılıyor...');
      // set() yerine update() kullan - daha güvenilir
      await _firestore.collection('doctors').doc(doctorId).update(updateData);
      debugPrint('✅ Firestore\'a yazıldı');
      
      // SharedPreferences'da da güncelle
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('doctor_name', _nameController.text.trim());
      debugPrint('✅ SharedPreferences güncellendi');
      
      // Profil bilgilerini yeniden yükle (fotoğraf URL'ini güncellemek için)
      await _loadDoctorProfile();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.profileSavedSuccessfully),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
        Navigator.pop(context);
      }
    } on FirebaseException catch (e) {
      debugPrint('❌ Firebase Firestore hatası:');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      
      String errorMessage = l10n.profileSaveError;
      if (e.code == 'permission-denied') {
        errorMessage = l10n.profileSavePermissionDenied;
      } else if (e.code == 'unavailable') {
        errorMessage = l10n.firebaseServiceUnavailable;
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.errorPrefix}$errorMessage'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Profil kaydetme hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.errorPrefix}${l10n.saveError(e.toString())}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }
  
  Future<void> _uploadDoctorPhoto() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      debugPrint('📸 Doktor profil fotoğrafı seçiliyor...');
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1200,
      );

      if (pickedFile == null) {
        debugPrint('⚠️ Fotoğraf seçilmedi');
        return;
      }

      debugPrint('✅ Fotoğraf seçildi: ${pickedFile.path}');
      setState(() => _isUploadingPhoto = true);

      // Doktor ID'sini DoctorAuthService'den al
      final doctorId = await _doctorAuthService.getStoredDoctorId();
      if (doctorId == null || doctorId.isEmpty) {
        throw Exception(l10n.doctorLoginNotFound);
      }
      
      debugPrint('📤 Doktor fotoğrafı yükleniyor...');
      debugPrint('   Doctor ID: $doctorId');
      
      final file = File(pickedFile.path);
      
      // Doktor fotoğrafını yükle
      final photoUrl = await _storageService.uploadPhoto(
        doctorId,
        file,
        customPath: 'doctors/$doctorId/profile.jpg',
      );
      
      debugPrint('✅ Fotoğraf başarıyla yüklendi: $photoUrl');
      
      setState(() {
        _doctorPhotoUrl = photoUrl;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.photoUploadedSaveRequired),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: l10n.ok,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
    } on FirebaseException catch (e) {
      debugPrint('❌ Firebase Storage hatası:');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      
      String errorMessage = l10n.photoUploadError;
      if (e.code == 'permission-denied') {
        errorMessage = l10n.photoUploadPermissionDenied;
      } else if (e.code == 'unauthorized') {
        errorMessage = l10n.photoUploadUnauthorized;
      } else if (e.code == 'canceled') {
        errorMessage = l10n.photoUploadCancelled;
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.errorPrefix}$errorMessage'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Fotoğraf yükleme hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.errorPrefix}${l10n.photoUploadError}: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUploadingPhoto = false);
      }
    }
  }
  
  Future<void> _signOut() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settingsLogout),
        content: Text(l10n.logoutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(l10n.settingsLogout),
          ),
        ],
      ),
    );
    
    if (confirmed == true) {
      await _authService.signOut();
      await _doctorAuthService.signOutDoctor();
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      }
    }
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _specialtyController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF101922) : Colors.white,
        elevation: 0,
        title: Text(l10n.profileSettings),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Avatar
                  Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: _uploadDoctorPhoto,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: AppTheme.getBrandPrimaryColor(context),
                            backgroundImage: _doctorPhotoUrl != null && _doctorPhotoUrl!.isNotEmpty
                                ? NetworkImage(_doctorPhotoUrl!)
                                : null,
                            child: _isUploadingPhoto
                                ? const CircularProgressIndicator(color: Colors.white)
                                : (_doctorPhotoUrl == null || _doctorPhotoUrl!.isEmpty)
                                    ? Text(
                                        _nameController.text.isNotEmpty
                                            ? _nameController.text[0].toUpperCase()
                                            : 'D',
                                        style: const TextStyle(
                                          fontSize: 48,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : null,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _uploadDoctorPhoto,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppTheme.getBrandPrimaryColor(context),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isDark ? const Color(0xFF101922) : Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // İsim
                  _buildTextField(
                    controller: _nameController,
                    label: l10n.fullName,
                    icon: Icons.person,
                    isDark: isDark,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Email (disabled)
                  _buildTextField(
                    controller: _emailController,
                    label: l10n.email,
                    icon: Icons.email,
                    isDark: isDark,
                    enabled: false,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Telefon
                  _buildTextField(
                    controller: _phoneController,
                    label: l10n.phone,
                    icon: Icons.phone,
                    isDark: isDark,
                    keyboardType: TextInputType.phone,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Uzmanlık
                  _buildTextField(
                    controller: _specialtyController,
                    label: l10n.specialty,
                    icon: Icons.medical_services,
                    isDark: isDark,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Kaydet butonu
                  ElevatedButton(
                    onPressed: _isSaving ? null : _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.getBrandPrimaryColor(context),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isSaving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            l10n.save,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Çıkış yap butonu
                  OutlinedButton(
                    onPressed: _signOut,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      l10n.settingsLogout,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
  
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isDark,
    bool enabled = true,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF192633) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        style: TextStyle(
          color: enabled
              ? (isDark ? Colors.white : Colors.black87)
              : (isDark ? Colors.grey : Colors.black45),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isDark ? const Color(0xFF92ADC9) : const Color(0xFF6B7280),
          ),
          prefixIcon: Icon(
            icon,
            color: AppTheme.getBrandPrimaryColor(context),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: isDark ? const Color(0xFF192633) : Colors.white,
        ),
      ),
    );
  }
}

