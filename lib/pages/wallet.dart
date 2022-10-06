import 'dart:convert';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/providers/card_provider.dart';

import 'package:swen325_assignment_3/providers/user_provider.dart';
import 'package:swen325_assignment_3/widgets/logo_button.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import '../widgets/wallet_wheel.dart';
import 'card_page.dart';

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
            children: <Widget>[
              const WalletWheel(),
              LogoButton(
                  text: 'Select Card',
                  onClicked: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardPage(
                              card: BusinessCard(id: 's', name: 'name')))),
                  icon: Icon(Icons.east, size: 25)),
              LogoButton(
                  text: 'Refresh',
                  onClicked: () async {
                    print('downloading cards');
                    await FirebaseFirestore.instance
                        .collection('Cards')
                        .where('owner',
                            isEqualTo: context.read<UserProvider>().userID)
                        .get()
                        .then((doc) {
                      //   print(doc.docs.length);
                      doc.docs.forEach((element) {
                        print(element.get('card'));
                        // ? Delete cards that wern't downloaded?
                        context.read<Cards>().add(
                            BusinessCard.fromJson(
                                jsonDecode(element.get('card'))),
                            false,
                            context.read<UserProvider>().userID);
                      });
                    });
                    print('dowloaded');
                  },
                  icon: Icon(Icons.refresh, size: 25)),
            ],
          ),
        ),
      );
}
