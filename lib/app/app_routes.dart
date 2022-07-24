import 'package:flutter/material.dart';
import 'package:veegil_media/pages/deposit/deposit.dart';
import 'package:veegil_media/pages/history/history.dart';
import 'package:veegil_media/pages/home/home.dart';
import 'package:veegil_media/pages/landing/landing_page.dart';
import 'package:veegil_media/pages/login/login.dart';
import 'package:veegil_media/pages/register/register.dart';
import 'package:veegil_media/pages/splash/splash_page.dart';
import 'package:veegil_media/pages/transfer/view/transfer_page.dart';

class VeegilBankPage {
  static const String initial = '/';
  static const String login = '/login';
  static const String splash = '/splash';
  static const String register = '/register';
  static const String home = '/home';
  static const String history = '/history';
  static const String deposit = '/deposit';
  static const String transfer = '/transfer';
}

class VeegilBankRoute {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case VeegilBankPage.initial:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );
      case VeegilBankPage.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case VeegilBankPage.login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case VeegilBankPage.register:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );
      case VeegilBankPage.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case VeegilBankPage.history:
        return MaterialPageRoute(
          builder: (context) => const HistoryPage(),
        );
      case VeegilBankPage.deposit:
        return MaterialPageRoute(
          builder: (context) => DepositPage(),
        );
      case VeegilBankPage.transfer:
        return MaterialPageRoute(
          builder: (context) => TransferPage(),
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
