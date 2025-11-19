import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/chat_service.dart';
import '../services/doctor_auth_service.dart';
import '../models/chat_message.dart';
import '../models/doctor_model.dart';
import '../services/doctor_api_service.dart';
import '../services/doctor_profile_service.dart';
import 'chat_conversation_screen.dart';

class DoctorMessagesScreen extends StatefulWidget {
  const DoctorMessagesScreen({super.key});

  @override
  State<DoctorMessagesScreen> createState() => _DoctorMessagesScreenState();
}

class _DoctorMessagesScreenState extends State<DoctorMessagesScreen> {
  final ChatService _chatService = ChatService();
  final DoctorAuthService _doctorAuthService = DoctorAuthService();
  final DoctorProfileService _doctorProfileService = DoctorProfileService();
  String? _doctorId;
  List<String> _legacyDoctorIds = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDoctorId();
  }

  Future<void> _loadDoctorId() async {
    try {
      debugPrint('🔍 DoctorMessagesScreen: _loadDoctorId başladı');
      
      final isAuthenticated = await _doctorAuthService.isDoctorAuthenticated;
      debugPrint('   isDoctorAuthenticated: $isAuthenticated');
      
      if (!isAuthenticated) {
        debugPrint('❌ DoctorMessagesScreen: Doktor oturumu yok');
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
        return;
      }
      
      // Önce getStoredDoctorId() kullan (doğru yöntem)
      final storedDoctorId = await _doctorAuthService.getStoredDoctorId();
      debugPrint('   getStoredDoctorId(): $storedDoctorId');
      
      if (storedDoctorId != null && storedDoctorId.isNotEmpty) {
        debugPrint('✅ Using stored doctor ID: $storedDoctorId');
        if (mounted) {
          setState(() {
            _doctorId = storedDoctorId;
            _isLoading = false;
          });
        }
        return;
      }
      
      // Fallback: SharedPreferences'dan al
      final prefs = await SharedPreferences.getInstance();
      final doctorEmail = prefs.getString('doctor_email') ?? '';
      final doctorName = prefs.getString('doctor_name');
      final prefsDoctorId = prefs.getString('doctor_id');
      
      debugPrint('🔍 DoctorMessagesScreen: Loading doctor ID (fallback)');
      debugPrint('   Email: $doctorEmail');
      debugPrint('   Prefs Doctor ID: $prefsDoctorId');
      debugPrint('   Doctor Name: $doctorName');
      
      // Legacy doctor desteği
      try {
        final legacyDoctor = Doctor.getDoctorByEmail(doctorEmail);
        if (legacyDoctor != null) {
          _legacyDoctorIds = [legacyDoctor.id];
          debugPrint('   Legacy Doctor Found: ${legacyDoctor.id}');
        } else {
          _legacyDoctorIds = [];
        }
      } catch (e) {
        debugPrint('⚠️ Legacy doctor bulunamadı: $e');
        _legacyDoctorIds = [];
      }

      // Prefs'ten doctor_id varsa kullan
      if (prefsDoctorId != null && prefsDoctorId.isNotEmpty) {
        debugPrint('✅ Using prefs doctor ID: $prefsDoctorId');
        if (mounted) {
          setState(() {
            _doctorId = prefsDoctorId;
            _isLoading = false;
          });
        }
        return;
      }

      // Email ile Firestore'dan doctor ID'yi al
      if (doctorEmail.isNotEmpty) {
        try {
          debugPrint('   Fetching doctor ID from Firestore...');
          final doctorId = await _doctorProfileService.getDoctorIdByEmail(doctorEmail);
          debugPrint('   Firestore Doctor ID: $doctorId');
          
          if (doctorId != null && doctorId.isNotEmpty) {
            await prefs.setString('doctor_id', doctorId);
            debugPrint('✅ Using Firestore doctor ID: $doctorId');
            if (mounted) {
              setState(() {
                _doctorId = doctorId;
                _isLoading = false;
              });
            }
            return;
          }
        } catch (e, stackTrace) {
          debugPrint('❌ Firestore doctor ID getirme hatası: $e');
          debugPrint('   Stack trace: $stackTrace');
        }
        
        // Email'den türetilen ID'yi kullan (fallback)
        final derivedDoctorId = doctorEmail
            .toLowerCase()
            .trim()
            .replaceAll('@', '_at_')
            .replaceAll('.', '_');
        await prefs.setString('doctor_id', derivedDoctorId);
        debugPrint('⚠️ Using derived doctor ID: $derivedDoctorId');
        if (mounted) {
          setState(() {
            _doctorId = derivedDoctorId;
            _isLoading = false;
          });
        }
        return;
      }

      debugPrint('❌ No doctor ID found - Email boş');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e, stackTrace) {
      debugPrint('❌ DoctorMessagesScreen: _loadDoctorId hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);

    Widget page;

    if (_isLoading) {
      page = Scaffold(
        backgroundColor: AppTheme.getBackgroundColor(context),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else if (_doctorId == null) {
      page = Scaffold(
        backgroundColor: AppTheme.getBackgroundColor(context),
        appBar: AppBar(
          title: Text(l10n.myMessages),
        ),
        body: Center(
          child: Text(
            l10n.doctorSessionNotFound,
            style: TextStyle(color: textSecondary),
          ),
        ),
      );
    } else {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      page = Scaffold(
        backgroundColor: isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
        appBar: AppBar(
          backgroundColor: isDark ? const Color(0xFF101922) : Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.chat_bubble,
                  color: AppTheme.getBrandPrimaryColor(context),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.myMessages,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: AppTheme.getBrandPrimaryColor(context),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                tooltip: l10n.newMessage,
                onPressed: () => _showNewMessageDialog(context),
              ),
            ),
          ],
        ),
        body: StreamBuilder<List<ChatConversation>>(
          stream: _chatService.getDoctorConversations(
            _doctorId!,
            legacyDoctorIds: _legacyDoctorIds,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  l10n.errorWithDetails(snapshot.error.toString()),
                  style: TextStyle(color: textSecondary),
                ),
              );
            }

            final conversations = snapshot.data ?? [];

            if (conversations.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 64,
                        color: AppTheme.getBrandPrimaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.noMessagesYet,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.startNewMessageHint,
                      style: TextStyle(
                        fontSize: 14,
                        color: textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: conversations.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                
                return _ConversationTile(
                  conversation: conversation,
                  doctorId: _doctorId!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatConversationScreen(
                          doctorId: conversation.doctorId,
                          doctorName: conversation.doctorName,
                          patientId: conversation.patientId,
                          patientName: conversation.patientName,
                          userRole: 'doctor',
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          return true;
        }
        Navigator.pushReplacementNamed(context, '/doctor-dashboard');
        return false;
      },
      child: page,
    );
  }

  void _showNewMessageDialog(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      debugPrint('💬 Yeni mesaj dialogu açılıyor...');
      
      // Doktor bilgilerini al
      final prefs = await SharedPreferences.getInstance();
      final doctorEmail = prefs.getString('doctor_email') ?? '';
      
      // Önce getStoredDoctorId() kullan
      final storedDoctorId = await _doctorAuthService.getStoredDoctorId();
      final doctorId = storedDoctorId ?? _doctorId;
      
      debugPrint('   Doctor Email: $doctorEmail');
      debugPrint('   Stored Doctor ID: $storedDoctorId');
      debugPrint('   Current Doctor ID: $_doctorId');
      debugPrint('   Final Doctor ID: $doctorId');
      
      if (doctorId == null || doctorId.isEmpty) {
        debugPrint('❌ Doktor ID bulunamadı');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.doctorInfoNotFoundLoginAgain),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }
      
      final doctor = Doctor.getDoctorByEmail(doctorEmail);
      
      // Hasta listesini al
      final api = DoctorApiService();
      debugPrint('   Hasta listesi alınıyor...');
      final patients = await api.listUsers(limit: 1000);
      debugPrint('   ${patients.length} hasta bulundu');
      
      if (patients.isEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.noPatientsFound)),
          );
        }
        return;
      }

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(l10n.selectPatient),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  try {
                    final patient = patients[index];
                    final patientId = (patient['id'] as Object?)?.toString() ?? '';
                    final patientName = ((patient['displayName'] ?? l10n.unknown) as Object).toString();
                    final avatarUrl = ((patient['avatarUrl'] ?? '') as Object).toString();
                    
                    if (patientId.isEmpty) {
                      debugPrint('⚠️ Hasta ID boş: index=$index');
                      return const SizedBox.shrink();
                    }
                    
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                        child: avatarUrl.isEmpty ? const Icon(Icons.person_outline) : null,
                      ),
                      title: Text(patientName),
                      onTap: () {
                        try {
                          Navigator.pop(dialogContext);
                          if (patientId.isEmpty || doctorId.isEmpty) {
                            debugPrint('❌ Hasta veya doktor ID boş - mesajlaşma başlatılamıyor');
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l10n.patientOrDoctorInfoNotFound),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            return;
                          }
                          
                          debugPrint('💬 Mesajlaşma başlatılıyor:');
                          debugPrint('   Doctor ID: $doctorId');
                          debugPrint('   Patient ID: $patientId');
                          debugPrint('   Patient Name: $patientName');
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatConversationScreen(
                                doctorId: doctorId,
                                doctorName: doctor?.name ?? l10n.doctorFallbackName,
                                patientId: patientId,
                                patientName: patientName,
                                userRole: 'doctor',
                              ),
                            ),
                          );
                        } catch (e, stackTrace) {
                          debugPrint('❌ Mesajlaşma başlatma hatası: $e');
                          debugPrint('   Stack trace: $stackTrace');
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.errorWithDetails(e.toString())),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                    );
                  } catch (e, stackTrace) {
                    debugPrint('❌ Hasta listesi item builder hatası: $e');
                    debugPrint('   Stack trace: $stackTrace');
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(l10n.cancel),
              ),
            ],
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ _showNewMessageDialog hatası: $e');
      debugPrint('   Stack trace: $stackTrace');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.errorWithDetails(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _ConversationTile extends StatelessWidget {
  final ChatConversation conversation;
  final String doctorId;
  final VoidCallback onTap;

  const _ConversationTile({
    required this.conversation,
    required this.doctorId,
    required this.onTap,
  });

  String _formatTime(BuildContext context, DateTime dateTime) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${dateTime.day}.${dateTime.month}.${dateTime.year}';
    } else if (difference.inHours > 0) {
      return l10n.hoursAgo(difference.inHours);
    } else if (difference.inMinutes > 0) {
      return l10n.minutesAgo(difference.inMinutes);
    } else {
      return l10n.justNow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);
    final unreadCount = conversation.unreadCount;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF192633) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppTheme.getBrandPrimaryColor(context),
                      child: Text(
                        conversation.patientName.isNotEmpty
                            ? conversation.patientName[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (unreadCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark ? const Color(0xFF192633) : Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            unreadCount > 99 ? '99+' : '$unreadCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              conversation.patientName,
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 16,
                                fontWeight: unreadCount > 0 ? FontWeight.bold : FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            _formatTime(context, conversation.lastMessageAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        conversation.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 14,
                          fontWeight: unreadCount > 0 ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

