import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/helpers/firebase_errors.dart';
import 'package:gym_app/models/user_model.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      onSuccess();
    } catch (e) {
      onFail(getErrorString(e.toString()));
    }
  }
}
