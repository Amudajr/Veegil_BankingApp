import 'package:flutter/material.dart';
import 'package:veegil_media/app/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0175C2),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      initialRoute: VeegilBankPage.initial,
      onGenerateRoute: VeegilBankRoute.onRouteGenerate,
    );
  }
}
