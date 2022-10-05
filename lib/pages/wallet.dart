import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

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
            children: const <Widget>[
              Header(title: 'Wallet'),
              SizedBox(height: 24),
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


