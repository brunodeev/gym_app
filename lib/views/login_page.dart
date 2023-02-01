import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import '../components/default_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/images/gym_icon.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Entrar',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    DefaultFormField(
                      label: 'Email',
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultFormField(
                      label: 'Senha',
                      controller: passwordController,
                      type: TextInputType.text,
                      obscureText: true,
                      validator: validatePassword,
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
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              authService.signInWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                              );
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: kAccentColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Registrar',
                          style: TextStyle(color: kAccentColor),
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
