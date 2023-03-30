import 'package:flutter/material.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({super.key, required this.validatorMessage, required this.prefixIcon, required this.labelText, required this.controller});

  final String validatorMessage;
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
      validator: (value) => value.toString().isEmpty ? widget.validatorMessage : (!value.toString().contains("@") ? "Please enter a valid email" : null),
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
    );;
  }
}