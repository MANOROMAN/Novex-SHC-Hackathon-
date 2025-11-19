import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_message.dart';

/// Service for doctor-patient messaging using Firebase Firestore
class ChatService {
  static final ChatService _instance = ChatService._internal();
  factory ChatService() => _instance;
  ChatService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Map<String, String> _conversationIdCache = {};

  String _legacyConversationId(String doctorId, String patientId) {
    return '${doctorId}_$patientId';
  }

  String _canonicalConversationId(String doctorId, String patientId) {
    final ids = [doctorId, patientId]..sort();
    return '${ids[0]}__${ids[1]}';
  }

  String _participantsKey(String doctorId, String patientId) {
    final ids = [doctorId, patientId]..sort();
    return ids.join('::');
  }

  Future<String> _resolveConversationId(
    String doctorId,
    String patientId,
  ) async {
    final key = _participantsKey(doctorId, patientId);
    if (_conversationIdCache.containsKey(key)) {
      return _conversationIdCache[key]!;
    }

    final existing = await _firestore
        .collection('conversations')
        .where('participantsKey', isEqualTo: key)
        .limit(1)
        .get();
    if (existing.docs.isNotEmpty) {
      final resolved = existing.docs.first.id;
      _conversationIdCache[key] = resolved;
      return resolved;
    }

    final legacyId = _legacyConversationId(doctorId, patientId);
    final legacyDoc =
        await _firestore.collection('conversations').doc(legacyId).get();
    if (legacyDoc.exists) {
      await legacyDoc.reference
          .set({'participantsKey': key}, SetOptions(merge: true));
      _conversationIdCache[key] = legacyId;
      return legacyId;
    }

    final canonicalId = _canonicalConversationId(doctorId, patientId);
    _conversationIdCache[key] = canonicalId;
    return canonicalId;
  }

  /// Send a message from patient to doctor or vice versa
  Future<void> sendMessage({
    required String senderId,
    required String senderName,
    required String senderRole, // 'doctor' or 'patient'
    required String receiverId,
    required String message,
    String? imageUrl,
    String? doctorName,
    String? patientName,
  }) async {
    try {
      // Determine doctor and patient IDs
      final doctorId = senderRole == 'doctor' ? senderId : receiverId;
      final patientId = senderRole == 'patient' ? senderId : receiverId;
      final conversationId =
          await _resolveConversationId(doctorId, patientId);
      final participantsKey = _participantsKey(doctorId, patientId);
      final conversationRef =
          _firestore.collection('conversations').doc(conversationId);

      // Conversation metadata - sadece dolu olan isimleri güncelle
      Map<String, dynamic> conversationData = {
        'doctorId': doctorId,
        'patientId': patientId,
        'lastMessage': message,
        'lastMessageAt': FieldValue.serverTimestamp(),
        'lastSenderId': senderId,
        'lastSenderRole': senderRole,
        'updatedAt': FieldValue.serverTimestamp(),
        'participantsKey': participantsKey,
      };

      // İsimleri ekle - sadece sağlanmışsa
      if (senderRole == 'doctor' && doctorName != null && doctorName.isNotEmpty) {
        conversationData['doctorName'] = doctorName;
      } else if (senderRole == 'doctor') {
        conversationData['doctorName'] = senderName;
      }
      
      if (senderRole == 'patient' && patientName != null && patientName.isNotEmpty) {
        conversationData['patientName'] = patientName;
      } else if (senderRole == 'patient') {
        conversationData['patientName'] = senderName;
      }

      // Alıcının ismini de ekle eğer verilmişse
      if (senderRole == 'doctor' && patientName != null && patientName.isNotEmpty) {
        conversationData['patientName'] = patientName;
      } else if (senderRole == 'patient' && doctorName != null && doctorName.isNotEmpty) {
        conversationData['doctorName'] = doctorName;
      }

      // Update conversation metadata
      await conversationRef.set(conversationData, SetOptions(merge: true));

      // Create message
      final messageData = ChatMessage(
        id: '',
        senderId: senderId,
        senderName: senderName,
        senderRole: senderRole,
        receiverId: receiverId,
        message: message,
        createdAt: DateTime.now(),
        isRead: false,
        imageUrl: imageUrl,
      ).toMap();

      // Add message to conversation
      await conversationRef.collection('messages').add(messageData);

      // Increment unread count for receiver
      if (senderRole == 'doctor') {
        await conversationRef
            .update({'patientUnreadCount': FieldValue.increment(1)});
      } else {
        await conversationRef
            .update({'doctorUnreadCount': FieldValue.increment(1)});
      }
    } catch (e) {
      print('❌ Mesaj gönderme hatası: $e');
      rethrow;
    }
  }

