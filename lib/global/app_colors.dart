import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // for Light Theme
  static const lightPrimaryColor = Color(0xFFEAEBEE);
  static const lightAccentColor = Color(0xFFEAEBEE);

// for Light Theme
  static const darkPrimaryColor = Color(0xFF303956);
  static const darkAccentColor = Color(0xFF303956);

  static const backgroundColor = Color(0xFF1a202e);
  static Color bottomSheetColor({bool isDark = false}) =>
      isDark ? Colors.black87 : Colors.white;
  static final buttonColor = Colors.orangeAccent;
  static final appBarColor = Color(0xFFe2e2e2);
  static final cardColor = Colors.grey;
}
