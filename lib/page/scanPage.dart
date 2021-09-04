import 'dart:ui';

import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(70, 70, 70, 1),
          leadingWidth: 80,
          leading: TextButton(
            child: Text(
              "FindMe",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onPressed: null,
          ),
          title: TextButton(
            child: Text(
              "Activer le flash",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onPressed: null,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: TextButton(
                child: Text(
                  "Annuler",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: null,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment(0.0, 0.0),
                children: [
                  Container(
                    color: Color.fromRGBO(70, 70, 70, 1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 142,
                    child: Divider(
                      color: Colors.redAccent.shade700,
                    ),
                  ),
                  GestureDetector(
                    child: Image.asset("images/qr_code.png"),
                    onTap: null,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
