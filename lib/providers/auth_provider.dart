import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  void login(String phoneno, password) async {
    try {
      Response response = await post(
          Uri.parse('https://bank.veegil.com/auth/login'),
          body: {'phoneNumber': phoneno, 'password': password});
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           DashboardPage(phone: phonenoController.text)),
        // );
        print('Account Logged In Successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void signup(String phoneno, password) async {
    try {
      Response response = await post(
          Uri.parse('https://bank.veegil.com/auth/signup'),
          body: {'phoneNumber': phoneno, 'password': password});
      if (response.statusCode == 200) {
        print('Account Created Successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
