import 'package:get/get.dart';
import 'package:mobboards/views/about/about_page.dart';
import 'package:mobboards/views/views.dart';

class AppRoutes {
  static const String APP_ROUTE_HOME = '/home';
  static const String APP_ROUTE_SYMBOLS = '/symbols';
  static const String APP_ROUTE_SPELL = '/spell';
  static const String APP_ROUTE_PAIN = '/pain';
  static const String APP_ROUTE_SETTINGS = '/settings';
  static const String APP_ROUTE_ABOUT = '/about';

  static List<GetPage> pages = [
    GetPage(name: APP_ROUTE_HOME, page: () => HomePage(), transition: Transition.cupertino, transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: APP_ROUTE_SYMBOLS, page: () => SymbolPage(), transition: Transition.cupertino, transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: APP_ROUTE_SPELL, page: () => SpellPage(), transition: Transition.cupertino, transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: APP_ROUTE_PAIN, page: () => PainPage(), transition: Transition.cupertino, transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: APP_ROUTE_SETTINGS, page: () => SettingsPage(), transition: Transition.cupertino, transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: APP_ROUTE_ABOUT, page: () => AboutPage(), transition: Transition.cupertino, transitionDuration: Duration(milliseconds: 500)),
  ];

  // Route getRoutes(RouteSettings routeSettings) {
  //   switch (routeSettings.name) {
  //     case APP_ROUTE_HOME:
  //       return MaterialPageRoute<void>(
  //         settings: routeSettings,
  //         builder: (BuildContext context) => Home(),
  //       );
  //
  //     case APP_ROUTE_SYMBOLS:
  //       return MaterialPageRoute<void>(
  //         settings: routeSettings,
  //         builder: (BuildContext context) => SymbolPage(),
  //       );
  //
  //     case APP_ROUTE_SPELL:
  //       return MaterialPageRoute<void>(
  //         settings: routeSettings,
  //         builder: (BuildContext context) => Spell(),
  //       );
  //
  //     case APP_ROUTE_PAIN:
  //       return MaterialPageRoute<void>(
  //         settings: routeSettings,
  //         builder: (BuildContext context) => Pain(),
  //       );
  //
  //     case APP_ROUTE_SETTINGS:
  //       return MaterialPageRoute<void>(
  //         settings: routeSettings,
  //         builder: (BuildContext context) => Settings(),
  //       );
  //
  //     case APP_ROUTE_ABOUT:
  //       return MaterialPageRoute<void>(
  //         settings: routeSettings,
  //         builder: (BuildContext context) => About(),
  //       );
  //
  //     default:
  //       return MaterialPageRoute<void>(
  //         settings: routeSettings,
  //         builder: (BuildContext context) => Home(),
  //       );
  //   }
  // }
}
