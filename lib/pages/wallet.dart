import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';
import '../widgets/card_view.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import '../data/business_card.dart';
import '../widgets/wallet_wheel.dart';

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
            children: const [WalletWheel()],
          ),
        ),
      );
}
