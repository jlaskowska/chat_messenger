import 'dart:convert';

import 'package:chatroom/models/chat_user.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Correct json', () {
    final jsonData = """
{
  "id": "12345",
  "nickname": "Bob"
}
""";
    final jsonMap = json.decode(jsonData);
    final chatUser = ChatUser.fromJson(jsonMap);
    expect(chatUser.id, "12345");
    expect(chatUser.nickname, "Bob");
  });

  test('Incorrect json', () {
    final jsonData = """
{
  "id": "12345",
  "bla": "Bob"
}
""";
    final jsonMap = json.decode(jsonData);
    final chatUser = ChatUser.fromJson(jsonMap);
    expect(chatUser.id, "12345");
    expect(chatUser.nickname, isNull);
  });
}
