import 'package:flutter/material.dart';

import 'config/themes/app_themes.dart';
import 'modules/home/screens/home_screen.dart';

void main() {
  runApp(AdotAppet());
}

class AdotAppet extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adotappet',
      theme: AppThemes.getThemeData(),
      home: HomePage(),
    );
  }
}