import 'package:chatroom/configs/app_colors.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              cursorColor: Theme.of(context).accentColor,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                labelText: 'Nickname',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ),
          OutlineButton(
            onPressed: () {},
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
