//import 'dart:convert';
import 'dart:async';
//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/Models/Besoin.dart';
import 'package:http/http.dart' as http;

class ExprimerVosBesoin extends StatefulWidget {
  ExprimerVosBesoin(BuildContext context, {Key key, this.title})
      : super(key: key);
  final String title;
  @override
  _ExprimerVosBesoin createState() => _ExprimerVosBesoin();
}

class _ExprimerVosBesoin extends State<ExprimerVosBesoin> {
  bool isloading;
  bool isSending;
  String message;
  Besoin besoin;
  @override
  void initState() {
    super.initState();
    isloading = false;
    isSending = false;
    message = "Nous promettons traité votre besoin avec soin.";
    besoin = Besoin();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  http.Response response;
  Future createBesoin(
      String nom, String numero, String description, String date) async {
    response = await http.post(
      //"${https://leliens.com/}/create.php",
      "http://192.168.43.238/bsbmobile/addbesoin.php",
      body: {
        "nom": nom,
        "numero": numero,
        "description": description,
        "date": date,
      },
    );

    if (response.statusCode == 200) {
      if (response.body == "true") {
        setState(() {
          isloading = false;
          message = "Besoin envoyer !";
        });
      } else {
        setState(() {
          isloading = false;
          message = "Reéssayer plustar!";
        });
      }
      _formKey.currentState.reset();
    } else {
      setState(() {
        isloading = false;
        message = "Une errer vient de se produire!\n Reéssayer plustar!";
      });
    }
    return (response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exprimez vos besoins"),
      ),
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: Column(
          children: <Widget>[
            Text(
              "Exprimez votre besoin",
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nom & Prénon *",
                      hintText: "Nom & Prénon",
                      icon: Icon(
                        Icons.person,
                        size: 25.0,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Entrez le nom et le prénom";
                      }
                    },
                    onSaved: (String value) {
                      besoin.nom = value;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Numero de téléphone *",
                      hintText: "Numero de téléphone",
                      icon: Icon(
                        Icons.phone,
                        size: 25.0,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Entrez le numero de téléphone";
                      }
                      if (value.length < 8) {
                        return "Entrez un numero de téléphone valide";
                      }
                    },
                    onSaved: (String value) {
                      besoin.numero = value;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Date dexpiration de l'offre *",
                      hintText: "Avant quel date le voulez-vous?",
                      icon: Icon(
                        Icons.date_range,
                        size: 25.0,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Entrez la date d'expiration du produit";
                      }
                    },
                    onSaved: (String value) {
                      besoin.date = value;
                    },
                    keyboardType: TextInputType.datetime,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Description du besoin *",
                      hintText: "Description du besoin",
                      icon: Icon(
                        Icons.text_fields,
                        size: 25.0,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Entrez une description du produit cela aide beaucoup !";
                      }
                    },
                    onSaved: (String value) {
                      besoin.description = value;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    message,
                  ),
                  isloading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                      : RaisedButton(
                          child: Text("ENVOYER"),
                          color: Colors.white,
                          textColor: Colors.cyan,
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            setState(() {
                              isSending = true;
                            });
                            _formKey.currentState.save();
                            createBesoin(besoin.nom, besoin.numero,
                                besoin.description, besoin.date);
                          },
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
