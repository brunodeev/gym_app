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
          if (data.type.length == 1)
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 25),
              child: SizedBox(
                height: 38,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                          margin: index != 0
                              ? const EdgeInsets.only(left: 5)
                              : null,
                          duration: const Duration(milliseconds: 100),
                          width: MediaQuery.of(context).size.width - 30,
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1,
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
          if (data.type.length == 2)
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 25),
              child: SizedBox(
                height: 38,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                          margin: index != 0
                              ? const EdgeInsets.only(left: 5)
                              : null,
                          duration: const Duration(milliseconds: 100),
                          width: MediaQuery.of(context).size.width / 2 - 18,
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1,
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
          if (data.type.length == 3)
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 25),
              child: SizedBox(
                height: 38,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                          padding: data.type[index].length > 8
                              ? const EdgeInsets.symmetric(horizontal: 5)
                              : null,
                          margin: index != 0
                              ? const EdgeInsets.only(left: 5)
                              : null,
                          duration: const Duration(milliseconds: 100),
                          width: MediaQuery.of(context).size.width / 3 - 13.5,
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1,
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
          if (data.type.length == 4)
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 25),
              child: SizedBox(
                height: 38,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                          margin: index != 0
                              ? const EdgeInsets.only(left: 5)
                              : null,
                          duration: const Duration(milliseconds: 100),
                          width: MediaQuery.of(context).size.width / 4 - 11.5,
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1,
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
