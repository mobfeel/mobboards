import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/utilities/utilities.dart';
import '../../constant.dart';
import '../views.dart';

class AboutPageMobile extends StatelessWidget {

  Widget _rowImage() {
    return Container(
      width: 100,
      height: 100,
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
    return Text(AppLocalizations.of(context)!.translate("about_page_welcome_to_MobBoards")!, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),);
  }

  // Widget _rowTextTwo(BuildContext context) {
  //   return Text(
  //     AppLocalizations.of(context).translate("about_page_description"),
  //     textAlign: TextAlign.center,
  //   );
  // }
  //
  // Widget _rowTextThree(BuildContext context) {
  //   return Text(
  //     AppLocalizations.of(context).translate("about_page_base_project"),
  //   );
  // }

  Widget _rowTextFour(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.translate("about_page_about_us_text")!, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.4)),
        Text(AppLocalizations.of(context)!.translate("about_page_about_us_text_2")!, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.4)),
      ],
    );
  }

  Widget _rowTextFive(BuildContext context) {
    return Text(AppLocalizations.of(context)!.translate("about_page_developed_by")!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600));
  }

  Widget _rowTextSix(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRichText(title: 'Thiago Cury', content: '- (Professor)'),
        SizedBox(height: 10),
        MyRichText(title: 'Eduardo Rambo', content: '- (Aluno)'),
        SizedBox(height: 10),
        MyRichText(title: 'Welinton Prediger', content: '- (Aluno)'),
        SizedBox(height: 10),
        MyRichText(title: 'Joana Eberle Dorigan', content: '- (Estudante do curso de Terapia Ocupacional pelo Centro Universitário da Serra Gaúcha - FSG, Caxias do Sul)'),
      ],
    );
    //return Text(AppLocalizations.of(context)!.translate("about_page_names")!);
  }

  _getVersionByOS(BuildContext context, AsyncSnapshot<String> snapshot) {
    if(Platform.isIOS || Platform.isAndroid) {
      return Text("${AppLocalizations.of(context)!.translate("version")} ${snapshot.data}",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)
      );
    }
    return Text('');
  }

  Widget _rowVersion(BuildContext context) {
    return FutureBuilder(
      future: Version.getVersion(),
      builder: (context, AsyncSnapshot<String> snapshot) => _getVersionByOS(context, snapshot),
    );
  }

  Widget _columnUI(BuildContext context) {
    return Column(
      children: [
        _rowImage(),
        SizedBox(height: 30),
        _rowTextOne(context),
        SizedBox(height: 20),
        // _rowTextTwo(context),
        // SizedBox(height: 15),
        // _rowTextThree(context),
        // SizedBox(height: 15),
        _rowTextFour(context),
        SizedBox(height: 20),
        _rowTextFive(context),
        SizedBox(height: 20),
        _rowTextSix(context),
        SizedBox(height: 20),
        Text(AppLocalizations.of(context)!.translate("about_page_partnership")!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        SizedBox(height: 15),
        _rowContributors(Constant.logoMobfeel, Constant.logoUfrgs, Constant.logoIsaacBrasil),
        SizedBox(height: 15),
        _rowContributors(Constant.logoComAcesso, Constant.logoAssistiva, Constant.boards),
        SizedBox(height: 30),
        Text(AppLocalizations.of(context)!.translate("about_page_arasaac")!, style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 30),
        _rowVersion(context),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("menu_screen_about")!, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerComponent(),
      body: ListView(
        children:[
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
