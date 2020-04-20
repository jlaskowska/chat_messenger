import 'package:chatroom/models/chat_user.dart';
import 'package:flutter/foundation.dart';

class ChatMessage {
  final String id;
  final String message;
  final DateTime date;
  final ChatUser chatUser;

  ChatMessage({
    @required this.id,
    @required this.message,
    @required this.date,
    @required this.chatUser,
  });

  factory ChatMessage.fromJson(Map<dynamic, dynamic> json) => ChatMessage(
        id: json['id'],
        message: json['message'],
        date: DateTime.fromMillisecondsSinceEpoch(json['date']),
        chatUser: ChatUser.fromJson(json['chatUser']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'date': date.millisecondsSinceEpoch,
        'charUser': chatUser.toJson(),
      };
}
