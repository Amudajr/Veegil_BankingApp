import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:veegil_media/model/model.dart';
import 'package:veegil_media/utils/utils.dart';

class TransactionProvider extends ChangeNotifier {
  Future<ResponseMessage> transfer({
    required String accountNumber,
    required String amount,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseUrl}/accounts/transfer'),
        body: {
          'phoneNumber': accountNumber,
          'password': amount,
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == HttpStatus.ok) {
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

  Future<ResponseMessage> deposit({
    required String accountNumber,
    required String amount,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseUrl}/accounts/withdraw'),
        body: {
          'phoneNumber': accountNumber,
          'password': amount,
        },
      );
      print(response.body);
      final data = jsonDecode(response.body);
      if (response.statusCode == HttpStatus.ok) {
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
}
