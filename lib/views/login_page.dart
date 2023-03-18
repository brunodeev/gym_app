// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:gym_app/models/user_manager.dart';
import 'package:gym_app/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/views/register_page.dart';
import '../components/default_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SafeArea(
            child: SingleChildScrollView(
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
                      color: const Color(0xFF363642),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 25),
                            child: Text(
                              'Entrar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  DefaultFormField(
                                    label: 'Email',
                                    controller: _emailController,
                                    type: TextInputType.emailAddress,
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
                                    height: 10,
                                  ),
                                  DefaultFormField(
                                    label: 'Senha',
                                    controller: _passwordController,
                                    type: TextInputType.text,
                                    obscureText: true,
                                    validator: (password) {
                                      if (password!.length < 5) {
                                        return 'Senha Inválida!';
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.93,
                                      height: 45,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 3,
                                            backgroundColor: kAccentColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            userManager.signIn(
                                                user: UserModel(
                                                    _emailController.text,
                                                    _passwordController.text),
                                                onFail: (e) {
                                                  final snackBar = SnackBar(
                                                    key: _scaffoldKey,
                                                    content: Text(
                                                        'Falha ao entrar: $e'),
                                                    backgroundColor: Colors.red,
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                                onSuccess: () {
                                                  print('sucesso');
                                                });
                                          }
                                        },
                                        child: userManager.isLoading
                                            ? const SizedBox(
                                                height: 25,
                                                width: 25,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : const Text(
                                                'Login',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 65,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Não tem uma conta?',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        TextButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: kAccentColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterPage(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Registre-se',
                                            style:
                                                TextStyle(color: kAccentColor),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Insira um email válido';
    }
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Insira uma senha válida';
    }
    return null;
  }
}
