import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/providers/card_provider.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScanState();
  }
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: MobileScanner(
                allowDuplicates: false,
                onDetect: (barcode, args) async {
                  if (barcode.rawValue != null) {
                    var data = barcode.rawValue!;
                    var cardMap = jsonDecode(data);
                    // ! incr scancount
                    await FirebaseFirestore.instance
                        .collection('cards')
                        .doc(cardMap['card_id'])
                        .update({'scancount': FieldValue.increment(1)});
                    // ! append new card to current users' scanned cards
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(context.read<UserProvider>().getUserID)
                        .set({
                      'wallet': FieldValue.arrayUnion(cardMap['card_id'])
                    });

                    context.read<Cards>().add(BusinessCard.fromJson(cardMap),
                        false, context.read<UserProvider>().getUserID);
                    Navigator.pop(context);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
