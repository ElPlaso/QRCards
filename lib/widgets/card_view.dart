import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/widgets/qr_image_gen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CardView extends StatelessWidget {
  final BusinessCard card;
  final BoxFit fit;

  const CardView({Key? key, required this.card, this.fit = BoxFit.contain})
      : super(key: key);

  @override
  // fitted box to ensure consistent sizing
  Widget build(BuildContext context) => FittedBox(
        fit: fit,
        child: Container(
          // container with set width/height to enforce aspect ratio
          width: 540,
          height: 320,
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(255, 29, 29, 29),
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),

          //Row of columns separated by spacer
          child: Row(
            children: [
              // First column name/position and QR code
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subcolumn for name/position text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          card.name,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 27),
                          minFontSize: 17,
                        ),
                        AutoSizeText(
                          card.position,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontStyle: FontStyle.italic,
                              fontSize: 17),
                          minFontSize: 9,
                        ),
                      ],
                    ),

                    const Spacer(),

                    // QR code wrapped in 1:1 aspect ratio
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: QRImageGen(
                            card: card,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Spacer between main columns.
              const Spacer(),

              // Second column personal info and company info
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Subcolumn for personal info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AutoSizeText(
                          'E-mail: ${card.email}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontSize: 15),
                          minFontSize: 5,
                        ),
                        AutoSizeText(
                          'Cellphone: ${card.cellphone}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontSize: 15),
                          minFontSize: 5,
                        ),
                        AutoSizeText(
                          'Website: ${card.website}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontSize: 15),
                          minFontSize: 5,
                        ),
                      ],
                    ),

                    const Spacer(),

                    //Subcolumn for company info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AutoSizeText(
                          card.company,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color.fromARGB(203, 203, 203, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                          minFontSize: 11,
                        ),
                        AutoSizeText(
                          'Address: ${card.companyaddress}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color.fromARGB(203, 203, 203, 255),
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                          ),
                          minFontSize: 5,
                        ),
                        AutoSizeText(
                          'Phone: ${card.companyphone}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontStyle: FontStyle.italic,
                              fontSize: 15),
                          minFontSize: 5,
                        ),
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
