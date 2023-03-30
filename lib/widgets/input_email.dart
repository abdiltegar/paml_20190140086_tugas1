import 'package:flutter/material.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({super.key, required this.prefixIcon, required this.labelText, required this.controller});

  final Icon prefixIcon;
  final String labelText;
  final TextEditingController controller;

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) => value.toString().isEmpty ? "Please enter your email" : value.toString().length < 6 ? "Must be at least 6 characters" : !value.toString().contains("@") ? "Please enter a valid email" : null,
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