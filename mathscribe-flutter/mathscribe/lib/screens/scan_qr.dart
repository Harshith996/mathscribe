import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MobileScanner(
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        final Uint8List? image = capture.image;
        for (final barcode in barcodes) {
          debugPrint('Barcode found! ${barcode.rawValue}');
        }
      },
    ));
  }
}
