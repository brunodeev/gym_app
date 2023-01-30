import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.image,
    required this.name,
    required this.series,
    required this.rep,
    this.weight,
  });

  final String image, name;
  final int series, rep;
  final double? weight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.116,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 100,
                width: 70,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                  weight == null
                      ? Text(
                          '$series Séries • $rep Rep.',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                        )
                      : Text(
                          '$series Séries • $rep Rep. • $weight Kg',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
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
