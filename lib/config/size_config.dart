import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenwidth;
  static double? screenheight;
  static double? sizeHorizontal;
  static double? sizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenheight = _mediaQueryData!.size.height;
    screenwidth = _mediaQueryData!.size.width;
    sizeHorizontal = screenwidth! / 100;
    sizeVertical = screenheight! / 100;
  }
}
