import 'package:chatroom/services/device_storage.dart';
import 'package:chatroom/widgets/common/adaptive_error_dialog.dart';
import 'package:chatroom/widgets/chatroom_screen/chatroom_screen.dart';
import 'package:chatroom/widgets/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DeviceStorage _deviceStorage;
  Future<bool> _futureIsUserSignedin;
  bool hasResolvedDependencies = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!hasResolvedDependencies) {
      _deviceStorage = Provider.of<DeviceStorage>(context);
      _futureIsUserSignedin = _deviceStorage.getIsUserSignedIn();
      hasResolvedDependencies = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureIsUserSignedin,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return snapshot.data == false
                ? Scaffold(
                    body: GestureDetector(
                      // GestureDetector dismisses the keyboard when the user clicks outside of the TextField
                      behavior: HitTestBehavior.opaque,
                      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                      child: SafeArea(
                        child: SigninScreen(),
                      ),
                    ),
                  )
                : Scaffold(
                    body: SafeArea(
                      child: ChatroomScreen(),
                    ),
                  );
          } else if (snapshot.hasError && snapshot.connectionState == ConnectionState.done) {
            _showPopup();
            return Container();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<void> _showPopup() async {
    await Future.delayed(Duration(milliseconds: 1));
    showAdaptiveErrorDialog(
      context: context,
      adaptiveErrorDialog: AdaptiveErrorDialog(
        title: AppLocalizations.adaptiveErrorDialogTitle,
        content: AppLocalizations.adaptiveErrorDialogContent,
        onPressed: () {
          Navigator.of(context).pop();

          setState(() {
            _futureIsUserSignedin = _deviceStorage.getIsUserSignedIn();
          });
        },
        buttonLabel: AppLocalizations.adaptiveErrorDialogButtonLabel,
      ),
    );
  }
}
