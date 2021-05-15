import 'package:flutter/material.dart';
import 'package:mobboards/translate/translate.dart';
import '../views.dart';

class Spell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.locales,
      localizationsDelegates: AppLocalizations.delegates,
      title: '...',
      debugShowCheckedModeBanner: false,
      home: SpellPage(),
    );
  }
}
