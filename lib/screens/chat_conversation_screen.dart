import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import '../models/chat_message.dart';
import '../models/doctor_model.dart';
import '../services/chat_service.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'package:self_capture/l10n/app_localizations.dart';

/// Chat conversation screen for doctor-patient messaging
class ChatConversationScreen extends StatefulWidget {
  final String doctorId;
  final String doctorName;
  final String patientId;
  final String patientName;
  final String userRole; // 'doctor' or 'patient'

  const ChatConversationScreen({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.patientId,
    required this.patientName,
    required this.userRole,
  });

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isSending = false;
  bool _isUploadingImage = false;
  static const int _messagePageSize = 30;
  int _messageLimit = _messagePageSize;
  bool _isLoadingMoreHistory = false;
  
  // Memory leak önleme: Stream subscription'ı kaydet
  StreamSubscription<List<ChatMessage>>? _messagesSubscription;
  
  // Performans: Debouncing için timer
  Timer? _sendDebounceTimer;
  
  // Performans: Son mesaj gönderme zamanı (spam önleme)
  DateTime? _lastSendTime;
  static const Duration _minSendInterval = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    // Arka planda çalışsın, sayfa açılışını engellemesin
    Future.microtask(() {
      _markAsRead();
      _markMessagesAsDelivered();
    });
  }
  
  @override
  void dispose() {
    // Memory leak önleme: Stream subscription'ı iptal et
    _messagesSubscription?.cancel();
    // Performans: Debounce timer'ı iptal et
    _sendDebounceTimer?.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadOlderMessages() {
    if (_isLoadingMoreHistory) return;
    setState(() {
      _isLoadingMoreHistory = true;
      _messageLimit += _messagePageSize;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isLoadingMoreHistory = false;
        });
      }
    });
  }

  Future<void> _markAsRead() async {
    try {
      await _chatService.markAsRead(
        doctorId: widget.doctorId,
        patientId: widget.patientId,
        userRole: widget.userRole,
      );
    } catch (e) {
      print('❌ Mark as read hatası: $e');
    }
  }

  /// Alıcı konuşmayı açtığında mesajları "delivered" olarak işaretle
  Future<void> _markMessagesAsDelivered() async {
    try {
      // Memory leak önleme: Stream subscription'ı kaydet
      _messagesSubscription = _chatService.getMessages(
        doctorId: widget.doctorId,
        patientId: widget.patientId,
        limit: _messageLimit,
      ).listen((messages) {
        if (!mounted) return; // Widget dispose edilmişse işlem yapma
        final receiverId = widget.userRole == 'doctor' ? widget.doctorId : widget.patientId;
        
        for (final message in messages) {
          // Sadece bana gönderilen ve henüz delivered olmayan mesajları işaretle
          if (message.receiverId == receiverId && message.deliveredAt == null) {
            _chatService.markAsDelivered(
              doctorId: widget.doctorId,
              patientId: widget.patientId,
              messageId: message.id,
            );
          }
        }
      });
    } catch (e) {
      debugPrint('❌ Mark as delivered hatası: $e');
    }
  }

  Future<void> _pickAndSendImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (image == null) return;

      setState(() => _isUploadingImage = true);

      // Upload to Firebase Storage
      final File imageFile = File(image.path);
      final String? imageUrl = await _storageService.uploadChatImage(
        imageFile,
        '${widget.doctorId}_${widget.patientId}',
      );

      if (imageUrl == null || imageUrl.isEmpty) {
        throw Exception('Fotoğraf yüklenemedi. Lütfen tekrar deneyin.');
      }

      // Sender bilgilerini belirle
      String senderId;
      if (widget.userRole == 'doctor') {
        senderId = widget.doctorId;
      } else {
        final currentUser = _authService.currentUser;
        if (currentUser == null) {
          throw Exception('Kullanıcı giriş yapmamış');
        }
        senderId = currentUser.uid;
      }

      final senderName = widget.userRole == 'doctor' 
          ? widget.doctorName 
          : widget.patientName;
      final receiverId = widget.userRole == 'doctor' 
          ? widget.patientId 
          : widget.doctorId;

      // Send message with image
      await _chatService.sendMessage(
        senderId: senderId,
        senderName: senderName,
        senderRole: widget.userRole,
        receiverId: receiverId,
        message: '📷 Fotoğraf',
        imageUrl: imageUrl,
        doctorName: widget.userRole == 'patient' ? _getDoctorDisplayName() : widget.doctorName,
        patientName: widget.patientName,
      );

      _scrollToBottom();
    } catch (e) {
      debugPrint('❌ Fotoğraf gönderme hatası: $e');
      if (mounted) {
        final errorMessage = e.toString().contains('Permission denied') 
            ? 'Fotoğraf yükleme izni yok. Lütfen Firebase Storage kurallarını kontrol edin.'
            : e.toString().contains('Fotoğraf çok büyük')
                ? 'Fotoğraf çok büyük. Maksimum 10MB olmalıdır.'
                : 'Fotoğraf gönderilemedi: ${e.toString()}';
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUploadingImage = false);
      }
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text(AppLocalizations.of(context)!.camera),
                onTap: () {
                  Navigator.pop(context);
                  _pickAndSendImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(AppLocalizations.of(context)!.gallery),
                onTap: () {
                  Navigator.pop(context);
                  _pickAndSendImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteOptions(ChatMessage message, bool isMe) {
    final currentUserId = widget.userRole == 'doctor' ? widget.doctorId : widget.patientId;
    
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: Text(AppLocalizations.of(context)!.deleteForMe),
                onTap: () async {
                  Navigator.pop(context);
                  
                  try {
                    await _chatService.deleteMessageForMe(
                      doctorId: widget.doctorId,
                      patientId: widget.patientId,
                      messageId: message.id,
                      userId: currentUserId,
                    );
                    
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(AppLocalizations.of(context)!.messageDeleted)),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!.anErrorOccurred(e.toString())),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
              ),
              if (isMe) ...[
                ListTile(
                  leading: const Icon(Icons.delete_forever, color: Colors.red),
                  title: Text(AppLocalizations.of(context)!.deleteForEveryone),
                  onTap: () {
                    Navigator.pop(context);
                    _confirmDeleteForEveryone(message);
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  void _confirmDeleteForEveryone(ChatMessage message) {
    // Mavi tik kontrolü (okundu mu?)
    final bool isRead = message.status == MessageStatus.read;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.deleteMessage),
          content: Text(
            isRead
                ? l10n.deleteMessageReadWarning
                : l10n.deleteMessageConfirm,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                
                try {
                  await _chatService.deleteMessageForEveryone(
                    doctorId: widget.doctorId,
                    patientId: widget.patientId,
                    messageId: message.id,
                  );
                  
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.messageDeletedForEveryone)),
                    );
                  }
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.anErrorOccurred(e.toString())),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(l10n.delete),
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty || _isSending) return;

    // Performans: Spam önleme - çok hızlı mesaj göndermeyi engelle
    final now = DateTime.now();
    if (_lastSendTime != null && now.difference(_lastSendTime!) < _minSendInterval) {
      return;
    }

    // Performans: Debounce timer'ı iptal et
    _sendDebounceTimer?.cancel();

    setState(() {
      _isSending = true;
      _lastSendTime = now;
    });

    try {
      // Doktor için auth kontrolü yapma, direkt doctorId kullan
      String senderId;
      if (widget.userRole == 'doctor') {
        senderId = widget.doctorId;
      } else {
        // Hasta için auth kontrolü yap
        final currentUser = _authService.currentUser;
        if (currentUser == null) {
          throw Exception(AppLocalizations.of(context)!.userNotLoggedIn);
        }
        senderId = currentUser.uid;
      }

      final senderName = widget.userRole == 'doctor' 
          ? widget.doctorName 
          : widget.patientName;
      final receiverId = widget.userRole == 'doctor' 
          ? widget.patientId 
          : widget.doctorId;

      // Performans: Mesaj gönderme işlemini async yap, UI'ı bloklamasın
      await _chatService.sendMessage(
        senderId: senderId,
        senderName: senderName,
        senderRole: widget.userRole,
        receiverId: receiverId,
        message: message,
        doctorName: widget.userRole == 'patient' ? _getDoctorDisplayName() : widget.doctorName,
        patientName: widget.patientName,
      );

      // Performans: Controller'ı temizle ve scroll'u gecikmeli yap
      _messageController.clear();
      
      // Performans: Scroll işlemini bir sonraki frame'de yap
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.messageSendError(e.toString())),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }


  String _getDoctorDisplayName() {
    // Önce doctorId'den Doctor modelinden almayı dene
    if (widget.doctorId.isNotEmpty) {
      Doctor? doctor = Doctor.getDoctorById(widget.doctorId);
      
      // Eğer bulunamazsa, doctorId email formatında olabilir, email'den dene
      if (doctor == null && widget.doctorId.contains('@')) {
        doctor = Doctor.getDoctorByEmail(widget.doctorId);
      }
      
      // Eğer hala bulunamazsa ve doctorId email formatında ise, email'i parse et
      if (doctor == null && widget.doctorId.contains('_at_')) {
        // Eski format: saricitarik_at_gmail_com
        final parts = widget.doctorId.split('_at_');
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
        return doctor.name;
      }
    }
    
    // Eğer Doctor modelinden bulunamazsa, widget.doctorName'i kontrol et
    if (widget.doctorName.isNotEmpty && 
        widget.doctorName != 'Doktor' &&
        widget.doctorName.trim().isNotEmpty &&
        !widget.doctorName.contains('@') &&
        !widget.doctorName.contains('At ') &&
        !widget.doctorName.contains('Gmail') &&
        !widget.doctorName.contains('Com')) {
      return widget.doctorName;
    }
    
    // Eğer hala "Doktor" ise ve doctorId geçerli formatta ise, doctorId'den isim oluştur
    if (widget.doctorId.isNotEmpty) {
      // doctorId formatını kontrol et (örn: "dr_tarik_sarici")
      if (widget.doctorId.startsWith('dr_') && !widget.doctorId.contains('@')) {
        final doctorIdParts = widget.doctorId.split('_');
        if (doctorIdParts.length >= 3) {
          // "dr" kısmını atla, geri kalanını birleştir
          final nameParts = doctorIdParts.skip(1).map((part) => 
            part.isEmpty ? '' : part[0].toUpperCase() + part.substring(1)
          ).toList();
          if (nameParts.length >= 2) {
            return 'Dr. ${nameParts.join(' ')}';
          }
        }
      }
    }
    
    return 'Doktor';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final doctorDisplayName = widget.userRole == 'patient' ? _getDoctorDisplayName() : widget.doctorName;
    final l10n = AppLocalizations.of(context)!;
    final recipientName = widget.userRole == 'doctor' 
        ? (widget.patientName.isNotEmpty ? widget.patientName : l10n.patient)
        : (doctorDisplayName.isNotEmpty ? doctorDisplayName : l10n.doctor);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
      // Performans: Klavye açıldığında rebuild'i optimize et
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF101922) : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.getTextPrimaryColor(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: AppTheme.getBrandPrimaryColor(context),
                child: Text(
                  recipientName.isNotEmpty ? recipientName[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipientName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.getTextPrimaryColor(context),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.userRole == 'doctor' 
                        ? AppLocalizations.of(context)!.patient 
                        : AppLocalizations.of(context)!.doctor,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.getTextSecondaryColor(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: StreamBuilder<List<ChatMessage>>(
              stream: _chatService.getMessages(
                doctorId: widget.doctorId,
                patientId: widget.patientId,
                limit: _messageLimit,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 48, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(AppLocalizations.of(context)!.messagesLoadingError,
                          style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
                        ),
                      ],
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppTheme.getBrandPrimaryColor(context),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.loadingMessages,
                          style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return const SizedBox.shrink();
                }

                final totalFetchedMessages = snapshot.data!;
                final hasMoreMessages = totalFetchedMessages.length >= _messageLimit;
                // Silinmemiş mesajları filtrele
                final currentUserId = widget.userRole == 'doctor' ? widget.doctorId : widget.patientId;
                final messages = totalFetchedMessages
                    .where((msg) => !msg.deletedFor.contains(currentUserId))
                    .toList();
                
                if (messages.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 64,
                          color: AppTheme.getTextSecondaryColor(context),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.noMessages,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.getTextSecondaryColor(context),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.startConversation,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.getTextSecondaryColor(context),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length + (hasMoreMessages ? 1 : 0),
                  // Performans optimizasyonları
                  cacheExtent: 200, // Kaç pixel önden render edilsin
                  addAutomaticKeepAlives: false, // Performans için
                  addRepaintBoundaries: true, // Her item için repaint boundary
                  physics: const ClampingScrollPhysics(), // Daha smooth scroll
                  itemBuilder: (context, index) {
                    if (hasMoreMessages && index == messages.length) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Center(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: AppTheme.getBrandPrimaryColor(context),
                            ),
                            onPressed: _isLoadingMoreHistory ? null : _loadOlderMessages,
                            icon: _isLoadingMoreHistory
                                ? SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppTheme.getBrandPrimaryColor(context),
                                      ),
                                    ),
                                  )
                                : const Icon(Icons.history),
                            label: Text(
                              _isLoadingMoreHistory
                                  ? AppLocalizations.of(context)!.loadingMessages
                                  : AppLocalizations.of(context)!.loadOlderMessages,
                            ),
                          ),
                        ),
                      );
                    }

                    final message = messages[index];
                    final isMe = message.senderRole == widget.userRole;
                    
                    return _MessageBubble(
                      key: ValueKey(message.id), // Her mesaj için unique key
                      message: message,
                      isMe: isMe,
                      isDark: isDark,
                      onLongPress: () => _showDeleteOptions(message, isMe),
                    );
                  },
                );
              },
            ),
          ),

          // Input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                children: [
                  // Fotoğraf butonu
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_photo_alternate_outlined,
                        color: AppTheme.getBrandPrimaryColor(context),
                        size: 24,
                      ),
                      onPressed: _isUploadingImage ? null : _showImageSourceDialog,
                      tooltip: AppLocalizations.of(context)!.sendPhoto,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark 
                            ? const Color(0xFF192633) 
                            : const Color(0xFFF6F7F8),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: isDark 
                              ? const Color(0xFF192633) 
                              : const Color(0xFFE2E8F0),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Mesajınızı yazın...',
                          hintStyle: TextStyle(
                            color: isDark 
                                ? const Color(0xFF92ADC9) 
                                : const Color(0xFF6B7280),
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black87,
                          fontSize: 15,
                        ),
                        maxLines: 5,
                        minLines: 1,
                        enabled: !_isSending && !_isUploadingImage,
                        onSubmitted: (_) {
                          _sendDebounceTimer?.cancel();
                          _sendDebounceTimer = Timer(const Duration(milliseconds: 100), () {
                            _sendMessage();
                          });
                        },
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _isSending ? null : _sendMessage,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.getBrandPrimaryColor(context),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.getBrandPrimaryColor(context).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: _isSending
                          ? const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ),
                            )
                          : const Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
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
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;
  final bool isDark;
  final VoidCallback onLongPress;

  const _MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.isDark,
    required this.onLongPress,
  });

  Widget _buildStatusIcon(ChatMessage message) {
    // 1 tik (gönderildi) - gri
    if (message.status == MessageStatus.sent) {
      return Icon(
        Icons.check,
        size: 14,
        color: isMe ? Colors.white.withOpacity(0.7) : Colors.grey,
      );
    }
    
    // 2 tik (iletildi) - gri
    if (message.status == MessageStatus.delivered) {
      return Icon(
        Icons.done_all,
        size: 14,
        color: isMe ? Colors.white.withOpacity(0.7) : Colors.grey,
      );
    }
    
    // 2 tik (okundu) - mavi
    if (message.status == MessageStatus.read) {
      return const Icon(
        Icons.done_all,
        size: 14,
        color: Color(0xFF00A3FF), // WhatsApp tarzı mavi
      );
    }
    
    // Default (sending)
    return Icon(
      Icons.access_time,
      size: 12,
      color: isMe ? Colors.white.withOpacity(0.5) : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.getBrandPrimaryColor(context),
              child: Text(
                message.senderName.isNotEmpty 
                    ? message.senderName[0].toUpperCase() 
                    : '?',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: GestureDetector(
              onLongPress: onLongPress,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isMe
                      ? AppTheme.getBrandPrimaryColor(context)
                      : (isDark ? const Color(0xFF192633) : Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isMe ? 20 : 4),
                    topRight: Radius.circular(isMe ? 4 : 20),
                    bottomLeft: const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isMe
                          ? AppTheme.getBrandPrimaryColor(context).withOpacity(0.3)
                          : Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // Fotoğraf varsa göster - Cached image ile performans optimizasyonu
                  if (message.imageUrl != null && message.imageUrl!.isNotEmpty) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: message.imageUrl!,
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SizedBox(
                          width: 200,
                          height: 150,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppTheme.primaryGreen,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 200,
                          height: 150,
                          color: Colors.grey[300],
                          child: const Icon(Icons.error_outline),
                        ),
                        memCacheWidth: 400, // Performans: Resmi küçült (2x retina için)
                        memCacheHeight: 300,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  Text(
                    message.message,
                    style: TextStyle(
                      color: isMe 
                          ? Colors.white 
                          : (isDark ? Colors.white : Colors.black87),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(message.createdAt),
                        style: TextStyle(
                          color: isMe
                              ? Colors.white.withOpacity(0.7)
                              : (isDark 
                                  ? const Color(0xFF92ADC9) 
                                  : const Color(0xFF6B7280)),
                          fontSize: 11,
                        ),
                      ),
                      // Sadece gönderen için tik işareti göster
                      if (isMe) ...[
                        const SizedBox(width: 4),
                        _buildStatusIcon(message),
                      ],
                    ],
                  ),
                  ],
                ),
              ),
            ),
          ),
          if (isMe) ...[
            const SizedBox(width: 8),
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
}
