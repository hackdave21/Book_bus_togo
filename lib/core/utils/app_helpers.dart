import'package:flutter/material.dart';

class AppHelpers {
   static getSpacerHeight(double step) {
    return SizedBox(height: 10 * step);
  }

  static getSpacerWidth(double step) {
    return SizedBox(width: 10 * step);
  }
}