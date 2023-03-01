import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    required this.controller,
    Key? key,
    required this.label,
    required this.type,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final TextInputType type;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: type,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, entre com $label';
        }
        return null;
      },
      controller: controller,
      style: const TextStyle(color: Colors.white, fontFamily: 'Poppins1'),
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: label,
        hintStyle: const TextStyle(color: Colors.white30, fontSize: 15),
      ),
    );
  }
}
