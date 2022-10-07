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
    if (!context.read<Cards>().isEmpty(false)) {
      context.read<Cards>().clear(false);
    }
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
                .then((value) async {
              BusinessCard card =
                  BusinessCard.fromJson(jsonDecode(value.get('card')));
              card.refreshcount = value.get("refreshcount") + 1;
              card.scancount = element.get("scancount");
              context.read<Cards>().add(card, false);

              await FirebaseFirestore.instance
                  .collection('Cards')
                  .doc(card.id)
                  .update({'scancount': FieldValue.increment(1)});
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
    if (!context.read<Cards>().isEmpty(true)) {
      context.read<Cards>().clear(true);
    }
    await FirebaseFirestore.instance
        .collection('Cards')
        .where('owner', isEqualTo: context.read<UserProvider>().userID)
        .get()
        .then((doc) async {
      //String uid = context.read<UserProvider>().userID;
      for (var element in doc.docs) {
        print(element.get('card')); // ? Delete cards that wern't downloaded?
        BusinessCard card =
            BusinessCard.fromJson(jsonDecode(element.get('card')));
        card.refreshcount = element.get("refreshcount") + 1;
        card.scancount = element.get("scancount");
        context.read<Cards>().add(card, true);
        await FirebaseFirestore.instance
            .collection('Cards')
            .doc(card.id)
            .update({'refreshcount': FieldValue.increment(1)});
      }
    });
  }
}
