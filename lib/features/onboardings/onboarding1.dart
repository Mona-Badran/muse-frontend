import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Positioned(
            bottom: 0,
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF789495),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Explore the world of art and culture',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
