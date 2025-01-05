import 'package:flutter/material.dart';
import 'button.dart';
import 'inputBox.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              InputBox(
                hintText: 'Username',
                icon: Icons.person,
                obscureText : false,
              ),
              InputBox(
                hintText: 'Password',
                icon: Icons.lock,
                obscureText : false,
              ),
              Button("LOGIN"),
              SizedBox(
                height: 40,
                child: Image(
                  image: AssetImage('assets/images/Ellipse 1.png'),
                ),
              ),
              Button("GET REGISTER"),
            ],
          ),
        ),
      ),
    );
  }
}
