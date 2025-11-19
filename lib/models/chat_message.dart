import 'package:cloud_firestore/cloud_firestore.dart';

/// Message status enum (WhatsApp-style)
enum MessageStatus {
  sending,    // Gönderiliyor (görünmez, lokal)
  sent,       // Gönderildi (1 tik - gri)
  delivered,  // İletildi (2 tik - gri)
  read,       // Okundu (2 tik - mavi)
}

/// Chat message model for doctor-patient messaging
class ChatMessage {
  final String id;
  final String senderId;
  final String senderName;
  final String senderRole; // 'doctor' or 'patient'
  final String receiverId;
  final String message;
  final DateTime createdAt;
  final bool isRead;
  final String? imageUrl;
  final MessageStatus status;
  final DateTime? deliveredAt;
  final DateTime? readAt;
  final List<String> deletedFor; // Mesajı silenler

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderRole,
    required this.receiverId,
    required this.message,
    required this.createdAt,
    this.isRead = false,
    this.imageUrl,
    this.status = MessageStatus.sent,
    this.deliveredAt,
    this.readAt,
    this.deletedFor = const [],
  });

  factory ChatMessage.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    
    // Status belirleme
    MessageStatus status = MessageStatus.sent;
    if (data['readAt'] != null) {
      status = MessageStatus.read;
    } else if (data['deliveredAt'] != null) {
      status = MessageStatus.delivered;
    }
    
    // deletedFor listesini al
    List<String> deletedFor = [];
    if (data['deletedFor'] != null) {
      deletedFor = List<String>.from(data['deletedFor'] as List);
    }
    
    return ChatMessage(
      id: doc.id,
      senderId: data['senderId'] ?? '',
      senderName: data['senderName'] ?? '',
      senderRole: data['senderRole'] ?? 'patient',
      receiverId: data['receiverId'] ?? '',
      message: data['message'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isRead: data['isRead'] ?? false,
      imageUrl: data['imageUrl'],
      status: status,
      deliveredAt: (data['deliveredAt'] as Timestamp?)?.toDate(),
      readAt: (data['readAt'] as Timestamp?)?.toDate(),
      deletedFor: deletedFor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'senderRole': senderRole,
      'receiverId': receiverId,
      'message': message,
      'createdAt': FieldValue.serverTimestamp(),
      'isRead': isRead,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (deliveredAt != null) 'deliveredAt': Timestamp.fromDate(deliveredAt!),
      if (readAt != null) 'readAt': Timestamp.fromDate(readAt!),
    };
  }
}

/// Chat conversation between doctor and patient
class ChatConversation {
  final String id;
  final String patientId;
  final String patientName;
  final String doctorId;
  final String doctorName;
  final String lastMessage;
  final DateTime lastMessageAt;
  final int unreadCount;

  ChatConversation({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.doctorId,
    required this.doctorName,
    required this.lastMessage,
    required this.lastMessageAt,
    this.unreadCount = 0,
  });

  factory ChatConversation.fromFirestore(DocumentSnapshot doc, {String? userRole}) {
    final data = doc.data() as Map<String, dynamic>;
    // userRole'e göre doğru unreadCount'u al
    int unreadCount = 0;
    if (userRole == 'doctor') {
      unreadCount = (data['doctorUnreadCount'] as int?) ?? 0;
    } else if (userRole == 'patient') {
      unreadCount = (data['patientUnreadCount'] as int?) ?? 0;
    } else {
      // Fallback to generic unreadCount if userRole not provided
      unreadCount = (data['unreadCount'] as int?) ?? 0;
    }
    
    return ChatConversation(
      id: doc.id,
      patientId: data['patientId'] ?? '',
      patientName: data['patientName'] ?? '',
      doctorId: data['doctorId'] ?? '',
      doctorName: data['doctorName'] ?? '',
      lastMessage: data['lastMessage'] ?? '',
      lastMessageAt: (data['lastMessageAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      unreadCount: unreadCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'patientId': patientId,
      'patientName': patientName,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'lastMessage': lastMessage,
      'lastMessageAt': FieldValue.serverTimestamp(),
      'unreadCount': unreadCount,
    };
  }
}

