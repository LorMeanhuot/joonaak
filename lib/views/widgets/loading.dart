import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
//  void initState() {
//    super.initState();
//    SystemChrome.setEnabledSystemUIOverlays([]);
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff80C41D),
              Color(0xffdefab4),
            ]),
      ),
      //color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 50,
              width: 50,
              child: Image(image: AssetImage("assets/icons/bike.png"))),
          Text('Loading...'),
        ],
      ),
    );
  }
}
