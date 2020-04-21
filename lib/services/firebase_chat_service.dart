import 'package:chatroom/models/chat_message.dart';
import 'package:chatroom/services/i_chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatService implements IChatService {
  // A path for the messages collection
  static const _messageCollectionPath = 'messages';

  @override
  Stream<List<ChatMessage>> messageStream() {
    return null;
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    final documentReference = Firestore.instance.collection(_messageCollectionPath).document(message.id);

    await Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        message.toJson(),
      );
    });
  }
}
