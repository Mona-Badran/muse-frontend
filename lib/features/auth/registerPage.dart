import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config.dart';
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

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController galleryNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void handleRegister() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final user_type_id = isChecked ? 2 : 1;
    final galleryName = isChecked ? galleryNameController.text : null;
    final description = isChecked ? descriptionController.text : null;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username and Password are required."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final url = Uri.parse('$BASE_URL/auth/register');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'user_type_id': user_type_id,
          if (isChecked) 'galleryName': galleryName,
          if (isChecked) 'description': description,
        }),
      );
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration successful! Please log in."),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }else {
        final error = jsonDecode(response.body)['error'] ?? 'Registration failed.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $error"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: SingleChildScrollView(
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
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      child: Image(
                        image: AssetImage('assets/images/musec.png'),
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
                      obscureText: true,
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
                        hintText: 'Description',
                        icon: Icons.description_outlined,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                    Button(
                      "REGISTER",
                      onPressed: handleRegister,
                    ),
                    SizedBox(
                      height: 40,
                      child: Image(
                        image: AssetImage('assets/images/Ellipse 1.png'),
                      ),
                    ),
                    Button(
                      "BACK TO LOGIN",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        // ),
      ),
    );
  }
}
