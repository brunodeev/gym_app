// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import '../components/default_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _userIdController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
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
                key: _formKey,
                child: Column(
                  children: [
                    DefaultFormField(
                      label: 'ID',
                      controller: _userIdController,
                      type: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      label: 'Nome de Usuário',
                      controller: _userNameController,
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      label: 'Email',
                      controller: _emailController,
                      type: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      label: 'Senha',
                      controller: _passwordController,
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      label: 'Confirmar Senha',
                      controller: _confirmPasswordController,
                      type: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 35),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.93,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kAccentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
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
    );
  }
}
