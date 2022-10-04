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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            card.name,
                            style: const TextStyle(
                                color: Color.fromARGB(203, 203, 203, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            card.position,
                            style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    //TEMP!!!!! REPLACE WITH QRCODE!!!!!
                    Container(
                      height: 128,
                      width: 128,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: const Text(
                        'QR CODE',
                        style: TextStyle(
                          color: Color.fromARGB(203, 203, 203, 255),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            'E-mail: ${card.email}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Color.fromARGB(203, 203, 203, 255),
                                fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            'Cellphone: ${card.cellphone}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Color.fromARGB(203, 203, 203, 255),
                                fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            'Website: ${card.website}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Color.fromARGB(203, 203, 203, 255),
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            card.company,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            'Address: ${card.companyaddress['streetnumber']} ${card.companyaddress['streetname']}, ${card.companyaddress['city']}, ${card.companyaddress['country']}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Color.fromARGB(203, 203, 203, 255),
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                          child: Text(
                            'Phone: ${card.companyphone}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Color.fromARGB(203, 203, 203, 255),
                                fontStyle: FontStyle.italic,
                                fontSize: 12),
                          ),
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
