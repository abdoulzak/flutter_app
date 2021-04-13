import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/Models/articlecard.dart';
import 'package:flutter_application_0/Models/varAll.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Annonces extends StatefulWidget {
  Annonces(BuildContext context);
  @override
  _Annonces createState() => _Annonces();
}

class _Annonces extends State<Annonces> {
  Future<List<ArticleCard>> article;
  bool pass;
  @override
  void initState() {
    super.initState();
    article = fetchAlbum();
    pass = true;
  }

  Future<List<ArticleCard>> fetchAlbum() async {
    final response =
        await http.get(Uri.http(address, 'bsbmobile/annonces.php'));

    if (response.contentLength <= 5) {
      setState(() {
        pass = false;
      });
      throw Exception("Echec d'internet");
    }
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();

      List<ArticleCard> usersList = jsonItems.map<ArticleCard>((json) {
        return ArticleCard.fromJson(json);
      }).toList();
      return usersList;
    } else {
      setState(() {
        pass = false;
      });
      throw Exception("Echec d'internet");
    }
  }

  void refreshArticleList() {
    setState(() {
      pass = true;
      article = fetchAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Annonces en cour"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_list_sharp,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.cyan,
        body: Center(
            child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 16.0,
                  ),
                  Text("Les plus récent ",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      )),
                  Spacer(),
                  RaisedButton(
                    child: Text("Rafraichir"),
                    color: Colors.white,
                    textColor: Colors.cyan,
                    onPressed: () {
                      refreshArticleList();
                    },
                  ),
                ],
              ),
            ),
            FutureBuilder<List<ArticleCard>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return pass
                      ? Center(
                          child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ))
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.ltr,
                            children: const <Widget>[
                              FlutterLogo(size: 48),
                              Padding(
                                padding: EdgeInsets.all(32),
                                child: Text(
                                  "Il n'y a pas d'annonces en ce moment !\nReessayer plus tard",
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        );
                }

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
                                              child: Text(
                                                '${data.note} ↑',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black),
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
}
