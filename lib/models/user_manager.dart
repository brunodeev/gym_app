import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/helpers/firebase_errors.dart';
import 'package:gym_app/models/user_model.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  late User user;

  bool isLoading = false;

  Future<void> signIn(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    setLoading(true);
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      user = result.user as UserModel;

      onSuccess();
    } catch (e) {
      onFail(getErrorString(e.toString()));
    }
    setLoading(false);
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final User currentUser = auth.currentUser!;
    if (currentUser != null) {
      user = currentUser;
      print(user.uid);
    }
    notifyListeners();
  }
}
