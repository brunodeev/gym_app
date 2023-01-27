import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

AppBar defaultAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: Image.asset(
      'assets/images/gym_icon.png',
      scale: 6,
    ),
    centerTitle: true,
  );
}
