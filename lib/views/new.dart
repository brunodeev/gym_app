import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class New extends StatelessWidget {
  const New(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Text(title),
    );
  }
}
