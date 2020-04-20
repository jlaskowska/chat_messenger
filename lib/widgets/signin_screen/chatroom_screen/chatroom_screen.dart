import 'package:chatroom/services/device_storage.dart';
import 'package:chatroom/services/i_auth_service.dart';
import 'package:chatroom/widgets/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatroomScreen extends StatelessWidget {
  const ChatroomScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Text('Chatroom'),
            ),
          ),
          Container(
            child: Center(
              child: FlatButton(
                onPressed: () async {
                  await Provider.of<IAuthService>(context).logOut();
                  await Provider.of<DeviceStorage>(context).deleteAll();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SigninScreen(),
                    ),
                  );
                },
                child: Text('Log out'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
