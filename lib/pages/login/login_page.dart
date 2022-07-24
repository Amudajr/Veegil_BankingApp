// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/app/app_routes.dart';
import 'package:veegil_media/providers/auth_provider.dart';
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
          child: Form(
            key: _formKey,
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
                  controller: phonenoController,
                  labelText: 'Phone Number',
                  icon: Icons.phone_android_rounded,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextBox(
                  controller: passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.showLoadingDialog();
                      context
                          .read<AuthProvider>()
                          .login(
                            phoneNumber: phonenoController.text,
                            password: passwordController.text,
                          )
                          .then((value) {
                        context.back();
                        if (value.status == 'error') {
                          context.showErrorMessage(value.message ?? '');
                        } else {
                          context.showSuccessMessage(value.message ?? '');
                        }
                      });
                    }
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
                    onPressed: () => context.push(VeegilBankPage.register),
                    child: Text('Sign Up'),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
