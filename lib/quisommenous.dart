import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuiSommeNous extends StatefulWidget {
  QuiSommeNous(BuildContext context, {Key key, this.title}) : super(key: key);
  final String title;
  @override
  _QuiSommeNous createState() => _QuiSommeNous();
}

class _QuiSommeNous extends State<QuiSommeNous> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nous"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              print(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.cyan,
      body: Center(child: Text("Qui somme nous page")),
    );
  }
}
