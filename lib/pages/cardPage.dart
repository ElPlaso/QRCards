import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/card_view.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CardPage extends StatefulWidget {
  final BusinessCard card;
  const CardPage({Key? key, required this.card}) : super(key: key);

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
                      )
                    ],
                  )),
            ],
          ),
        ),
      );
}
