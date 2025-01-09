import 'package:flutter/material.dart';
import '../../shared/customButton.dart';
import '../../shared/customInputBox.dart';
import '../../shared/customBottomNavBar.dart';
import 'registerPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Show an error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please provide both username and password."),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomBottomNavBar(),
        ),
      );
    }
  }

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
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    hintText: 'Username',
                    icon: Icons.person,
                    obscureText: false,
                    controller: usernameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: false,
                    controller: passwordController,
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
                  Button("LOGIN", CustomBottomNavBar(), onPressed: handleLogin,),
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