  /// Get messages stream for a conversation
  Stream<List<ChatMessage>> getMessages({
    required String doctorId,
    required String patientId,
    int limit = 30, // Performans: Varsayılan limit 30'a düşürüldü
  }) async* {
    final conversationId =
        await _resolveConversationId(doctorId, patientId);
    yield* _firestore
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => ChatMessage.fromFirestore(doc))
              .toList();
        });
  }

  /// Get conversations for a doctor. Accepts optional legacy ids for backward compatibility.
  Stream<List<ChatConversation>> getDoctorConversations(
    String doctorId, {
    List<String> legacyDoctorIds = const [],
  }) {
    final ids = <String>{
      if (doctorId.isNotEmpty) doctorId,
      ...legacyDoctorIds.where((id) => id.isNotEmpty),
    }.toList();

    if (ids.isEmpty) {
      return Stream.value([]);
    }

    Query<Map<String, dynamic>> query =
        _firestore.collection('conversations');

    if (ids.length == 1) {
      query = query.where('doctorId', isEqualTo: ids.first);
    } else {
      // Firestore whereIn supports up to 10 items.
      query = query.where('doctorId', whereIn: ids.take(10).toList());
    }

    return query
        .orderBy('lastMessageAt', descending: true)
        .limit(50) // Performans: Maksimum 50 konuşma yükle
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatConversation.fromFirestore(doc, userRole: 'doctor'))
            .toList());
  }

  /// Get conversations for a patient
  Stream<List<ChatConversation>> getPatientConversations(String patientId) {
    try {
      return _firestore
          .collection('conversations')
          .where('patientId', isEqualTo: patientId)
          .snapshots()
          .map((snapshot) {
            final conversations = snapshot.docs
                .map((doc) => ChatConversation.fromFirestore(doc, userRole: 'patient'))
                .toList();
            // Client-side sorting by lastMessageAt
            conversations.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
            return conversations;
          });
    } catch (e) {
      print('❌ getPatientConversations hatası: $e');
      // Return empty stream on error
      return Stream.value([]);
    }
  }

  /// Mark message as delivered (2 tik - gri)
  Future<void> markAsDelivered({
    required String doctorId,
    required String patientId,
    required String messageId,
  }) async {
    try {
      final conversationId =
          await _resolveConversationId(doctorId, patientId);
      await _firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .doc(messageId)
          .update({
        'deliveredAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('❌ Delivered mark hatası: $e');
    }
  }

  /// Mark messages as read (2 tik - mavi)
  Future<void> markAsRead({
    required String doctorId,
    required String patientId,
    required String userRole, // 'doctor' or 'patient'
  }) async {
    try {
      final conversationId =
          await _resolveConversationId(doctorId, patientId);
      // Okunmamış mesajları bul
      final unreadMessages = await _firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .where('receiverId', isEqualTo: userRole == 'doctor' ? doctorId : patientId)
          .where('readAt', isEqualTo: null)
          .get();

      // Her mesajı okundu olarak işaretle
      final batch = _firestore.batch();
      for (final doc in unreadMessages.docs) {
        batch.update(doc.reference, {
          'readAt': FieldValue.serverTimestamp(),
          'isRead': true,
        });
      }
      await batch.commit();

      // Reset unread count
      if (userRole == 'doctor') {
        await _firestore
            .collection('conversations')
            .doc(conversationId)
            .update({'doctorUnreadCount': 0});
      } else {
        await _firestore
            .collection('conversations')
            .doc(conversationId)
            .update({'patientUnreadCount': 0});
      }
    } catch (e) {
      print('❌ Read mark hatası: $e');
    }
  }

  /// Mesajı sadece benden sil (soft delete)
  Future<void> deleteMessageForMe({
    required String doctorId,
    required String patientId,
    required String messageId,
    required String userId,
  }) async {
    try {
      final conversationId =
          await _resolveConversationId(doctorId, patientId);
      await _firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .doc(messageId)
          .update({
        'deletedFor': FieldValue.arrayUnion([userId]),
      });
    } catch (e) {
      print('❌ Mesaj silme hatası: $e');
      rethrow;
    }
  }

  /// Mesajı herkesten sil (hard delete - sadece gönderen silebilir)
  Future<void> deleteMessageForEveryone({
    required String doctorId,
    required String patientId,
    required String messageId,
  }) async {
    try {
      final conversationId =
          await _resolveConversationId(doctorId, patientId);
      await _firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .doc(messageId)
          .delete();
    } catch (e) {
      print('❌ Mesaj silme hatası: $e');
      rethrow;
    }
  }

  /// Delete a conversation (admin only)
  Future<void> deleteConversation({
    required String doctorId,
    required String patientId,
  }) async {
    // Delete all messages
    final conversationId =
        await _resolveConversationId(doctorId, patientId);
    final messages = await _firestore
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .get();
    
    for (final doc in messages.docs) {
      await doc.reference.delete();
    }
    
    // Delete conversation
    await _firestore.collection('conversations').doc(conversationId).delete();
  }

  /// Get unread count for user
  Future<int> getUnreadCount({
    required String userId,
    required String userRole,
  }) async {
    final field = userRole == 'doctor' ? 'doctorUnreadCount' : 'patientUnreadCount';
    final idField = userRole == 'doctor' ? 'doctorId' : 'patientId';
    
    final snapshot = await _firestore
        .collection('conversations')
        .where(idField, isEqualTo: userId)
        .get();
    
    int total = 0;
    for (final doc in snapshot.docs) {
      final data = doc.data();
      total += (data[field] as int?) ?? 0;
    }
    
    return total;
  }
}

