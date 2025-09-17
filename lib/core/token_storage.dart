import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _storage;
  static const _keyAuthToken = 'auth_token';

  TokenStorage({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyAuthToken, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _keyAuthToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _keyAuthToken);
  }
}