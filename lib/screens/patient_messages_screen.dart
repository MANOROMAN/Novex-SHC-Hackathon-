import 'package:flutter/material.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/chat_service.dart';
import '../services/auth_service.dart';
import '../models/chat_message.dart';
import '../models/doctor_model.dart';
import '../services/doctor_profile_service.dart';
import 'chat_conversation_screen.dart';

class PatientMessagesScreen extends StatefulWidget {
  const PatientMessagesScreen({super.key});

  @override
  State<PatientMessagesScreen> createState() => _PatientMessagesScreenState();
}

class _PatientMessagesScreenState extends State<PatientMessagesScreen> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final DoctorProfileService _doctorProfileService = DoctorProfileService();
  String? _patientId;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPatientId();
  }

  Future<void> _loadPatientId() async {
    final currentUser = _authService.currentUser;
    if (currentUser != null) {
      setState(() {
        _patientId = currentUser.uid;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);

    Widget page;

    if (_isLoading) {
      page = Scaffold(
        backgroundColor: AppTheme.getBackgroundColor(context),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else if (_patientId == null) {
      page = Scaffold(
        backgroundColor: AppTheme.getBackgroundColor(context),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myMessages),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 64,
                color: textSecondary,
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.loginRequiredForMessaging,
                style: TextStyle(
                  fontSize: 16,
                  color: textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(AppLocalizations.of(context)!.loginLoginButton),
              ),
            ],
          ),
        ),
      );
    } else {
      page = Scaffold(
        backgroundColor: AppTheme.getBackgroundColor(context),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myMessages),
          backgroundColor: AppTheme.getSurfaceColor(context),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              tooltip: 'Yeni Mesaj',
              onPressed: () => _showNewMessageDialog(context),
            ),
          ],
        ),
        body: StreamBuilder<List<ChatConversation>>(
          stream: _chatService.getPatientConversations(_patientId!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hata: ${snapshot.error}',
                      style: TextStyle(color: textSecondary),
                    ),
                  ],
                ),
              );
            }

            final conversations = snapshot.data ?? [];

            if (conversations.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 64,
                      color: textSecondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Henüz mesaj yok',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Doktorunuz size mesaj gönderdiğinde burada görünecek',
                      style: TextStyle(
                        fontSize: 14,
                        color: textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: conversations.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                
                return _ConversationTile(
                  conversation: conversation,
                  patientId: _patientId!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatConversationScreen(
                          doctorId: conversation.doctorId,
                          doctorName: conversation.doctorName,
                          patientId: conversation.patientId,
                          patientName: conversation.patientName,
                          userRole: 'patient',
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
        Navigator.pushReplacementNamed(context, '/dashboard');
        return false;
      },
      child: page,
    );
  }

  void _showNewMessageDialog(BuildContext context) {
    // Doktor listesini al
    final doctors = Doctor.getAllDoctors();
    
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Doktor Seç'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              
              // Sadece mesajlaşma açık olan doktorları göster
              if (!doctor.canMessage) return const SizedBox.shrink();
              
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(doctor.imagePath),
                ),
                title: Text(doctor.name),
                subtitle: Text(doctor.getLocalizedSpecialization(context)),
                onTap: () async {
                  Navigator.pop(dialogContext);
                  
                  // Hasta bilgilerini al
                  final currentUser = _authService.currentUser;
                  if (currentUser == null) {
                    return;
                  }
                  
                  final patientId = currentUser.uid;
                  final patientName = currentUser.displayName ?? 'Hasta';
                  final doctorEmail = doctor.email;
                  if (doctorEmail == null || doctorEmail.isEmpty) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Doktor e-posta bilgisi bulunamadı')),
                      );
                    }
                    return;
                  }
                  final doctorId = await _doctorProfileService.getDoctorIdByEmail(doctorEmail);
                  if (doctorId == null) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Doktor kaydı bulunamadı: ${doctor.name}'),
                        ),
                      );
                    }
                    return;
                  }
                  
                  // Mesajlaşma ekranına git
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatConversationScreen(
                        doctorId: doctorId,
                        doctorName: doctor.name,
                        patientId: patientId,
                        patientName: patientName,
                        userRole: 'patient',
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('İptal'),
          ),
        ],
      ),
    );
  }
}

