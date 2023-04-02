// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/models/workout_manager.dart';
import 'package:gym_app/models/user_manager.dart';
import 'package:gym_app/views/login_page.dart';
import 'package:gym_app/views/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: kSecondaryColor,
      statusBarColor: Colors.transparent,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => WorkoutManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
          color: kPrimaryColor,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins2',
          ),
          home: Consumer<UserManager>(
            builder: (_, userManager, __) {
              return userManager.isLoggedIn
                  ? const MainPage()
                  : const LoginPage();
            },
          )),
    );
  }
}
