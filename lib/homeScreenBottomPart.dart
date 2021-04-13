import 'package:flutter/material.dart';
import 'package:flutter_application_0/acheterunbien.dart';
import 'package:flutter_application_0/nouscontacter.dart';
import 'package:flutter_application_0/exprimervosbesoin.dart';
import 'package:flutter_application_0/louerunbien.dart';
import 'package:flutter_application_0/vendreunbien.dart';

class HomeScreenBottomPart extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    //Color gradientStart = Colors.deepOrange[50];
    //Color gradientEnd = Colors.orange[100];
    //final String number = "0022960204493";

    //Size size = MediaQuery.of(context).size;
    double largeur = MediaQuery.of(context).size.width;

    return new Center(
      child: new Container(
          width: largeur,
          margin: EdgeInsets.all(20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Container(
                  width: largeur / 2.5,
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 10.0,
                        color: Colors.cyan.shade400,
                        child: InkWell(
                          splashColor: Colors.cyanAccent.withAlpha(100),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VendreUnBien(context)),
                            );
                          },
                          child: Container(
                            width: 300.0,
                            height: 100.0,
                            child: Column(children: <Widget>[
                              Icon(
                                Icons.account_balance,
                                size: 60.0,
                                color: Colors.orange[100],
                              ),
                              Text(
                                'Vendre un bien',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.orange[100],
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Spacer(),
                      Card(
                        elevation: 10.0,
                        color: Colors.cyan.shade400,
                        child: InkWell(
                          splashColor: Colors.cyanAccent.withAlpha(100),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AcheterUnBien(context)),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(children: <Widget>[
                              Icon(
                                Icons.business_center,
                                size: 60.0,
                                color: Colors.orange[100],
                              ),
                              Text(
                                'Acheter un bien',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.orange[100],
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Spacer(),
                      Card(
                        elevation: 10.0,
                        color: Colors.cyan.shade400,
                        child: InkWell(
                          splashColor: Colors.cyanAccent.withAlpha(100),
                          onTap: () {
                            print("Site Web link");
                          },
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(children: <Widget>[
                              Icon(
                                Icons.business_center,
                                size: 60.0,
                                color: Colors.orange[100],
                              ),
                              Text(
                                'Visitez notre site',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.orange[100],
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: largeur / 2.5,
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 10.0,
                        color: Colors.cyan.shade400,
                        child: InkWell(
                          splashColor: Colors.cyanAccent.withAlpha(100),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LouerUnBien(context)),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                size: 60.0,
                                color: Colors.orange[100],
                              ),
                              Text(
                                'Louer un bien',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.orange[100],
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Spacer(),
                      Card(
                        elevation: 10.0,
                        color: Colors.cyan.shade400,
                        child: InkWell(
                          splashColor: Colors.cyanAccent.withAlpha(100),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ExprimerVosBesoin(context)),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(children: <Widget>[
                              Icon(
                                Icons.mail_outline,
                                size: 60.0,
                                color: Colors.orange[100],
                              ),
                              Text(
                                'Exprimer un besoin',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.orange[100],
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Spacer(),
                      Card(
                        elevation: 10.0,
                        color: Colors.cyan.shade400,
                        child: InkWell(
                          splashColor: Colors.cyanAccent.withAlpha(100),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NousContacter(context)),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(children: <Widget>[
                              Icon(
                                Icons.phone,
                                size: 60.0,
                                color: Colors.orange[100],
                              ),
                              Text(
                                'Nous contacter',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.orange[100],
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
              ])),
    );
  }
}
