import 'package:findmehouse_test/db/database.dart';
import 'package:findmehouse_test/modele/user.dart';
import 'package:findmehouse_test/services/outils.dart';

import 'package:flutter/material.dart';

class UserService {
  void handleSubmitted(User user, context) async {
    await DatabaseHandler().authification(user, context).then((value) {
      if (value.id == 0) {
        Outils.errorLogin(context, "Identifiant ou mot de passe incorrect!");
      } else {
        if (user.password != value.password) {
          Outils.errorLogin(context, "Identifiant ou mot de passe incorrect!");
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            ModalRoute.withName('/home'),
          );
        }
      }
    });
  }
}
