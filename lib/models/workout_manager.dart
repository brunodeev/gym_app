import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/models/workout_model.dart';

class WorkoutManager extends ChangeNotifier {
  WorkoutManager() {
    _loadAllWorkouts();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Workout> allWorkouts = [];

  Future<void> _loadAllWorkouts() async {
    final QuerySnapshot snapshotWorkouts =
        await firestore.collection('workouts').get();

    allWorkouts = snapshotWorkouts.docs
        .map((document) => Workout.fromDocument(document))
        .toList();
    notifyListeners();
  }
}
