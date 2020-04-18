import 'package:chatroom/services/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService implements IAuthService {
  @override
  Future<bool> logIn() async {
    try {
      final result = await FirebaseAuth.instance.signInAnonymously();
      if (result != null) {
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
    } catch (e) {
      print(e);
    }
  }
}
