import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:swen325_assignment_3/data/business_card.dart';

class QRImageGen extends StatelessWidget {
  final BusinessCard card;

  const QRImageGen({
    required this.card,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImage(data: jsonEncode(card));
  }
}
