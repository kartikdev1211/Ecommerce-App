import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String lableText;
  final TextEditingController? controller;
  final bool obsecureText;
  final String? Function(String?)? validator;
  const PrimaryTextField({
    super.key,
    required this.lableText,
    this.controller,
    this.obsecureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: lableText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
