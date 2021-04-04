import 'dart:async';

import 'package:driverapp/serives/profile_service.dart';
import 'package:driverapp/utils/app_manager.dart';
import 'package:driverapp/views/home/HomePage.dart';
import 'package:driverapp/views/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {

  ProfileService _service;
  SplashPage(){
    _service = ProfileService();
  }

  @override
  _SplashPageState createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    AppManager().auth(
        auth: () {
          widget._service.getProfile().then((value) {
            if(value != null){
              Timer(Duration(seconds: 3), () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false));
            } else {
              Timer(Duration(seconds: 3), () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false));
            }
          });
        }, guess: () {
          Timer(Duration(seconds: 3), () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 100),
                  child: Image(
                    image: AssetImage('assets/1-1-2.png'),
                    height: 150.0,
                    width: 150.0,
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 110),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    backgroundColor: Colors.white70,
                  )
              ),
            )
          ],
        )
      ),
    );
  }
}