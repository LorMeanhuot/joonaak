import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/shared_pref.dart';
//import 'package:driverapp/utils/translator-util.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: AppColor.MAIN_COLOR),
      body: Container(
        height: size.height * 5,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(children: <Widget>[
          Container(
            height: size.height * 0.3 - 27,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff80C41D),
                      Color(0xffdefab4),
                    ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          Positioned(
            top: 60,
            left: 0.5,
            right: 0.5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 450.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.50),
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 100.0,
                    ),
                    child: RichText(
                        text: TextSpan(
                            text: 'ជ្រើសរើសភាសា',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                            ))),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Choose Language',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ))),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        SharedPref.setPref('kh');
                      });
                      Navigator.pop(context);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/1-2-1.png'),
                            height: 65.0,
                            width: 65.0,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'ភាសាខ្មែរ',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic,
                                  )))
                        ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          text: '- - - - - - - - - - - - - - - - - - -',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 30.0,
                            fontStyle: FontStyle.italic,
                          ))),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        SharedPref.setPref('en');
                      });
                      Navigator.pop(context);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/1-2-3.png'),
                            height: 65.0,
                            width: 65.0,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'English',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic,
                                  )))
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage('assets/1-1-2.png'),
              height: 135.0,
              width: 135.0,
            ),
          ),
        ]),
      ),
    );
  }
}
