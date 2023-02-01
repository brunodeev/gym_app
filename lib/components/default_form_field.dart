import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class DefaultFormField extends StatefulWidget {
  const DefaultFormField({
    required this.controller,
    Key? key,
    required this.label,
    required this.type,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final TextInputType type;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText!,
      keyboardType: widget.type,
      validator: widget.validator,
      controller: widget.controller,
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
        hintText: widget.label,
        hintStyle: const TextStyle(color: Colors.white30, fontSize: 15),
      ),
    );
  }
}
