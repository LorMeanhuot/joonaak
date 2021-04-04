import 'package:driverapp/app.dart';
import 'package:driverapp/utils/shared_pref.dart';
import 'package:driverapp/utils/translator-util.dart';
// import 'package:driverapp/theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:load/load.dart';


class Routes {
  Map routes = <String, WidgetBuilder>{};

  Routes() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    TranslatorUtil.load().then((_) {
      SharedPref.initPref();
      runApp(DriverApp(),
      );
    });
  }
}
