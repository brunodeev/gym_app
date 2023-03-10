// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import '../components/default_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
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
                  'Entrar',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DefaultFormField(
                        label: 'ID',
                        controller: _userIdController,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormField(
                        label: 'Senha',
                        controller: _passwordController,
                        type: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.93,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kAccentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: const Text('Login'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'N??o tem uma conta?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: kAccentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Registre-se',
                                style: TextStyle(color: kAccentColor),
                              ),
                            ),
                          ],
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

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Insira um email v??lido';
    }
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Insira uma senha v??lida';
    }
    return null;
  }
}
