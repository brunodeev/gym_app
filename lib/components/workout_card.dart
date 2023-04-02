import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.name,
    required this.series,
    required this.repetitions,
  });

  final String name;
  final int series, repetitions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '${series.toString()} Séries • ${repetitions.toString()} Rep.',
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
