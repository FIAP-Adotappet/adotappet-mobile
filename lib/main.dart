import 'package:adotappet/modules/cadastro_user/screens/cadastro_user.dart';
import 'package:adotappet/config/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'config/routes/routes.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Adotappet',
      theme: AppThemes.getThemeData(context),
      initialRoute: Routes.root,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
