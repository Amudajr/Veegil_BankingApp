// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veegil_media/screens/signup.dart';
import 'package:veegil_media/utils/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/login1.jpg'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Log In',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Constants.primaryColor,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Hey there, login into your account',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextBox(
                labelText: 'Phone Number',
                icon: Icons.phone_android_rounded,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextBox(
                labelText: 'Password',
                icon: Icons.lock,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // login(phonenoController.text.toString(),
                  //     passwordController.text.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: Constants.primaryColor,
                  fixedSize: const Size(
                    350,
                    50,
                  ),
                ),
                child: Text(
                  "LOG IN",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Don't have an account?",
                  style: const TextStyle(color: Colors.black),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Constants.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
