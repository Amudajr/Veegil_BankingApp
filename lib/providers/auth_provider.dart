import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegil_media/model/response_message.dart';
import 'package:veegil_media/utils/utils.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthProvider({required SharedPreferences sharedPreferences})
      : _pref = sharedPreferences;

  bool _loading = true;
  bool get loading => _loading;

  final SharedPreferences _pref;

  String get user => _pref.getString('user') ?? '';

  AuthStatus get authStatus {
    if (user.isEmpty) {
      return AuthStatus.unauthenticated;
    } else {
      return AuthStatus.authenticated;
    }
  }

  Future<ResponseMessage> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await http.post(
          Uri.parse('${Constants.baseUrl}/auth/login'),
          body: {'phoneNumber': phoneNumber, 'password': password});
      final data = jsonDecode(response.body);
      if (response.statusCode == HttpStatus.ok) {
        _pref.setString('user', jsonEncode(data['data']));
        return ResponseMessage.fromJson(data as Map<String, dynamic>);
      } else {
        return ResponseMessage(
          message: data['message'],
          status: data['status'],
        );
      }
    } catch (e) {
      return ResponseMessage(
        message: 'An error occur, Try again later',
        status: 'error',
      );
    }
  }

  Future<ResponseMessage> register({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      _loading = true;
      final response = await http.post(
          Uri.parse('${Constants.baseUrl}/auth/signup'),
          body: {'phoneNumber': phoneNumber, 'password': password});
      _loading = false;
      final data = jsonDecode(response.body);
      if (response.statusCode == HttpStatus.ok) {
        _pref.setString('user', jsonEncode(data['data']));
        return ResponseMessage.fromJson(data as Map<String, dynamic>);
      } else {
        return ResponseMessage(
          message: data['message'],
          status: data['status'],
        );
      }
    } catch (e) {
      _loading = false;
      return ResponseMessage(
        message: 'An error occur, Try again later',
        status: 'error',
      );
    }
  }

  void logout() {
    _pref.remove('user');
  }
}
