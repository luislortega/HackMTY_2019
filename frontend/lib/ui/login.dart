import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/model/note.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final notesReference = FirebaseDatabase.instance.reference().child('notes');

  List<Note> notas = new List();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login_page',
      home: Scaffold(
          body: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Terremex",
                    style: TextStyle(fontSize: 36, color: Color(0xFF8F5100))
                    ),
                    Text("Bienvenido de nuevo, ingresa para ver como colaborar en apoyo a tu comunidad",
                    style: TextStyle(fontSize: 28, color: Color(0x70707000)),),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, ingresa tu correo';
                        }
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, ingresa tu contraseña';
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            //_showDialog(emailController.text);
                            _login(
                                emailController.text, passwordController.text);
                          }
                        },
                        child: Text('Login'),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                      ),
                      RaisedButton(
                        onPressed: null,
                        child: Text("Regístrate con facebook"),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                      )
                        ],
                      ) 
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  // user defined function
  void _showDialog(String text) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alerta:"),
          content: new Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }






  //NO TOCAR
  void _login(String email, String password) {
    FirebaseDatabase.instance
        .reference()
        .child('usuarios')
        .orderByChild("email")
        .equalTo(email)
        .once()
        .then((DataSnapshot val) {

      if (password ==
          val.value[val.value
                  .toString()
                  .split(':')[0]
                  .replaceAll(RegExp('{'), '')]['password']
              .toString()) {
                print("es correcto el usuario");
              }else{
                print("no esta correcta la contra");
              }
    }).catchError((onError) {
      print("No se encuentra el usuario");
    });
  }

  void _doSomething() async {
    FirebaseDatabase.instance
        .reference()
        .child('notes')
        .orderByChild("description")
        .equalTo("weee2")
        .once()
        .then((DataSnapshot val) {
      Note nota = new Note(
          val.value[val.value
                  .toString()
                  .split(':')[0]
                  .replaceAll(RegExp('{'), '')]
              .toString(),
          val.value[val.value
                  .toString()
                  .split(':')[0]
                  .replaceAll(RegExp('{'), '')]['title']
              .toString(),
          val.value[val.value
                  .toString()
                  .split(':')[0]
                  .replaceAll(RegExp('{'), '')]['description']
              .toString());
      print(nota.getTitlexd());
    }).catchError((onError) {
      print("errorcito");
    });
  }
}
