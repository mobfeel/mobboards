import 'package:flutter/material.dart';
import 'package:mobcards/utils/text_to_speech.dart';
import 'package:mobcards/component/drawer.dart';
import 'package:mobcards/views/custom_colors.dart';
import '../../app/app_routes.dart';
import '../views.dart';

class IlustrationPage extends StatefulWidget {
  final String title;
  IlustrationPage(this.title);

  @override
  _IlustrationPageState createState() => _IlustrationPageState();
}

class _IlustrationPageState extends State<IlustrationPage> {
  List<Widget> _buttons;
  List<String> _words = [];
  TextEditingController _text;
  TextToSpeech textToSpeech = TextToSpeech();

  Widget _button(Color color, String message, {String image}) {
    return AspectRatio(
      aspectRatio: 1,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: CustomColors.primaryMobfeel,
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
            /// adicionado borda ao card 'DOR' para chamar a ateção do paciente
            decoration: message == 'Dor' ? BoxDecoration(
                border: Border.all(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(5)
            ) : null,
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
                // SizedBox(
                //   height: 5,
                // ),
                AspectRatio(
                  aspectRatio: 1.4,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
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
          switch (message) {

            /// teste para navegar para a tela sobre
            case 'Soletrar':
              {
                Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
                break;
              }

            case 'Dor':
              {
                Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_PAIN);
                break;
              }

            /// teste para apagar o que já foi escrito
            case 'Apagar':
              {
                setState(
                  () {
                    _words.removeAt(_words.length - 1);
                    _text = TextEditingController(text: _showWords());
                  },
                );
                break;
              }

            /// inserindo a nova palavra na tela
            default:
              setState(
                () {
                  _words.add('$message,');
                  textToSpeech.speechMessage = message;
                  textToSpeech.speak();

                  _text = TextEditingController(text: _showWords());
                },
              );
          }
        },
        onLongPress: () {
          switch (message) {

            /// teste para apagar o que já foi escrito
            case 'Apagar':
              {
                setState(() => _words.clear());
                _text = TextEditingController(text: _showWords());
                break;
              }
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    textToSpeech.stop();
    _buttons = [
      //background blue2
      _button(CustomColors.blue2, 'Ligar luz', image: Constant.turnOnTheLight),
      _button(CustomColors.blue2, 'Ligar ou desligar', image: Constant.turnOnTurnOff),
      _button(CustomColors.blue2, 'Silêncio', image: Constant.silence),
      _button(CustomColors.blue2, 'Caneca e Papel', image: Constant.penAndPaper),
      _button(CustomColors.blue2, 'Óculos', image: Constant.glasses),
      _button(CustomColors.blue2, 'Fralda', image: Constant.diaper),
      _button(CustomColors.blue2, 'Brinquedos', image: Constant.toys),
      _button(CustomColors.blue2, 'Música', image: Constant.music),
      _button(CustomColors.blue2, 'Leitura', image: Constant.reading),
      _button(CustomColors.blue2, 'TV', image: Constant.tv),
      _button(CustomColors.blue2, 'Tablet', image: Constant.tablet),
      _button(CustomColors.blue2, 'Celular', image: Constant.cellphone),

      //background green
      _button(CustomColors.green, 'Beber', image: Constant.drink),
      _button(CustomColors.green, 'Comer', image: Constant.eat),
      _button(CustomColors.green, 'Umedecer Boca', image: Constant.moistenYourMonth),
      _button(CustomColors.green, 'Fazer xixi', image: Constant.pee),
      _button(CustomColors.green, 'Fazer cocô', image: Constant.poop),
      _button(CustomColors.green, 'Ir andar', image: Constant.walk),
      _button(CustomColors.green, 'Lavar rosto', image: Constant.washTheFace),
      _button(CustomColors.green, 'Higiene oral', image: Constant.oralHygiene),
      _button(CustomColors.green, 'Banho', image: Constant.shower),
      _button(CustomColors.green, 'Reposicionar', image: Constant.reposition),
      _button(CustomColors.green, 'Dormir', image: Constant.sleep),
      _button(CustomColors.green, 'Vestir', image: Constant.dress),

      //background blue
      _button(CustomColors.blue, 'Calor', image: Constant.warm),
      _button(CustomColors.blue, 'Frio', image: Constant.cold),
      _button(CustomColors.blue, 'Medo', image: Constant.scary),
      _button(CustomColors.blue, 'Bem', image: Constant.well),
      _button(CustomColors.blue, 'Mal', image: Constant.bad),
      _button(CustomColors.blue, 'Roupa molhada', image: Constant.wetClothes),
      _button(CustomColors.blue, 'Roupa molhada', image: Constant.wetClothes),
      _button(CustomColors.blue, 'Oxigênio', image: Constant.oxygen),
      _button(CustomColors.blue, 'Remédios', image: Constant.medicine),
      _button(CustomColors.blue, 'Aspiração', image: Constant.aspiration),

      //background amber
      _button(CustomColors.amber, 'Chamar médico', image: Constant.callDoctor),
      _button(CustomColors.amber, 'Chamar enfermeira', image: Constant.callNurse),
      _button(CustomColors.amber, 'Chamar família', image: Constant.callFamily),
      _button(CustomColors.amber, 'Ajuda', image: Constant.help),
      _button(CustomColors.amber, 'Segura minha mão', image: Constant.holdMyHand),
      _button(CustomColors.amber, 'Visita família', image: Constant.visitFamily),
      _button(CustomColors.amber, 'Quanto tempo?', image: Constant.howMuchTime),
      _button(CustomColors.amber, 'Como estou?', image: Constant.howAmI1),
      _button(CustomColors.amber, 'E agora?', image: Constant.andThen),

      //background blue2
      _button(CustomColors.blue2, 'Mais', image: Constant.more),
      _button(CustomColors.blue2, 'Outra coisa', image: Constant.anotherThing),
      _button(CustomColors.blue2, 'Não sei', image: Constant.iDontKnow),
      _button(CustomColors.blue2, 'Obrigado', image: Constant.thankYou),
      _button(CustomColors.blue2, 'Pergunta sim ou não', image: Constant.questionYesOrNo),
      _button(CustomColors.blue2, 'Soletrar', image: Constant.alphabet),
      _button(CustomColors.blue2, 'Apagar', image: Constant.backspace),
    ];
  }

  void dispose() {
    super.dispose();
    textToSpeech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),

          ///inseridos um TextField para pegar os valores dos cards
          ///e proporcionar mais uma maneira de alterar os valores digitados
          ///através do teclado do TextFields
          TextField(
            controller: _text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 5,
          ),

          ///alterada a maneira que passamos os valores dos cards(Linha 182)
          // Expanded(
          //     flex: 1,
          //     child: Center(
          //       child: Text(_showWords()),
          //     )),
          Expanded(
            flex: 9,
            child: GridView.count(
              crossAxisCount: 6,
              children: List.generate(
                _buttons.length,
                (index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: _buttons[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showWords() {
    String _text = "";
    for (String word in _words) {
      _text += "$word";
    }
    return _text;
  }
}
