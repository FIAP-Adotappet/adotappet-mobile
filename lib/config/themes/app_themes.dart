import 'package:adotappet/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData getThemeData() {
    return new ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      primarySwatch: Colors.deepOrange,
      textTheme: _getTextTheme(),
    );
  }

  static TextTheme _getTextTheme() {
    return new TextTheme(
      headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.primary),
      headline2: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 32),
      headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 18),
      bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      subtitle2: TextStyle(fontSize: 12),
    );
  }
}
