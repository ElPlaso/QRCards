import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/widgets/qr_image_gen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CardView extends StatelessWidget {
  final BusinessCard card;

  const CardView({
    required this.card,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1.69, //standard aspect ratio for a business card
        child: Container(
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(255, 29, 29, 29),
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        //   child:
                        AutoSizeText(
                          card.name,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                          minFontSize: 17,
                        ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        //   child:
                        AutoSizeText(
                          card.position,
                          style: const TextStyle(
                            color: Color.fromARGB(203, 203, 203, 255),
                            fontStyle: FontStyle.italic,
                          ),
                          minFontSize: 9,
                        ),
                        // ),
                      ],
                    ),
                    const Spacer(),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: QRImageGen(
                          card: card,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        // child:
                        AutoSizeText(
                          'E-mail: ${card.email}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontSize: 12),
                          minFontSize: 5,
                        ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        //   child:
                        AutoSizeText(
                          'Cellphone: ${card.cellphone}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontSize: 12),
                          minFontSize: 5,
                        ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        //   child:
                        AutoSizeText(
                          'Website: ${card.website}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontSize: 12),
                          minFontSize: 5,
                        ),
                        // ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        //   child:
                        AutoSizeText(
                          card.company,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color.fromARGB(203, 203, 203, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          minFontSize: 11,
                        ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        //   child:
                        AutoSizeText(
                          'Address: ${card.companyaddress}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color.fromARGB(203, 203, 203, 255),
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                          minFontSize: 5,
                        ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                        //   child:
                        AutoSizeText(
                          'Phone: ${card.companyphone}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                          minFontSize: 5,
                        ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
