import 'package:chatroom/models/login_result.dart';

abstract class IAuthService {
  Future<LoginResult> logIn();
  Future<void> logOut();
}
