import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key, required this.prefixIcon, required this.labelText, required this.controller});

  final Icon prefixIcon;
  final String labelText;
  final TextEditingController controller;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) => value.toString().isEmpty ? "Please enter your password" : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide.none
        ),
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        fillColor: Colors.grey.shade200,
        filled: true
      ),
      controller: widget.controller,
    );
  }
}