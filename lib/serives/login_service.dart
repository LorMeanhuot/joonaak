import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../models/login_model.dart';
import 'audit_service.dart';
import 'package:driverapp/models/login_model.dart';
import 'package:driverapp/serives/audit_service.dart';
import 'package:driverapp/utils/app_storage.dart';

class LoginService extends AuditService {
  Future<LoginModel> attemptSingin(
      {String username,
      String password,
      Function(bool isSuccess) callBack}) async {
    var url =
        '$baseUrl/oauth/token?username=${username.trim()}&password=${password}&grant_type=password';

    var response = await client.post(url, headers: {
      HttpHeaders.authorizationHeader: "Basic Sk5UcnVzdDpKTlNlY3JldA==",
      HttpHeaders.contentTypeHeader: "application/json"
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      LoginModel login = LoginModel.fromJSon(json.decode(jsonString));
      var token = login.accessToken;
      AppStorage.storeAccessToken(token);
      callBack(true);
      return login;
    } else {
      callBack(false);
    }
  }
}
