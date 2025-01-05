import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final bool obscureText;

  const InputBox({
    required this.hintText,
    required this.icon,
    required this.obscureText ,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black87),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black87,
            fontFamily: 'Poppins',
          ),
        ),
    );
  }
}
