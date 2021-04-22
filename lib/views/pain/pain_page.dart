import 'package:flutter/material.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/views/views.dart';

class PainPage extends StatefulWidget {
  @override
  _PainPageState createState() => _PainPageState();
}

class _PainPageState extends State<PainPage> {
  String _text = "";
  Color _color = Colors.white;
  String _where = '...';

  double _width = 50.0;
  double _height = 50.0;

  @override
  void initState() {
    super.initState();
  }

  buildContainerInformation(
      BuildContext context, String message, String image) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              message,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 50,
              height: 50,
              child: Image.asset(
                image,
              ),
            ),
          ),
          SizedBox(
            width: 1,
          )
        ],
      ),
    );
  }

  buildContainerLevelPain(Color color, int level) {
    return Container(
      color: color,
      width: _width,
      height: _height,
      child: TextButton(
        onPressed: () {
          setState(
            () {
              _text = "$level";
              _color = color;
            },
          );
        },
        child: Text(
          '$level',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  buildButtonFrontBack(String wherePain, String image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(image),
            alignment: Alignment.bottomCenter,
            scale: 10 / 2.4),
      ),
      width: MediaQuery.of(context).size.width / 2.2,
      height: 150,
      child: TextButton(
        onPressed: () {
          setState(
            () {
              _where = wherePain;
              _alertBody(context);
            },
          );
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(wherePain,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }

  testWherePain() {
    if (_where ==
        "${AppLocalizations.of(context).translate('pain_page_front')}")
      return Constant.front;
    else
      return Constant.back;
  }

  void _alertBody(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Onde dói?'),
          content: SingleChildScrollView(
            child: Image.asset(testWherePain()),
          ),
        );
      },
    );
  }

  Widget _containerRow(String icon) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _alertBody(context);
          },
        );
      },
      child: Container(
        color: _color,
        width: 100,
        height: MediaQuery.of(context).size.height / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)
                  .translate("pain_page_where_is_the_pain"),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            Expanded(child: Image.asset(icon)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('screen_pain'),
        ),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${AppLocalizations.of(context).translate('pain_page_pain_location')} $_where",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${AppLocalizations.of(context).translate('pain_page_grade')}: $_text",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  AppLocalizations.of(context)
                                      .translate("pain_page_worst_pain"),
                                  Constant.worstPossiblePain),
                              Column(
                                children: [
                                  Container(
                                    child: buildContainerLevelPain(
                                        Colors.red[900], 10),
                                  ),
                                  buildContainerLevelPain(Colors.red[700], 9),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  AppLocalizations.of(context)
                                      .translate("pain_page_very_severe_pain"),
                                  Constant.verySeverePain),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.red, 8),
                                  buildContainerLevelPain(Colors.red[300], 7),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  AppLocalizations.of(context)
                                      .translate("pain_page_severe_pain"),
                                  Constant.severePain),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.red[100], 6),
                                  buildContainerLevelPain(
                                      Colors.yellow[200], 5),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  AppLocalizations.of(context)
                                      .translate("pain_page_moderate_pain"),
                                  Constant.moderatePain),
                              Column(
                                children: [
                                  buildContainerLevelPain(
                                      Colors.yellow[300], 4),
                                  buildContainerLevelPain(Colors.green[200], 3),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  AppLocalizations.of(context)
                                      .translate("pain_page_mild pain"),
                                  Constant.littlePain),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.green[400], 2),
                                  buildContainerLevelPain(Colors.green[600], 1),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              buildContainerInformation(
                                  context,
                                  AppLocalizations.of(context)
                                      .translate("pain_page_no_pain"),
                                  Constant.noPain),
                              Column(
                                children: [
                                  buildContainerLevelPain(Colors.green[900], 0),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    _containerRow('${Constant.front}'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButtonFrontBack(
                        AppLocalizations.of(context)
                            .translate('pain_page_front'),
                        Constant.front),
                    buildButtonFrontBack(
                        AppLocalizations.of(context)
                            .translate('pain_page_back'),
                        Constant.back),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
