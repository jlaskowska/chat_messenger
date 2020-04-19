import 'package:chatroom/localizations.dart';
import 'package:chatroom/services/firebase_auth_service.dart';
import 'package:chatroom/services/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<IAuthService>(
        create: (_) => FirebaseAuthService(),
        child: MaterialApp(
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizationsDelegate.supportedLocals,
          home: HomeScreen(),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService firebaseService = Provider.of<IAuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.appTitle),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () => firebaseService.logIn(),
              child: Text('Login'),
            ),
            FlatButton(
              onPressed: () => firebaseService.logOut(),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
