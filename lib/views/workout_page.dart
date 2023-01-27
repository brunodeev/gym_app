import 'package:flutter/material.dart';
import 'package:gym_app/components/workout_card.dart';
import 'package:gym_app/constants/colors.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          WorkoutCard(
            image: 'assets/images/men.jpg',
            name: 'Montanha Alpinista',
            rep: 3,
            series: 4,
          ),
        ],
      ),
    );
  }
}
