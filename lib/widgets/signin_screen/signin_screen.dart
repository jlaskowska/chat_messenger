import 'package:chatroom/configs/app_colors.dart';

import 'package:chatroom/widgets/signin_screen/signin_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SigninScreenStore>(context);
    final _focusNode = FocusNode();

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          Icon(
            Icons.people_outline,
            color: AppColors.blue,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.10),
            child: TextField(
              focusNode: _focusNode,
              onChanged: (value) => store.nickname = value,
              cursorColor: Theme.of(context).accentColor,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                labelText: 'Nickname',
                errorText: store.nicknameError,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ),
          OutlineButton(
            onPressed: store.canSignin ? () => store.login() : null,
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            borderSide: BorderSide(color: Theme.of(context).accentColor, width: 2),
            child: Text(
              'Signin',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
