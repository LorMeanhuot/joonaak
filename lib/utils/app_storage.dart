import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {

  static storeAccessToken(String token) async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    await storage.write(key: 'TOKEN_KEY', value: token);
    await storage.write(key: 'IS_LOGED_IN', value: 'yes');
  }

  static Future<String> getAccessToken() async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    String token = await storage.read(key: 'TOKEN_KEY');
    return token;
  }

  static Future<String> getLoginStatus() async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    String status = await storage.read(key: 'IS_LOGED_IN');
    return status;
  }

  static storeUsername(String username) async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    await storage.write(key: 'USERNAME', value: username);
  }

  static Future<String> getUsername() async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    String username = await storage.read(key: 'USERNAME');
    return username;
  }

  static clearLogin() async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    await storage.write(key: 'USER_NAME', value: '');
    await storage.write(key: 'IS_LOGED_IN', value: 'no');
    await storage.write(key: 'TOKEN_KEY', value: '');
  }

  //********************* STORE ***********************//
  static store({String key, String value}) async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  static Future<String> get({String key}) async {
    FlutterSecureStorage storage =  FlutterSecureStorage();
    String username = await storage.read(key: key);
    return username;
  }

}