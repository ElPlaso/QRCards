import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/widgets/logo_button.dart';
import '../main.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import '../widgets/wallet_wheel.dart';
import 'cardPage.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

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
              const WalletWheel(),
              LogoButton(
                  text: 'Select Card',
                  onClicked: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardPage(
                              card: BusinessCard(
                                  id: "testID",
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
                                  cellphone: '098 765 4321')))),
                  icon: const Icon(Icons.east, size: 25))
            ],
          ),
        ),
      );
}
