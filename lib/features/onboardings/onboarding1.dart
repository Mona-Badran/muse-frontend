import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_shape.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      )),
    );
  }
}
