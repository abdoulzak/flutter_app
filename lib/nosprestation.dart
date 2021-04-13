import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NosPrestation extends StatefulWidget {
  NosPrestation(BuildContext context, {Key key, this.title}) : super(key: key);
  final String title;
  @override
  _NosPrestation createState() => _NosPrestation();
}

class _NosPrestation extends State<NosPrestation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nos Prestation"),
      ),
      backgroundColor: Colors.cyan,
      body: Center(child: Text("Liste de toute les prestation")),
    );
  }
}
