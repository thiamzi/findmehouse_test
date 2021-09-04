import 'package:findmehouse_test/page/adressPage.dart';
import 'package:findmehouse_test/page/connexion.dart';
import 'package:findmehouse_test/page/getLinkPage.dart';
import 'package:findmehouse_test/page/home.dart';
import 'package:findmehouse_test/page/scanPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find Me House',
      theme: ThemeData(backgroundColor: Colors.white),
      initialRoute: "/",
      routes: {
        "/": (context) {
          return Connexion();
        },
        "/home": (context) {
          return Home();
        },
        "/scanpage": (context) {
          return ScanPage();
        },
        "/getlinkPage": (context) {
          return GetLinkPage();
        },
        "/adressPage": (context) {
          return AdressPage();
        },
      },
    );
  }
}
