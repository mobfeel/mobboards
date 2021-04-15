import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../views.dart';

///criado a stateless Spell para a navegação por routes
class Spell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.screenSpellTittle,
      debugShowCheckedModeBanner: false,
      home: SpellPage(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
