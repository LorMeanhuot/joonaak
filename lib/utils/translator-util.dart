import 'dart:convert';

import 'package:driverapp/utils/shared_pref.dart';
// import 'package:driverapp/utils/string-field-util.dart';
import 'package:flutter/services.dart' show rootBundle;

class TranslatorUtil {
  static Map _localizedValues;

  static String text(String key) {
    String langCode = SharedPref.getLangCode();
    SharedPref.initPref();
    return _localizedValues[key] == null
        ? '$key'
        : _localizedValues[key][langCode];
  }

  static Future load() async {
    String jsonContent = await rootBundle.loadString("assets/lang/lang.json");
    _localizedValues = Map.from(json.decode(jsonContent));
  }
}
