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
                                id: "preview",
                                name: context.read<CardCreator>().name,
                                position: context.read<CardCreator>().postion,
                                email: context.read<CardCreator>().email,
                                cellphone:
                                    context.read<CardCreator>().cellphone,
                                website: context.read<CardCreator>().website,
                                company: context.read<CardCreator>().company,
                                companyaddress:
                                    context.read<CardCreator>().companyAddress,
                                companyphone:
                                    context.read<CardCreator>().companyPhone,
                              )));
                    },
                    icon: const Icon(Icons.remove_red_eye, size: 40),
                  ),
                  LogoButton(
                    text: 'Upload',
                    onClicked: () async {
                      WidgetsFlutterBinding.ensureInitialized();
                      // ! get UID
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
                      // ! get the current id of the users' card
                      String cardId = '';
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(context.read<UserProvider>().userID)
                          .get()
                          .then((doc) {
                        int val = doc.get('card-id');
                        cardId = "${context.read<UserProvider>().userID}-$val";
                      });
                      var bCard = BusinessCard(
                        id: cardId,
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
                      print(jsonEncode(bCard));
                      // past the bussiness card to the DB
                      //   await FirebaseFirestore.instance
                      //       .collection('Cards')
                      //       .doc(cardId)
                      //       .set({'card-sheesh': 'yess'});
                      await FirebaseFirestore.instance
                          .collection('Cards')
                          .doc(cardId)
                          .set({
                        'card_id': cardId,
                        'card': jsonEncode(bCard),
                        'owner': context.read<UserProvider>().userID
                      }).onError((error, stackTrace) =>
                              print("${error} + ${stackTrace} =========== "));
                      // Update the user profile with the ownership of the new card
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(context.read<UserProvider>().userID)
                          .update({
                        'personalcards': FieldValue.arrayUnion([cardId])
                      }).onError((error, stackTrace) =>
                              print("$error + $stackTrace ==========="));
                      // ! is this how we can exit the create page flutterly?
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.upload, size: 40),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void setState(Null Function() param0) {}
}
