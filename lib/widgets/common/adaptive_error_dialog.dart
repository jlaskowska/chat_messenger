import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveErrorDialog extends StatelessWidget {
  final String content;
  final String title;
  final String buttonLabel;
  final void Function() onPressed;

  const AdaptiveErrorDialog({
    Key key,
    @required this.title,
    @required this.content,
    @required this.buttonLabel,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                onPressed: onPressed,
                child: Text(buttonLabel),
              )
            ],
          )
        : AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                onPressed: onPressed,
                child: Text(buttonLabel),
              )
            ],
          );
  }
}

showAdaptiveErrorDialog({
  @required BuildContext context,
  @required AdaptiveErrorDialog adaptiveErrorDialog,
  bool barrierDismissible = true,
}) =>
    showDialog(
      context: context,
      builder: (_) => adaptiveErrorDialog,
      barrierDismissible: barrierDismissible,
    );
