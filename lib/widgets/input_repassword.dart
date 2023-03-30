import 'package:flutter/material.dart';

class InputRePassword extends StatefulWidget {
  const InputRePassword({super.key, required this.prefixIcon, required this.labelText, required this.controller, required this.passwordController});

  final Icon prefixIcon;
  final String labelText;
  final TextEditingController controller;
  final TextEditingController passwordController;

  @override
  State<InputRePassword> createState() => _InputRePasswordState();
}

class _InputRePasswordState extends State<InputRePassword> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) => value.toString().isEmpty ? "Please enter your password" : value.toString().length < 6 ? "Must be at least 6 characters" : widget.passwordController.text != value.toString() ? "Password must be the same" : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide.none
        ),
        prefixIcon: widget.prefixIcon,
        hintText: widget.labelText,
        fillColor: Colors.grey.shade200,
        filled: true
      ),
      controller: widget.controller,
    );
  }
}