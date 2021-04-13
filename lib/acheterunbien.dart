import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/Models/articlecard.dart';
import 'package:flutter_application_0/Models/varAll.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AcheterUnBien extends StatefulWidget {
  AcheterUnBien(BuildContext context);
  @override
  _AcheterUnBien createState() => _AcheterUnBien();
}

class _AcheterUnBien extends State<AcheterUnBien> {
  Future<List<ArticleCard>> article;
  @override
  void initState() {
    super.initState();
    article = fetchAlbum();
  }

  Future<List<ArticleCard>> fetchAlbum() async {
    final response =
        await http.get(Uri.http(address, 'bsbmobile/bienenlocation.php'));

    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();

      List<ArticleCard> usersList = jsonItems.map<ArticleCard>((json) {
        return ArticleCard.fromJson(json);
      }).toList();
      return usersList;
    } else {
      throw Exception("Echec d'internet");
    }
  }

  void refreshArticleList() {
    setState(() {
      article = fetchAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Louer un bien"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_list_sharp,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.cyan,
        body: Center(
            child: SingleChildScrollView(
          child: Column(children: <Widget>[
            FutureBuilder<List<ArticleCard>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ));

                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: snapshot.data
                          .map((data) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: Stack(children: <Widget>[
                                      Container(
                                        height: 190.0,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          "http://$address/bsbmobile/images/picsum_${data.id}.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        left: 0.0,
                                        bottom: 0.0,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 60.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  colors: [
                                                Colors.black,
                                                Colors.black12
                                              ])),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.0,
                                        bottom: 10.0,
                                        right: 10.0,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  data.nom,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 20.0),
                                                ),
                                                Text(
                                                  data.expirdate,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.white,
                                                      fontSize: 14.0),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6.0,
                                                  vertical: 2.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                              ),
                                              child: RaisedButton(
                                                child: Text("Ça m'intéresse"),
                                                color: Colors.white,
                                                textColor: Colors.cyan,
                                                onPressed: () {
                                                  _showMyDialog();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ])),
                              ))
                          .toList(),
                    ));
              },
            ),
          ]),
        )));
  }

  Future<void> _showMyDialog() async {
    String number;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Numero de téléphone'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    "Nous vous contacterons par appel telephonique pour plus d'explication"),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "94 __ __ __ ",
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Vous devez saisir le numero de téléphone";
                    }
                  },
                  onSaved: (String value) {
                    number = value;
                  },
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Envoyer'),
              onPressed: () {
                print(number);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
