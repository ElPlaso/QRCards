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
  MobileScannerController controller = MobileScannerController();

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
                controller: controller,
                allowDuplicates: false,
                onDetect: (barcode, args) async {
                  if (barcode.rawValue != null) {
                    var data = barcode.rawValue!;
                    var cardMap = jsonDecode(data);
                    // ! incr scancount
                    await FirebaseFirestore.instance
                        .collection('Cards')
                        .doc(cardMap['id'])
                        .update({'scancount': FieldValue.increment(1)});
                    // ! append new card to current users' scanned cards
                    await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(context.read<UserProvider>().getUserID)
                        .set({
                      'wallet': FieldValue.arrayUnion([cardMap['id']])
                    });

                    context
                        .read<Cards>()
                        .add(BusinessCard.fromJson(cardMap), false);
                    controller.stop();
                    Navigator.pop(context);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
