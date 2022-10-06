import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
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
  final BusinessCard card;

  const EditCard({super.key, required this.card});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Edit Card'),
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
                          builder: (context) => CardView(card: card));
                    },
                    icon: const Icon(Icons.remove_red_eye, size: 40),
                  ),
                  LogoButton(
                    text: 'Save Changes',
                    onClicked: () async {
                      // set the provider feilds to be consistent with the card displayed on screen
                      context.read<CardCreator>().setCellphone(card.cellphone);
                      context.read<CardCreator>().setPostion(card.position);
                      context.read<CardCreator>().setEmail(card.email);
                      context.read<CardCreator>().setCellphone(card.cellphone);
                      context.read<CardCreator>().setWebsite(card.website);
                      context.read<CardCreator>().setCompany(card.company);

                      context
                          .read<CardCreator>()
                          .setCompanyAddress(card.companyaddress);
                      context
                          .read<CardCreator>()
                          .setCompanyPhone(card.companyphone);

                      WidgetsFlutterBinding.ensureInitialized();
                      // ! get UID
                      // ! get the current id of the users' card
                      String cardId = card.id;
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(context.read<UserProvider>().userID)
                          .get()
                          .then((doc) {
                        cardId = cardId;
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
                      await FirebaseFirestore.instance
                          .collection('Cards')
                          .doc(cardId)
                          .update({
                        'card_id': cardId,
                        'card': jsonEncode(bCard),
                        'owner': context.read<UserProvider>().userID,
                      }).onError((error, stackTrace) =>
                              print("${error} + ${stackTrace} =========== "));
                      // ! is this how we can exit the create page flutterly?

                      Fluttertoast.showToast(
                          msg: "Card updated!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.download, size: 40),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  void setState(Null Function() param0) {}
}
