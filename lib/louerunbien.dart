import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/Models/articlecard.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LouerUnBien extends StatefulWidget {
  LouerUnBien(BuildContext context);
  @override
  _LouerUnBien createState() => _LouerUnBien();
}

class _LouerUnBien extends State<LouerUnBien> {
  Future<List<ArticleCard>> article;
  @override
  void initState() {
    super.initState();
    article = fetchAlbum();
  }

  Future<List<ArticleCard>> fetchAlbum() async {
    final response = await http
        .get(Uri.http('192.168.43.238', 'bsbmobile/bienenlocation.php'));

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
                                        color: Colors.white30,
                                      ),
                                      Positioned(
                                          left: 0.0,
                                          top: 0.0,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60.0,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  data.nom,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 30.0),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          left: 0.0,
                                          top: 40.0,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 110.0,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Le lorem ispgralloc (12881): gralloc_regrmat=1 stride=480, stride=480, 0x860f8000, writeOwner=0, attr_base=0xffffffff, yuv_info=1, fd=-1, buf_idx=0, offset=0, min_pgsz=4096, phyaddr=0E/(12881): Shared attribute region not available to be mapped",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 15.0),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                        left: 10.0,
                                        bottom: 10.0,
                                        right: 10.0,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Prix : ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 20.0),
                                                ),
                                                Text(
                                                  data.note,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 20.0),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: RaisedButton(
                                                child:
                                                    Text("JE SUIS INTERESSER"),
                                                color: Colors.white,
                                                textColor: Colors.red,
                                                onPressed: () {
                                                  print("Je suis interesser");
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
}
