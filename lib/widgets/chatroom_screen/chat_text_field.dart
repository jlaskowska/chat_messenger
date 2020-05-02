import 'package:chatroom/localizations.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  final double constraintsMaxHeight;
  final onPressed;
  final onChanged;

  ChatTextField({
    Key key,
    @required this.onPressed,
    @required this.onChanged,
    @required this.constraintsMaxHeight,
  }) : super(key: key);

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _maxLines = (widget.constraintsMaxHeight * 0.02).toInt();
    debugPrint(_maxLines.toString()); // determine the max number of lines depending on the height of the device
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              minLines: 1,
              maxLines: _maxLines,
              cursorColor: Theme.of(context).accentColor,
              keyboardType: TextInputType.multiline,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: AppLocalizations.chatTextFieldSendMessageHintText,
                hintStyle: TextStyle(fontSize: 14),
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
