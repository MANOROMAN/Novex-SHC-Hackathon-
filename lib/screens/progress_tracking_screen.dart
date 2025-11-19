import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class ProgressTrackingScreen extends StatefulWidget {
  const ProgressTrackingScreen({super.key});

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {
  String? _selectedView;

  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  List<Map<String, dynamic>> _progressData = [];
  String? _userName;
  String? _patientId;

  @override
  void initState() {
    super.initState();
    _loadProgressData();
    _loadUserProfile();
  }

  Future<void> _loadProgressData() async {
    if (!_authService.isAuthenticated) return;
    
    final userId = _authService.currentUser!.uid;
    _firestoreService.getProgressTrackingStream(userId).listen((data) {
      if (mounted) {
        setState(() {
          _progressData = data;
        });
      }
    });
  }

  Future<void> _loadUserProfile() async {
    if (!_authService.isAuthenticated) return;
    final profile = await _authService.getUserProfile();
    if (!mounted) return;
    final profileData = profile?['profile'] ?? {};
    setState(() {
      _userName = profile?['displayName'] ??
          profileData['name'] ??
          _authService.currentUser?.displayName ??
          _userName;
      final patientId = profileData['patientId'];
      _patientId = (patientId is String && patientId.isNotEmpty)
          ? patientId
          : _authService.currentUser?.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = _authService.currentUser;
    final displayName = (_userName?.isNotEmpty ?? false)
        ? _userName!
        : ((currentUser?.displayName?.isNotEmpty ?? false)
            ? currentUser!.displayName!
            : l10n.patientNameSample);
    final patientId = (_patientId?.isNotEmpty ?? false)
        ? _patientId!
        : (currentUser?.uid ?? '—');
    _selectedView ??= l10n.timelineView;
    return Scaffold(

      backgroundColor: AppTheme.getBackgroundColor(context),
      body: CustomScrollView(
        slivers: [
          // Enhanced App Bar
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(

                color: AppTheme.getSurfaceColor(context),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: IconButton(

                icon: Icon(Icons.arrow_back, color: AppTheme.getTextPrimaryColor(context)),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: const SizedBox.shrink(),
            centerTitle: false,
            actions: const [],
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [

                      AppTheme.getPrimaryColor(context),
                      AppTheme.getPrimaryColor(context).withOpacity(0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 35,

                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: AppTheme.getPrimaryColor(context),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    displayName,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    l10n.progressPatientIdParam(patientId),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Enhanced Segmented Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(

                      color: AppTheme.getSurfaceColor(context),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        _buildViewButton(l10n.timelineView),
                        _buildViewButton(l10n.progressStatistics),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Timeline Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: _progressData.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                                Icon(
                                  Icons.timeline_outlined,
                                  size: 64,
                                  color: AppTheme.getTextSecondaryColor(context),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Henüz ilerleme kaydı yok',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.getTextSecondaryColor(context),
                                  ),
                      ),
                                const SizedBox(height: 8),
                                Text(
                                  'Fotoğraf yükleyerek ilerlemenizi takip edebilirsiniz',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.getTextSecondaryColor(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: _progressData.asMap().entries.map((entry) {
                            final index = entry.key;
                            final item = entry.value;
                            final isLast = index == _progressData.length - 1;
                            
                            return Column(
                              children: [
                      _buildEnhancedTimelineItem(
                                  icon: item['icon'] ?? Icons.check_circle,
                                  iconColor: item['iconColor'] ?? AppTheme.getPrimaryColor(context),
                                  title: item['title'] ?? '',
                                  date: item['date'] ?? '',
                                  hasImage: item['imageUrl'] != null,
                                  imageUrl: item['imageUrl'],
                                  description: item['description'],
                                  details: item['details'],
                                  isLast: isLast,
                      ),
                                if (!isLast) const SizedBox(height: 20),
                    ],
                            );
                          }).toList(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(

          gradient: LinearGradient(
            colors: [
              AppTheme.getPrimaryColor(context),
              AppTheme.getPrimaryColor(context).withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(

              color: AppTheme.getPrimaryColor(context).withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/photo-capture');
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_a_photo, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    l10n.progressUploadPhoto,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildViewButton(String view) {
    final isSelected = _selectedView == view;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedView = view;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: isSelected

                ? LinearGradient(
                    colors: [
                      AppTheme.getPrimaryColor(context),
                      AppTheme.getPrimaryColor(context).withOpacity(0.8),
                    ],
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(

                      color: AppTheme.getPrimaryColor(context).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              view,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,

                color: isSelected 
                    ? Colors.white 
                    : AppTheme.getTextSecondaryColor(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedTimelineItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String date,
    bool hasImage = false,
    String? imageUrl,
    String? description,
    String? details,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enhanced Timeline Marker
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    iconColor,
                    iconColor.withOpacity(0.7),
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: iconColor.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(icon, size: 18, color: Colors.white),
            ),
            if (!isLast)
              Container(
                width: 3,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      iconColor.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20),
        // Enhanced Timeline Content
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(

              color: AppTheme.getSurfaceColor(context),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.getTextPrimaryColor(context),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ],
                ),
                if (hasImage && imageUrl != null) ...[
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.5),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                if (details != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          iconColor.withOpacity(0.1),
                          iconColor.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: iconColor.withOpacity(0.2),
                      ),
                    ),
                    child: Text(
                      details,

                    style: TextStyle(
                        fontSize: 14,
                      color: AppTheme.getTextPrimaryColor(context),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
                if (description != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    description,

                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.getTextSecondaryColor(context),
                      height: 1.6,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}


