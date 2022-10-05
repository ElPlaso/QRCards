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
  Widget build(BuildContext context) => Container(
      child: SizedBox(
          height: 400,
          child: ListWheelScrollView(
              itemExtent: 250,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) => {},
              children: cardList)));
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: CardView(
        card: BusinessCard(
          id: "testID1",
          name: "Bob",
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: CardView(
        card: BusinessCard(
          id: "testID2",
          name: "John",
        ),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: CardView(
        card: BusinessCard(
          id: "testID3",
          name: "Alice",
        ),
      ),
    );
  }
}
