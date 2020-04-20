import 'package:flutter/foundation.dart';

class ChatUser {
  final String id;
  final String nickname;

  ChatUser({
    @required this.id,
    @required this.nickname,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        id: json['id'],
        nickname: json['nickname'],
      );

  Map<String, String> toJson() => {
        'id': id,
        'nickname': nickname,
      };

  @override
  String toString() => toJson().toString();
}
