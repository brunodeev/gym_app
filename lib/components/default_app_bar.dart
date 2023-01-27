import 'package:flutter/material.dart';

import '../constants/colors.dart';

AppBar defaultAppBar() {
  return AppBar(
    backgroundColor: bgColor,
    elevation: 0.5,
    title: Image.asset(
      'assets/images/gym_icon.png',
      scale: 5,
    ),
    centerTitle: true,
  );
}
