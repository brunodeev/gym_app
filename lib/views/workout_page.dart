import 'package:flutter/material.dart';
import 'package:gym_app/components/workout_card.dart';
import 'package:gym_app/constants/colors.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                    child: Text(
                      'Treinos do dia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  WorkoutCard(
                    image: 'assets/images/men.jpg',
                    name: 'Montanha Alpinista',
                    rep: 10,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/abdominal.jpg',
                    name: 'Abdominal Supra',
                    rep: 20,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/men.jpg',
                    name: 'Montanha Alpinista',
                    rep: 10,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/abdominal.jpg',
                    name: 'Abdominal Supra',
                    rep: 20,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/men.jpg',
                    name: 'Montanha Alpinista',
                    rep: 10,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/abdominal.jpg',
                    name: 'Abdominal Supra',
                    rep: 20,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/men.jpg',
                    name: 'Montanha Alpinista',
                    rep: 10,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/abdominal.jpg',
                    name: 'Abdominal Supra',
                    rep: 20,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/men.jpg',
                    name: 'Montanha Alpinista',
                    rep: 10,
                    series: 4,
                  ),
                  WorkoutCard(
                    image: 'assets/images/abdominal.jpg',
                    name: 'Abdominal Supra',
                    rep: 20,
                    series: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
