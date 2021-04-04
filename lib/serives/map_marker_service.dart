import 'package:driverapp/models/map_marker_model.dart';
import 'package:driverapp/serives/audit_service.dart';
import 'dart:convert';

class MapMarkerService extends AuditService {
  static final MapMarkerService _singleton = MapMarkerService._internal();
  factory MapMarkerService() {
    return _singleton;
  }
  MapMarkerService._internal();

  Future<List<MerchantLocationModel>> getMerchantLocation() async {
    var response =
        await requestAuth(uri: '/driver_app/pickups/location', method: 'get');
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> locationData = jsonData['data'];
      List<MerchantLocationModel> mapMakers = locationData
          .map((mItem) => MerchantLocationModel.fromMap(mItem))
          .toList();
      return mapMakers;
      //print(jsonString);
    }
  }
}
