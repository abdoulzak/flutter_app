//import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_application_0/annonces.dart';
import 'package:flutter_application_0/exprimervosbesoin.dart';
import 'package:flutter_application_0/homeScreenBottomPart.dart';
import 'package:flutter_application_0/nosprestation.dart';
import 'package:flutter_application_0/search.dart';
//import 'package:flutter_application_0/vendreunbien.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:workmanager/workmanager.dart';

void main() {
  runApp(MyApp());
}

bool notificationSTATE;
String noti;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BSB Mobile',
      theme: themeData(),
      home: MyHomePage(),
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    accentColor: Colors.white,
    primaryColor: Colors.cyan,
  );
}

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BSB Mobile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Recherche',
            onPressed: () async {
              await showSearch<String>(
                context: context,
                delegate: Search(),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.cyan,
      body: HomeScreenBottomPart(),
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'BSB Sarl',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      Text(
                        'Le slogan',
                        style: TextStyle(color: Colors.white54, fontSize: 16.0),
                      ),
                      Spacer(),
                      Text(
                        'Notification $noti',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.cyan,
              ),
              title: Text('Qui somme nous ?'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuiSommeNous()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.cyan),
              title: Text('Nos prestations'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NosPrestation(context)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement, color: Colors.cyan),
              title: Text('Nos annonces'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Annonces(context)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.track_changes_outlined, color: Colors.cyan),
              title: Text('Exprimer vos besoins'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExprimerVosBesoin(context)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page, color: Colors.cyan),
              title: Text('Nous contacter'),
              onTap: () {
                /*
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NousContacter(context)),
                );*/
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Qui sommes nous ?"),
        ),
        body: new Center(
          child: SingleChildScrollView(
            child: Html(
              data: """
                <div>Follow<a class='sup'><sup>pl</sup></a> 
                  Below hr
                    <b>Bold</b>
                <h1>what was sent down to you from your Lord</h1>, 
                and do not follow other guardians apart from Him. Little do 
                <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                """,
              padding: EdgeInsets.all(8.0),
              onLinkTap: (url) {
                print("Opening $url...");
              },
            ),
          ),
        ));
  }
}

class QuiSommeNous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Qui sommes nous ?"),
        ),
        body: Container(
          color: Colors.white,
          child: Center(),
        ));
  }
}
