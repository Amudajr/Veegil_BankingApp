// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/app/app_routes.dart';
import 'package:veegil_media/providers/auth_provider.dart';
import 'package:veegil_media/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Image.asset(
                //   'images/signup.jpg',
                // ),
                InkResponse(
                  onTap: () => context.back(),
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign Up',
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
                  'Open an account with few details',
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
                  icon: Icons.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number is required';
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
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextBox(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password is required';
                    }

                    if (passwordController.text != value) {
                      return 'Password does not match';
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
                          .register(
                            phoneNumber: phonenoController.text,
                            password: passwordController.text,
                          )
                          .then((value) {
                        context.back();
                        if (value.status == 'error') {
                          context.showErrorMessage(value.message ?? '');
                        } else {
                          context.showSuccessMessage(value.message ?? '');
                          Future.delayed(
                            Duration(
                              milliseconds: 1550,
                            ),
                            () => context.push(VeegilBankPage.home),
                          );
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
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Constants.primaryColor),
                    ),
                    onPressed: () => context.push(VeegilBankPage.login),
                    child: Text('Login.'),
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
