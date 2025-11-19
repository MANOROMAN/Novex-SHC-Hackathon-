
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:self_capture/l10n/app_localizations.dart';
import '../services/ai_chat_service.dart';
import '../theme/app_theme.dart';

class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({super.key});

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final SmileAiChatService _aiService = SmileAiChatService();

  final List<_ChatMessage> _messages = [];
  final List<_ChatSession> _sessions = [];

  bool _isSending = false;
  String? _activeSessionId;
  bool _welcomeAdded = false;
  Locale? _lastLocale;

  // SSS soruları ve cevapları
  final Map<String, String> _faqMap = {};

  @override
  void initState() {
    super.initState();

    _loadSessions();
    _startNewSession();
    _scrollController.addListener(_handleScrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    if (_lastLocale != locale) {
      _loadFAQMap();
      _lastLocale = locale;
    }
  }

  void _loadFAQMap() {
    final l10n = AppLocalizations.of(context)!;
    _faqMap.clear();
    _faqMap[l10n.faqQuestion1.toLowerCase()] = l10n.faqAnswer1;
    _faqMap[l10n.faqQuestion2.toLowerCase()] = l10n.faqAnswer2;
    _faqMap[l10n.faqQuestion3.toLowerCase()] = l10n.faqAnswer3;
    _faqMap[l10n.faqQuestion4.toLowerCase()] = l10n.faqAnswer4;
    _faqMap[l10n.faqQuestion5.toLowerCase()] = l10n.faqAnswer5;
    _faqMap[l10n.faqQuestion6.toLowerCase()] = l10n.faqAnswer6;
    _faqMap[l10n.faqQuestion7.toLowerCase()] = l10n.faqAnswer7;
    _faqMap[l10n.faqQuestion8.toLowerCase()] = l10n.faqAnswer8;
    _faqMap[l10n.faqQuestion9.toLowerCase()] = l10n.faqAnswer9;
    _faqMap[l10n.faqQuestion10.toLowerCase()] = l10n.faqAnswer10;
  }

  void _handleScrollListener() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;
    final showIndicator = maxScroll - offset > 200;
    if (showIndicator != _showScrollToBottom) {
      setState(() => _showScrollToBottom = showIndicator);
    }
  }

  bool _showScrollToBottom = false;

  void _startNewSession() {
    setState(() {
      _activeSessionId = DateTime.now().millisecondsSinceEpoch.toString();
      _messages.clear();
      _welcomeAdded = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _welcomeAdded) return;
      _addWelcomeMessage();
    });
  }

  void _addWelcomeMessage() {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return;
    setState(() {
      _messages.add(_ChatMessage.welcome(l10n.chatSupportWelcomeMessage));
      _welcomeAdded = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  Future<void> _loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('ai_chat_sessions');
    if (jsonString == null) return;

    final decoded = jsonDecode(jsonString) as List<dynamic>;
    final loaded = decoded
        .map((e) => _ChatSession.fromJson(e as Map<String, dynamic>))
        .toList();

    // Kullanıcı mesajı içermeyen (sadece hoşgeldin olan) sohbetleri kaldır
    final beforeCount = loaded.length;
    loaded.removeWhere(
      (session) => !session.messages.any((msg) => msg.isUser),
    );
    final removed = beforeCount != loaded.length;

    setState(() {
      _sessions
        ..clear()
        ..addAll(loaded);
    });

    if (removed) {
      await _persistSessions();
    }
  }

  Future<void> _deleteSession(String id) async {
    setState(() {
      _sessions.removeWhere((session) => session.id == id);
    });
    await _persistSessions();
  }

  Future<void> _persistSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(_sessions.map((session) => session.toJson()).toList());
    await prefs.setString('ai_chat_sessions', jsonString);
  }

  Future<void> _saveActiveSession() async {
    if (_activeSessionId == null) return;
    final hasUserMessage = _messages.any((msg) => msg.isUser);
    if (!hasUserMessage) return;

    final existingIndex =
        _sessions.indexWhere((session) => session.id == _activeSessionId);

    final updated = _ChatSession(
      id: _activeSessionId!,
      title: _messages
          .firstWhere((m) => m.isUser, orElse: () => _messages.first)
          .text
          .trim()
          .take(40),
      updatedAt: DateTime.now(),
      messages: List<_ChatMessage>.from(_messages),
    );

    setState(() {
      if (existingIndex >= 0) {
        _sessions[existingIndex] = updated;
      } else {
        _sessions.insert(0, updated);
      }
    });

    await _persistSessions();
  }

  String? _checkFAQ(String question) {
    final lowerQuestion = question.toLowerCase().trim();
    
    // Tam eşleşme kontrolü
    if (_faqMap.containsKey(lowerQuestion)) {
      return _faqMap[lowerQuestion];
    }
    
    // Kısmi eşleşme kontrolü (anahtar kelimeler)
    for (final entry in _faqMap.entries) {
      final keywords = entry.key.split(' ');
      final matchedKeywords = keywords.where((kw) => 
        kw.length > 3 && lowerQuestion.contains(kw)
      ).length;
      
      // Eğer sorunun %60'ından fazlası eşleşiyorsa
      if (matchedKeywords >= (keywords.length * 0.6).ceil()) {
        return entry.value;
      }
    }
    
    return null;
  }

  Future<void> _sendMessage([String? preset]) async {
    final text = preset ?? _messageController.text.trim();
    if (text.isEmpty || _isSending) return;

    setState(() {
      _messages.add(
        _ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
      _isSending = true;
    });

    _messageController.clear();
    _scrollToBottom();

    // Önce SSS kontrolü yap
    final faqAnswer = _checkFAQ(text);
    String aiResponse;
    
    if (faqAnswer != null) {
      // SSS cevabını kullan
      aiResponse = faqAnswer;
    } else {
      // AI'dan yanıt al
      final history = _messages
          .where((m) => !m.isWelcome)
          .map((m) => {
                'role': m.isUser ? 'user' : 'model',
                'text': m.text,
              })
          .toList();

      aiResponse = await _aiService.sendMessage(
        prompt: text,
        history: history,
      );
    }

    setState(() {
      _messages.add(
        _ChatMessage(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: aiResponse,
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
      _isSending = false;
    });

    _scrollToBottom();
    await _saveActiveSession();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  void _showHistorySheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.getElevatedSurfaceColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, modalSetState) {
            return _HistorySheet(
              sessions: _sessions,
              onDelete: (id) async {
                await _deleteSession(id);
                modalSetState(() {});
              },
              onSelect: (session) {
                setState(() {
                  _activeSessionId = session.id;
                  _messages
                    ..clear()
                    ..addAll(session.messages);
                  _welcomeAdded = true;
                });
                Navigator.of(context).pop();
                _scrollToBottom();
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();

    _aiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
      body: SafeArea(
        child: Column(
          children: [
            // Üst bar - Yeni sohbet ve Geçmiş butonları
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF101922) : Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: isDark 
                        ? const Color(0xFF192633).withOpacity(0.5) 
                        : const Color(0xFFE2E8F0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: AppTheme.getBrandPrimaryColor(context),
                    ),
                    onPressed: () {
                      _saveActiveSession();
                      _startNewSession();
                    },
                    tooltip: AppLocalizations.of(context)!.newChat,
                  ),
                  Text(
                    AppLocalizations.of(context)!.chatSupportAiAssistantName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.history,
                      color: AppTheme.getBrandPrimaryColor(context),
                    ),
                    onPressed: _sessions.isEmpty ? null : _showHistorySheet,
                    tooltip: AppLocalizations.of(context)!.historyTooltip,
                  ),
                ],
              ),
            ),

            // Mesajlar listesi
            Expanded(
              child: ListView.builder(
                key: ValueKey('chat_$_activeSessionId'),
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _MessageBubble(
                    message: _messages[index],
                    isDark: isDark,
                  );
                },
              ),
            ),

            // Yazıyor göstergesi
            if (_isSending)
              Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: _TypingIndicator(isDark: isDark),
              ),
            // Input alanı
            _buildInputArea(isDark),
          ],
        ),
      ),
      floatingActionButton: _showScrollToBottom
          ? FloatingActionButton.small(
              onPressed: _scrollToBottom,
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
              child: const Icon(Icons.arrow_downward_rounded, color: Colors.white),
            )
          : null,
    );
  }

  Widget _buildInputArea(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101922) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark 
                ? const Color(0xFF192633).withOpacity(0.5) 
                : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF192633) : const Color(0xFFF6F7F8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.chatMessageHint,
                    hintStyle: TextStyle(
                      color: isDark 
                          ? const Color(0xFF92ADC9) 
                          : const Color(0xFF6B7280),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                  maxLines: 5,
                  minLines: 1,
                  enabled: !_isSending,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _isSending ? null : () => _sendMessage(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.getBrandPrimaryColor(context),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  _isSending ? Icons.hourglass_bottom : Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    required this.isDark,
  });

  final _ChatMessage message;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
              child: Icon(
                Icons.psychology,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: message.isUser 
                  ? CrossAxisAlignment.end 
                  : CrossAxisAlignment.start,
              children: [
                if (!message.isUser)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      AppLocalizations.of(context)!.chatSupportAiAssistantName,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark 
                            ? const Color(0xFF92ADC9) 
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message.isUser 
                        ? AppTheme.getBrandPrimaryColor(context)
                        : (isDark ? const Color(0xFF192633) : Colors.white),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(message.isUser ? 12 : 0),
                      topRight: Radius.circular(message.isUser ? 0 : 12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isUser 
                          ? Colors.white 
                          : (isDark ? Colors.white : Colors.black87),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (message.isUser) ...[
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
              child: const Icon(Icons.person, size: 16, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }

}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppTheme.getBrandPrimaryColor(context),
          child: Icon(
            Icons.psychology,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF192633) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.typingIndicator,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme.getBrandPrimaryColor(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HistorySheet extends StatelessWidget {
  const _HistorySheet({
    required this.sessions,
    required this.onDelete,
    required this.onSelect,
  });

  final List<_ChatSession> sessions;
  final ValueChanged<String> onDelete;
  final ValueChanged<_ChatSession> onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.history,
                color: AppTheme.getBrandPrimaryColor(context),
              ),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context)!.chatHistoryTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getTextPrimaryColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: sessions.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.noSavedChats,
                      style: TextStyle(
                        color: AppTheme.getTextSecondaryColor(context),
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: sessions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final session = sessions[index];
                      return ListTile(
                        tileColor: AppTheme.getMutedSurfaceColor(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text(
                          session.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.getTextPrimaryColor(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          session.formattedDate,
                          style: TextStyle(
                            color: AppTheme.getTextSecondaryColor(context),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => onDelete(session.id),
                        ),
                        onTap: () => onSelect(session),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}


class _ChatMessage {
  _ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isWelcome = false,
  });

  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isWelcome;

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'isUser': isUser,
        'timestamp': timestamp.toIso8601String(),
        'isWelcome': isWelcome,
      };

  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _ChatMessage(
        id: json['id'] as String,
        text: json['text'] as String,
        isUser: json['isUser'] as bool,
        timestamp: DateTime.parse(json['timestamp'] as String),
        isWelcome: json['isWelcome'] as bool? ?? false,
      );

  static _ChatMessage welcome(String text) => _ChatMessage(
        id: 'welcome',
        text: text,
        isUser: false,
        timestamp: DateTime.now(),
        isWelcome: true,
      );
}

class _ChatSession {
  _ChatSession({
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.messages,
  });

  final String id;
  final String title;
  final DateTime updatedAt;
  final List<_ChatMessage> messages;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'updatedAt': updatedAt.toIso8601String(),
        'messages': messages.map((msg) => msg.toJson()).toList(),
      };

  factory _ChatSession.fromJson(Map<String, dynamic> json) => _ChatSession(
        id: json['id'] as String,
        title: json['title'] as String,
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        messages: (json['messages'] as List<dynamic>)
            .map((e) => _ChatMessage.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  String get formattedDate =>
      '${updatedAt.day.toString().padLeft(2, '0')}.${updatedAt.month.toString().padLeft(2, '0')}.${updatedAt.year}';
}

extension _StringTake on String {
  String take(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
