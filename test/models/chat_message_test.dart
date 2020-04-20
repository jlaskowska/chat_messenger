import 'dart:convert';

import 'package:chatroom/models/chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Correct json', () {
    final jsonData = """
{
  "id": "12345",
  "message": "Hello!",
  "date": 1587394742054,
  "chatUser": {
    "id": "09876",
    "nickname": "Bob"
  }
}
""";
    final jsonMap = json.decode(jsonData);
    final chatMessage = ChatMessage.fromJson(jsonMap);
    expect(chatMessage.id, "12345");
    expect(chatMessage.message, "Hello!");
    expect(chatMessage.date.millisecondsSinceEpoch, 1587394742054);
    expect(chatMessage.chatUser.id, "09876");
    expect(chatMessage.chatUser.nickname, "Bob");
  });
}
