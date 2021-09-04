import 'package:findmehouse_test/db/database.dart';
import 'package:findmehouse_test/modele/user.dart';
import 'package:findmehouse_test/services/outils.dart';
import 'package:findmehouse_test/services/userService.dart';
import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  Connexion({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ConnexiontState createState() => _ConnexiontState();
}

class _ConnexiontState extends State<Connexion> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: ConnexionForm());
  }
}

class ConnexionForm extends StatefulWidget {
  @override
  ConnexionFormState createState() {
    return ConnexionFormState();
  }
}

class ConnexionFormState extends State<ConnexionForm> {
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
      setState(() {});
    });
  }

  Future<int> addUsers() async {
    User firstUser = User(username: "rene", password: "12345678");
    User secondUser = User(username: "augustin", password: "12345678");
    List<User> listOfUsers = [firstUser, secondUser];
    return await this.handler.insertUser(listOfUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 100, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("images/img.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "S'identifier au compte pro",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(22, 101, 174, 1),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: username,
                  validator: (String? value) {
                    if (value == '' || value == null) {
                      return "Champ requis";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Identifiant',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(22, 101, 174, 1),
                        fontWeight: FontWeight.bold),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(22, 101, 174, 1),
                        width: 2,
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: password,
                  obscureText: true,
                  validator: (String? value) {
                    if (value == '' || value == null) {
                      return "Champ requis";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(22, 101, 174, 1),
                        fontWeight: FontWeight.bold),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(22, 101, 174, 1),
                        width: 2,
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Outils.button(
                "Valider",
                () => {
                  if (_formKey.currentState!.validate())
                    {
                      UserService().handleSubmitted(
                        new User(
                            username: username.text, password: password.text),
                        context,
                      )
                    }
                  else
                    {}
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
