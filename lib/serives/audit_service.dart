import 'package:driverapp/utils/app_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/app_storage.dart';

class AuditService {
  String baseUrl = 'http://express.dev.joonaakhub.com:8882/api/v1';
  http.Client client = http.Client();

  requestAuth({String uri, String body, String method = 'get'}) async {
    String token = await AppStorage.getAccessToken();

    var url = '$baseUrl$uri';
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    // = (method == 'get')
    //     ? await client.get(url, headers: headers)
    //     : await client.post(url, headers: headers, body: body);
    var response;
    if (method == 'get') {
      response = await client.get(url, headers: headers);
    } else if (method == 'post') {
      response = await client.post(url, headers: headers, body: body);
    } else if (method == 'put') {
      response = await client.put(url, headers: headers, body: body);
    }
    return response;
  }

  request({String uri, String body, String method = 'get'}) async {
    // String token = await AppStorage.getAccessToken();

    var url = '$baseUrl$uri';
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    /*var response = (method == 'get')
        ? await client.get(url, headers: headers)
        : await client.post(url, headers: headers, body: body);*/
    var response;
    if (method == 'get') {
      response = await client.get(url, headers: headers);
    } else if (method == 'post') {
      response = await client.post(url, headers: headers, body: body);
    } else if (method == 'put') {
      response = await client.put(url, headers: headers, body: body);
    }
    return response;
  }
}
