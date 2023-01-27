import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Text('Just a test'),
    );
  }
}
