import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
static const Color primaryColor = Color(0xFFDB4A2B);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static  Color? grey = Colors.grey[300];

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

static ThemeData lightTheme = ThemeData (
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: primaryColor,
  fontFamily: fontFamilyQuick
);
}