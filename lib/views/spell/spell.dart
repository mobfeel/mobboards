import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../custom_colors.dart';
import '../views.dart';

///criado a stateless Spell para a navegação por routes
class Spell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      debugShowCheckedModeBanner: false,
      home: SpellPage(Constant.APP_NAME),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}