abstract class IAuthService {
  Future<bool> logIn();
  Future<void> logOut();
}
