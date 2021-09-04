import 'package:findmehouse_test/services/outils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: Outils.buildAppBar(
        IconButton(
            icon: FaIcon(
              FontAwesomeIcons.solidTimesCircle,
              size: 20,
              color: Colors.red,
            ),
            onPressed: null),
      ),
      drawer: Outils.builDrawer(context),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Image.asset("images/profile.png"),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Outils.buildCardButton(
                      Image.asset("images/search_qr.png"),
                      'Scanner',
                      "QR code",
                      context,
                      () {
                        Navigator.pushNamed(
                          context,
                          "/scanpage",
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
                      child: Text(
                          "Enter l'identifiant l'aid de l'adresse en copiant le lien present dans le QRCode sur la plaque",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black)),
                    ),
                    ClassForm()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Avec "),
                    Text(
                      "FindMe",
                      style: TextStyle(color: Color.fromRGBO(50, 177, 8, 1)),
                    ),
                    Text(", une adresse pour tous")
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

class ClassForm extends StatefulWidget {
  @override
  ClassFormState createState() {
    return ClassFormState();
  }
}

class ClassFormState extends State<ClassForm> {
  final _formKey = GlobalKey<FormState>();
  final linkControl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      setState(() {
        linkControl.text =
            ModalRoute.of(context)!.settings.arguments.toString();
      });
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              controller: linkControl,
              validator: (String? value) {
                if (value == '' || value == null) {
                  return "Veuillez d'abord copier le lien sur la plaque";
                }
                return null;
              },
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Exemple : Infos.house/sen/aid/adresse',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(50, 177, 8, 1), width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(50, 177, 8, 1), width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(color: Color.fromRGBO(50, 177, 8, 1)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Outils.button(
              "Valider",
              () => {
                if (_formKey.currentState!.validate())
                  {
                    linkControl.clear(),
                    Navigator.pushNamed(
                      context,
                      "/adressPage",
                    )
                  }
                else
                  {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
