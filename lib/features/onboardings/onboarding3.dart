import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_shape.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 200,
          right: 20,
          child: Image.asset(
            'assets/images/boy.png',
            width: 170,
          ),
        ),
      ],
    );
  }
}


