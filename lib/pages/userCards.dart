import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/pages/display.dart';
import 'addCard.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

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
              const Header(title: 'Your Cards'),
              const SizedBox(height: 24),
              Button(
                text: 'Add Card',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddCard()),
                ),
              ),
              Button(
                text: 'Display QR Code',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Display()),
                ),
              ),
              Button(
                text: 'Home',
                onClicked: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
}
