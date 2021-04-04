
class LoginModel {
  String accessToken;

  LoginModel({
    this.accessToken,
  });

  LoginModel.fromJSon(Map<String, dynamic> json){
    accessToken = json['access_token'];
  }
}
