import 'package:chatroom/models/chat_message.dart';

abstract class IChatService {
  Stream<List<ChatMessage>> messageStream();

  Future<void> sendMessage(ChatMessage message);
}
