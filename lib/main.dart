import 'package:flutter/material.dart';
import 'package:muse/features/onboardings/onboardingNav.dart';

void main() {
  runApp(const Muse());
}

class Muse extends StatelessWidget {
  const Muse({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFEF7E6),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFEF7E6),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: OnboardingNav(),
    );
  }
}
