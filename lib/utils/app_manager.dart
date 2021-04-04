import 'package:driverapp/utils/app_storage.dart';

class AppManager {
  // make it to be singleton
  static final AppManager _singleton = AppManager._internal();
  factory AppManager() {
    return _singleton;
  }
  AppManager._internal();


  auth({Function auth, Function guess}){
    AppStorage.getLoginStatus().then((value) {
      if(value == 'yes'){
        auth();
      }else{
        guess();
      }
    });
  }

}