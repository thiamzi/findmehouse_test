import 'package:findmehouse_test/services/outils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      appBar: Outils.buildAppBar(),
      drawer: Outils.builDrawer(context),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.home,
                                    color: Color.fromRGBO(50, 177, 8, 1)),
                                Text(
                                  " Adresse physique",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text("06 Rue Abdoulaye Seck Marie Parsine"),
                            Text("CP : 13000"),
                            Text("Dakar, Senegal")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Outils.buildCardButton(
                                FaIcon(
                                  FontAwesomeIcons.phoneAlt,
                                  color: Color.fromRGBO(22, 101, 174, 1),
                                  size: 30,
                                ),
                                "contacter",
                                "le client",
                                context),
                            Outils.buildCardButton(
                                FaIcon(
                                  FontAwesomeIcons.camera,
                                  color: Color.fromRGBO(50, 177, 8, 1),
                                  size: 30,
                                ),
                                "Preuve",
                                "Photo",
                                context),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Outils.buildCardButton(
                                FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  color: Colors.redAccent[700],
                                  size: 30,
                                ),
                                "Corriger",
                                "position",
                                context),
                            Outils.buildCardButton(
                                FaIcon(
                                  FontAwesomeIcons.commentDots,
                                  color: Color.fromRGBO(22, 101, 174, 1),
                                  size: 30,
                                ),
                                "Support",
                                "FindMe",
                                context),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 115,
                    width: 100,
                    child: Card(
                      color: Color.fromRGBO(50, 177, 8, 1),
                      elevation: 3,
                      margin: EdgeInsets.only(bottom: 20),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(width: 1, color: Colors.white)),
                      child: GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "VALIDER",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          onTap: null),
                    ),
                  ),
                ],
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
