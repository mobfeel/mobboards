import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../../constant.dart';
import '../custom_colors.dart';
import 'home_page.dart';

///criado a stateless Home para a navegação entre telas
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      debugShowCheckedModeBanner: false,
      home: HomePage(Constant.APP_NAME),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
