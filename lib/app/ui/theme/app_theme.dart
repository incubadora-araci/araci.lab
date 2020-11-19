
import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.lightGreen,
  primaryColor: Colors.lightGreen,
  buttonColor: Colors.lightGreen,
  brightness: Brightness.light,
  accentColor: Colors.cyan[600],
  appBarTheme: AppBarTheme(
    color: Colors.lightGreen,
  ),
);

final ThemeData appThemeDataDark = ThemeData(
  primaryColor: Colors.black,
  buttonColor: Colors.black,
  brightness: Brightness.dark,
  accentColor: Colors.cyan[600],
  appBarTheme: AppBarTheme(
    color: Colors.black,
  ),
);