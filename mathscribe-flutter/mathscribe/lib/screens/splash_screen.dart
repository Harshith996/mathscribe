// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mathscribe/screens/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/shared_prefs.dart';
import '../utils/apis.dart';
import '../utils/constants.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    checkIsLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color(CustomColors.background),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/first_screen.png'),
            )
          ],
        ),
      ),
    ));
  }

  Future registerUser() async {
    final response = await http.post(Uri.parse(ApiUrls.url_register));
    final responseJSON = json.decode(response.body);
    if (responseJSON['error'] == false) {
      print("Sweet");
      print(responseJSON['user_id']);
      SharedPrefs().id = responseJSON['user_id'];
    } else {
      print(responseJSON['message']);
    }
  }

  Future registerOFUser(String user_id) async {
    final headers = {
      "Authorization": "6b7OFfTGFEP0f8LX",
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    Map data = {"username": user_id, "password": "qwerty"};
    var body = json.encode(data);
    final response = await http.post(Uri.parse(ApiUrls.url_make_of_user),
        headers: headers, body: body);
    print(response.body);
    // final responseJSON = json.decode(response.body);
    // if (responseJSON['error'] == false) {
    //   print("Sweet");
    // } else {
    //   print(responseJSON['message']);
    // }
  }

  Future<void> checkIsLogin(context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final id = prefs.getInt("id") ?? -1;
    final is_first_open = SharedPrefs().is_first_open;
    if (is_first_open) {
      await registerUser();
      int user_id = SharedPrefs().id;
      String username = "user_$user_id";
      await registerOFUser(username);
      SharedPrefs().is_first_open = false;
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => HomePage(
                    camera: widget.camera,
                  ),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 1000),
                ),
              ));
      return;
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => HomePage(
                    camera: widget.camera,
                  ),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 1000),
                ),
              ));
      return;
    }
  }
}
