import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:veegil_media/utils/custom_button.dart';
import 'package:veegil_media/screens/login.dart';
import 'package:veegil_media/screens/send_money.dart';
import 'package:veegil_media/screens/deposit.dart';
import 'package:veegil_media/screens/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:veegil_media/utils/custom_button.dart';

class Profile {
  final String phone;

  const Profile({
    required this.phone,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      phone: json['phoneNumber'],
    );
  }
}

class DashboardPage extends StatefulWidget {
  final String phone;

  const DashboardPage({required this.phone});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

// var bal = [];

class _DashboardPageState extends State<DashboardPage> {
  String myText = "";
  List<Profile>? profile;

  Future<Profile?> fetchProfile() async {
    try {
      final response =
          await http.get(Uri.parse("https://bank.veegil.com/accounts/list"));
      if (response.statusCode == 200) {
        profile = (response.body as List)
            .map((e) => Profile.fromJson(e as Map<String, dynamic>))
            .toList();
        print(profile);
      } else {
        throw Exception('Failed to load Profile');
      }
    } catch (err) {
      print(err);
      return null;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF979EF2),
                  offset: const Offset(6.0, 6.0),
                ),
              ],
            ),
            height: 200,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.account_balance, size: 60),
                  title: Text(
                    'Veegil Media',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text('The bank you can trust',
                      style: TextStyle(fontSize: 18.0)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(widget.phone, style: const TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 2,
                ),
                const Text('futureprof.toString()'),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
              Widget>[
            CustomButton(
                title: "Send Money",
                icon: Icons.send,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SendMoneyPage()),
                  );
                }),
            const SizedBox(
              width: 5,
            ),
            CustomButton(
                title: "Deposit",
                icon: Icons.money,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DepositPage()),
                  );
                }),
            const SizedBox(
              width: 5,
            ),
            CustomButton(
                title: "Transaction Details",
                icon: Icons.done_all,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionPage()),
                  );
                }),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CustomButton(
                  title: "Logout",
                  icon: Icons.logout,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  })
            ],
          ),
        ]),
      ),
    );
  }
}
