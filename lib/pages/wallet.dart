import 'package:flutter/material.dart';
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
