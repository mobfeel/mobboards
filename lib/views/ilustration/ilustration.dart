import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../custom_colors.dart';
import '../views.dart';

///criado a stateless Home para a navegação entre telas
class Ilustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      debugShowCheckedModeBanner: false,
      home: IlustrationPage(Constant.APP_NAME),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}