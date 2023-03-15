import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/views/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  FirebaseFirestore.instance.collection('teste').add({'teste': 'teste'});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: kSecondaryColor,
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
        color: kPrimaryColor,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins2',
        ),
        home: const RegisterPage());
  }
}
