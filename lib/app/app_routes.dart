import 'package:flutter/material.dart';
import 'package:veegil_media/pages/landing/landing_page.dart';
import 'package:veegil_media/pages/login/login.dart';
import 'package:veegil_media/pages/register/register.dart';

class VeegilBankPage {
  static const String initial = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
}

class VeegilBankRoute {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case VeegilBankPage.initial:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );
      case VeegilBankPage.login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case VeegilBankPage.register:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Oops you lost your ways',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
    }
  }
}
