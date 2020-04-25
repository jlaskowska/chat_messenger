import 'package:chatroom/configs/app_colors.dart';
import 'package:chatroom/models/chat_user.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatUser chatuser;
  final String message;
  final bool isMe;
  ChatBubble({
    Key key,
    @required this.chatuser,
    @required this.isMe,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isMe);

    final avatar = Column(
      children: <Widget>[
        Icon(
          Icons.person,
          color: isMe ? AppColors.blue : AppColors.lightBlue,
        ),
        Text(
          chatuser.nickname,
          style: TextStyle(color: AppColors.gray),
        )
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          // isMe ? avatar : Expanded(child: Container()),
          if (!isMe)
            avatar,
          Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: !isMe
                      ? const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(20.0),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                  color: isMe ? AppColors.blue : Colors.grey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isMe ? AppColors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // isMe ? Expanded(child: Container()) : avatar,
          if (isMe)
            avatar,
        ],
      ),
    );
  }
}
