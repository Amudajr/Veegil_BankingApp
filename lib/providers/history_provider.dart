import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegil_media/model/model.dart';
import 'package:veegil_media/utils/utils.dart';

class HistoryProvider extends ChangeNotifier {
  List<TransactionModel> _history = [];
  bool _loading = true;

  bool get loading => _loading;
  List<TransactionModel> get history => _history;

  final SharedPreferences _pref;

  HistoryProvider({required SharedPreferences sharedPreferences})
      : _pref = sharedPreferences;

  Future<void> getHistory() async {
    try {
      _loading = true;
      notifyListeners();
      final user = _pref.getString('user');
      final phone =
          (jsonDecode(user ?? '') as Map<String, dynamic>)['phoneNumber'];
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}/transactions'),
      );
      if (response.statusCode == HttpStatus.ok) {
        _loading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final transactions = (data['data'] as List)
            .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
            .toList();

        final userTransactions = transactions
            .where((element) => element.phoneNumber?.trim() == phone.trim())
            .toList();
        _history = userTransactions;
        notifyListeners();
      } else {
        _loading = false;
        _history = [];
        notifyListeners();
      }
    } catch (error) {
      _loading = false;
      _history = <TransactionModel>[];
      notifyListeners();
    }
  }
}
