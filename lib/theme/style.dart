import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Color(0xff804783);
const primaryLightColor = Color(0xFFFBE8FF);

// Text
var segmentText = const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white);

// Styles
var paddingMainView = const EdgeInsets.fromLTRB(20, 16, 20, 16);

// Content width, so on tablet content will be not over whole screen.
var maxWidth = 600.0;

// App theme
ThemeData appLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    ),
    primaryColor: primaryColor,
    indicatorColor: primaryColor, colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor, secondary:  primaryColor),
  );
}

