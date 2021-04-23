import 'package:flutter/material.dart';
import 'package:mobboards/app/app_routes.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/utilities/utilities.dart';
import '../../constant.dart';
import '../views.dart';

///criado a stateless About para a navegação por routes
class AboutPageMobilePortrait extends StatelessWidget {
  Widget _rowImage() {
    return Container(
      width: 150,
      height: 150,
      child: Image.asset(Constant.logoApp),
    );
  }

  Widget _rowContributors(String image1, String image2, String image3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          image1,
          width: 100,
        ),
        Image.asset(
          image2,
          width: 100,
        ),
        Image.asset(
          image3,
          width: 100,
        ),
      ],
    );
  }

  Widget _rowTextOne(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate("about_page_welcome_to_MobBoards"),
    );
  }

  Widget _rowTextTwo(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate("about_page_description"),
      textAlign: TextAlign.center,
    );
  }

  Widget _rowTextThree(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate("about_page_base_project"),
    );
  }

  Widget _rowTextFour(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate("about_page_about_us_text"),
      textAlign: TextAlign.center,
    );
  }

  Widget _rowTextFive(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate("about_page_developed_by"),
    );
  }

  Widget _rowTextSix(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate("about_page_names"),
    );
  }

  Widget _rowVersion(BuildContext context) {
    return FutureBuilder(
      future: Version.getVersion(),
      builder: (context, AsyncSnapshot<String> snapshot) => Text(
        "Versão ${snapshot.data}",
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),
      ),
    );
  }

  Widget _columnUI(BuildContext context) {
    return Column(
      children: [
        _rowImage(),
        SizedBox(
          height: 10,
        ),
        _rowTextOne(context),
        SizedBox(height: 10),
        _rowVersion(context),
        SizedBox(height: 15),
        _rowTextTwo(context),
        SizedBox(height: 15),
        _rowTextThree(context),
        SizedBox(height: 15),
        _rowTextFour(context),
        SizedBox(
          height: 20,
        ),
        _rowTextFive(context),
        SizedBox(
          height: 20,
        ),
        _rowTextSix(context),
        SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context).translate("about_page_partnership"),
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        _rowContributors(
            Constant.logoMobfeel, Constant.logoUfrgs, Constant.logoIsaacBrasil),
        SizedBox(
          height: 15,
        ),
        _rowContributors(
            Constant.logoComAcesso, Constant.logoAssistiva, Constant.boards),
        SizedBox(
          height: 15,
        ),
        Text(
          AppLocalizations.of(context).translate("about_page_arasaac"),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("screen_about"),
        ),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: ListView(
        children:[
          Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_HOME);
              }),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
            child: Align(
              alignment: Alignment.center,
              child: _columnUI(context),
            ),
          ),
        ]
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
