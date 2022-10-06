import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/pages/home.dart';
import 'package:swen325_assignment_3/providers/cardCreator_provider.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/card_view.dart';
import '../widgets/logo_button.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/card_form.dart';

class EditCard extends StatelessWidget {
  final BusinessCard card;

  const EditCard({super.key, required this.card});
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
                  CardForm(card: card),
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
                    onClicked: () {},
                    icon: const Icon(Icons.download, size: 40),
                  ),
                  Button(
                      text: 'Remove Card',
                      onClicked: () => {
                            // delete card from db
                            FirebaseFirestore.instance
                                .collection('Cards')
                                .doc(card.id)
                                .delete(),
                            // delete card from owners' personal collection
                            FirebaseFirestore.instance
                                .collection('Users')
                                .doc(context.read<UserProvider>().getUserID)
                                .update({
                              'personalcard': FieldValue.arrayRemove([card.id])
                            }),
                            // delete every other reference to the card

                            FirebaseFirestore.instance.doc('User').update({
                              'personalcard': FieldValue.arrayRemove([card.id])
                            })
                          }),
                ],
              ),
            ),
          ),
        ),
      );

  void setState(Null Function() param0) {}
}
