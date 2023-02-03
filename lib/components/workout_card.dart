import 'package:flutter/material.dart';
import 'package:gym_app/models/workout_model.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key, required this.workoutList});

  final Workout workoutList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.116,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workoutList.workoutData!.workoutName!,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '${workoutList.workoutData!.series!} Séries • ${workoutList.workoutData!.rep!} Rep.',
                    style: TextStyle(color: Colors.white.withOpacity(0.4)),
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
