import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veegil_media/utils/utils.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    this.controller,
    this.labelText,
    this.icon,
    this.validator,
    this.isPassword = false,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? labelText;
  final IconData? icon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      inputFormatters: inputFormatters,
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
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: Constants.primaryColor,
              )
            : null,
      ),
    );
  }
}
