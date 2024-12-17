import 'package:flutter/material.dart';

OutlineInputBorder buildBorder({
  double? borderRadius,
  Color? borderColor,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 8),
    borderSide: BorderSide(
      color: borderColor ?? Colors.white,
    ),
  );
}
