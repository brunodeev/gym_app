import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kAccentColor,
            ),
          ),
        ],
      ),
    );
  }
}
