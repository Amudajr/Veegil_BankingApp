import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegil_media/app/app.dart';
import 'package:veegil_media/providers/auth_provider.dart';
import 'package:veegil_media/providers/history_provider.dart';
import 'package:veegil_media/providers/home_provider.dart';
import 'package:veegil_media/providers/transaction_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider(sharedPreferences: pref)),
        ChangeNotifierProvider(
            create: (_) => HomeProvider(sharedPreferences: pref)),
        ChangeNotifierProvider(
            create: (_) => HistoryProvider(sharedPreferences: pref)),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: const App(),
    ),
  );
}
