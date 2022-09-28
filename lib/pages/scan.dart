import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

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
              const Header(title: 'Scan'),
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
