import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mathscribe/utils/apis.dart';
import 'package:mathscribe/utils/shared_prefs.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';
import 'home_page.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    super.key,
    required this.imagePath,
    required this.camera,
  });

  final String imagePath;
  final CameraDescription camera;

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    bool hasDetected = false;
    return Scaffold(body: MobileScanner(
      onDetect: (capture) async {
        final List<Barcode> barcodes = capture.barcodes;
        final Uint8List? image = capture.image;
        for (final barcode in barcodes) {
          if (hasDetected == false) {
            hasDetected = true;
            await uploadImage(widget.imagePath, barcode.rawValue.toString());
            showAlertDialog(
                context, "Image uploaded successfully", widget.camera);
          }
          // ignore: use_build_context_synchronously

          debugPrint('Barcode found! ${barcode.rawValue}');
        }
      },
    ));
  }

  Future uploadImage(String imgPath, String pc_id) async {
    var request =
        http.MultipartRequest("POST", Uri.parse(ApiUrls.url_upload_image));
    request.files.add(await http.MultipartFile.fromPath("img", imgPath));
    request.fields["user_id"] = SharedPrefs().id.toString();
    request.fields["pc_id"] = pc_id;
    var response = await request.send();
  }
}

showAlertDialog(BuildContext context, message, CameraDescription camera) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "OK",
      style: TextStyle(color: Color(CustomColors.green)),
    ),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => HomePage(
            camera: camera,
          ),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    contentPadding: const EdgeInsets.all(20.0),
    backgroundColor: const Color(CustomColors.background),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
