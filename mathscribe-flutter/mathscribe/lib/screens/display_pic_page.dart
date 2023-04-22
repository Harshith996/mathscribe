import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mathscribe/screens/scan_qr.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final CameraDescription camera;

  const DisplayPictureScreen(
      {super.key, required this.imagePath, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => QRViewExample(
                        camera: camera,
                        imagePath: imagePath,
                      ),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: const Duration(milliseconds: 1000),
                    ),
                  );
                },
                child: Text("Upload"))
          ],
        )),
      ),
    );
  }
}
