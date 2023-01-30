import 'package:flutter/material.dart';
import 'package:gym_app/components/workout_card.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/data/dummy_data.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final data = DUMMY_DATA();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: SizedBox(
              height: 35,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.type.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        margin: index == 0
                            ? const EdgeInsets.only(left: 15)
                            : const EdgeInsets.only(left: 5),
                        width: 100,
                        decoration: BoxDecoration(
                          color: current == index
                              ? kSecondaryColor
                              : kTerciaryColor,
                          borderRadius: current == index
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(12),
                          border: current == index
                              ? Border.all(color: Colors.white, width: 1.5)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            data.type[index],
                            style: TextStyle(
                              color: current == index
                                  ? Colors.white
                                  : Colors.white24,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          if (current == 0)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: data.a
                      .map(
                        (value) => WorkoutCard(
                          image: value['image'].toString(),
                          name: value['name'].toString(),
                          rep: value['rep'],
                          series: value['series'],
                          weight: value['weight'],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          if (current == 1)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: data.b
                      .map(
                        (value) => WorkoutCard(
                          image: value['image'].toString(),
                          name: value['name'].toString(),
                          rep: value['rep'],
                          series: value['series'],
                          weight: value['weight'],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          if (current == 2)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: data.c
                      .map(
                        (value) => WorkoutCard(
                          image: value['image'].toString(),
                          name: value['name'].toString(),
                          rep: value['rep'],
                          series: value['series'],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
