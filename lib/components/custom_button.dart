import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Column(children: <Widget>[
        Icon(
          icon,
          color: Color(0xFF979EF2),
          size: 30,
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF979EF2),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
      onPressed: onPressed,
    );
  }
}
