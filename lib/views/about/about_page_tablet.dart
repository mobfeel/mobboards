import 'package:flutter/material.dart';

import '../custom_colors.dart';

class AboutPageTablet extends StatefulWidget {
  @override
  _AboutPageTabletState createState() => _AboutPageTabletState();
}

class _AboutPageTabletState extends State<AboutPageTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.primaryMobfeel,
      ),
    );
  }
}
