// import 'dart:html';
import 'dart:ui';

import 'package:driverapp/serives/login_service.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/app_toast.dart';
import 'package:driverapp/views/home/HomePage.dart';
import 'package:driverapp/views/signup/signup_page.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginService _apiSv;

  LoginPage() {
    _apiSv = LoginService();
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    var margin = MediaQuery.of(context).size.width / 12;

    return AppLoading(
        isLoading: _isLoading,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff80C41D),
                          Color(0xffdefab4),
                        ]),
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 100),
                          child: Image(
                            image: AssetImage('assets/1-1-2.png'),
                            height: 150.0,
                            width: 150.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(left: margin, right: margin),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _username,
                                obscureText: false,
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                                cursorColor: Colors.black54,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  hintText: "Username",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _password,
                                obscureText: true,
                                cursorColor: Colors.black54,
                                style:
                                    TextStyle(color: Colors.black54, fontSize: 16),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  hintText: "Password",
                                  // border: InputBorder.none,
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  // disabledBorder: InputBorder.none
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60.0)),
                                margin: EdgeInsets.only(top: 50),
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    widget._apiSv.attemptSingin(
                                        password: _password.text,
                                        username: _username.text,
                                        callBack: (isSuccess) {
                                          if (isSuccess) {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage()),
                                                    (route) => false);
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => NavigetionPage()));
                                          } else {
                                            setState(() {
                                              AppToast().show("Login faild");
                                              _isLoading = false;
                                            });
                                          }

                                        });
                                  },
                                  color: Color(0xff80C41D),
                                  child: _isLoading
                                      ? CupertinoActivityIndicator()
                                      : Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30, bottom: 30),
                                child: Divider(
                                  thickness: 0.1,
                                  color: Colors.black54,
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: AppColor.MAIN_COLOR, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
          ),
          ),
        );
  }
}
