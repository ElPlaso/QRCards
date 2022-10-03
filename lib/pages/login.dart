import 'package:flutter/material.dart';
import '../main.dart';
import 'scan.dart';
import 'userCards.dart';
import 'wallet.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Header(title: 'Menu'),
              Button(
                text: 'Scan',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Scan()),
                ),
              ),
              Button(
                text: 'Personal',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserCards()),
                ),
              ),
              Button(
                text: 'Wallet',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Wallet()),
                ),
              ),
              Button(text: 'Contact Us', onClicked: () => {})
            ],
          ),
        ),
      );
}
