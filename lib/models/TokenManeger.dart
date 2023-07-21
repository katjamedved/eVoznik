import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager with ChangeNotifier {

  final storage = FlutterSecureStorage();
  final String _tokenKey = 'auth_login_token';

  Future<void> storeToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  Future<void> removeToken() async {
    await storage.delete(key: _tokenKey);
  }
}