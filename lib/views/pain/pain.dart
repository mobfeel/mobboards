import 'package:flutter/material.dart';
import 'package:mobcards/views/views.dart';
import '../../app/app.dart';
import '../../constant.dart';

class Pain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.SCREEN_PAIN_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: PainPage(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
