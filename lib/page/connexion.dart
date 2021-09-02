import 'package:flutter/material.dart';
//import 'package:gestion_bibliotheque/services/authService.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("images/img.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "S'idenfier au compte pro",
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
                      if (value == null) {
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
                      if (value == null) {
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
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
                    minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(50, 177, 8, 1)),
                  ),
                  child: Text(
                    "Valider",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
