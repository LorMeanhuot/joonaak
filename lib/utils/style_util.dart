import 'package:flutter/material.dart';

class StyleUtil {
  static BoxDecoration decorationBorderAllRadius({Color color}) {
    return BoxDecoration(
        border: Border.all(color: color ?? Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20)));
  }

  static ShapeDecoration shapeDecorationRadius({color}) {
    return ShapeDecoration(
        color: color ?? Colors.blue,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)));
  }
}
