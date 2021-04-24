import 'package:flutter/material.dart';
import 'package:mobboards/views/pain/pain.dart';
import 'package:mobboards/views/views.dart';

class AppRoutes {
  static const String APP_ROUTE_HOME = '/home';
  static const String APP_ROUTE_SYMBOLS = '/symbols';
  static const String APP_ROUTE_SPELL = '/spell';
  static const String APP_ROUTE_PAIN = '/pain';
  static const String APP_ROUTE_SETTINGS = '/settings';
  static const String APP_ROUTE_ABOUT = '/about';

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ROUTE_HOME:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Home(),
        );

      case APP_ROUTE_SYMBOLS:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => SymbolPage(),
        );

      case APP_ROUTE_SPELL:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Spell(),
        );

      case APP_ROUTE_PAIN:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Pain(),
        );

      case APP_ROUTE_SETTINGS:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Settings(),
        );

      case APP_ROUTE_ABOUT:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => About(),
        );

      default:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Home(),
        );
    }
  }
}
