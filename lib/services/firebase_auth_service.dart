import 'package:chatroom/services/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService implements IAuthService {
  @override
  Future<bool> logIn() async {
    try {
      final result = await FirebaseAuth.instance.signInAnonymously();
      if (result != null) {
        debugPrint('LoggedIn');
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
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
