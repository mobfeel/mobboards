import 'package:flutter/material.dart';
import 'package:mobcards/utils/version.dart';
import '../custom_colors.dart';
import '../views.dart';

///criado a stateless About para a navegação por routes
class AboutPageMobilePortrait extends StatelessWidget {
  Widget _rowImage() {
    return Container(
      width: 100,
      height: 100,
      child: Image.asset(Constant.logo),
    );
  }

  Widget _rowImageTwo() {
    return Image.asset(
      Constant.logo2,
      width: 80,
      height: 80,
    );
  }

  Widget _rowTextOne() {
    return Text(Constant.WELCOME_TO_MOBECARDS);
  }

  Widget _rowTextTwo() {
    return Text(
      Constant.EFFECT_PHRASE,
      textAlign: TextAlign.center,
    );
  }

  Widget _rowTextThree() {
    return Text(Constant.BASE_PROJECT);
  }

  Widget _rowTextFour() {
    return Text(
      '${Constant.ABOUT_US_TEXT}',
      textAlign: TextAlign.center,
    );
  }

  Widget _rowTextFive() {
    return Text(Constant.DEVELOPMENT_BY);
  }

  Widget _rowTextSix() {
    return Text(Constant.NAMES);
  }

  Widget _rowVersion() {
    return FutureBuilder(
      future: Version.getVersion(),
      builder: (context, AsyncSnapshot<String> snapshot) => Text(
        "Versão ${snapshot.data}",
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),
      ),
    );
  }

  Widget _columnUI() {
    return Column(
      children: [
        _rowImage(),
        SizedBox(
          height: 10,
        ),
        _rowTextOne(),
        SizedBox(height: 10),
        _rowVersion(),
        SizedBox(height: 15),
        _rowTextTwo(),
        SizedBox(height: 15),
        _rowTextThree(),
        SizedBox(height: 15),
        _rowTextFour(),
        SizedBox(
          height: 20,
        ),
        _rowTextFive(),
        SizedBox(
          height: 20,
        ),
        _rowTextSix(),
        SizedBox(
          height: 20,
        ),
        _rowImageTwo(),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o App'),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
          child: Align(
            alignment: Alignment.center,
            child: _columnUI(),
          ),
        ),
      ),
    );
  }
}

class AboutPageMobileLandscape extends StatefulWidget {
  @override
  _AboutPageMobileLandscapeState createState() =>
      _AboutPageMobileLandscapeState();
}

class _AboutPageMobileLandscapeState extends State<AboutPageMobileLandscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
