import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/card_view.dart';
import '../widgets/header.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WidgetsToImage(
                controller: controller,
                child: CardView(
                  card: BusinessCard(
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
              ),
              Button(
                text: 'Save Image',
                onClicked: () async {
                  final bytes = await controller.capture();
                  setState(() {
                    this.bytes = bytes;
                  });
                  if (bytes != null) {
                    ImageGallerySaver.saveImage(bytes,
                        quality: 60, name: "file_name${DateTime.now()}");
                  }
                },
              ),
            ],
          ),
        ),
      );
}
