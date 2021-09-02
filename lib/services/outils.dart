import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Outils {
  static AppBar buildAppBar(bottom, [Widget? iconb3]) {
    return AppBar(
      leading: iconb3 == null ? null : iconb3,
      elevation: 2,
      backgroundColor: Color.fromRGBO(79, 84, 103, 1),
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: []),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.info_outline,
              size: 25,
              color: Colors.white,
            ),
            onPressed: null),
      ],
      bottom: bottom,
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
}
