import 'package:flutter/material.dart';
import '../homepage.dart';

class Arrow extends StatelessWidget {
  const Arrow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: new Container(
              child: Image.asset(
                'assets/returnArrow.png',
                color: Colors.black,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
