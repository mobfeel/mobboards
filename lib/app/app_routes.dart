import 'package:flutter/material.dart';
import 'package:mobcards/views/pain/pain.dart';
import 'package:mobcards/views/views.dart';

class AppRoutes {
  static const String APP_ROUTE_HOME = '/home';
  static const String APP_ROUTE_ABOUT = '/about';
  static const String APP_ROUTE_ILUSTRATION = '/ilustration';
  static const String APP_ROUTE_SPELL = '/spell';
  static const String APP_ROUTE_PAIN = '/pain';
  static const String APP_ROUTE_VOLUME = '/volume';

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ROUTE_HOME:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Home(),
          );
        }

      case APP_ROUTE_PAIN:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Pain(),
          );
        }

      case APP_ROUTE_ABOUT:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => AboutPageMobilePortrait(),
          );
        }

      case APP_ROUTE_ILUSTRATION:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Ilustration(),
          );
        }

      case APP_ROUTE_SPELL:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Spell(),
          );
        }
      case APP_ROUTE_VOLUME:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Volume(),
          );
        }

      default:
        {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Home(),
          );
        }
    }
  }
}
