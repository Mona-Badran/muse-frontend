import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_shape.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 70,
          right: 0,
          child: Image.asset(
            'assets/images/tower.png',
            width: 200,
          ),
        ),
        Positioned(
          bottom: 150,
          left: 40,
          child: Image.asset(
            'assets/images/girl.png',
            width: 120,
          ),
        ),
      ],
    );
  }
}
