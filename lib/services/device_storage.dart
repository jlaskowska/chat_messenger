import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceStorage {
  final _storage = FlutterSecureStorage();

  Future<bool> getIsUserSignedIn() async => (await _storage.read(key: 'isUserSignedIn') ?? '') == 'true';

  Future<void> setIsUserSignedIn(bool value) async =>
      await _storage.write(key: 'isUserSignedIn', value: value ? 'true' : 'false');

  Future<void> setUserNickname(String nickname) async => await _storage.write(key: 'nickname', value: nickname);

  Future<void> setUserID(String id) async => await _storage.write(key: 'id', value: id);

  Future<String> getUserID() async => await _storage.read(key: 'id');

  Future<String> getUserNickname() async => await _storage.read(key: 'nickname');

  Future<void> deleteAll() async => await _storage.deleteAll();
}
