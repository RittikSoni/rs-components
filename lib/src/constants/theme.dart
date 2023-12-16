import 'package:flutter/material.dart';

class RsTheme {
  static const Color buttonBg = Colors.blue;
  static const Color buttonFg = Colors.black;

  static const MaterialColor splashColor = Colors.lightBlue;
  static const Color ghostWhite = Color(0xffF8F8FF);
  static final Color disableBg = Colors.grey.shade300;
  static final Color disableFg = Colors.grey.shade600;
  static const Color error = Colors.red;

  static TextStyle subtitleTextStyle() => const TextStyle(
        color: Colors.grey,
      );

  static TextStyle titleTextStyle({Color? textColor}) => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: textColor,
      );
}
