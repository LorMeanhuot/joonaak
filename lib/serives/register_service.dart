import 'dart:convert';
import 'dart:io';

import 'package:driverapp/models/register_model.dart';
import 'package:driverapp/serives/audit_service.dart';
import 'package:driverapp/utils/app_storage.dart';

class RegisterService extends AuditService {
  attemptSignup(
      {String username,
      String password,
      String name,
      String phone,
      Function(bool isSuccess) callBack}) async {
    Map<String, String> body = {
      "name": name,
      "username": username,
      "phone": phone,
      "password": password
    };
    var response = await request(
        uri: '/driver_app/register', method: 'post', body: jsonEncode(body));
    if (response.statusCode == 200) {
      callBack(true);
    } else {
      callBack(false);
    }
  }
}
