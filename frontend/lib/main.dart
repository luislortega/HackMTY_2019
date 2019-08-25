import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Centros de acopio',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: HomePage(),
    );
  }
}