class _ConversationTile extends StatelessWidget {
  final ChatConversation conversation;
  final String patientId;
  final VoidCallback onTap;

  const _ConversationTile({
    required this.conversation,
    required this.patientId,
    required this.onTap,
  });

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${dateTime.day}.${dateTime.month}.${dateTime.year}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} dk önce';
    } else {
      return 'Şimdi';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final textSecondary = AppTheme.getTextSecondaryColor(context);
    final unreadCount = conversation.unreadCount;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: AppTheme.getBrandPrimaryColor(context),
          child: Icon(
            Icons.local_hospital,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Builder(
          builder: (context) {
            // Doktor adını Doctor modelinden al, eğer yoksa conversation'dan kullan
            String displayName = 'Doktor';
            
            // Önce doctorId'den Doctor modelinden almayı dene
            if (conversation.doctorId.isNotEmpty) {
              Doctor? doctor = Doctor.getDoctorById(conversation.doctorId);
              
              // Eğer bulunamazsa, doctorId email formatında olabilir, email'den dene
              if (doctor == null && conversation.doctorId.contains('@')) {
                doctor = Doctor.getDoctorByEmail(conversation.doctorId);
              }
              
              // Eğer hala bulunamazsa ve doctorId email formatında ise, email'i parse et
              if (doctor == null && conversation.doctorId.contains('_at_')) {
                // Eski format: saricitarik_at_gmail_com
                final parts = conversation.doctorId.split('_at_');
                if (parts.length >= 2) {
                  final emailUser = parts[0];
                  final domainParts = parts[1].split('_');
                  if (domainParts.length >= 2) {
                    final domain = domainParts[0];
                    final email = '$emailUser@$domain.com';
                    doctor = Doctor.getDoctorByEmail(email);
                  }
                }
              }
              
              if (doctor != null && doctor.name.isNotEmpty) {
                displayName = doctor.name;
              } else if (conversation.doctorName.isNotEmpty && 
                        conversation.doctorName != 'Doktor' &&
                        conversation.doctorName.trim().isNotEmpty &&
                        !conversation.doctorName.contains('@') &&
                        !conversation.doctorName.contains('At ') &&
                        !conversation.doctorName.contains('Gmail') &&
                        !conversation.doctorName.contains('Com')) {
                displayName = conversation.doctorName;
              }
            } else if (conversation.doctorName.isNotEmpty && 
                      conversation.doctorName != 'Doktor' &&
                      conversation.doctorName.trim().isNotEmpty &&
                      !conversation.doctorName.contains('@') &&
                      !conversation.doctorName.contains('At ') &&
                      !conversation.doctorName.contains('Gmail') &&
                      !conversation.doctorName.contains('Com')) {
              displayName = conversation.doctorName;
            }
            
            // Eğer hala "Doktor" ise ve doctorId geçerli formatta ise, doctorId'den isim oluştur
            if (displayName == 'Doktor' && conversation.doctorId.isNotEmpty) {
              // doctorId formatını kontrol et (örn: "dr_tarik_sarici")
              if (conversation.doctorId.startsWith('dr_') && !conversation.doctorId.contains('@')) {
                final doctorIdParts = conversation.doctorId.split('_');
                if (doctorIdParts.length >= 3) {
                  // "dr" kısmını atla, geri kalanını birleştir
                  final nameParts = doctorIdParts.skip(1).map((part) => 
                    part.isEmpty ? '' : part[0].toUpperCase() + part.substring(1)
                  ).toList();
                  if (nameParts.length >= 2) {
                    displayName = 'Dr. ${nameParts.join(' ')}';
                  }
                }
              }
            }
            
            return Text(
              displayName.startsWith('Dr.') ? displayName : 'Dr. $displayName',
              style: TextStyle(
                color: textPrimary,
                fontWeight: unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
              ),
            );
          },
        ),
        subtitle: Text(
          conversation.lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textSecondary,
            fontWeight: unreadCount > 0 ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _formatTime(conversation.lastMessageAt),
              style: TextStyle(
                fontSize: 12,
                color: textSecondary,
              ),
            ),
            if (unreadCount > 0) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.getBrandPrimaryColor(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  unreadCount > 99 ? '99+' : '$unreadCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

