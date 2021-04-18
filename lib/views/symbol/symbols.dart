import 'package:flutter/material.dart';
import 'package:mobboards/translate/translate.dart';
import '../../app/app.dart';
import '../views.dart';

class Ilustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: AppLocalizations.delegates,
      title: '...',
      debugShowCheckedModeBanner: false,
      home: SymbolPage(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}