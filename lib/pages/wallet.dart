import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';
import 'package:swen325_assignment_3/widgets/logo_button.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';
import '../widgets/card_view.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import '../data/business_card.dart';
import '../widgets/wallet_wheel.dart';
import '../widgets/card_stack.dart';
import 'cardPage.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const WalletWheel(),
              LogoButton(
                  text: 'Select Card',
                  onClicked: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CardPage())),
                  icon: Icon(Icons.east, size: 25))
            ],
          ),
        ),
      );
}
// // ! returns an array of cards the user owns
// String[] ret_arry;
// await FirebaseFirestore.instance
//                           .collection('Cards')
//                           .where('owner', isEqualTo: context.read<UserProvider>().userID).get().then((doc){
//                             ret = doc.get('card');
//                           });


