import 'package:chatroom/models/chat_message.dart';
import 'package:chatroom/models/chat_user.dart';
import 'package:chatroom/services/device_storage.dart';
import 'package:chatroom/services/i_auth_service.dart';
import 'package:chatroom/services/i_chat_service.dart';
import 'package:chatroom/widgets/chatroom_screen/chat_bubble.dart';
import 'package:chatroom/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../localizations.dart';

class ChatroomScreen extends StatefulWidget {
  const ChatroomScreen({Key key}) : super(key: key);

  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  String _currentUserId;
  String _currentUserNickname;
  DeviceStorage _deviceStorage;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _deviceStorage = Provider.of<DeviceStorage>(context);
    _currentUserId = await _deviceStorage.getUserID();
    _currentUserNickname = await _deviceStorage.getUserNickname();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              initialData: <ChatMessage>[],
              stream: Provider.of<IChatService>(context, listen: false).messageStream(),
              builder: (_, AsyncSnapshot<List<ChatMessage>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final message = snapshot.data[index];
                          return ChatBubble(
                            chatuser: message.chatUser,
                            isMe: message.chatUser.id == _currentUserId,
                            message: message.message,
                          );
                        }),
                  );
                }
                return Container();
              },
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
                  child: Text(AppLocalizations.chatroomLogoutButton),
                ),
              ),
            ),
            RaisedButton(
              child: Text(AppLocalizations.chatroomSendMessageButton),
              onPressed: () async {
                await Provider.of<IChatService>(context, listen: false).sendMessage(
                  ChatMessage(
                    id: Uuid().v4(),
                    message: 'bla bla bla',
                    date: DateTime.now(),
                    chatUser: ChatUser(
                      id: _currentUserId,
                      nickname: _currentUserNickname,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
