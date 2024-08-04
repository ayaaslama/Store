import 'package:flutter/material.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/pages/home_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route defiend For ${settings.name}'),
                  ),
                ));
    }
  }
}
