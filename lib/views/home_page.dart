import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
        title: Image.asset(
          'assets/images/gym_icon.png',
          scale: 5,
        ),
        centerTitle: true,
      ),
    );
  }
}
