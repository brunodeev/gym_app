// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/models/user_manager.dart';
import 'package:gym_app/models/user_model.dart';
import 'package:gym_app/views/main_page.dart';
import 'package:provider/provider.dart';
import '../components/default_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _otherFormKey = GlobalKey<FormState>();
  final _otherScaffoldKey = GlobalKey<ScaffoldState>();
  final UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 20),
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/gym_icon.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 8,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromARGB(255, 45, 45, 59),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 25),
                      child: Text(
                        'Registrar',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6), fontSize: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: _otherFormKey,
                        child: Column(
                          children: [
                            DefaultFormField(
                              label: 'Nome',
                              type: TextInputType.emailAddress,
                              onSaved: (name) => userModel.name = name!,
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return 'Campo Obrigatório!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DefaultFormField(
                              label: 'Email',
                              type: TextInputType.text,
                              onSaved: (email) => userModel.email = email!,
                              validator: (email) {
                                if (email!.isEmpty ||
                                    !email.contains('@') ||
                                    !email.contains('.com')) {
                                  return 'Email Inválido!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DefaultFormField(
                              label: 'Senha',
                              type: TextInputType.emailAddress,
                              obscureText: true,
                              onSaved: (password) =>
                                  userModel.password = password!,
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return 'Campo Obrigatório!';
                                } else if (password.length < 5) {
                                  return 'Senha Inválida!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DefaultFormField(
                              label: 'Confirmar Senha',
                              type: TextInputType.emailAddress,
                              obscureText: true,
                              onSaved: (confirmPassword) =>
                                  userModel.confirmPassword = confirmPassword!,
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return 'Campo Obrigatório!';
                                } else if (password.length < 5) {
                                  return 'Senha Inválida!';
                                }
                                return null;
                              },
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
                                  onPressed: () {
                                    if (_otherFormKey.currentState!
                                        .validate()) {
                                      _otherFormKey.currentState!.save();

                                      if (userModel.password !=
                                          userModel.confirmPassword) {
                                        final snackBar = SnackBar(
                                          key: _otherScaffoldKey,
                                          content: const Text(
                                              'As senhas não correspondem!'),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }

                                      context.read<UserManager>().singUp(
                                          kuser: userModel,
                                          onFail: (e) {
                                            final snackBar = SnackBar(
                                              key: _otherScaffoldKey,
                                              content:
                                                  Text('Falha ao entrar: $e'),
                                              backgroundColor: Colors.red,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                          onSuccess: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MainPage()),
                                                (route) => false);
                                          });
                                    }
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
          ],
        ),
      ),
    );
  }
}
