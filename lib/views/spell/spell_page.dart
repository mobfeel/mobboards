import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/controller/controller.dart';
import 'package:mobboards/controller/initializer_controllers.dart';
import 'package:mobboards/model/model.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/utilities/utilities.dart';
import '../../app/app_routes.dart';
import '../views.dart';

// class SpellPage extends StatefulWidget {
//   @override
//   _SpellPageState createState() => _SpellPageState();
// }
//
// class _SpellPageState extends State<SpellPage> {
//   List<Widget>? _buttons;
//   List<String> _words = [];
//   TextEditingController? _textSpell;
//   TextToSpeech textToSpeech = TextToSpeech();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   onClickSnackbar(BuildContext context) {
//     final snackBar = SnackBar(
//       duration: Duration(seconds: 1),
//       content: Text(AppLocalizations.of(context)!.translate("snackbar_empty_field")!),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   Widget _button(String message, {Color? color}) {
//     return TextButton(
//       style: TextButton.styleFrom(
//         padding: EdgeInsets.all(0),
//         primary: AppStyle.primaryMobfeel,
//         shadowColor: Colors.grey,
//         elevation: 3,
//       ),
//       child: Card(
//         child: Container(
//           decoration: BoxDecoration(
//             color: color == null ? Colors.white : color,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Center(
//                 child: Text(
//                   message,
//                   style: TextStyle(fontSize: 20, color: Colors.black),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//       onPressed: () {
//         setState(() {
//           _words.add('$message');
//           _textSpell = TextEditingController(text: _showWords());
//         });
//       },
//     );
//   }
//
//   Widget _auxiliaryButton(String message, {Color? color, String? image}) {
//     return TextButton(
//       style: TextButton.styleFrom(
//         primary: AppStyle.primaryMobfeel,
//         shadowColor: Colors.blueAccent,
//         padding: EdgeInsets.all(0),
//         elevation: 3,
//       ),
//       child: Card(
//         color: color,
//         child: Container(
//           // decoration: message == AppLocalizations.of(context).translate('button_pain')
//           //     ? BoxDecoration(
//           //         border: Border.all(width: 3, color: Colors.red),
//           //         borderRadius: BorderRadius.circular(5))
//           //     : null,
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 3.5,
//                 child: Container(
//                   child: Text(
//                     message,
//                     style: TextStyle(fontSize: 10),
//                   ),
//                 ),
//               ),
//               AspectRatio(
//                 aspectRatio: 1.4,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(image!),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       onPressed: () {
//
//         if(message == AppLocalizations.of(context)!.translate("button_pain")) {
//           Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_PAIN);
//
//         } else if(message == AppLocalizations.of(context)!.translate("button_symbols")) {
//           Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SYMBOLS);
//
//         } else if(message == AppLocalizations.of(context)!.translate("button_space")) {
//           _words.add(' ');
//           _textSpell = TextEditingController(text: _showWords());
//
//         } else if(message == AppLocalizations.of(context)!.translate("button_delete")) {
//           setState(() {
//             if (_words.isEmpty)
//               return onClickSnackbar(context);
//             else
//               _words.removeAt(_words.length - 1);
//             _textSpell = TextEditingController(text: _showWords());
//           });
//
//         } else {
//           setState(() {
//             _words.add('$message');
//             _textSpell = TextEditingController(text: _showWords());
//           });
//         }
//       },
//       onLongPress: () {
//
//         if(message == AppLocalizations.of(context)!.translate("button_delete")) {
//           setState(() {
//             if (_words.isEmpty)
//               return onClickSnackbar(context);
//             else
//               _words.clear();
//             _textSpell = TextEditingController(text: _showWords());
//           });
//         }
//       },
//     );
//   }
//
//   _showWords() {
//     String _text = "";
//     for (String word in _words) {
//       _text += "$word";
//     }
//     return _text;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _buttons = [
//       _auxiliaryButton(AppLocalizations.of(context)!.translate("button_pain")!,
//           image: Constant.pain, color: Colors.redAccent),
//       _auxiliaryButton(AppLocalizations.of(context)!.translate("button_symbols")!,
//           image: Constant.cards),
//       _auxiliaryButton(
//           AppLocalizations.of(context)!.translate("button_space")!,
//           image: Constant.space),
//       _auxiliaryButton(AppLocalizations.of(context)!.translate("button_delete")!,
//           image: Constant.backspace),
//       _auxiliaryButton(AppLocalizations.of(context)!.translate("button_yes")!,
//           image: Constant.yes),
//       _auxiliaryButton(AppLocalizations.of(context)!.translate("button_no")!,
//           image: Constant.no),
//       _button('A'),
//       _button('B'),
//       _button('C'),
//       _button('D'),
//       _button('E'),
//       _button('F'),
//       _button('G'),
//       _button('H'),
//       _button('I'),
//       _button('J'),
//       _button('K'),
//       _button('L'),
//       _button('M'),
//       _button('N'),
//       _button('O'),
//       _button('P'),
//       _button('Q'),
//       _button('R'),
//       _button('S'),
//       _button('T'),
//       _button('U'),
//       _button('V'),
//       _button('W'),
//       _button('X'),
//       _button('Y'),
//       _button('Z'),
//       _button('1', color: Colors.yellow),
//       _button('2', color: Colors.yellow),
//       _button('3', color: Colors.yellow),
//       _button('4', color: Colors.yellow),
//       _button('5', color: Colors.yellow),
//       _button('6', color: Colors.yellow),
//       _button('7', color: Colors.yellow),
//       _button('8', color: Colors.yellow),
//       _button('9', color: Colors.yellow),
//       _button('0', color: Colors.yellow),
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.translate('menu_screen_spell')!, style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: AppStyle.primaryMobfeel,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       drawer: DrawerComponent(),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Flexible(
//                 child: TextField(
//                   controller: _textSpell,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               IconButton(
//                   icon: Icon(Icons.play_arrow),
//                   onPressed: () {
//                     textToSpeech.speechMessage = _showWords();
//                     textToSpeech.speak();
//                   })
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Expanded(
//             flex: 9,
//             child: GridView.count(
//               crossAxisCount: symbolController.columnNumber.value,
//               children: List.generate(
//                 _buttons!.length,
//                 (index) {
//                   return Center(
//                     child: _buttons![index],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class SpellPage extends GetView<SymbolController> {

  List<Pictogram> listPictograms = [];

  _createList({required BuildContext context}) {
    listPictograms = [
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_pain")!,
        image: Constant.pain,
        backgroundColor: AppStyle.red,
        onTap: () {
          Get.toNamed(AppRoutes.APP_ROUTE_PAIN);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_pain")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_space")!,
        image: Constant.space,
        backgroundColor: Colors.white,
        onTap: () {
          controller.newWord(word: ' ');
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_delete")!,
        image: Constant.backspace,
        backgroundColor: Colors.white,
        onTap: () {
          if(controller.textController.value.text.isNotEmpty)
            controller.deleteWord();
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("menu_screen_symbols")!,
        image: Constant.cards,
        backgroundColor: AppStyle.amber,
        onTap: () {
          Get.toNamed(AppRoutes.APP_ROUTE_SYMBOLS);
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("menu_screen_symbols")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_yes")!,
        image: Constant.yes,
        backgroundColor: AppStyle.green,
        onTap: () {
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_yes")!);
        },
      ),
      Pictogram(
        title: AppLocalizations.of(context)!.translate("button_no")!,
        image: Constant.no,
        backgroundColor: AppStyle.red,
        onTap: () {
          if(controller.textToSpeechOnOff.value) controller.speak(message: AppLocalizations.of(context)!.translate("button_no")!);
        },
      ),
      Pictogram(
        title: 'A',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'A'); },
      ),
      Pictogram(
        title: 'B',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'B'); },
      ),
      Pictogram(
        title: 'C',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'C'); },
      ),
      Pictogram(
        title: 'Ç',
        backgroundColor: AppStyle.amber,
        onTap: () { controller.newWord(word: 'Ç'); },
      ),
      Pictogram(
        title: 'D',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'D'); },
      ),
      Pictogram(
        title: 'E',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'E'); },
      ),
      Pictogram(
        title: 'F',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'F'); },
      ),
      Pictogram(
        title: 'G',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'G'); },
      ),
      Pictogram(
        title: 'H',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'H'); },
      ),
      Pictogram(
        title: 'I',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'I'); },
      ),
      Pictogram(
        title: 'J',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'J'); },
      ),
      Pictogram(
        title: 'K',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'K'); },
      ),
      Pictogram(
        title: 'L',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'L'); },
      ),
      Pictogram(
        title: 'M',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'M'); },
      ),
      Pictogram(
        title: 'N',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'N'); },
      ),
      Pictogram(
        title: 'O',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'O'); },
      ),
      Pictogram(
        title: 'P',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'P'); },
      ),
      Pictogram(
        title: 'Q',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'Q'); },
      ),
      Pictogram(
        title: 'R',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'R'); },
      ),
      Pictogram(
        title: 'S',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'S'); },
      ),
      Pictogram(
        title: 'T',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'T'); },
      ),
      Pictogram(
        title: 'U',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'U'); },
      ),
      Pictogram(
        title: 'V',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'V'); },
      ),
      Pictogram(
        title: 'W',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'W'); },
      ),
      Pictogram(
        title: 'X',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'X'); },
      ),
      Pictogram(
        title: 'Y',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'Y'); },
      ),
      Pictogram(
        title: 'Z',
        backgroundColor: Colors.white,
        onTap: () { controller.newWord(word: 'Z'); },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    _createList(context: context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('menu_screen_spell')!, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppStyle.primaryMobfeel,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Obx(() => IconButton(
              icon: Icon(controller.textToSpeechOnOff.value ? Icons.volume_up : Icons.volume_off),
              onPressed: () {
                log('${controller.textToSpeechOnOff.value}');
                controller.changeSound();
              }
          ),
          )
        ],
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Obx(() => TextFormField(
              controller: controller.textController.value = TextEditingController(text: controller.showSpelledMessage()),
              maxLines: null,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: AppLocalizations.of(context)!.translate('hint_symbol_page'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.play_circle_rounded),
                  onPressed: () { controller.speak(message: controller.textController.value.text); }
                )
              ),
            ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: GridView.count(
                crossAxisCount: symbolController.columnNumber.value,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  listPictograms.length,
                      (index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: MyPictogramButton(
                          onTap: listPictograms[index].onTap,
                          title: listPictograms[index].title,
                          image: listPictograms[index].image ?? null,
                          size: MediaQuery.of(context).size.width / symbolController.columnNumber.value,
                          backgroundColor: listPictograms[index].backgroundColor
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}