import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/providers/cardCreator_provider.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';
import 'package:swen325_assignment_3/widgets/google_sign_in.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/card_form.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});
  static const CardForm cf = CardForm();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            height: 1000,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 24),
                  cf,
                  const ThemeToggle(),
                  Button(
                    text: 'Clear All',
                    onClicked: () => {},
                  ),
                  Button(
                    text: 'Save Card',
                    onClicked: () async {
                      WidgetsFlutterBinding.ensureInitialized();
                      print('save card ${context.read<UserProvider>().userID}');
                      // ! get UID
                      // ! get card-id number
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(context.read<UserProvider>().userID)
                          .get()
                          .then((document) => {
                                if (!document.exists)
                                  {
                                    FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(
                                            context.read<UserProvider>().userID)
                                        .set({"card-id": 0})
                                  }
                                else
                                  {
                                    FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(
                                            context.read<UserProvider>().userID)
                                        .update({
                                      'card-id': FieldValue.increment(1)
                                    })
                                  }
                              });
                      String a = '';

// ! get the current id of the users' card

                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(context.read<UserProvider>().userID)
                          .get()
                          .then((doc) {
                        int val = doc.get('card-id');
                        print(val);
                        print('       testtt');

                        a = context.read<UserProvider>().userID +
                            "-" +
                            val.toString();
                      });
                      var bCard = BusinessCard(
                        name: context.read<CardCreator>().name,
                        position: context.read<CardCreator>().postion,
                        email: context.read<CardCreator>().email,
                        cellphone: context.read<CardCreator>().cellphone,
                        website: context.read<CardCreator>().website,
                        company: context.read<CardCreator>().company,
                        companyaddress:
                            context.read<CardCreator>().companyAddress,
                        companyphone: context.read<CardCreator>().companyPhone,
                      );
                      print("ID ------ ${a}");
                      print(jsonEncode(bCard));
                      // past the bussiness card to the DB
                      await FirebaseFirestore.instance
                          .collection('Cards')
                          .doc(a)
                          .set({'card-sheesh': 'yess'});
                      await FirebaseFirestore.instance
                          .collection('Cards')
                          .doc(a)
                          .set({'card': jsonEncode(bCard)}).onError((error,
                                  stackTrace) =>
                              print("${error} + ${stackTrace} =========== "));
                      // Update the user profile with the ownership of the new card
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(context.read<UserProvider>().userID)
                          .set({'card': jsonEncode(bCard)}).onError((error,
                                  stackTrace) =>
                              print("${error} + ${stackTrace} ==========="));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void setState(Null Function() param0) {}
}
