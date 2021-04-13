import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NousContacter extends StatefulWidget {
  NousContacter(BuildContext context, {Key key, this.title}) : super(key: key);
  final String title;
  @override
  _NousContacter createState() => _NousContacter();
}

class _NousContacter extends State<NousContacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      backgroundColor: Colors.cyan,
      body: new Center(
        child: new Container(
          margin: EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
              //mainAxisAlignment: MainAxisAlignment.center,
              //children: <Widget>[
              new Image.asset('images/logobsb.png'),

              new Text(''),

              new Text(
                'BIOU SERVICES BENIN SARL',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),

              new Text(''),

              new Text(
                'Située à Gbèdégbé au bord des pavés en quittant le CEG Houéyiho '
                'pour Fidjrossè avant l\’église Catholique Saint Louis de Gbèdégbé, '
                'juste en face du centre médical Medland',
                textAlign: TextAlign.justify,
                style: new TextStyle(
                  fontSize: 16,
                ),
              ),

              new Text(''),

              new Text(
                'Téléphone',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              new Text(''),

              new Text(
                '(+229) 61 61 23 89  / 60 20 44 93',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 16,
                ),
              ),

              new Text(''),

              new Text(
                'E-mail',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              new Text(''),

              new Text(
                'contact@biouservicesbenin.com',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 16,
                ),
              ),

              new Text(''),

              new Text(
                'Site web',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              new Text(''),

              new Text(
                'www.biouservicesbenin.com',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
