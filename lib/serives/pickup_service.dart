import 'dart:convert';

import 'package:driverapp/models/pickup_model.dart';
import 'package:driverapp/serives/audit_service.dart';

class PickupService extends AuditService {
  static final PickupService _singleton = PickupService._internal();
  factory PickupService() {
    return _singleton;
  }
  PickupService._internal();

  Future<List<PickupModel>> getPickups() async {
    var response = await requestAuth(
        uri: '/driver_app/pickups?sort=createdAt,DESC&size=1000',
        method: 'get');
    //await client.get('${baseUrl}/pickup_request/list?isAssigned=true');

    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> pickupdatas = jsonData['data']['content'];
      List<PickupModel> pickups =
          pickupdatas.map((mItem) => PickupModel.fromMap(mItem)).toList();
      return pickups;
    }
  }

  Future<PickupModel> updateStatus(
      {String currentStatus, String id, String note}) async {
    Map<String, String> body = {
      "currentStatus": currentStatus,
      "id": id,
      "note": note
    };
    var response = await requestAuth(
        uri: '/driver_app/update_status',
        method: 'post',
        body: jsonEncode(body));
    //await client.get('${baseUrl}/pickup_request/list?isAssigned=true');

    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      PickupModel pickup = PickupModel.fromMap(jsonData['data']);
      return pickup;
    }
  }
}
