class LoginResult {
  final bool success;
  final String id;

  LoginResult.withId(this.id) : success = true;

  LoginResult.failed()
      : success = false,
        id = null;
}
