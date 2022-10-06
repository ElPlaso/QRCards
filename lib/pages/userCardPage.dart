import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';
import '../providers/card_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/button.dart';
import '../widgets/card_view.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../widgets/qr_image_gen.dart';
import 'editCard.dart';

class UserCardPage extends StatefulWidget {
  final BusinessCard card;
  const UserCardPage({Key? key, required this.card}) : super(key: key);

  @override
  State<UserCardPage> createState() => UserCardPageState(card: this.card);
}

class UserCardPageState extends State<UserCardPage> {
  final WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  final BusinessCard card;

  UserCardPageState({required this.card});

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
              Container(
                margin: const EdgeInsets.all(15),
                child: WidgetsToImage(
                  controller: controller,
                  child: CardView(
                    card: widget.card,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OutlinedButton(
                        child: const Text('Save Image'),
                        onPressed: () async {
                          final bytes = await controller.capture();
                          setState(() {
                            this.bytes = bytes;
                          });
                          if (bytes != null) {
                            ImageGallerySaver.saveImage(bytes,
                                quality: 60,
                                name: "file_name${DateTime.now()}");
                          }
                          Fluttertoast.showToast(
                              msg: "Image saved!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                      ),
                      OutlinedButton(
                        child: const Text('Print Card'),
                        onPressed: () async {
                          final bytes = await controller.capture();
                          setState(() {
                            this.bytes = bytes;
                          });
                          if (bytes != null) {
                            final doc = pw.Document();
                            doc.addPage(
                              pw.Page(
                                pageFormat: const PdfPageFormat(
                                    9.3 * (72 / 2.54), 5.5 * (72 / 2.54),
                                    marginAll: 1.0 * (72 / 2.54)),
                                build: (pw.Context context) {
                                  return pw.Center(
                                    child: pw.Transform.scale(
                                        scale: 0.65,
                                        child: pw.Image(pw.MemoryImage(bytes))),
                                  ); // Center
                                },
                              ),
                            );
                            await Printing.layoutPdf(
                                onLayout: (PdfPageFormat format) async =>
                                    doc.save());
                          }
                        },
                      ),
                      OutlinedButton(
                        child: const Text('Show QR'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) =>
                                  Center(child: QRImageGen(card: card)));
                        },
                      ),
                      OutlinedButton(
                        child: const Text('Edit Card'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCard(card: card)),
                        ),
                      ),
                      OutlinedButton(
                        child: const Text('Delete Card'),
                        onPressed: () async => {
                          // delete card from db
                          await FirebaseFirestore.instance
                              .collection('Cards')
                              .doc(card.id)
                              .delete(),
                          // delete card from owners' personal collection
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(context.read<UserProvider>().getUserID)
                              .update({
                            'personalcards': FieldValue.arrayRemove([card.id])
                          }),

                          // ! delete every other reference to the card
                          // TODO implement this
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .where('wallet', arrayContains: card.id)
                              .get()
                              .then((value) {
                            value.docs.forEach((element) {
                              element.reference.update({
                                'wallet': FieldValue.arrayRemove([card.id])
                              });
                            });
                          }),
                          // .update({
                          //   'personalcards': FieldValue.arrayRemove([card.id])
                          // })
                          context.read<Cards>().delete(card, true),
                          Navigator.pop(context),
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
}
