class Workout {
  String? key;
  WorkoutData? workoutData;

  Workout({this.key, this.workoutData});
}

class WorkoutData {
  String? workoutName;
  String? rep;
  String? series;

  WorkoutData({this.workoutName, this.rep, this.series});

  WorkoutData.fromJson(Map<dynamic, dynamic> json) {
    workoutName = json['workoutName'];
    rep = json['rep'];
    series = json['series'];
  }
}
