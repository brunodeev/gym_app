import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import '../components/default_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  'Registrar',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  child: Column(
                    children: [
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
                              authService.createUserWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                              );

                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/main', (route) => false);
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
