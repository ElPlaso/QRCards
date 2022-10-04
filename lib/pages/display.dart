import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/widgets/qr_image_gen.dart';

import '../main.dart';
import '../widgets/header.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  BusinessCard card = BusinessCard(id: "testUID", name: "test");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Header(title: "Display QR Code"),
            const SizedBox(height: 24),
            QRImageGen(
              card: card,
            ),
          ],
        ),
      ),
    );
  }
}
