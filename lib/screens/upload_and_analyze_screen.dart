import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../services/ai_analysis_service.dart';
import '../models/captured_photo.dart';
import '../models/capture_stage.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import 'photo_analysis_chat_screen.dart';

class UploadAndAnalyzeScreen extends StatefulWidget {
  const UploadAndAnalyzeScreen({super.key});

  @override
  State<UploadAndAnalyzeScreen> createState() => _UploadAndAnalyzeScreenState();
}

class _UploadAndAnalyzeScreenState extends State<UploadAndAnalyzeScreen> {
  final ImagePicker _picker = ImagePicker();
  final AuthService _authService = AuthService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  List<XFile> _selectedImages = [];
  bool _isAnalyzing = false;
  double _analysisProgress = 0.0;
  String _analysisStatus = '';

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
      );
      
      if (images.isNotEmpty) {
        setState(() {
          _selectedImages = images;
        });
        
        // Başarı sesi çal
        _playSuccessSound();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorSelectingPhoto(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );
      
      if (image != null) {
        setState(() {
          _selectedImages = [image];
        });
        
        // Başarı sesi çal
        _playSuccessSound();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorCapturingPhoto(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  Future<void> _playSuccessSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/success.mp3'));
      HapticFeedback.mediumImpact();
    } catch (e) {
      debugPrint('Başarı sesi çalma hatası: $e');
    }
  }

  Future<void> _analyzeImages() async {
    if (_selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.pleaseSelectAtLeastOnePhoto),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (!_authService.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)?.needLoginForAnalysis ?? 'Analiz için giriş yapmanız gerekiyor'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Convert XFile to CapturedPhoto
    List<CapturedPhoto> photos = [];
    for (int i = 0; i < _selectedImages.length; i++) {
      final xFile = _selectedImages[i];
      final file = File(xFile.path);
      
      if (!file.existsSync()) continue;
      
      // Her fotoğrafa bir stage ata (sırayla)
      CaptureStage stage;
      if (i == 0) {
        stage = CaptureStage.front;
      } else if (i == 1) stage = CaptureStage.right45;
      else if (i == 2) stage = CaptureStage.left45;
      else if (i == 3) stage = CaptureStage.vertex;
      else stage = CaptureStage.donor;

      photos.add(CapturedPhoto(
        file: file,
        stage: stage,
        capturedAt: DateTime.now(),
      ));
    }

    if (photos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.noValidPhotoFound),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Fotoğraf analizi chatbot sayfasına yönlendir
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => PhotoAnalysisChatScreen(initialPhotos: photos),
      ),
    );

    if (mounted && result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.photosAnalyzedAndSavedSuccessfully),
          backgroundColor: Colors.green,
        ),
      );
      // Başarılı olduysa analiz sayfasına yönlendir
      Navigator.of(context).pop(); // Upload ekranını kapat
      Navigator.of(context).pushReplacementNamed('/past-analyses'); // Analiz sayfasına git
    } else if (mounted && result == false) {
      // Kullanıcı geri döndüyse analiz sayfasına yönlendir
      Navigator.of(context).pop(); // Upload ekranını kapat
      Navigator.of(context).pushReplacementNamed('/past-analyses'); // Analiz sayfasına git
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.uploadAndAnalyzeTitle),
        backgroundColor: AppTheme.getBrandPrimaryColor(context),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _selectedImages.isEmpty
                  ? _buildEmptyState()
                  : _buildImageGrid(),
            ),
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 100,
            color: AppTheme.getTextSecondaryColor(context).withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)?.noPhotosSelectedYet ?? 'Henüz fotoğraf seçilmedi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.getTextPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)?.addPhotosFromGalleryOrCamera ?? 'Galeriden veya kameradan fotoğraf ekleyin',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.getTextSecondaryColor(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: _selectedImages.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(_selectedImages[index].path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => _removeImage(index),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getSurfaceColor(context),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isAnalyzing) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _analysisProgress,
                minHeight: 8,
                backgroundColor: AppTheme.getMutedSurfaceColor(context),
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.getBrandPrimaryColor(context),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _analysisStatus,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.getTextSecondaryColor(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${(_analysisProgress * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.getTextSecondaryColor(context),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
          ],
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _isAnalyzing ? null : _pickFromCamera,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppTheme.getBrandPrimaryColor(context), width: 2),
                    foregroundColor: AppTheme.getBrandPrimaryColor(context),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.camera_alt),
                  label: Text(AppLocalizations.of(context)!.imageSourceCamera),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _isAnalyzing ? null : _pickImages,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppTheme.getBrandPrimaryColor(context), width: 2),
                    foregroundColor: AppTheme.getBrandPrimaryColor(context),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.photo_library),
                  label: Text(AppLocalizations.of(context)!.imageSourceGallery),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isAnalyzing ? null : _analyzeImages,
              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppTheme.getBrandPrimaryColor(context),
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppTheme.getTextSecondaryColor(context),
              ),
              child: _isAnalyzing
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      AppLocalizations.of(context)?.analyzeButton ?? 'Analiz Et',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAnalysisResults(AiAnalysisResult result, int photoCount) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              result.isValid ? Icons.check_circle : Icons.warning,
              color: result.isValid ? Colors.green : Colors.orange,
              size: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                result.isValid ? 'Analiz Başarılı!' : 'Analiz Tamamlandı',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(result.message ?? 'Analiz tamamlandı'),
              const SizedBox(height: 16),
              Text(
                'Fotoğraf Sayısı: $photoCount',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                result.isValid ? 'Tüm fotoğraflar uygun' : 'Bazı fotoğraflar tekrar çekilmeli',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: result.isValid ? Colors.green : Colors.orange,
                ),
              ),
              if (result.invalidStages.isNotEmpty) ...[
                const SizedBox(height: 12),
                const Text(
                  '❌ Tekrar Çekilmesi Gereken Açılar:',
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                ),
                ...result.invalidStages.map((stage) => Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text('• ${_getStageName(stage)}'),
                )),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(true);
            },
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }

  String _getStageName(CaptureStage stage) {
    switch (stage) {
      case CaptureStage.front:
        return 'Ön (Front)';
      case CaptureStage.right45:
        return '45° Sağ (Right45)';
      case CaptureStage.left45:
        return '45° Sol (Left45)';
      case CaptureStage.vertex:
        return 'Tepe (Vertex)';
      case CaptureStage.donor:
        return 'Arka (Donor)';
    }
  }
}