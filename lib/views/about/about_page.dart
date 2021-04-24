import 'package:flutter/material.dart';
import 'package:mobboards/utilities/utilities.dart';
import 'package:mobboards/views/views.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: AboutPageMobilePortrait(),
        landscape: AboutPageMobileLandscape(),
      ),
      tablet: AboutPageTablet(),
      desktop: AboutPageDesktop(),
    );
  }
}
