import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasexchatapp/models/message.dart';

class ChatServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("message")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, otherUserId) {
    List<String> ids = [userID, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
