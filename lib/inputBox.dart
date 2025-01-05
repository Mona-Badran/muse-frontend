import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final bool secureText;

  const InputBox({
    required this.hintText,
    required this.icon,
    required this.secureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
    );
  }
}
