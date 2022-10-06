import 'dart:convert';
import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/pages/home.dart';
import 'package:swen325_assignment_3/providers/cardCreator_provider.dart';
import 'package:swen325_assignment_3/providers/card_provider.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/card_view.dart';
import '../widgets/logo_button.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/card_form.dart';

class EditCard extends StatelessWidget {
  const EditCard({super.key});
  static const String CARDID = '';
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
                  Button(text: 'Clear All', onClicked: () => {}),
                  LogoButton(
                    text: 'Preview',
                    onClicked: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => CardView(
                              card: BusinessCard(
                                  id: "preview", name: "Preview")));
                    },
                    icon: const Icon(Icons.remove_red_eye, size: 40),
                  ),
                  LogoButton(
                    text: 'Save Changes',
                    onClicked: () {
                      FirebaseFirestore.instance
                          .collection('Cards')
                          .doc(CARDID)
                          .update({
                        'card': jsonEncode(BusinessCard(
                          id: CARDID,
                          name: context.read<CardCreator>().name,
                          position: context.read<CardCreator>().postion,
                          email: context.read<CardCreator>().email,
                          cellphone: context.read<CardCreator>().cellphone,
                          website: context.read<CardCreator>().website,
                          company: context.read<CardCreator>().company,
                          companyaddress:
                              context.read<CardCreator>().companyAddress,
                          companyphone:
                              context.read<CardCreator>().companyPhone,
                        ))
                      });
                    },
                    icon: const Icon(Icons.download, size: 40),
                  ),
                  Button(
                      text: 'Remove Card',
                      onClicked: () => {
                            // delete card from db
                            FirebaseFirestore.instance
                                .collection('Cards')
                                .doc(CARDID)
                                .delete(),
                            // delete card from owners' personal collection
                            FirebaseFirestore.instance
                                .collection('Users')
                                .doc(context.read<UserProvider>().getUserID)
                                .update({
                              'personalcard': FieldValue.arrayRemove(CARDID)
                            }),
                            // delete every other reference to the card
                            // FirebaseFirestore.instance.collection('Users').get().then((value) {
                            //     value.forEach();
                            // })
                            FirebaseFirestore.instance.doc('User')
                                // .collection('Users')
                                // .where('wallet', arrayContains: CARDID).get().then((value) {})
                                .update({
                              'personalcard': FieldValue.arrayRemove(CARDID)
                            })
                            // .where('personalcards', arrayContains: CARDID)
                            // .delete(),
                          }),
                  // delete card from every wallet
                ],
              ),
            ),
          ),
        ),
      );

  void setState(Null Function() param0) {}
}
