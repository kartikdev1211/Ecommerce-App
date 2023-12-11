import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String lableText;
  final TextEditingController? controller;
  final bool obsecureText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;
  const PrimaryTextField({
    super.key,
    required this.lableText,
    this.controller,
    this.obsecureText = false,
    this.validator,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: lableText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
