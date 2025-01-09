import 'package:flutter/material.dart';
import '../../shared/customButton.dart';
import '../../shared/customInputBox.dart';
import 'registerPage.dart';

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
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/Vector.png'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image(
                image: AssetImage('assets/images/Ellipse.png'),
                fit: BoxFit.none,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputBox(
                    hintText: 'Username',
                    icon: Icons.person,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Button("LOGIN", RegisterPage()),
                  SizedBox(
                    height: 40,
                    child: Image(
                      image: AssetImage('assets/images/Ellipse 1.png'),
                    ),
                  ),
                  Button("GET REGISTER", RegisterPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
