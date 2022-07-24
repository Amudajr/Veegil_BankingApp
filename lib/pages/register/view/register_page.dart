// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:veegil_media/screens/login.dart';
import 'package:veegil_media/utils/custom_text_box.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/signup.jpg',
                  ),
                  CustomTextBox(
                    labelText: 'Phone Number',
                    icon: Icons.phone,
                  ),
                  CustomTextBox(
                    labelText: 'Password',
                    icon: Icons.password,
                  ),
                  CustomTextBox(
                    labelText: 'Confirm Password',
                    icon: Icons.password,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // signup(phonenoController.text.toString(),
                      //     passwordController.text.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF979EF2),
                      fixedSize: const Size(
                        350,
                        50,
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Already have an account?",
                      style: const TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text('Login.'),
                    ),
                  ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
