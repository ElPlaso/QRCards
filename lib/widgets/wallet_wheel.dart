import 'package:flutter/material.dart';
import 'card_view.dart';
import '../data/business_card.dart';

class WalletWheel extends StatefulWidget {
  const WalletWheel({super.key});

  @override
  WalletWheelState createState() {
    return WalletWheelState();
  }
}

class WalletWheelState extends State<WalletWheel> {
  List<Widget> cardList = [const Item1(), const Item2(), const Item3()];

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 500,
      child: ListWheelScrollView.useDelegate(
          itemExtent: 200,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) => {},
          childDelegate:
              ListWheelChildLoopingListDelegate(children: cardList)));
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: CardView(
        card: BusinessCard(
          id: "testID1",
          name: "Lei",
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: CardView(
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
            cellphone: '098 765 4321'),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: CardView(
        card: BusinessCard(
          id: "testID3",
          name: "Alice",
        ),
      ),
    );
  }
}
