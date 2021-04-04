import 'dart:convert';

import 'package:driverapp/models/driver_model.dart';
import 'package:driverapp/serives/audit_service.dart';

class ProfileService extends AuditService {
  static final ProfileService _singleton = ProfileService._internal();
  factory ProfileService() {
    return _singleton;
  }
  ProfileService._internal();
  Future<DriverModel> getProfile() async {
    var response =
        await requestAuth(uri: '/driver_app/my_profile', method: 'get');
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      dynamic driverdatas = jsonData['data'];
      return DriverModel.fromJson(driverdatas);
    }
  }
}
