import 'package:chatroom/services/device_storage.dart';
import 'package:chatroom/services/i_auth_service.dart';
import 'package:chatroom/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatroomScreen extends StatelessWidget {
  const ChatroomScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Chatroom'),
              ),
            ),
            Container(
              child: Center(
                child: RaisedButton(
                  onPressed: () async {
                    await Provider.of<IAuthService>(context, listen: false).logOut();
                    await Provider.of<DeviceStorage>(context, listen: false).deleteAll();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text('Log out'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
