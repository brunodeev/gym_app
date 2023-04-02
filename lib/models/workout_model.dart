import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  Workout.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'] as String;
    category = document['category'] as String;
    repetitions = document['repetitions'] as int;
    series = document['series'] as int;
  }

  String? id;
  String? name;
  String? category;
  int? repetitions;
  int? series;
}
