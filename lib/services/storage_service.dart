import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

/// Firebase Storage servisi
class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Chat fotoğrafı yükle
  Future<String?> uploadChatImage(File imageFile, String conversationId) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${path.basename(imageFile.path)}';
      final uploadPath = 'chat_images/$conversationId/$fileName';
      final ref = _storage.ref().child(uploadPath);

      // Dosya boyutunu kontrol et (max 10MB)
      final fileSize = await imageFile.length();
      if (fileSize > 10 * 1024 * 1024) {
        throw Exception('Fotoğraf çok büyük. Maksimum 10MB olmalıdır.');
      }

      final uploadTask = ref.putFile(
        imageFile,
        SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {
            'conversationId': conversationId,
            'uploadedAt': DateTime.now().toIso8601String(),
          },
        ),
      );

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      
      debugPrint('✅ Chat fotoğraf başarıyla yüklendi: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      debugPrint('❌ Chat fotoğraf yükleme hatası: $e');
      debugPrint('   Dosya yolu: ${imageFile.path}');
      debugPrint('   Conversation ID: $conversationId');
      rethrow;
    }
  }

  /// Fotoğraf yükle
  Future<String> uploadPhoto(String userId, File photoFile, {String? customPath}) async {
    try {
      debugPrint('📤 StorageService: Fotoğraf yükleme başlatılıyor');
      debugPrint('   User ID: $userId');
      debugPrint('   Custom Path: $customPath');
      debugPrint('   File Path: ${photoFile.path}');
      
      // Dosya boyutunu kontrol et (max 10MB)
      final fileSize = await photoFile.length();
      debugPrint('   File Size: ${(fileSize / 1024 / 1024).toStringAsFixed(2)} MB');
      
      if (fileSize > 10 * 1024 * 1024) {
        throw Exception('Fotoğraf çok büyük. Maksimum 10MB olmalıdır.');
      }

      // Dosya adı oluştur
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${path.basename(photoFile.path)}';

      // Yükleme yolu oluştur
      final uploadPath = customPath ?? 'users/$userId/photos/$fileName';
      debugPrint('   Upload Path: $uploadPath');

      // Reference oluştur
      final ref = _storage.ref().child(uploadPath);

      // Upload task başlat
      debugPrint('📤 Upload task başlatılıyor...');
      final uploadTask = ref.putFile(
        photoFile,
        SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {
            'uploadedBy': userId,
            'uploadedAt': DateTime.now().toIso8601String(),
          },
        ),
      );

      // Yükleme ilerlemesini dinle
      uploadTask.snapshotEvents.listen((snapshot) {
        final progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        debugPrint('📤 Upload progress: ${progress.toStringAsFixed(1)}%');
      });

      // Yükleme tamamlanmasını bekle
      debugPrint('⏳ Upload tamamlanması bekleniyor...');
      final snapshot = await uploadTask.whenComplete(() {
        debugPrint('✅ Upload tamamlandı');
      });

      // Download URL al
      debugPrint('🔗 Download URL alınıyor...');
      final downloadUrl = await snapshot.ref.getDownloadURL();
      debugPrint('✅ Fotoğraf başarıyla yüklendi: $downloadUrl');

      return downloadUrl;
    } on FirebaseException catch (e) {
      debugPrint('❌ Firebase Storage hatası:');
      debugPrint('   Code: ${e.code}');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Plugin: ${e.plugin}');
      
      String errorMessage = 'Fotoğraf yüklenirken hata oluştu';
      if (e.code == 'permission-denied') {
        errorMessage = 'Fotoğraf yükleme izni reddedildi. Lütfen Firebase Storage kurallarını kontrol edin.';
      } else if (e.code == 'unauthorized') {
        errorMessage = 'Fotoğraf yükleme yetkisi yok. Lütfen giriş yapın.';
      } else if (e.code == 'canceled') {
        errorMessage = 'Fotoğraf yükleme iptal edildi.';
      } else if (e.code == 'unknown') {
        errorMessage = 'Bilinmeyen bir hata oluştu. Lütfen internet bağlantınızı kontrol edin.';
      }
      
      throw Exception('$errorMessage (${e.code})');
    } catch (e, stackTrace) {
      debugPrint('❌ Fotoğraf yükleme hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      throw Exception('Fotoğraf yüklenirken hata oluştu: $e');
    }
  }

  /// Birden fazla fotoğraf yükle
  Future<List<String>> uploadMultiplePhotos(String userId, List<File> photoFiles) async {
    final List<String> downloadUrls = [];

    for (final photoFile in photoFiles) {
      try {
        final downloadUrl = await uploadPhoto(userId, photoFile);
        downloadUrls.add(downloadUrl);
      } catch (e) {
        // Tek fotoğraf hatası tüm işlemi durdurmasın
        print('Fotoğraf yükleme hatası: $e');
      }
    }

    return downloadUrls;
  }

  /// Analiz fotoğrafları yükle
  Future<Map<String, String>> uploadAnalysisPhotos(
    String userId,
    String analysisId,
    Map<String, File> photos,
  ) async {
    final Map<String, String> downloadUrls = {};

    for (final entry in photos.entries) {
      final stage = entry.key;
      final photoFile = entry.value;

      try {
        final downloadUrl = await uploadPhoto(
          userId,
          photoFile,
          customPath: 'users/$userId/analyses/$analysisId/${stage}_photo.jpg',
        );
        downloadUrls[stage] = downloadUrl;
      } catch (e) {
        print('$stage fotoğrafı yüklenirken hata: $e');
      }
    }

    return downloadUrls;
  }

  /// Profil fotoğrafı yükle
  Future<String> uploadProfilePhoto(String userId, File photoFile) async {
    // Önce eski profil fotoğrafını sil
    await deleteProfilePhoto(userId);

    return await uploadPhoto(
      userId,
      photoFile,
      customPath: 'users/$userId/profile/profile_photo.jpg',
    );
  }

  /// Profil fotoğrafı sil
  Future<void> deleteProfilePhoto(String userId) async {
    try {
      final ref = _storage.ref().child('users/$userId/profile/profile_photo.jpg');
      await ref.delete();
    } catch (e) {
      // Dosya yoksa hata verme
      print('Profil fotoğrafı silinirken hata: $e');
    }
  }

  /// Dosya sil
  Future<void> deleteFile(String filePath) async {
    try {
      final ref = _storage.ref().child(filePath);
      await ref.delete();
    } catch (e) {
      throw Exception('Dosya silinirken hata oluştu: $e');
    }
  }

  /// Kullanıcının tüm fotoğraflarını sil
  Future<void> deleteAllUserPhotos(String userId) async {
    try {
      final userPhotosRef = _storage.ref().child('users/$userId');

      // Tüm dosyaları listele ve sil
      final result = await userPhotosRef.listAll();
      final deleteFutures = <Future>[];

      // Dosyaları sil
      for (final fileRef in result.items) {
        deleteFutures.add(fileRef.delete());
      }

      // Klasörleri recursive olarak sil
      for (final folderRef in result.prefixes) {
        final folderResult = await folderRef.listAll();
        for (final fileRef in folderResult.items) {
          deleteFutures.add(fileRef.delete());
        }
      }

      await Future.wait(deleteFutures);
    } catch (e) {
      throw Exception('Kullanıcı fotoğrafları silinirken hata oluştu: $e');
    }
  }

  /// Analiz fotoğraflarını getir
  Future<List<String>> getAnalysisPhotoUrls(String userId, String analysisId) async {
    try {
      final analysisRef = _storage.ref().child('users/$userId/analyses/$analysisId');
      final result = await analysisRef.listAll();

      final List<String> urls = [];
      for (final fileRef in result.items) {
        final downloadUrl = await fileRef.getDownloadURL();
        urls.add(downloadUrl);
      }

      return urls;
    } catch (e) {
      print('Analiz fotoğrafları getirilirken hata: $e');
      return [];
    }
  }

  /// Dosya metadata bilgilerini getir
  Future<FullMetadata> getFileMetadata(String filePath) async {
    try {
      final ref = _storage.ref().child(filePath);
      return await ref.getMetadata();
    } catch (e) {
      throw Exception('Dosya metadata alınırken hata oluştu: $e');
    }
  }

  /// Kullanıcının toplam storage kullanımını hesapla
  Future<int> getUserStorageUsage(String userId) async {
    try {
      final userRef = _storage.ref().child('users/$userId');
      final result = await userRef.listAll();

      int totalBytes = 0;

      // Tüm dosyaların boyutunu topla
      for (final fileRef in result.items) {
        final metadata = await fileRef.getMetadata();
        totalBytes += metadata.size ?? 0;
      }

      // Alt klasörlerdeki dosyaları da dahil et
      for (final folderRef in result.prefixes) {
        final folderResult = await folderRef.listAll();
        for (final fileRef in folderResult.items) {
          final metadata = await fileRef.getMetadata();
          totalBytes += metadata.size ?? 0;
        }
      }

      return totalBytes;
    } catch (e) {
      print('Storage kullanımı hesaplanırken hata: $e');
      return 0;
    }
  }

  /// Dosya var mı kontrol et
  Future<bool> fileExists(String filePath) async {
    try {
      final ref = _storage.ref().child(filePath);
      await ref.getDownloadURL();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Geçici URL oluştur (download link)
  Future<String> getDownloadUrl(String filePath, {Duration? expiry}) async {
    try {
      final ref = _storage.ref().child(filePath);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('Download URL alınırken hata oluştu: $e');
    }
  }
}


