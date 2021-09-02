import 'package:findmehouse_test/db/database.dart';
import 'package:findmehouse_test/modele/user.dart';

import 'package:flutter/material.dart';

class UserService {
  void handleSubmitted(User user, context) async {
    await DatabaseHandler().authification(user, context).whenComplete(() {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        ModalRoute.withName('/home'),
      );
    });
  }
}
