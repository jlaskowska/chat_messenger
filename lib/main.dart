import 'package:chatroom/configs/app_colors.dart';
import 'package:chatroom/localizations.dart';
import 'package:chatroom/services/device_storage.dart';
import 'package:chatroom/services/firebase_auth_service.dart';
import 'package:chatroom/services/i_auth_service.dart';
import 'package:chatroom/widgets/home_screen.dart';
import 'package:chatroom/widgets/signin_screen/signin_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<IAuthService>(
            create: (_) => FirebaseAuthService(),
          ),
          Provider<DeviceStorage>(
            create: (_) => DeviceStorage(),
          ),
          ProxyProvider2<IAuthService, DeviceStorage, SigninScreenStore>(
            update: (_, authService, deviceStorage, __) => SigninScreenStore(authService, deviceStorage),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(accentColor: AppColors.blue),
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
