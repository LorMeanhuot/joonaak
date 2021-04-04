import 'package:driverapp/serives/register_service.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/app_toast.dart';
import 'package:driverapp/views/login/login_page.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';

String _phone, _warning;
String phoneIsoCode;
String confirmedNumber;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
  RegisterService _apiSv;

  SignUp() {
    _apiSv = RegisterService();
  }
}

class _SignUpState extends State<SignUp> {
  bool _isLoading = false;
  TextEditingController _username = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirmPassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPhoneError = false;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      _phone = number;
    });
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      confirmedNumber = internationalizedPhoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppLoading(
      isLoading: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: size.height / 2.5,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff80C41D),
                                Color(0xffdefab4),
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          children: [
                            Text("Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 40.0,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
                        ),
                      )),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 150),
                      alignment: Alignment.center,
                      height: size.height * 0.9,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // color: AppColor.WARNING_COLOR,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Colors.grey.withOpacity(0.50),
                          )
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50, right: 24, left: 24, bottom: 30),
                          child: Column(
                            children: [
                              _buildInput(
                                image: 'assets/icons/avatar.png',
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please your name';
                                    }
                                    return null;
                                  },
                                  controller: _name,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  cursorColor: Colors.black54,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    hintText: "Name",
                                  ),
                                ),
                              ),
                              _buildInput(
                                image: 'assets/icons/avatar.png',
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter username';
                                    }
                                    return null;
                                  },
                                  controller: _username,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  cursorColor: Colors.black54,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    hintText: "Username",
                                  ),
                                ),
                              ),
                              _buildInput(
                                image: 'assets/icons/phone-1.png',
                                child: Column(
                                  children: [
                                    InternationalPhoneInput(
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.grey[600]),
                                        hintText: "070 599 408",
                                        border: InputBorder.none,
                                      ),
                                      //border: //Border(bottom: BorderSide(width: 3, color: Colors.black54)) ,
                                      onPhoneNumberChange: onPhoneNumberChange,
                                      initialPhoneNumber: _phone,
                                      initialSelection: 'KH',

                                      // enabledCountries: [
                                      //   'US',
                                      //   'KH',
                                      //   'VN',
                                      //   'TH'
                                      // ],
                                      enabledCountries: [],

                                      showCountryCodes: true,
                                      showCountryFlags: true,
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.black54,
                                    ),
                                    Container(
                                      child: _isPhoneError == true
                                          ? Text(
                                              "Please input the valid phone",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          : null,
                                    )
                                  ],
                                ),
                              ),
                              _buildInput(
                                image: 'assets/icons/padlock.png',
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                  controller: _password,
                                  obscureText: true,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  cursorColor: Colors.black54,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                              _buildInput(
                                image: 'assets/icons/padlock.png',
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter confirm password';
                                    }
                                    if (value != _password.text)
                                      return 'confirm password not match';
                                    return null;
                                  },
                                  // validator: (value) {

                                  // },
                                  controller: _confirmPassword,
                                  obscureText: true,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  cursorColor: Colors.black54,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    hintText: "Confirm Password",
                                  ),
                                ),
                              ),
                              Text(
                                'By continuing, I confirm that i have read & agree to the Terms & conditions and privacy policy',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    setState(() {
                                      _isPhoneError = (_phone == null ||
                                          _phone.length < 8 ||
                                          _phone.length > 10);
                                    });
                                    if (!_formKey.currentState.validate() ||
                                        _isPhoneError) {
                                      print(">>>>>> Please check form");
                                      return;
                                    }
                                    widget._apiSv.attemptSignup(
                                        name: _name.text,
                                        username: _username.text,
                                        phone: _phone,
                                        password: _password.text,
                                        callBack: (isSuccess) {
                                          if (isSuccess) {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginPage()),
                                                    (route) => false);
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => NavigetionPage()));
                                          } else {
                                            setState(() {
                                              AppToast().show("SignUp fail");
                                              _isLoading = false;
                                            });
                                          }
                                        });
                                  },
                                  child: Container(
                                    width: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.MAIN_COLOR,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sing Up",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Image(
                        image: AssetImage('assets/1-1.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildInput({String image, Widget child}) {
    return Padding(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: SizedBox(
              child: Image(
                image: AssetImage(image),
                height: 25,
              ),
              // flex: 1,
            ),
          ),
          Flexible(child: child),
        ],
      ),
    );
  }
}
