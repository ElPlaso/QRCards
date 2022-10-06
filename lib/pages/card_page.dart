import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';
import '../widgets/card_view.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../widgets/qr_image_gen.dart';
import '../widgets/small_button.dart';

class CardPage extends StatefulWidget {
  final BusinessCard card;
  const CardPage({Key? key, required this.card}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState(card: this.card);
}

class _CardPageState extends State<CardPage> {
  final WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  final BusinessCard card;

  _CardPageState({required this.card});

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
              // display business card
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
                      SmallButton(
                        text: 'Save Image',

                        // save widget as image bytes
                        onClicked: () async {
                          final bytes = await controller.capture();
                          setState(() {
                            this.bytes = bytes;
                          });

                          // if widget was succesfully turned into image bytes, save image to phone gallery.
                          if (bytes != null) {
                            ImageGallerySaver.saveImage(bytes,
                                quality: 60,
                                name: "file_name${DateTime.now()}");
                          }

                          // Inform user that the image has been saved.
                          Fluttertoast.showToast(
                              msg: "Image saved!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        icon: const Icon(Icons.camera_alt, size: 25),
                      ),
                      SmallButton(
                        text: 'Print Card',

                        // save widget as image bytes
                        onClicked: () async {
                          final bytes = await controller.capture();
                          setState(() {
                            this.bytes = bytes;
                          });

                          // if widget was succesfully turned into image bytes, add image bytes to a PDF
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

                            // print PDF
                            await Printing.layoutPdf(
                                onLayout: (PdfPageFormat format) async =>
                                    doc.save());
                          }
                        },
                        icon: const Icon(Icons.print, size: 25),
                      ),
                      SmallButton(
                        text: 'Show QR',
                        onClicked: () {
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
                        icon: const Icon(Icons.qr_code, size: 25),
                      ),
                      SmallButton(
                        text: 'Remove from wallet',
                        onClicked: () {},
                        icon: const Icon(Icons.remove, size: 25),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
}
