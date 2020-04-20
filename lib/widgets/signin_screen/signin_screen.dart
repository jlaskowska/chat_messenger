import 'package:chatroom/configs/app_colors.dart';
import 'package:chatroom/widgets/common/adaptive_error_dialog.dart';
import 'package:chatroom/widgets/common/modal_progress_indicator.dart';
import 'package:chatroom/widgets/signin_screen/chatroom_screen/chatroom_screen.dart';
import 'package:chatroom/widgets/signin_screen/signin_screen_store.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../localizations.dart';
import '../../localizations.dart';
import '../../localizations.dart';
import '../../localizations.dart';
import '../../localizations.dart';
import '../../localizations.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SigninScreenStore>(context);

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
              onChanged: (value) => store.nickname = value,
              cursorColor: Theme.of(context).accentColor,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                labelText: AppLocalizations.signinScreenNickname,
                errorText: store.nicknameError,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ),
          ButtonTheme(
            minWidth: constraints.maxWidth * 0.5,
            child: OutlineButton(
              onPressed: store.canSignin
                  ? () async {
                      ModalProgressIndicator.show(context);
                      final success = await store.login();
                      ModalProgressIndicator.dismiss();

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatroomScreen(),
                          ),
                        );
                      } else {
                        showAdaptiveErrorDialog(
                          context: context,
                          adaptiveErrorDialog: AdaptiveErrorDialog(
                            title: AppLocalizations.signinScreenAdaptiveErrorDialogTitle,
                            content: AppLocalizations.signinScreenAdaptiveErrorDialogContent,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            buttonLabel: AppLocalizations.signinScreenAdaptiveErrorDialogButtonLabel,
                          ),
                        );
                      }
                    }
                  : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Theme.of(context).accentColor, width: 2),
              child: Text(
                AppLocalizations.signinScreenSigininButtonLabel,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
