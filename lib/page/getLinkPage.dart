import 'package:clipboard/clipboard.dart';
import 'package:findmehouse_test/services/outils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetLinkPage extends StatefulWidget {
  GetLinkPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _GetLinkPageState createState() => _GetLinkPageState();
}

class _GetLinkPageState extends State<GetLinkPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String link = "http/Infos.house/sen/aid/adresse";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            child: Image.asset("images/logo.png"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                child: Column(
                  children: [
                    Text(link,
                        style: TextStyle(color: Color.fromRGBO(50, 177, 8, 1))),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.copy,
                        size: 20,
                        color: Color.fromRGBO(50, 177, 8, 1),
                      ),
                      onPressed: () {
                        FlutterClipboard.copy(link).then((value) =>
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                "Copied !",
                                textAlign: TextAlign.center,
                              ),
                            )));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Outils.button(
            "Retour",
            () => {
              Navigator.pushNamed(context, "/home", arguments: link),
            },
          )
        ]),
      ),
    );
  }
}
