class DriverModel {
  String username;
  String phone;
  String name;
  String role;
  bool active;

  DriverModel({this.phone, this.username});

  DriverModel.fromJson(Map<String, dynamic> json) {
    phone = json['tel'];
    username = json['username'];
    name = json['name'];
    role = json['role'];
    active = json['active'];
  }
}
