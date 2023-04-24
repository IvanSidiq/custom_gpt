
import 'package:flutter/material.dart';

class CustomShadow {
  static const aboveHigh = BoxShadow(
      offset: Offset(0, -16),
      blurRadius: 48,
      spreadRadius: 0,
      color: Color(0x38000000));

  static const aboveMed = BoxShadow(
      offset: Offset(0, -8),
      blurRadius: 36,
      spreadRadius: 0,
      color: Color(0x2B000000));

  static const above = BoxShadow(
      offset: Offset(0, -4),
      blurRadius: 16,
      spreadRadius: 0,
      color: Color(0x1E000000));

  static const bellowHigh = BoxShadow(
      offset: Offset(0, 16),
      blurRadius: 48,
      spreadRadius: 0,
      color: Color(0x38000000));

  static const bellowMed = BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 36,
      spreadRadius: 0,
      color: Color(0x2B000000));

  static const bellow = BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
      color: Color(0x1E000000));
}
