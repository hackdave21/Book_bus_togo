import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF003466);
  static const Color inContainerColor = Color(0xFFCCCCCC);
  static const Color black = Colors.black;
  static const Color white = Colors.white;

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

class BaseColors {
  static const List<Color> grad1 = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink
  ];
  static const List<Color> arcsColors = [
    Colors.blue,
    Colors.yellow,
    Colors.red
  ];
}
