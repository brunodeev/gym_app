// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import '../components/default_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/images/gym_icon.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text(
                        'Registrar',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6), fontSize: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        child: Column(
                          children: [
                            DefaultFormField(
                              label: 'Nome',
                              controller: nameController,
                              type: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DefaultFormField(
                              label: 'Email',
                              controller: emailController,
                              type: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DefaultFormField(
                              label: 'Senha',
                              controller: passwordController,
                              type: TextInputType.text,
                              obscureText: true,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 35),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.93,
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kAccentColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Navigator.of(context).pushNamed('/login');
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  child: const Text('Registrar'),
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
            ),
    );
  }
}
