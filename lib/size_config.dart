import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;

  SizeConfig(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get blockSizeHorizontal => screenWidth / 100;
  double get blockSizeVertical => screenHeight / 100;
}
