import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';

/// Simple conversation screen between a patient and a doctor.
/// Firestore structure (suggested):
/// conversations/{conversationId}
///   participants: [patientId, doctorId]
///   doctorId, patientId
///   updatedAt
/// conversations/{conversationId}/messages/{messageId}
///   senderId, text, createdAt
class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final _textController = TextEditingController();
  String? _conversationId;
  String? _patientId;
  String? _doctorId;
  String? _title;
  final _authService = AuthService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map) {
      _patientId = args['patientId'] as String? ?? _authService.currentUser?.uid;
      _doctorId = args['doctorId'] as String?;
      _title = args['patientName'] as String? ?? args['doctorName'] as String? ?? AppLocalizations.of(context)!.messages;
      _ensureConversation();
    }
    // Argüman gelmediyse de hasta kimliğini doldur
    _patientId ??= _authService.currentUser?.uid;
  }

  Future<void> _ensureConversation() async {
    if (_patientId == null || _doctorId == null) return;
    final q = await FirebaseFirestore.instance
        .collection('conversations')
        .where('patientId', isEqualTo: _patientId)
        .where('doctorId', isEqualTo: _doctorId)
        .limit(1)
        .get();
    if (q.docs.isNotEmpty) {
      setState(() {
        _conversationId = q.docs.first.id;
      });
      return;
    }
    final ref = await FirebaseFirestore.instance.collection('conversations').add({
      'patientId': _patientId,
      'doctorId': _doctorId,
      'participants': [_patientId, _doctorId],
      'updatedAt': FieldValue.serverTimestamp(),
    });
    setState(() {
      _conversationId = ref.id;
    });
  }

  Future<void> _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _conversationId == null) return;
    final messages = FirebaseFirestore.instance
        .collection('conversations')
        .doc(_conversationId)
        .collection('messages');
    await messages.add({
      'text': text,
      'createdAt': FieldValue.serverTimestamp(),
      // In a full app, set the senderId from current user (patient or doctor)
      'senderId': 'unknown',
    });
    await FirebaseFirestore.instance
        .collection('conversations')
        .doc(_conversationId)
        .update({'updatedAt': FieldValue.serverTimestamp()});
    _textController.clear();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(context),
      appBar: AppBar(title: Text(_title ?? AppLocalizations.of(context)!.messages)),
      body: Column(
        children: [
          Expanded(
            child: _conversationId == null
                ? const Center(child: CircularProgressIndicator())
                : StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('conversations')
                        .doc(_conversationId)
                        .collection('messages')
                        .orderBy('createdAt', descending: true)
                        .limit(100)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final docs = snapshot.data?.docs ?? [];
                      if (docs.isEmpty) {
                        return Center(child: Text(AppLocalizations.of(context)!.noMessagesYet));
                      }
                      return ListView.builder(
                        reverse: true,
                        itemCount: docs.length,
                        itemBuilder: (context, i) {
                          final data = docs[i].data() as Map<String, dynamic>;
                          final text = (data['text'] ?? '').toString();
                          return ListTile(
                            title: Text(text),
                            dense: true,
                          );
                        },
                      );
                    },
                  ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Mesaj yazın...',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


