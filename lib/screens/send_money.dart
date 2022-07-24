import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
        Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(35),  
            margin: EdgeInsets.all(15), 
            decoration: BoxDecoration(   
              borderRadius: BorderRadius.circular(8),
                boxShadow: [  
                  new BoxShadow(color: Color(0xFF979EF2), offset: new Offset(4.0, 4.0),),  
            ], 
              ),
            height: 100,
            width: 350,
            child: Text('Make Tansfer Using Phone Number As Account No.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )
          ),
                Padding(
                      padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF979EF2), width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF979EF2), width: 3.0),
                          ),
                        border: OutlineInputBorder(),
                        labelText: 'From Account',
                        labelStyle: TextStyle(color: Color(0xFF979EF2)),
                        prefixIcon: Icon(Icons.account_box, color: Color(0xFF979EF2)),  
                    ),
                    ),
                    ),
                      Padding(
                        padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF979EF2), width: 3.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF979EF2), width: 3.0),
                            ),
                          border: OutlineInputBorder(),
                          labelText: 'To Account',
                          labelStyle: TextStyle(color: Color(0xFF979EF2)),
                          prefixIcon: Icon(Icons.account_box, color: Color(0xFF979EF2)),  
                      ),
                      ),
                    ),
                    Padding(
                        padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF979EF2), width: 3.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF979EF2), width: 3.0),
                            ),
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                          labelStyle: TextStyle(color: Color(0xFF979EF2)),
                          suffixIcon: Icon(Icons.currency_exchange, color: Color(0xFF979EF2)),  
                      ),
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                    "Transfer",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF979EF2),
                    fixedSize: const Size(
                      350,
                      50,
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
