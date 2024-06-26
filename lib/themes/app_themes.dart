import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
static const Color primaryColor = Color(0xFFF6F8FA);
static const Color secondaryColor = Color(0xFF00545C);
  static const Color black = Colors.black;
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static  const Color grey = Color(0xFFFD4DAE1) ;

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