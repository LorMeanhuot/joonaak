import 'package:driverapp/models/audit_model.dart';
import 'package:driverapp/models/delivery_item_model.dart';

class DeliverySheetModel extends AuditModel {
  String id;
  String shift;
  String branch;
  DateTime targetDate;
  List<dynamic> deliveryItems;

  DeliverySheetModel.fromMap(Map<String, dynamic> json){
    id = json['id'];
    shift = json['shift'];
    branch = json['branch'];
    //if(isNotNull(json['targetDate'])) targetDate = DateTime.parse(json['targetDate'].toString());
    if(isNotNull(json['deliverySheetItems'])){
      List<dynamic> tmp = json['deliverySheetItems'].map((item) => DeliveryItemModel.fromMap(item)).toList();
      deliveryItems = tmp;
    }
  }
}