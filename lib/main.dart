import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/services/auth_service.dart';
import 'package:gym_app/views/login_page.dart';
import 'package:gym_app/views/register_page.dart';
import 'package:gym_app/views/wrapper_page.dart';
import 'package:provider/provider.dart';
import 'views/main_page.dart';

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
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        color: kPrimaryColor,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins2',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/main': (context) => const MainPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
      ),
    );
  }
}
