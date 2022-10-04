import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});
  static DatabaseReference ref = FirebaseDatabase.instance.ref();
// https://firebase.google.com/docs/database/flutter/read-and-write?authuser=0
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
              const Header(title: 'Wallet'),
              const SizedBox(height: 24),
              Button(
                text: 'Home',
                onClicked: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
}
