import 'package:chatroom/models/login_result.dart';
import 'package:chatroom/services/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService implements IAuthService {
  @override
  Future<LoginResult> logIn() async {
    try {
      final result = await FirebaseAuth.instance.signInAnonymously();
      if (result != null) {
        debugPrint('LoggedIn');
        debugPrint(result.user.uid);
        // return true;
        return LoginResult.withId(result.user.uid);
      }
    } catch (e) {
      print(e);
    }
    // return false;
    return LoginResult.failed();
  }

  @override
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      debugPrint('LoggedOut');
    } catch (e) {
      print(e);
    }
  }
}
