import 'package:flutter/material.dart';
import 'package:mobcards/views/views.dart';
import '../../app/app.dart';
import '../../constant.dart';

class Pain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: PainPage(Constant.APP_NAME),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
