import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final bool obscureText;

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const InputBox({
    required this.hintText,
    required this.icon,
    required this.obscureText ,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,

        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black87),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black87,
            fontFamily: 'Poppins',
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
    );
  }
}
