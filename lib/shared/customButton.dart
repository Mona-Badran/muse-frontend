import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const Button(this.buttonText, {this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF789495),
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      child: Center(
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
