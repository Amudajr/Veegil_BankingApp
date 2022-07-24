import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/app/app.dart';
import 'package:veegil_media/providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const App(),
    ),
  );
}
