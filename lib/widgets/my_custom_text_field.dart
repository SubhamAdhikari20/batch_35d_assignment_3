import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  const MyCustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.labelText,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final String? labelText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Please enter number";
            }
            return null;
          },
    );
  }
}
