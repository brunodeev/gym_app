import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/models/user_model.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(UserModel user) async {
    final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
  }
}
