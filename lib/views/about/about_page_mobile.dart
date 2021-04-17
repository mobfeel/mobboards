import 'package:flutter/material.dart';
import 'package:mobcards/utils/utils.dart';
import '../../constant.dart';
import '../views.dart';

///criado a stateless About para a navegação por routes
class AboutPageMobilePortrait extends StatelessWidget {
  Widget _rowImage() {
    return Container(
      width: 150,
      height: 150,
      child: Image.asset(Constant.logoOfficial),
    );
  }

  Widget _rowContributors(String image1, String image2, String image3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(image1, width: 100,),
        Image.asset(image2, width: 100,),
        Image.asset(image3, width: 100,),
      ],
    );
  }

  Widget _rowTextOne() {
    return Text(Constant.welcomeToMobBoards);
  }

  Widget _rowTextTwo() {
    return Text(
      Constant.description,
      textAlign: TextAlign.center,
    );
  }

  Widget _rowTextThree() {
    return Text(Constant.baseProject);
  }

  Widget _rowTextFour() {
    return Text(
      '${Constant.aboutUsText}',
      textAlign: TextAlign.center,
    );
  }

  Widget _rowTextFive() {
    return Text(Constant.developmentBy);
  }

  Widget _rowTextSix() {
    return Text(Constant.names);
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
        SizedBox(height: 10,),
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
        Text('Parceiros', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
        SizedBox(height: 15,),
        _rowContributors(Constant.logo2, Constant.ufrgsLogo, Constant.isaacBrasil),
        SizedBox(height: 15,),
        _rowContributors(Constant.comAcessoLogo,Constant.assistivaLogo, Constant.boards),
        SizedBox(height: 15,),
        Text(Constant.arasaac)
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
