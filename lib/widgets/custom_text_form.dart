import 'package:flutter/material.dart';

class TextFormFields extends StatelessWidget {
  final String? hint;
  final String labelText;
  final Icon icono;
  final String? Function(String?)? validators;
  final bool oscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? initialValue;

  const TextFormFields(
      {super.key,
      this.hint,
      required this.labelText,
      required this.icono,
      this.validators,
      this.oscureText = false, this.suffixIcon, this.controller, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: controller,
      obscureText: oscureText,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 95, 95, 95))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 10, 10, 10), width: 2)),
          hintText: hint,
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
          prefixIcon: icono,
          prefixIconColor: const Color.fromARGB(255, 255, 9, 9)),
      validator: validators,
      initialValue: initialValue,
    );
  }
}
