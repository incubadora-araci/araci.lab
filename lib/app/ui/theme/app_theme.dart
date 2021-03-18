
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.white,
  buttonColor: Colors.purple[400],
  brightness: Brightness.light,
  accentColor: Colors.lightGreen,
  dialogBackgroundColor: Colors.purple[400],
  appBarTheme: AppBarTheme(
    color: Colors.lightGreen,
  ),
);

final ThemeData appThemeDataDark = ThemeData(
  primaryColor: Colors.black,
  buttonColor: Colors.purple[400],
  brightness: Brightness.dark,
  accentColor: Colors.lightGreen,
  dialogBackgroundColor: Colors.purple[400],
  appBarTheme: AppBarTheme(
    color: Colors.lightGreen,
  ),
);

ThemeData pickCurrentAppTheme(){
  bool isDark = GetStorage().read("isDarkTheme")??true;
  return isDark ? appThemeDataDark : appThemeData;
}