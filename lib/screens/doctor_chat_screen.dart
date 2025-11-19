import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import '../services/doctor_auth_service.dart';
import 'package:self_capture/l10n/app_localizations.dart';

class DoctorChatScreen extends StatefulWidget {
  final String patientId;
  final String? patientName;
  final String? doctorId;
  
  const DoctorChatScreen({
    super.key, 
    required this.patientId, 
    this.patientName,
    this.doctorId,
  });

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  final _controller = TextEditingController();
  bool _sending = false;
  String? _doctorId;
  String? _doctorName;

  @override
  void initState() {
    super.initState();
    _loadDoctorInfo();
  }

  Future<void> _loadDoctorInfo() async {
    try {
      final doctorAuthService = DoctorAuthService();
      final isAuthenticated = await doctorAuthService.isDoctorAuthenticated;
      
      if (isAuthenticated) {
        final prefs = await SharedPreferences.getInstance();
        final doctorId = widget.doctorId ?? 
                        prefs.getString('doctor_id') ?? 
                        prefs.getString('doctorId');
        final doctorName = prefs.getString('doctor_name') ?? 
                          prefs.getString('doctorName') ?? 
                          'Dr. Unknown';
        
        if (doctorId != null && doctorId.isNotEmpty) {
          setState(() {
            _doctorId = doctorId;
            _doctorName = doctorName;
          });
          print('🩺 Doktor bilgisi yüklendi: $_doctorName ($_doctorId)');
        } else {
          print('❌ Doktor ID bulunamadı');
          _showAuthError();
        }
      } else {
        print('❌ Doktor kimlik doğrulama başarısız');
        _showAuthError();
      }
    } catch (e) {
      print('❌ Doktor bilgisi yükleme hatası: $e');
      _showAuthError();
    }
  }
  
  void _showAuthError() {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)?.loginRequiredToSend ?? 'Mesaj göndermek için doktor girişi yapmalısınız'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _messagesStream() {
    if (widget.patientId.isEmpty) {
      return const Stream.empty();
    }
    return FirebaseFirestore.instance
        .collection('doctor_chats')
        .doc(widget.patientId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .limit(200)
        .snapshots();
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || widget.patientId.isEmpty || _doctorId == null) {
      if (_doctorId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.loginRequiredToSend ?? 'Mesaj göndermek için giriş yapmalısınız'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }
    
    setState(() => _sending = true);
    try {
      await FirebaseFirestore.instance
          .collection('doctor_chats')
          .doc(widget.patientId)
          .collection('messages')
          .add({
        'text': text,
        'createdAt': FieldValue.serverTimestamp(),
        'sender': _doctorId!,
        'senderName': _doctorName ?? (AppLocalizations.of(context)?.doctor ?? 'Doktor'),
        'isFromDoctor': true,
        'type': 'text',
      });
      _controller.clear();
      print('📨 Mesaj gönderildi: $_doctorName -> ${widget.patientName}');
    } catch (e) {
      print('❌ Mesaj gönderme hatası: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)?.messageSendError(e.toString()) ?? 'Mesaj gönderilemedi: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textPrimary = AppTheme.getTextPrimaryColor(context);
    final title = widget.patientName ?? (AppLocalizations.of(context)?.patient ?? 'Hasta');
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.messagesWithTitle(title) ?? 'Mesajlar - $title'),
      ),
      backgroundColor: AppTheme.backgroundLight,
      body: Column(
        children: [
          Expanded(
            child: widget.patientId.isEmpty
                ? Center(child: Text(AppLocalizations.of(context)?.patientInfoMissing ?? 'Hasta bilgisi eksik'))
                : StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _messagesStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data?.docs ?? [];
                if (docs.isEmpty) {
                  return Center(child: Text(AppLocalizations.of(context)?.noMessages ?? 'Mesaj yok'));
                }
                return ListView.builder(
                  reverse: true,
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final m = docs[i].data();
                    final me = (m['isFromDoctor'] ?? false) == true;
                    return Align(
                      alignment: me ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: me ? AppTheme.primaryGreen : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          (m['text'] as String?) ?? '',
                          style: TextStyle(
                            color: me ? Colors.white : textPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)?.typeMessage ?? 'Mesaj yazın...',
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: (_sending || widget.patientId.isEmpty || _doctorId == null) ? null : _send,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.primaryGreen,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    child: _sending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : const Icon(Icons.send, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


