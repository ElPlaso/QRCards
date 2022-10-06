import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'card_view.dart';
import '../data/business_card.dart';
import '../providers/card_provider.dart';

class WalletWheel extends StatefulWidget {
  const WalletWheel({super.key});

  @override
  WalletWheelState createState() {
    return WalletWheelState();
  }
}

class WalletWheelState extends State<WalletWheel> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 400,
      child: ListWheelScrollView.useDelegate(
          itemExtent: 200,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) => {},
          childDelegate: ListWheelChildLoopingListDelegate(
            children: context.watch<Cards>().collectedcards.map(
              (card) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: CardView(
                        card: card,
                      ),
                    );
                  },
                );
              },
            ).toList(),
          )));
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
            companyaddress: 'asd',
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
