import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.hintText, this.validator});

  final String hintText;
  final String? Function(String)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 18),
      validator: (input) {
        if (validator != null) {
          return validator!(input!);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(1, 102, 102, 102),
          ),
        ),
      ),
    );
  }
}
