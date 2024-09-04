import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF003466);
  static const Color background = Color(0xFFF0F3F4);
  static const Color inContainerColor = Color(0xFFCCCCCC);
  static const Color black = Colors.black;
  static const Color white = Color.fromRGBO(255, 255, 255, 1);

  static const String fontFamilyLato = "Lato";
  static const String fontFamilyQuick = "Quicksand";

  TextStyle stylish1(double size, Color color, {bool isBold = false}) {
    return GoogleFonts.raleway(
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: color,
    );
  }

  TextStyle stylish2(double size, Color color, {bool isBold = false}) {
    return GoogleFonts.comfortaa(
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: color,
    );
  }

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: primaryColor,
      fontFamily: fontFamilyQuick);
}
