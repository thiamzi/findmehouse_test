import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Outils {
  static AppBar buildAppBar([IconButton? iconb]) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color.fromRGBO(22, 101, 174, 1)),
      title: Padding(
        padding: EdgeInsets.only(top: 45),
        child: Image.asset(
          'images/logo.png',
          height: 40,
        ),
      ),
      actions: <Widget>[
        if (iconb != null) iconb,
      ],
    );
  }

  static Drawer builDrawer(context) {
    return Drawer();
  }

  static errorLogin(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 5),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    ));
  }

  static ElevatedButton button(String text, function()) {
    return ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
          minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
          backgroundColor:
              MaterialStateProperty.all<Color>(Color.fromRGBO(50, 177, 8, 1)),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }
}
