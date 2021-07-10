import 'package:adotappet/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData getThemeData(context) {
    return new ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      primarySwatch: Colors.deepOrange,
      textTheme: GoogleFonts.dosisTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
