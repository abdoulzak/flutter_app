import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/Models/Bien.dart';
import 'package:http/http.dart' as http;

class VendreUnBien extends StatefulWidget {
  VendreUnBien(BuildContext context);
  @override
  _VendreUnBien createState() => _VendreUnBien();
}

class _VendreUnBien extends State<VendreUnBien> {
  bool isloading = false;
  bool isSending = false;
  String message = "";
  Bien bien = Bien();

  @override
  void initState() {
    super.initState();
    isloading = false;
    isSending = false;
    message = "Nous promettons traité votre requette avec soin.";
    bien = Bien();
  }

  final GlobalKey<FormState> _formKe = GlobalKey<FormState>();

  http.Response response;

  Future createBien(String nom, String numero, String position,
      String description, String prix) async {
    http.Response response;

    response = await http.post(
      //"${https://leliens.com/}/create.php",
      "http://192.168.43.238/bsbmobile/addbien.php",
      body: {
        "nom": nom,
        "numero": numero,
        "position": position,
        "description": description,
        "prix": prix,
      },
    );

    if (response.statusCode == 200) {
      if (response.body == 'true') {
        setState(() {
          isloading = false;
          message = "Bien envoyer !";
        });
        _formKe.currentState.reset();
      } else {
        setState(() {
          isloading = false;
          message = "Reéssayer plustar!";
        });
      }
    } else {
      setState(() {
        isloading = false;
        message = "Une erreur vient de se produire! \nReéssayer plustar!";
      });
    }
    return (response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendre un bien"),
      ),
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: Column(
          children: <Widget>[
            Text(
              "Information à fournir",
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            Form(
              key: _formKe,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nom & Prénon *",
                      hintText: "Nom & Prénon",
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
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
                      bien.nom = value;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Numero de téléphone *",
                      hintText: "Numero de téléphone",
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
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
                      bien.numero = value;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Proposition de prix *",
                      hintText: "A combien le vendez vous?",
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Vous devez estimer un prix ";
                      }
                    },
                    onSaved: (String value) {
                      bien.prix = value;
                    },
                    keyboardType: TextInputType.datetime,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Localisation *",
                      hintText: "Ville, village, position precise...",
                      icon: Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Ce champ est requis ";
                      }
                    },
                    onSaved: (String value) {
                      bien.position = value;
                    },
                    keyboardType: TextInputType.datetime,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Description du bien *",
                      hintText: "Description du bien",
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Entrez une description du bien cela aide beaucoup !";
                      }
                    },
                    onSaved: (String value) {
                      bien.description = value;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                  isloading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                      : RaisedButton(
                          child: Text("ENVOYER"),
                          color: Colors.white,
                          textColor: Colors.white,
                          onPressed: () {
                            if (!_formKe.currentState.validate()) {
                              return;
                            }
                            setState(() {
                              isloading = true;
                            });
                            _formKe.currentState.save();
                            createBien(bien.nom, bien.numero, bien.position,
                                bien.description, bien.prix);
                          },
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
