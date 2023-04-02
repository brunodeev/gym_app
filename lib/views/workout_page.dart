import 'package:flutter/material.dart';
import 'package:gym_app/components/workout_card.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/models/workout_manager.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Consumer<WorkoutManager>(
        builder: (_, workoutManager, __) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: workoutManager.allWorkouts.length,
            itemBuilder: (_, index) {
              return WorkoutCard(
                  name: workoutManager.allWorkouts[index].name!,
                  series: workoutManager.allWorkouts[index].series!,
                  repetitions: workoutManager.allWorkouts[index].repetitions!);
            },
          );
        },
      ),
    );
  }
}
