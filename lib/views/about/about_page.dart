import 'package:flutter/material.dart';
import 'package:mobcards/utils/orientation_layout.dart';
import 'package:mobcards/utils/screen_type_layout.dart';
import 'package:mobcards/views/views.dart';

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
