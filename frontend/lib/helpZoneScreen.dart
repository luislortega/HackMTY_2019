import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/helpZoneScreen.dart';
import 'package:frontend/widgets/backArrow.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/listPlaces.dart';

class HelpZone extends StatefulWidget {
  HelpZone({Key key}) : super(key: key);
  _HelpZoneState createState() => _HelpZoneState();
}

class _HelpZoneState extends State<HelpZone> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 80, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Arrow(),
                      Arrow(),
                    ],
                  ),
                ],
              )),
          new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    "Centro de acopio",
                    style: TextStyle(
                        fontSize: 28, color: Color.fromRGBO(84, 82, 82, 1.0)),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text("calle 21 x 131 sda y av 123 por Mexico 3",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(112, 112, 112, 1.0))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(46),
                    child: Image.asset('assets/centroAcopio.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 180),
                  child: FlatButton(
                    child: Text("Compartir en facebook",
                        style: TextStyle(fontSize: 16, color: Colors.blue)),
                    onPressed: () {},
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, left: 30),
                    child: ButtonTheme(
                      minWidth: 350,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.orange,
                        child: Text(
                          "Ya he donado",
                          style: TextStyle(fontSize: 16),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.orange)),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  child: Text("Escribe un comentario:",
                      style: TextStyle(fontSize: 14)),
                ),
                Container(
                  width: 350,
                  margin: EdgeInsets.only(top: 10, left: 30),
                  child: TextFormField(),
                )
              ]),
        ]));
  }
}
