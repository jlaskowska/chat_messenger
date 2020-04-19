import 'package:chatroom/services/i_auth_service.dart';
import 'package:mobx/mobx.dart';

part 'signin_screen_store.g.dart';

class SigninScreenStore = _SigninScreenStore with _$SigninScreenStore;

abstract class _SigninScreenStore with Store {
  final IAuthService _authService;

  List<ReactionDisposer> _disposers;

  _SigninScreenStore(this._authService) {
    _disposers = [
      reaction((_) => nickname, _validateNickname),
    ];
  }

  void dispose() => _disposers.forEach((disposer) => disposer());
  @observable
  String nickname = '';

  @observable
  String nicknameError;

  @computed
  bool get canSignin => nickname == '' ? false : true;

  Future<bool> login() async => _authService.logIn();

  @action
  void _validateNickname(String value) => nicknameError = value.length >= 1 ? null : 'At least 1 character';
}
