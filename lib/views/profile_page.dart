import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        height: 40,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kAccentColor,
        ),
      ),
    );
  }
}
