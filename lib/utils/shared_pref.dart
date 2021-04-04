import 'dart:convert';
import 'package:driverapp/utils/string-field-util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences _sharedPreferences;

  static Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    if (token == null) {
      _sharedPreferences.setString('Authorization', null);
    } else {
      _sharedPreferences.setString('Authorization', "Bearer $token" ?? "");
    }
  }

  static Future<String> getToken() async {
    return _sharedPreferences?.get('Authorization') ?? "";
  }

  static Future<void> setPref(value) async {
    _sharedPreferences.setString(StrFieldUtil.langCode, value);
  }

  static String getLangCode() {
    return _sharedPreferences?.get(StrFieldUtil.langCode) ?? "en";
  }
}
