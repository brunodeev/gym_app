import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/views/login_page.dart';
import 'package:gym_app/views/register_page.dart';
import 'views/main_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
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
        initialRoute: '/register',
        routes: {
          '/': (context) => const MainPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        });
  }
}
