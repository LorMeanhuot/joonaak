class RegisterModel {
  String username;
  String phone;
  String name;
  String password;
  String accessToken;

  RegisterModel({this.phone, this.username, this.accessToken});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    phone = json['tel'];
    username = json['username'];
    name = json['name'];
    password = json['password'];
    accessToken = json['accessToken'];

  }



}