import 'dart:async';
import 'dart:convert'; //it allows us to convert our json to a list

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListAcopios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List view"),
        ),
        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {

  Future<List<Acopio>> _getItems() async {
    //This isn't a safety option to send params.
    String url =
        'http://10.22.156.184:8081/acopios';

    http.Response itemData = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    if (itemData.statusCode != 200) {
      throw Exception('Failed to fetch data');
    }

    var jsonData = json.decode(itemData.body);
    int j = 0;
    List<Acopio> items = [];
    for (var i in jsonData) {
      Acopio acopio = Acopio(double.tryParse(jsonData[j]['geometry']['lat'].toString()),  double.tryParse(jsonData[j]['geometry']['lng'].toString()), jsonData[j]['name'].toString());
      j++;
      items.add(acopio);
    }
    return items;
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 10, right: 25, left: 25),
          constraints: BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 55,
              ),
              FutureBuilder(
                future: _getItems(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  } else if (snapshot.data.isEmpty) {
                    return Text('sin data');
                  }
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                           //Text(snapshot.data[index].nombre); 
                          return ListTile(
      title: Text(snapshot.data[index].nombre),
      contentPadding: EdgeInsets.only(bottom: 10, right: 10),
      trailing: Text(
        snapshot.data[index].nombre,
        style: TextStyle(color: Color(0xff49FE5B), fontSize: 15),
      ),
      leading: InkWell(
        child: new Container(
          height: 45,
          child: Image.network(
            "https://d1dxvryen9goi5.cloudfront.net/wp-content/uploads/2019/05/mapa-mexico.jpg",
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ),
      subtitle: Text(snapshot.data[index].nombre),
    );
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  }

  


class Acopio{
  double lat;
  double lng;
  String nombre;
  Acopio(this.lat, this.lng, this.nombre);
}