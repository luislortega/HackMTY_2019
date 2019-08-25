import 'package:flutter/material.dart';
import '../widgets/backArrow.dart';

class DonationData extends StatefulWidget {
  DonationData({Key key}) : super(key: key);

  _DonationDataState createState() => _DonationDataState();
}

class _DonationDataState extends State<DonationData> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        home: Scaffold(
            body: new Container(
          margin: const EdgeInsets.only(top: 80, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Arrow(),
                  ),
                  Text("¿Qué donar?",
                      style: TextStyle(fontSize: 28, color: Color(0xFFFF6F00))),
                  InstructionDescription(
                    title: "• Víveres",
                    description:
                        "Atún, sardinas, sal, azúcar, café, sopa de pasta, lentejas, verduras enlatadas, aceite, galletas, leche en polvo, alimento para bebé, frijoles enlatados... ",
                  ),
                  InstructionDescription(
                    title: "Médicos",
                    description:
                        "Guantes desechables, gasas, punzos 16 y 14, electrodos, llaves de 3 líneas, jeringas de 5 y 10mm, agua oxigenada, guantes quirúrgicos, cepillos quirúrgicos, tela adhesiva, micropore...",
                  ),
                  InstructionDescription(
                    title: "Limpieza",
                    description:
                        "Jabón en polvo, escobas, cepillos, jaladores, jergas, franelas, cubetas...",
                  ),
                  InstructionDescription(
                    title: "Monetarios",
                    description:
                        "También es posible donar a cualquiera de las siguientes asoaciaciones: ",
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: DonateButton(
                        buttonDescription: "Brigada de rescate topos",
                      )),
                  new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: DonateButton(
                        buttonDescription: "Cruz Roja Mexicana",
                      )),
                ],
              ),
            ],
          ),
        )));
  }
}

class InstructionDescription extends StatefulWidget {
  String title, description;
  InstructionDescription({Key key, this.title, this.description})
      : super(key: key);

  IinstructionDescriptionState createState() => IinstructionDescriptionState();
}

class IinstructionDescriptionState extends State<InstructionDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.title,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(84, 82, 82, 1.0))),
              new Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  widget.description,
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(158, 158, 158, 1.0)),
                ),
              )
            ],
          )),
    );
  }
}

class DonateButton extends StatefulWidget {
  String buttonDescription;
  DonateButton({Key key, this.buttonDescription}) : super(key: key);

  _DonateButtonState createState() => _DonateButtonState();
}

class _DonateButtonState extends State<DonateButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      child: FlatButton(
        onPressed: () {},
        child: Text(
          widget.buttonDescription,
          style:
              TextStyle(fontSize: 20, color: Color.fromRGBO(255, 81, 81, 1.0)),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
            side: BorderSide(color: Color.fromRGBO(255, 81, 81, 1.0))),
        color: Color.fromRGBO(0, 0, 0, 0),
        padding: EdgeInsets.only(top: 15, bottom: 15),
      ),
    );
  }
}
