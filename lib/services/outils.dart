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

  static Container buildCardButton(
      Widget icon, String text1, String text2, context,
      [function()?]) {
    return Container(
      height: 115,
      width: 100,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.only(bottom: 20),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: GestureDetector(
          onTap: function == null ? null : function,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                Text(text1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Text(text2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
