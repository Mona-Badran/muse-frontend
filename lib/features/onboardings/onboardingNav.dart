import 'package:flutter/material.dart';
import 'onboarding1.dart';

class OnboardingNav extends StatefulWidget {
  const OnboardingNav({super.key});

  @override
  State<OnboardingNav> createState() => _OnboardingNavState();
}

class _OnboardingNavState extends State<OnboardingNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Onboarding1(),
    Onboarding2(),
    Onboarding3(),
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
