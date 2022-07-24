// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:veegil_media/screens/signup.dart';
import 'package:veegil_media/screens/dashboard.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? phone;

  void login(String phoneno, password) async {
    try {
      Response response = await post(
          Uri.parse('https://bank.veegil.com/auth/login'),
          body: {'phoneNumber': phoneno, 'password': password});
      if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage(phone: phonenoController.text)),
          );
        print('Account Logged In Successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/login1.jpg',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: phonenoController,
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF979EF2), width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF979EF2), width: 3.0),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Color(0xFF979EF2)),
                        prefixIcon: Icon(
                          Icons.phone_android_rounded,
                          color: Color(0xFF979EF2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF979EF2), width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF979EF2), width: 3.0),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Color(0xFF979EF2)),
                        prefixIcon:
                            Icon(Icons.password, color: Color(0xFF979EF2)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login(phonenoController.text.toString(),
                          passwordController.text.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF979EF2),
                      fixedSize: const Size(
                        350,
                        50,
                      ),
                    ),
                    child: Text(
                      "Login",
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
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text('Join.'),
                    ),
                  ])
                ],
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
