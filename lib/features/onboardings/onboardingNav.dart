import 'package:flutter/material.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';

class OnboardingNav extends StatefulWidget {
  const OnboardingNav({super.key});

  @override
  State<OnboardingNav> createState() => _OnboardingNavState();
}

class _OnboardingNavState extends State<OnboardingNav> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': Onboarding1(),
      'text': 'Explore the world of art and culture',
      'buttonAction': () => null, // Add custom actions here
    },
    {
      'page': Onboarding2(),
      'text': 'Discover art that catches your eye',
      'buttonAction': () => null,
    },
    {
      'page': Onboarding3(),
      'text': 'Visit online Galleries',
      'buttonAction': () => null,
    },
  ];

  void _nextPage() {
    setState(() {
      if (_currentIndex < _pages.length - 1) {
        _currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomSheet: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF789495),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Explore the world of art and culture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
