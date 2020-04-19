import 'package:chatroom/configs/app_colors.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.people_outline,
          color: AppColors.blue,
        ),
        TextField(),
      ],
    );
  }
}
