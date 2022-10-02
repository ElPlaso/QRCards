import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';

class CardView extends StatelessWidget {
  final BusinessCard card;

  const CardView({
    required this.card,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1.69, //standard aspect ratio for a business card
        child: Container(/*todo, display business card*/),
      );
}
