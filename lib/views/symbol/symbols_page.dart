import 'package:flutter/material.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/utilities/utilities.dart';
import 'package:mobboards/component/component.dart';
import '../../app/app_routes.dart';
import '../views.dart';

class SymbolPage extends StatefulWidget {
  @override
  _SymbolPageState createState() => _SymbolPageState();
}

class _SymbolPageState extends State<SymbolPage> {
  List<Widget>? _buttons;
  List<String> _words = [];
  TextEditingController? _text;
  TextToSpeech textToSpeech = TextToSpeech();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  onClickSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(AppLocalizations.of(context)!.translate("snackbar_empty_field")!),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _button(Color color, String message, {String? image}) {
    double widthFactor = MediaQuery.of(context).size.width / 360;
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppStyle.primaryMobfeel,
        shadowColor: Colors.grey,
        padding: EdgeInsets.all(0),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
      ),
      child: Card(
        color: color,
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 100 * widthFactor,
                child: Text(
                  message,
                  style: TextStyle(fontSize: 11 * widthFactor),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        if (message == AppLocalizations.of(context)!.translate("button_pain")) {
          Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_PAIN);
        } else if (message ==
            AppLocalizations.of(context)!.translate("button_alphabet")) {
          Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
        } else if (message ==
            AppLocalizations.of(context)!.translate("button_delete")) {
          setState(
            () {
              if (_words.isEmpty)
                return onClickSnackbar(context);
              else
                _words.removeAt(_words.length - 1);
              _text = TextEditingController(text: _showWords());
            },
          );
        } else {
          setState(
            () {
              _words.add('$message ');
              if (TextToSpeech.onOff) {
                textToSpeech.speechMessage = message;
                textToSpeech.speak();
              }
              _text = TextEditingController(text: _showWords());
            },
          );
        }
      },
      onLongPress: () {
        if (message ==
            AppLocalizations.of(context)!.translate('button_delete')) {
          setState(() {
            if (_words.isEmpty)
              return onClickSnackbar(context);
            else
              _words.clear();
          });
          _text = TextEditingController(
            text: _showWords(),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    textToSpeech.stop();
  }

  @override
  void dispose() {
    super.dispose();
    textToSpeech.stop();
  }

  _deleteButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: AppStyle.primaryMobfeel,
        shadowColor: Colors.grey,
        padding: EdgeInsets.all(0),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
      ),
      child: Column(
        children: [
          // Text(AppLocalizations.of(context).translate("button_delete")),
          Image.asset(
            Constant.backspace,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _buttons = [
      //background blue2
      _button(AppStyle.red,
          AppLocalizations.of(context)!.translate("button_pain")!,
          image: Constant.pain),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_alphabet")!,
          image: Constant.alphabet),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_another_thing")!,
          image: Constant.anotherThing),
      // _deleteButton(),
      _button(
          Colors.white, AppLocalizations.of(context)!.translate("button_delete")!,
          image: Constant.backspace),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_i_dont_know")!,
          image: Constant.iDontKnow),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_thank_you")!,
          image: Constant.thankYou),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_more")!,
          image: Constant.more),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_turn_on_the_light")!,
          image: Constant.turnOnTheLight),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_turn_on_turn_off")!,
          image: Constant.turnOnTurnOff),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_question_yes_or_no")!,
          image: Constant.questionYesOrNo),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_silence")!,
          image: Constant.silence),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_pen_and_paper")!,
          image: Constant.penAndPaper),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_glasses")!,
          image: Constant.glasses),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_diaper")!,
          image: Constant.diaper),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_toys")!,
          image: Constant.toys),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_music")!,
          image: Constant.music),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_reading")!,
          image: Constant.reading),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_tv")!,
          image: Constant.tv),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_tablet")!,
          image: Constant.tablet),
      _button(AppStyle.blue2,
          AppLocalizations.of(context)!.translate("button_cellphone")!,
          image: Constant.cellphone),

      //background green
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_drink")!,
          image: Constant.drink),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_eat")!,
          image: Constant.eat),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_moisten_your_month")!,
          image: Constant.moistenYourMonth),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_pee")!,
          image: Constant.pee),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_poop")!,
          image: Constant.poop),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_walk")!,
          image: Constant.walk),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_wash_the_face")!,
          image: Constant.washTheFace),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_oral_hygiene")!,
          image: Constant.oralHygiene),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_shower")!,
          image: Constant.shower),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_reposition")!,
          image: Constant.reposition),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_sleep")!,
          image: Constant.sleep),
      _button(AppStyle.green,
          AppLocalizations.of(context)!.translate("button_wear")!,
          image: Constant.wear),

      //background blue
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_warm")!,
          image: Constant.warm),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_cold")!,
          image: Constant.cold),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_scary")!,
          image: Constant.scary),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_well")!,
          image: Constant.well),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_bad")!,
          image: Constant.bad),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_wet_clothes")!,
          image: Constant.wetClothes),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_oxygen")!,
          image: Constant.oxygen),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_medicine")!,
          image: Constant.medicine),
      _button(AppStyle.blue,
          AppLocalizations.of(context)!.translate("button_aspiration")!,
          image: Constant.aspiration),

      //background amber
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_call_doctor")!,
          image: Constant.callDoctor),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_call_nurse")!,
          image: Constant.callNurse),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_call_family")!,
          image: Constant.callFamily),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_help")!,
          image: Constant.help),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_hold_my_hand")!,
          image: Constant.holdMyHand),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_visit_family")!,
          image: Constant.visitFamily),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_how_much_time")!,
          image: Constant.howMuchTime),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_how_am_i")!,
          image: Constant.howAmI1),
      _button(AppStyle.amber,
          AppLocalizations.of(context)!.translate("button_and_then")!,
          image: Constant.andThen),
    ];

    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.translate('menu_screen_symbols')!),
        actions: [
          IconButton(
              icon:
                  Icon(TextToSpeech.onOff ? Icons.volume_up : Icons.volume_off),
              onPressed: _changeIconVolume)
        ],
        backgroundColor: AppStyle.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 9,
            child: GridView.count(
              crossAxisCount: ColumnSettings.columnNumber ?? 4,
              children: List.generate(
                _buttons!.length,
                (index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: _buttons![index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _changeIconVolume() {
    if (TextToSpeech.onOff)
      setState(() {
        TextToSpeech.onOff = false;
      });
    else
      setState(() {
        TextToSpeech.onOff = true;
      });
  }

  _showWords() {
    String _text = "";
    for (String word in _words) {
      _text += "$word";
    }
    return _text;
  }
}
