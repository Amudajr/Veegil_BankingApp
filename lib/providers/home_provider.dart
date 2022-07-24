import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegil_media/model/model.dart';
import 'package:veegil_media/utils/utils.dart';

class HomeProvider extends ChangeNotifier {
  List<TransactionModel> _transactions = [];
  bool _transactionLoading = true;
  bool _balanceLoading = true;
  bool _isShowAccount = false;
  User _user = User();

  final SharedPreferences _pref;

  HomeProvider({required SharedPreferences sharedPreferences})
      : _pref = sharedPreferences;

  List<TransactionModel> get transactions => _transactions;
  User get user => _user;
  bool get transactionLoading => _transactionLoading;
  bool get balanceLoading => _balanceLoading;
  bool get isShowAccount => _isShowAccount;

  set isShowAccount(value) {
    _isShowAccount = value;
    notifyListeners();
  }

  Future<void> getTransactions() async {
    try {
      _transactionLoading = true;
      notifyListeners();
      final user = _pref.getString('user');
      final phone =
          (jsonDecode(user ?? '') as Map<String, dynamic>)['phoneNumber'];
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}/transactions'),
      );
      if (response.statusCode == HttpStatus.ok) {
        _transactionLoading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final transactions = (data['data'] as List)
            .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
            .toList();

        final userTransactions = transactions
            .where((element) => element.phoneNumber?.trim() == phone.trim())
            .toList();
        _transactions = userTransactions;
        notifyListeners();
      } else {
        _transactionLoading = false;
        _transactions = [];
        notifyListeners();
      }
    } catch (error) {
      _transactionLoading = false;
      _transactions = <TransactionModel>[];
      notifyListeners();
    }
  }

  Future<void> getUserBalance() async {
    try {
      _balanceLoading = true;
      notifyListeners();
      final user = _pref.getString('user');
      final phone =
          (jsonDecode(user ?? '') as Map<String, dynamic>)['phoneNumber'];
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}/accounts/list'),
      );
      if (response.statusCode == HttpStatus.ok) {
        _balanceLoading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final users = (data['data'] as List)
            .map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList();
        final user = users.firstWhere(
            (element) => element.phoneNumber?.trim() == phone.trim());
        log(user.balance.toString());
        _user = user;
        notifyListeners();
      } else {
        _balanceLoading = false;
        _user = User(balance: 0, phoneNumber: phone);
        notifyListeners();
      }
    } catch (error) {
      _balanceLoading = false;
      _user = User(balance: 0);
      notifyListeners();
    }
  }

  Future<void> fetchProfile() async {
    try {
      final response =
          await http.get(Uri.parse("${Constants.baseUrl}/accounts/list"));
      if (response.statusCode == 200) {
        // profile = (response.body as List)
        //     .map((e) => Profile.fromJson(e as Map<String, dynamic>))
        //     .toList();
        // print(profile);
      } else {
        // throw Exception('Failed to load Profile');
      }
    } catch (err) {
      print(err);
      // return null;
    }
  }
}
