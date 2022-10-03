import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/card_view.dart';
import '../widgets/header.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

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
              CardView(
                  card: BusinessCard(
                      name: "TestName",
                      company: "TestCompany",
                      position: "TestPosition",
                      companyaddress: {
                        'city': 'TestCity',
                        'country': 'TestCountry',
                        'streetname': 'TestStreet',
                        'streetnumber': '42'
                      },
                      companyphone: '123 456 7890',
                      email: 'test@testing.com',
                      website: 'www.testtesting.net',
                      cellphone: '098 765 4321')),
              Button(
                text: 'Home',
                onClicked: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
}
