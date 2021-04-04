class MerchantLocationModel {
  String addressId;
  String description;
  String id;
  int itemCount;
  double lat;
  double lng;
  String name;
  String phone;

  MerchantLocationModel.fromMap(Map<String, dynamic> json){
    addressId = json['addressId'];
    description = json['description'];
    id = json['id'];
    itemCount = json['itemCount'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    phone = json['phone'];

  }
}