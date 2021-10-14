import 'package:flutter/material.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/controller/initializer_controllers.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/utilities/utilities.dart';
import '../../app/app_routes.dart';
import '../views.dart';

class SpellPage extends StatefulWidget {
  @override
  _SpellPageState createState() => _SpellPageState();
}

class _SpellPageState extends State<SpellPage> {
  List<Widget>? _buttons;
  List<String> _words = [];
  TextEditingController? _textSpell;
  TextToSpeech textToSpeech = TextToSpeech();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  onClickSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 1),
      content: Text(AppLocalizations.of(context)!.translate("snackbar_empty_field")!),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _button(String message, {Color? color}) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
        primary: AppStyle.primaryMobfeel,
        shadowColor: Colors.grey,
        elevation: 3,
      ),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            color: color == null ? Colors.white : color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          _words.add('$message');
          _textSpell = TextEditingController(text: _showWords());
        });
      },
    );
  }

  Widget _auxiliaryButton(String message, {Color? color, String? image}) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppStyle.primaryMobfeel,
        shadowColor: Colors.blueAccent,
        padding: EdgeInsets.all(0),
        elevation: 3,
      ),
      child: Card(
        color: color,
        child: Container(
          // decoration: message == AppLocalizations.of(context).translate('button_pain')
          //     ? BoxDecoration(
          //         border: Border.all(width: 3, color: Colors.red),
          //         borderRadius: BorderRadius.circular(5))
          //     : null,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 3.5,
                child: Container(
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.4,
                child: Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(8.0),
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

        if(message == AppLocalizations.of(context)!.translate("button_pain")) {
          Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_PAIN);

        } else if(message == AppLocalizations.of(context)!.translate("button_symbols")) {
          Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SYMBOLS);

        } else if(message == AppLocalizations.of(context)!.translate("button_space")) {
          _words.add(' ');
          _textSpell = TextEditingController(text: _showWords());

        } else if(message == AppLocalizations.of(context)!.translate("button_delete")) {
          setState(() {
            if (_words.isEmpty)
              return onClickSnackbar(context);
            else
              _words.removeAt(_words.length - 1);
            _textSpell = TextEditingController(text: _showWords());
          });

        } else {
          setState(() {
            _words.add('$message');
            _textSpell = TextEditingController(text: _showWords());
          });
        }
      },
      onLongPress: () {

        if(message == AppLocalizations.of(context)!.translate("button_delete")) {
          setState(() {
            if (_words.isEmpty)
              return onClickSnackbar(context);
            else
              _words.clear();
            _textSpell = TextEditingController(text: _showWords());
          });
        }
      },
    );
  }

  _showWords() {
    String _text = "";
    for (String word in _words) {
      _text += "$word";
    }
    return _text;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _buttons = [
      _auxiliaryButton(AppLocalizations.of(context)!.translate("button_pain")!,
          image: Constant.pain, color: Colors.redAccent),
      _auxiliaryButton(AppLocalizations.of(context)!.translate("button_symbols")!,
          image: Constant.cards),
      _auxiliaryButton(
          AppLocalizations.of(context)!.translate("button_space")!,
          image: Constant.space),
      _auxiliaryButton(AppLocalizations.of(context)!.translate("button_delete")!,
          image: Constant.backspace),
      _auxiliaryButton(AppLocalizations.of(context)!.translate("button_yes")!,
          image: Constant.yes),
      _auxiliaryButton(AppLocalizations.of(context)!.translate("button_no")!,
          image: Constant.no),
      _button('A'),
      _button('B'),
      _button('C'),
      _button('D'),
      _button('E'),
      _button('F'),
      _button('G'),
      _button('H'),
      _button('I'),
      _button('J'),
      _button('K'),
      _button('L'),
      _button('M'),
      _button('N'),
      _button('O'),
      _button('P'),
      _button('Q'),
      _button('R'),
      _button('S'),
      _button('T'),
      _button('U'),
      _button('V'),
      _button('W'),
      _button('X'),
      _button('Y'),
      _button('Z'),
      _button('1', color: Colors.yellow),
      _button('2', color: Colors.yellow),
      _button('3', color: Colors.yellow),
      _button('4', color: Colors.yellow),
      _button('5', color: Colors.yellow),
      _button('6', color: Colors.yellow),
      _button('7', color: Colors.yellow),
      _button('8', color: Colors.yellow),
      _button('9', color: Colors.yellow),
      _button('0', color: Colors.yellow),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('menu_screen_spell')!,
        ),
        backgroundColor: AppStyle.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textSpell,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    textToSpeech.speechMessage = _showWords();
                    textToSpeech.speak();
                  })
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 9,
            child: GridView.count(
              crossAxisCount: symbolController.columnNumber.value,
              children: List.generate(
                _buttons!.length,
                (index) {
                  return Center(
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
}
