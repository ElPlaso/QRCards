import 'package:flutter/material.dart';
import '../pages/cardPage.dart';
import 'card_view.dart';
import '../data/business_card.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  CardStackState createState() {
    return CardStackState();
  }
}

class CardStackState extends State<CardStack> {
  List<Widget> cardList = [
    const Item1(),
    const Item1(),
    const Item2(),
  ];

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: 400, width: 300, child: ListView(children: cardList));
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        heightFactor: 0.5,
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () => {print("hello2")},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  spreadRadius: 6,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: CardView(
                card: BusinessCard(
                  id: "testID1",
                  name: "Bob1",
                ),
              ),
            ),
          ),
        ),
      );
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        heightFactor: 0.5,
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () => {print("hello")},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  spreadRadius: 6,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: CardView(
                card: BusinessCard(
                  id: "testID1",
                  name: "Bob2",
                ),
              ),
            ),
          ),
        ),
      );
}
