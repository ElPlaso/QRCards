import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/widgets/floater.dart';
import '../providers/query_provider.dart';
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
            children: <Widget>[
              const WalletWheel(),
              Floater(
                text: 'Refresh Wallet',
                onClicked: () async =>
                    {await context.read<QueryProvider>().updateWallet(context)},
                icon: const Icon(Icons.refresh, size: 25),
              ),
            ],
          ),
        ),
      );
}
