import 'package:chatroom/services/device_storage.dart';
import 'package:chatroom/services/i_auth_service.dart';
import 'package:flutter/material.dart';

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
    final result = await _authService.logIn();
    if (result.success) {
      await _deviceStorage.setIsUserSignedIn(true);
      await _deviceStorage.setUserID(result.id);
      debugPrint('${result.id}');
      await _deviceStorage.setUserNickname(nickname);
      debugPrint('$nickname');
      _deviceStorage.getIsUserSignedIn().then((value) => debugPrint('isUSerSignedIn: $value'));
      return true;
    } else {
      return false;
    }
  }

  @action
  void _validateNickname(String value) => nicknameError = value.length >= 1 ? null : 'At least 1 character';
}
