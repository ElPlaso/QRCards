import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/widgets/floater.dart';
import '../main.dart';
import 'scan.dart';
import 'userCards.dart';
import 'wallet.dart';
import 'cardPage.dart';
import '../widgets/logo_button.dart';
import '../widgets/header.dart';
import '../widgets/floater.dart';

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
              LogoButton(
                text: 'Scan',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Scan()),
                ),
                icon: const Icon(Icons.qr_code_scanner, size: 40),
              ),
              LogoButton(
                text: 'Create',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserCards()),
                ),
                icon: Icon(Icons.library_add, size: 40),
              ),
              LogoButton(
                text: 'Wallet',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Wallet()),
                ),
                icon: const Icon(Icons.wallet, size: 40),
              ),
              LogoButton(
                  text: 'Contact Us',
                  onClicked: () => {},
                  icon: Icon(Icons.contact_support, size: 40)),
              LogoButton(
                text: 'Test',
                onClicked: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage())),
                icon: Icon(Icons.add, size: 25),
              ),
            ],
          ),
        ),
      );
}
