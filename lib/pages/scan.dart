import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScanState();
  }
}

class _ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
    controller!.resumeCamera();
  }

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
              Expanded(
                flex: 1,
                child: CreateQRView(context),
              ),
              const SizedBox(height: 24),
              const Header(title: 'Scan')
            ],
          ),
        ),
      );

  Widget CreateQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
        borderRadius: 10,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      AlertDialog(content: Text(scanData.toString()));
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
