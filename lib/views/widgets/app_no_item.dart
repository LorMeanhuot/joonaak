import 'package:driverapp/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.camera_roll, size: 48, color: AppColor.MAIN_COLOR.withOpacity(0.5),),
    );
  }

}