import 'package:flutter/material.dart';

import '../../functions/build_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.hintColor,
    this.maxLines,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.textColor,
    this.suffixIcon,
    required this.keyboardType,
    required this.textInputAction,
    this.obscure,
    this.cursorColor,
    required this.controller,
    this.validator,
    this.onFieldSubmitted,
  });

  final String hintText;
  final Color? hintColor;
  final int? maxLines;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? textColor;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool? obscure;
  final Color? cursorColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        border: border ?? buildBorder(),
        enabledBorder: enabledBorder ?? buildBorder(),
        focusedBorder: focusedBorder,
        suffixIcon: suffixIcon,
      ),
      style: TextStyle(
        color: textColor,
      ),
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscure ?? false,
      cursorColor: cursorColor ?? Colors.black,
      controller: controller,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
