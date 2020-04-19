import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceStorage {
  final _storage = FlutterSecureStorage();

  Future<bool> getIsUserSignedIn() async => (await _storage.read(key: 'isUserSignedIn') ?? '') == 'true';

  Future<void> setIsUserSignedIn(bool value) async =>
      await _storage.write(key: 'isUserSignedIn', value: value ? 'true' : 'false');
}
