import 'package:flutter/material.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/views/views.dart';
import '../../app/app.dart';

class Pain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: AppLocalizations.delegates,
      title: '...',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: PainPage(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
