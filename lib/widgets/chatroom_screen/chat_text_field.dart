import 'package:chatroom/localizations.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  final onPressed;
  final onChanged;
  // final TextEditingController controller;
  ChatTextField({
    Key key,
    @required this.onPressed,
    @required this.onChanged,
    // @required this.controller,
  }) : super(key: key);

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              maxLines: null,
              cursorColor: Theme.of(context).accentColor,
              keyboardType: TextInputType.multiline,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: AppLocalizations.chatTextFieldSendMessageHintText,
              ),
              controller: _controller,
            ),
          ),
        ),
        FlatButton(
            onPressed: () {
              _controller.clear();
              widget.onPressed();
            },
            child: Text(
              AppLocalizations.chatroomSendMessageButton,
              style: TextStyle(color: Theme.of(context).accentColor),
            ))
      ],
    );
  }
}
