import 'package:flutter/material.dart';
import 'package:gym_app/services/auth_service.dart';
import 'package:gym_app/views/home_page.dart';
import 'package:gym_app/views/login_page.dart';
import 'package:gym_app/views/main_page.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const LoginPage() : const MainPage();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
