import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobboards/app/app.dart';
import 'package:mobboards/component/my_elevated_button.dart';
import 'package:mobboards/constant.dart';
import 'package:mobboards/translate/translate.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   Widget columnLogo() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 30),
//           child: Container(
//             height: 150,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(Constant.logoApp),
//               ),
//             ),
//           ),
//         ),
//         Text(
//           AppLocalizations.of(context)!.translate("app_title")!,
//           style: TextStyle(
//             fontSize: 32,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Padding columnButtons(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           buildTextButton(AppLocalizations.of(context)!.translate("symbols")!, 0),
//           SizedBox(
//             height: 20,
//           ),
//           buildTextButton(AppLocalizations.of(context)!.translate("spell")!, 1),
//         ],
//       ),
//     );
//   }
//
//   Widget columnEffectPhrase() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//           child: Text(
//             AppLocalizations.of(context)!.translate("home_page_description")!,
//             textAlign: TextAlign.justify,
//             style: TextStyle(fontSize: 16),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTextButton(String buttonName, int cod) {
//     return TextButton(
//       style: ButtonStyle(
//           backgroundColor:
//               MaterialStateProperty.all(CustomColors.primaryMobfeel),
//           padding:
//               MaterialStateProperty.all(EdgeInsets.only(top: 15, bottom: 15))),
//       onPressed: () {
//         cod == 0
//             ? Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SYMBOLS)
//             : Navigator.popAndPushNamed(context, AppRoutes.APP_ROUTE_SPELL);
//       },
//       child: Text(
//         buttonName,
//         style: TextStyle(
//             fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.translate('app_title')!),
//         backgroundColor: CustomColors.primaryMobfeel,
//       ),
//       drawer: DrawerComponent(),
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               columnLogo(),
//               SizedBox(
//                 height: 40,
//               ),
//               columnEffectPhrase(),
//               SizedBox(
//                 height: 50,
//               ),
//               columnButtons(context),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.appName, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constant.logoApp),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Text(AppLocalizations.of(context)!.translate("app_title")!, style: TextStyle(fontSize: 32)),
          const SizedBox(height: 50.0),
          Text(AppLocalizations.of(context)!.translate("home_page_description")!, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyElevatedButton(title: AppLocalizations.of(context)!.translate("symbols")!, onPressed: () { Get.toNamed(AppRoutes.APP_ROUTE_SYMBOLS); }),
                SizedBox(height: 20),
                MyElevatedButton(title: AppLocalizations.of(context)!.translate("spell")!, onPressed: () { Get.toNamed(AppRoutes.APP_ROUTE_SPELL); }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

