import 'package:flutter/material.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/pages/card_page.dart';
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
  final _scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 400,
      child: ClickableListWheelScrollView(
          itemCount: context.read<Cards>().collectedcards.length,
          onItemTapCallback: (index) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardPage(
                      card: context.read<Cards>().collectedcards[index])),
            );
          },
          itemHeight: 200,
          scrollController: _scrollController,
          child: ListWheelScrollView(
            controller: _scrollController,
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
          )));
}
