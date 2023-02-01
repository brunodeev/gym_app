// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              FirebaseAuth.instance.currentUser!.displayName
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              FirebaseAuth.instance.currentUser!.email
                                  .toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: kSecondaryColor,
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Meus Dados',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    height: 35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kSecondaryColor,
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Editar Treinos',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    height: 35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kSecondaryColor,
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Configurações',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await authService.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    },
                    child: Container(
                      height: 35,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: kSecondaryColor,
                      ),
                      child: Row(
                        children: const [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Sair',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      '© Todos os Direitos Reservados',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.1),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
