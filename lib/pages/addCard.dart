import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

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
              const Header(title: 'Add Card'),
              const SizedBox(height: 24),
              Button(
                text: 'Save Card',
                onClicked: () => {},
              ),
              Button(
                text: 'Clear Field',
                onClicked: () => {},
              ),
            ],
          ),
        ),
      );
}
