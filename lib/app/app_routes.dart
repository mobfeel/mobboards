import 'package:flutter/material.dart';
import 'package:mobboards/views/views.dart';

class AppRouter {
  static const String APP_ROUTE_HOME = '/';
  static const String APP_ROUTE_SYMBOLS = '/symbols';
  static const String APP_ROUTE_SPELL = '/spell';
  static const String APP_ROUTE_PAIN = '/pain';
  static const String APP_ROUTE_SETTINGS = '/settings';
  static const String APP_ROUTE_ABOUT = '/about';

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => HomePage());

      case APP_ROUTE_SYMBOLS:
        return MaterialPageRoute(builder: (_) => SymbolPage());

      case APP_ROUTE_SPELL:
        return MaterialPageRoute(builder: (_) => SpellPage());

      case APP_ROUTE_PAIN:
        return MaterialPageRoute(builder: (_) => PainPage());

      case APP_ROUTE_SETTINGS:
        return MaterialPageRoute(builder: (_) => SettingsPage());

      case APP_ROUTE_ABOUT:
        return MaterialPageRoute(
            builder: (BuildContext context) => AboutPageMobilePortrait());

      default:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
    }
  }
}
