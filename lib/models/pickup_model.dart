class PickupModel {
  String id;
  String name;
  String phone;
  String status;
  String address;
  int itemCount;
  int fromDate;
  int toDate;
  String note;
  double lat;
  double lng;

  PickupModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    status = json['currentStatus'];
    name = json['sender']['name'];
    phone = json['sender']['selectedPhoneNumber']['value'];
    itemCount = int.parse(
        json['itemCount'] != null ? json['itemCount'].toString() : "0");
    fromDate = json['pickupFromDate'];
    toDate = json['pickupToDate'];
    note = json['note'];
    lat = json['sender']['selectedAddress']['lat'];
    lng = json['sender']['selectedAddress']['lng'];

    if (json['sender']['selectedAddress'] != null) {
      Map<String, dynamic> jsonAddress = json['sender']['selectedAddress'];
      address = "${checkNull(jsonAddress['streetNumber'])}"
              "${checkNull(jsonAddress['streetName'], 'St.')}"
              "${checkNull(jsonAddress['houseNumber'], '#')}"
              "${checkNull(jsonAddress['sangkat'])}"
              "${checkNull(jsonAddress['khan'])}"
              "${checkNull(jsonAddress['other'])}"
          .trim();
    }
  }

  checkNullInt(int value) {
    return value != null ? value : 'no';
  }

  checkNull(String value, [String prefix = '']) {
    return value != null ? "$prefix${value.trim()}, " : '';
  }
}
