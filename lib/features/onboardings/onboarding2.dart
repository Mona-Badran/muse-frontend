import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
          top: 70,
          right: 0,
          child: Image.asset(
            'assets/images/Frame.png',
            width: 200,
          ),
        ),
      ],
    );
  }
}
