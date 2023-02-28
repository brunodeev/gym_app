import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../components/default_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserGlobal>(context);

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
                        controller: _nameController,
                        type: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormField(
                        label: 'Email',
                        controller: _emailController,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormField(
                        label: 'Idade',
                        controller: _ageController,
                        type: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormField(
                        label: 'Peso',
                        controller: _weightController,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormField(
                        label: 'Celular',
                        controller: _phoneController,
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
                        padding: const EdgeInsets.only(top: 15, bottom: 35),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.93,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kAccentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              provider.addData(
                                _nameController.text,
                                _emailController.text,
                                _phoneController.text,
                                int.parse(_ageController.text),
                                double.parse(_weightController.text),
                              );
                              Navigator.of(context).pushNamed('/');
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
