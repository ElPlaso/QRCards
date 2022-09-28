import 'package:flutter/material.dart';
import '../main.dart';
import 'scan.dart';
import 'userCards.dart';
import 'wallet.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
