// ignore_for_file: unnecessary_null_comparison, avoid_print, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/helpers/firebase_errors.dart';
import 'package:gym_app/models/user_model.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserModel? user;

  bool isLoading = false;
  bool get isLoggedIn => user != null;

  Future<void> signIn(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    setLoading(true);
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      await _loadCurrentUser(firebaseUser: result.user);

      onSuccess();
    } catch (e) {
      onFail(getErrorString(e.toString()));
    }
    setLoading(false);
  }

  Future<void> singUp(
      {required UserModel kuser,
      required Function onFail,
      required Function onSuccess}) async {
    setLoading(true);

    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: kuser.email!, password: kuser.password!);

      kuser.id = result.user!.uid;

      await kuser.saveData();

      onSuccess();
    } catch (e) {
      onFail(getErrorString(e.toString()));
    }
    setLoading(false);
  }

  void signOut() {
    auth.signOut();
    user = null;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async {
    final User currentUser = firebaseUser ?? auth.currentUser!;
    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').doc(currentUser.uid).get();
      user = UserModel.fromDocument(docUser);
      notifyListeners();
    }
  }
}
