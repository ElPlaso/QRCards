import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/card_form.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            height: 1000,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 24),
                  const CardForm(),
                  const ThemeToggle(),
                  Button(
                    text: 'Clear All',
                    onClicked: () => {},
                  ),
                  Button(
                    text: 'Save Card',
                    onClicked: () => {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void setState(Null Function() param0) {}
}
