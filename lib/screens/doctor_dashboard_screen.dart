import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/doctor_auth_service.dart';
import '../services/chat_service.dart';
import '../theme/app_theme.dart';
import '../models/chat_message.dart';
import 'doctor_approvals_screen.dart';
import 'doctor_appointments_screen.dart';
import 'chat_conversation_screen.dart';
import 'package:self_capture/l10n/app_localizations.dart';

class DoctorDashboardScreen extends StatefulWidget {
  const DoctorDashboardScreen({super.key});

  @override
  State<DoctorDashboardScreen> createState() => _DoctorDashboardScreenState();
}

class _DoctorDashboardScreenState extends State<DoctorDashboardScreen> {
  final DoctorAuthService _doctorService = DoctorAuthService();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.doctorPanel ?? 'Doktor Paneli'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildPatientsTab(),
          _buildAppointmentsTab(),
          _buildApprovalsTab(),
          _buildMessagesTab(),
          _buildAIChatbotTab(),
          _buildSettingsTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.people_outline), label: AppLocalizations.of(context)?.myPatients ?? 'Hastalarım'),
          BottomNavigationBarItem(icon: const Icon(Icons.calendar_month_outlined), label: AppLocalizations.of(context)?.appointments ?? 'Randevular'),
          BottomNavigationBarItem(icon: const Icon(Icons.check_circle_outline), label: AppLocalizations.of(context)?.approvals ?? 'Onaylar'),
          BottomNavigationBarItem(icon: const Icon(Icons.chat_bubble_outline), label: AppLocalizations.of(context)?.messages ?? 'Mesajlar'),
          BottomNavigationBarItem(icon: const Icon(Icons.psychology_outlined), label: AppLocalizations.of(context)?.aiAssistant ?? 'AI Asistan'),
          BottomNavigationBarItem(icon: const Icon(Icons.settings_outlined), label: AppLocalizations.of(context)?.settings ?? 'Ayarlar'),
        ],
      ),
    );
  }

  Widget _buildPatientsTab() {
    // Placeholder: list patients assigned to this doctor
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('patients')
          .orderBy('createdAt', descending: true)
          .limit(50)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snapshot.data?.docs ?? [];
        if (docs.isEmpty) {
          return Center(child: Text(AppLocalizations.of(context)?.noPatientsFound ?? 'Hasta bulunamadı.'));
        }
        return ListView.separated(
          itemCount: docs.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final d = docs[i].data() as Map<String, dynamic>;
            final name = (d['name'] ?? d['displayName'] ?? (AppLocalizations.of(context)?.patient ?? 'Hasta')).toString();
            final email = (d['email'] ?? '').toString();
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(name),
              subtitle: Text(email),
              trailing: IconButton(
                tooltip: AppLocalizations.of(context)?.sendMessage ?? 'Mesaj Gönder',
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () => Navigator.pushNamed(context, '/messages', arguments: {
                  'patientId': docs[i].id,
                  'patientName': name,
                }),
              ),
              onTap: () => Navigator.pushNamed(context, '/patient-detail', arguments: {
                'patientId': docs[i].id,
                'patientName': name,
              }),
            );
          },
        );
      },
    );
  }

  Widget _buildAppointmentsTab() {
    return FutureBuilder<String?>(
      future: _doctorService.getStoredDoctorId(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final doctorId = snapshot.data;
        if (doctorId == null || doctorId.isEmpty) {
          return Center(
            child: Text(AppLocalizations.of(context)?.doctorInfoNotFound ?? 'Doktor bilgisi bulunamadı.'),
          );
        }

        return FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, prefsSnapshot) {
            if (!prefsSnapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            
            final prefs = prefsSnapshot.data!;
            final doctorName = prefs.getString('doctor_name') ?? (AppLocalizations.of(context)?.doctor ?? 'Doktor');
            
            return DoctorAppointmentsScreen(
              doctorId: doctorId,
              doctorName: doctorName,
            );
          },
        );
      },
    );
  }

  Widget _buildApprovalsTab() {
    return const DoctorApprovalsScreen();
  }

  Widget _buildMessagesTab() {
    // Mesajlar ekranını içe aktarıp göster
    return FutureBuilder<bool>(
      future: _doctorService.isDoctorAuthenticated,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.data!) {
          return Center(
            child: Text(AppLocalizations.of(context)?.doctorSessionNotFound ?? 'Doktor oturumu bulunamadı.'),
          );
        }
        // Navigator yerine direkt widget göster
        return Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => _DoctorMessagesTab(),
            );
          },
        );
      },
    );
  }

  Widget _buildAIChatbotTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.psychology, color: AppTheme.getBrandPrimaryColor(context)),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)?.aiAssistant ?? 'AI Asistan',
                style: TextStyle(
                  color: AppTheme.getTextPrimaryColor(context),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.psychology_outlined,
                    size: 64,
                    color: AppTheme.primaryGreen.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)?.aiAssistant ?? 'AI Asistan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.aiAssistantDescription ?? 'Medikal sorularınıza AI destekli cevaplar alın',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/photo-analysis-chat'),
                    icon: const Icon(Icons.chat),
                    label: Text(AppLocalizations.of(context)?.chatWithAI ?? 'AI ile Sohbet Et'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.primaryGreen,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await _doctorService.signOutDoctor();
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false);
            },
            icon: const Icon(Icons.logout),
            label: Text(AppLocalizations.of(context)?.logoutDoctor ?? 'Çıkış Yap (Doktor)'),
          ),
        ],
      ),
    );
  }
}

