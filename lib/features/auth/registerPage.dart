import 'package:flutter/material.dart';
import '../../shared/customButton.dart';
import '../../shared/customInputBox.dart';
import 'loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
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
                    "Register",
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
                    icon: Icons.person_2_outlined,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    hintText: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      Text(
                        "Gallery Owner",
                        style: TextStyle(
                          fontSize: 16, // Adjust font size
                          fontFamily: 'Poppins', // Use your custom font
                          color: Colors.black, // Text color
                        ),
                      ),
                    ],
                  ),
                  if (isChecked) ...[
                    SizedBox(
                      height: 10,
                    ),
                    InputBox(
                      hintText: 'Gallery Name',
                      icon: Icons.image_outlined,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputBox(
                      hintText: 'Location',
                      icon: Icons.location_on_outlined,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                  Button("REGISTER", LoginPage()),
                  SizedBox(
                    height: 40,
                    child: Image(
                      image: AssetImage('assets/images/Ellipse 1.png'),
                    ),
                  ),
                  Button("BACK TO LOGIN", LoginPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
