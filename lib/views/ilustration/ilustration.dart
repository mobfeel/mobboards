import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../views.dart';

///criado a stateless Home para a navegação entre telas
class Ilustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.SCREEN_SYMBOLS_TITLE,
      debugShowCheckedModeBanner: false,
      home: IlustrationPage(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}