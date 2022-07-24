import 'package:flutter/material.dart';
import 'package:veegil_media/screens/dashboard.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                     new IconButton(
                      icon: new Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                        onPressed: (){
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage(phone: "")),
                      );
                      }),
                      SizedBox(
                        width: 50,
                      ),
                      Text('Transaction History',
                        style: TextStyle(
                          color: Colors.black, 
                          fontSize: 20),
                       ),
              ]
              ),
                  Column(
                    children: [
                      SizedBox(
                        width: 400,
                        height: 2,
                        child: const ColoredBox(color: Color(0xFF979EF2)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              new BoxShadow(
                              color: Color(0xFF979EF2),
                              ),
                            ],
                          ),
                          width: 370,
                          height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Acc',
                              style: TextStyle(
                              color: Colors.white, 
                              fontSize: 15),
                             ),
                            Text('# 0.00',
                              style: TextStyle(
                              color: Colors.white, 
                              fontSize: 20),
                        ),
                        ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 400,
                        height: 2,
                        child: const ColoredBox(color: Color(0xFF979EF2)),
                      ),
                        ],
                      ),
              SizedBox(
                height: 5,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 191, 199, 204),
                        ),
                      ],
                    ),
                  width: 370,
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Sender Acc',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Description",
                             style: TextStyle(color: Colors.black),
                            ),
                            Text('Amount Received',
                            style: TextStyle(color: Colors.black),
                        ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
              ]
              ),
        ),
      ),
    );
  }
}
