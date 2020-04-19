import 'package:chatroom/services/device_storage.dart';
import 'package:chatroom/services/i_auth_service.dart';

import 'package:mobx/mobx.dart';

part 'signin_screen_store.g.dart';

class SigninScreenStore = _SigninScreenStore with _$SigninScreenStore;

abstract class _SigninScreenStore with Store {
  final IAuthService _authService;
  final DeviceStorage _deviceStorage;

  List<ReactionDisposer> _disposers;

  _SigninScreenStore(this._authService, this._deviceStorage) {
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

  Future<bool> login() async {
    final success = await _authService.logIn();
    if (success) {
      await _deviceStorage.setIsUserSignedIn(true);
      return true;
    } else {
      return false;
    }
  }

  @action
  void _validateNickname(String value) => nicknameError = value.length >= 1 ? null : 'At least 1 character';
}
