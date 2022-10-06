import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/editCard.dart';
import '../providers/card_provider.dart';
import 'card_view.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  CardStackState createState() {
    return CardStackState();
  }
}

class CardStackState extends State<CardStack> {
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
      width: 300,
      child: ListView(
        children: context.watch<Cards>().personalcards.map(
          (card) {
            return Builder(
              builder: (BuildContext context) {
                return Align(
                  heightFactor: 0.5,
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditCard(card: card)),
                    ),
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
                        borderRadius: BorderRadius.circular(15.0),
                        child: CardView(card: card),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
      ));
}
