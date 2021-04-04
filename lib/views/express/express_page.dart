import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpressPage extends StatefulWidget {
  @override
  _ExpressPageState createState() => _ExpressPageState();

}

class _ExpressPageState extends State<ExpressPage> {
  @override
  Widget build(BuildContext context) {
    return AppLoading(
      isLoading: false,
      child: Scaffold(
        body: Center(
            child: Text("Hello Express")
        ),
        //bottomNavigationBar: ,
      ),
    );
  }

}