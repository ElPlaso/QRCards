import 'package:flutter/material.dart';
import '../widgets/wallet_wheel.dart';

// * Page to display whallet wheel of user's collected cards

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Wallet'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[WalletWheel()],
          ),
        ),
      );
}
