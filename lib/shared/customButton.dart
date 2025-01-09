import 'package:flutter/material.dart';
import '../features/auth/loginPage.dart';

class Button extends StatefulWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const Button(
      this.buttonText,
      this.onPressed
      );

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF789495), // Background color
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold, // Medium weight
          fontSize: 24, // Font size
        ), // Full width height padding
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