// Mesajlar tab içeriği
class _DoctorMessagesTab extends StatefulWidget {
  @override
  State<_DoctorMessagesTab> createState() => _DoctorMessagesTabState();
}

class _DoctorMessagesTabState extends State<_DoctorMessagesTab> {
  final ChatService _chatService = ChatService();
  final DoctorAuthService _doctorAuthService = DoctorAuthService();
  String? _doctorId;
  final List<String> _legacyDoctorIds = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDoctorId();
  }

  Future<void> _loadDoctorId() async {
    final prefs = await SharedPreferences.getInstance();
    final doctorEmail = prefs.getString('doctor_email') ?? '';
    
    print('🔍 DoctorMessagesTab: Loading doctor ID');
    print('   Email: $doctorEmail');
    
    // Önce kayıtlı doctor_id'yi kontrol et
    final storedDoctorId = await _doctorAuthService.getStoredDoctorId();
    print('   Stored ID: $storedDoctorId');
    
    if (storedDoctorId != null && storedDoctorId.isNotEmpty) {
      print('✅ Using stored doctor ID: $storedDoctorId');
      setState(() {
        _doctorId = storedDoctorId;
        _isLoading = false;
      });
      return;
    }

    // Email'den türetilen ID'yi kullan (fallback)
    if (doctorEmail.isNotEmpty) {
      final derivedDoctorId = doctorEmail.replaceAll('@', '_at_').replaceAll('.', '_');
      print('⚠️ Using derived doctor ID: $derivedDoctorId');
      await prefs.setString('doctor_id', derivedDoctorId);
      setState(() {
        _doctorId = derivedDoctorId;
        _isLoading = false;
      });
      return;
    }

    print('❌ No doctor ID found');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_doctorId == null) {
      return Center(
        child: Text(AppLocalizations.of(context)?.doctorSessionNotFound ?? 'Doktor oturumu bulunamadı.'),
      );
    }

    print('📱 Building messages view with doctorId: $_doctorId');
    
    return StreamBuilder<List<ChatConversation>>(
      stream: _chatService.getDoctorConversations(
        _doctorId!,
        legacyDoctorIds: _legacyDoctorIds,
      ),
      builder: (context, snapshot) {
        print('📨 Messages stream state: ${snapshot.connectionState}');
        print('   Has data: ${snapshot.hasData}');
        print('   Data length: ${snapshot.data?.length ?? 0}');
        print('   Has error: ${snapshot.hasError}');
        if (snapshot.hasError) {
          print('   Error: ${snapshot.error}');
        }
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(AppLocalizations.of(context)?.errorWithDetail(snapshot.error.toString()) ?? 'Hata: ${snapshot.error}'),
                const SizedBox(height: 8),
                Text(AppLocalizations.of(context)?.doctorIdLabel(_doctorId!) ?? 'Doctor ID: $_doctorId', style: const TextStyle(fontSize: 12)),
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
                const Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(AppLocalizations.of(context)?.noMessagesYet ?? 'Henüz mesaj yok.'),
                const SizedBox(height: 8),
                Text(AppLocalizations.of(context)?.doctorIdLabel(_doctorId!) ?? 'Doctor ID: $_doctorId', style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          );
        }

        return ListView.separated(
          itemCount: conversations.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final conv = conversations[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(conv.patientName[0].toUpperCase()),
              ),
              title: Text(conv.patientName),
              subtitle: Text(
                conv.lastMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: conv.unreadCount > 0
                  ? CircleAvatar(
                      radius: 12,
                      backgroundColor: AppTheme.primaryGreen,
                      child: Text(
                        '${conv.unreadCount}',
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )
                  : null,
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                final doctorName = prefs.getString('doctor_name') ?? (AppLocalizations.of(context)?.doctor ?? 'Doktor');
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatConversationScreen(
                      doctorId: _doctorId!,
                      doctorName: doctorName,
                      patientId: conv.patientId,
                      patientName: conv.patientName,
                      userRole: 'doctor',
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}


