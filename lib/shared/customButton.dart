import 'package:flutter/material.dart';
import '../features/auth/loginPage.dart';

class Button extends StatefulWidget {
  final String buttonText;
  final Widget action;
  const Button(this.buttonText, this.action);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to Second Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.action),
        );
      },
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
