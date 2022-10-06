import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/providers/card_provider.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';

import '../data/business_card.dart';

class QueryProvider with ChangeNotifier {
  ///
  /// * Populates the context  _collectedcards
  ///
  Future<void> updateWallet(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(context.read<UserProvider>().getUserID)
        .get()
        .then((DocumentSnapshot value) {
      value.get('wallet').forEach((element) async => {
            await FirebaseFirestore.instance
                .collection('Cards')
                .doc(element)
                .get()
                .then((value) {
              context.read<Cards>().add(
                  BusinessCard.fromJson(jsonDecode(value.get('card'))), false);
            })
          });
    });
  }

  ///
  /// * Populates the context  _personalcards
  /// *
  ///
  Future<void> updatePersonalcards(BuildContext context) async {
    // print('downloading cards');
    await FirebaseFirestore.instance
        .collection('Cards')
        .where('owner', isEqualTo: context.read<UserProvider>().userID)
        .get()
        .then((doc) {
      String uid = context.read<UserProvider>().userID;
      context.read<Cards>().clear(true, uid);
      doc.docs.forEach((element) {
        print(element.get('card')); // ? Delete cards that wern't downloaded?
        context
            .read<Cards>()
            .add(BusinessCard.fromJson(jsonDecode(element.get('card'))), true);
      });
    });
  }
}
