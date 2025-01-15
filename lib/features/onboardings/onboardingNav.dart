import 'package:flutter/material.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';
import '../auth/loginPage.dart';

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
      'buttonAction': () => null,
    },
    {
      'page': Onboarding2(),
      'text': 'Discover art that catches your eye',
      'buttonAction': () => null,
    },
    {
      'page': Onboarding3(),
      'text': 'Welcome to our online Galleries',
      'buttonAction': () => null,
    },
  ];

  void _nextPage() {
    setState(() {
      if (_currentIndex < _pages.length - 1) {
        _currentIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  List<Widget> currentPage() {
    return List<Widget>.generate(
      _pages.length,
      (index) => Icon(
        index == _currentIndex ? Icons.circle : Icons.circle_outlined,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex]['page'],
      bottomSheet: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF789495),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _pages[_currentIndex]['text'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(children: currentPage()),
                  IconButton(
                    onPressed: _nextPage,
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
