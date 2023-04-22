import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mathscribe/screens/home_page.dart';
import 'package:mathscribe/screens/splash_screen.dart';
import 'package:mathscribe/utils/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: SplashScreenPage(
      camera: firstCamera,
    ),
  ));
}
