import 'package:flutter/material.dart';

class CustomButtoms extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  CustomButtoms({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color:  const Color.fromARGB(100, 238, 159, 253),
      child: Text(text),
    );
  }
}
