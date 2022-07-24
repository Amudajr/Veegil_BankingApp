import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/pages/home/home.dart';
import 'package:veegil_media/pages/login/login.dart';
import 'package:veegil_media/providers/auth_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const HomePage();
    } else {
      return LoginPage();
    }
  }
}
