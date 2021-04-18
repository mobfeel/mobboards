import 'package:flutter/material.dart';
import 'package:mobboards/utils/orientation_layout.dart';
import 'package:mobboards/utils/screen_type_layout.dart';
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
