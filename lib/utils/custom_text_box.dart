import 'package:flutter/material.dart';
import 'package:veegil_media/utils/utils.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    this.controller,
    this.labelText,
    this.icon,
    this.validator,
    this.isPassword = false,
  });

  final TextEditingController? controller;
  final String? labelText;
  final IconData? icon;
  final FormFieldValidator? validator;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Constants.primaryColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Constants.primaryColor,
          ),
        ),
        border: const OutlineInputBorder(),
        labelText: labelText,
        labelStyle: const TextStyle(color: Constants.primaryColor),
        prefixIcon: Icon(
          icon,
          color: Constants.primaryColor,
        ),
      ),
    );
  }
}
