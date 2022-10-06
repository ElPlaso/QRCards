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
      child: ListWheelScrollView(
        itemExtent: 200,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) => {},
        children: context.watch<Cards>().collectedcards.map(
          (card) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CardView(
                    card: card,
                  ),
                );
              },
            );
          },
        ).toList(),
      ));
}
