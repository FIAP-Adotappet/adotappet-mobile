import 'package:adotappet/config/routes/routes.dart';
import 'package:adotappet/modules/detail/screens/detail_screen.dart';
import 'package:adotappet/modules/home/models/pet_model.dart';
import 'package:adotappet/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/cadastro_user/screens/cadastro_user.dart';
import '../../modules/order_created/screens/order_created_screen.dart';
//import 'package:adotappet-mobile/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (context) => HomePage());
      case Routes.detail:
        if (args is Pet) {
          return MaterialPageRoute(
            builder: (context) => DetailPage(
              args,
            ),
          );
        }
        return _errorRoute();
      case Routes.cadastro:
        return MaterialPageRoute(builder: (context) => CadastroUser());
      case Routes.order_created:
        return MaterialPageRoute(builder: (context) => OrderCreatedPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
