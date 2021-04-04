import 'dart:convert';
import 'package:driverapp/models/delivery_sheet_model.dart';
import 'package:driverapp/serives/audit_service.dart';
import 'package:driverapp/models/delivery_item_model.dart';

class DeliveryService extends AuditService {
  static final DeliveryService _singleton = DeliveryService._internal();

  factory DeliveryService() {
    return _singleton;
  }

  DeliveryService._internal();

  Future<List<DeliverySheetModel>> getDeliveries() async {
    var response = await requestAuth(
        uri: '/driver_app/delivery_sheet?sort=createdAt', method: 'get');
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> mapDeliverySheet = jsonData['data'];
      List<DeliverySheetModel> sheets = mapDeliverySheet
          .map((mItem) => DeliverySheetModel.fromMap(mItem))
          .toList();
      return sheets;
    }
  }

  Future<DeliveryItemModel> isGoing({String id}) async {
    var response = await requestAuth(
        uri: '/driver_app/mark_going?id=${id}', method: 'put');
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      DeliveryItemModel delivery = DeliveryItemModel.fromMap(jsonData['data']);
      return delivery;
    }
  }

  Future<DeliveryItemModel> provinceTransfer({
    String busOrTaxiBillPhoto,
    dynamic busOrTaxiFee,
    dynamic collectedDollar,
    dynamic collectedRiel,
    String companyName,
    String deliveredNote,
    String driverName,
    String id,
    String note,
    String phoneNumber,
    String type,
  }) async {
    Map<String, String> body = {
      'busOrTaxiBillPhoto': busOrTaxiBillPhoto,
      'busOrTaxiFee': busOrTaxiFee,
      'collectedDollar': collectedDollar,
      'collectedRiel': collectedRiel,
      'companyName': companyName,
      'deliveredNote': deliveredNote,
      'driverName': driverName,
      'id': id,
      'note': note,
      'phoneNumber': phoneNumber,
      'type': type,
    };
    var response = await requestAuth(
        uri: '/driver_app/confirm/transfer',
        method: 'put',
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      DeliveryItemModel delivery = DeliveryItemModel.fromMap(jsonData['data']);
      return delivery;
    }
  }

  Future<DeliveryItemModel> halfItemUpdate({
    dynamic collectedDollar,
    dynamic collectedRiel,
    String deliveredNote,
    String id,
    String note,
  }) async {
    Map<String, String> body = {
      'collectedDollar': collectedDollar,
      'collectedRiel': collectedRiel,
      'deliveredNote': deliveredNote,
      'id': id,
      'note': note,
    };
    var response = await requestAuth(
        uri: '/driver_app/confirm/partial',
        method: 'put',
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      DeliveryItemModel delivery = DeliveryItemModel.fromMap(jsonData['data']);
      return delivery;
    }
  }

  Future<DeliveryItemModel> updateStatus({
    dynamic collectedDollar,
    dynamic collectedRiel,
    String deliveredNote,
    String expectedDeliveryTimeFrom,
    String expectedDeliveryTimeTo,
    String id,
    String note,
    String recontactDate,
    String recontactNote,
    String status,
  }) async {
    Map<String, String> body = {
      "status": status,
      "id": id,
      "note": note,
      "expectedDeliveryTimeTo": expectedDeliveryTimeTo,
      "expectedDeliveryTimeFrom": expectedDeliveryTimeFrom,
      "collectedDollar": collectedDollar,
      "collectedRiel": collectedRiel,
      "deliveredNote": deliveredNote,
      "recontactDate": recontactDate,
      "recontactNote": recontactNote,
    };
    var response = await requestAuth(
        uri: '/driver_app/confirm', method: 'put', body: jsonEncode(body));

    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      DeliveryItemModel delivery = DeliveryItemModel.fromMap(jsonData['data']);
      return delivery;
    } else {
      print("update error");
    }
  }
}
