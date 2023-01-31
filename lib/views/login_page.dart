import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import '../components/default_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                  'Entrar',
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
                            onPressed: () {},
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
                          onPressed: () {},
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
      ),
    );
  }
}
