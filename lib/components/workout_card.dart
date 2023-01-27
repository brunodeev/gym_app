import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.image,
    required this.name,
    required this.series,
    required this.rep,
  });

  final String image, name;
  final int series, rep;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.115,
      child: Card(
        elevation: 0,
        color: Colors.green,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 100,
                child: Image.asset(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text('$series Séries • $rep Rep.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
