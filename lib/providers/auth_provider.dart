import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:veegil_media/utils/utils.dart';

class AuthProvider extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;

  void login(String phoneno, password) async {
    try {
      final response = await http.post(
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

  Future<void> register({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      _loading = true;
      final response = await http.post(
          Uri.parse('${Constants.baseUrl}/auth/signup'),
          body: {'phoneNumber': phoneNumber, 'password': password});
      print(response.body);
      _loading = false;
      if (response.statusCode == 200) {
        print('Account Created Successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      _loading = false;
      print(e.toString());
    }
  }
}
