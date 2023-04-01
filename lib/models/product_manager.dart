import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutManager {
  WorkoutManager() {
    _loadAllWorkouts();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadAllWorkouts() async {
    final QuerySnapshot snapshotWorkouts =
        await firestore.collection('workouts').get();

    for (DocumentSnapshot document in snapshotWorkouts.docs) {
      print(document.data());
    }
  }
}
