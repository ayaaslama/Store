import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;

  CustomTextField({
    Key? key,
    this.hintText,
    this.inputType,
    this.onChanged,
    this.obscureText = false,
    this.initialValue,
    TextEditingController? controller,
  })  : controller = controller ?? TextEditingController(text: initialValue),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
