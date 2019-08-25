import 'dart:async';
import 'dart:convert'; //it allows us to convert our json to a list

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/listPlaces.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/ui/login.dart';

import './ui/donationData.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  List list = List();
  var isLoading = false;

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          _googlemap(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListPlaces()))
                },
                padding: EdgeInsets.all(10.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Image.asset(
                      "images/drag.png",
                      width: 150.0,
                      height: 50.0,
                    ),
                    Text("New York", style: TextStyle(fontSize: 22)),
                    Text("Descripcion", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Row(
            children: <Widget>[
              Expanded(child: SizedBox()),
              FlatButton(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 20),
                // 

                //ESTA FUNCION HACE QUE OBTENGA LOS MARCADORES DEL API
                
                //onPressed: () => {fetchData()},

                //

                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DonationData()))
                },

                child: Text("¿Qué donar?",
                    style: TextStyle(fontSize: 20, color: Colors.orange)),
              ),
            ],
          )
        ],
      ),
    ));
  }

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  Widget _googlemap(BuildContext context) {
    return Container(
      height: 560.0,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  fetchData() async {
    http.Response response = await http.get(
        //Uri.encodeFull removes all the dashes or extra characters present in our Uri
        Uri.encodeFull("http://10.22.156.184:8080/acopios"),
        headers: {
          //if your api require key then pass your key here as well e.g "key": "my-long-key"
          "Accept": "application/json"
        });
    //print(response.body);
    List data = json.decode(response.body) as List;

    data.map((datos) {
      print(datos['geometry']['location']);
      
      var markerIdVal = datos['geometry']['location'].toString();
      final MarkerId markerId = MarkerId(markerIdVal);

      // creating a new MARKER
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(double.tryParse(datos['geometry']['location']['lat'].toString()), double.tryParse(datos['geometry']['location']['lng'].toString())),
        infoWindow: InfoWindow(title: datos['name'].toString(), snippet: '*'),
        onTap: () {
          // DATOS LIMPIOS
          String nombre = datos['name'].toString();
          double latitud = double.tryParse(datos['geometry']['location']['lat'].toString());
          double longitud = double.tryParse(datos['geometry']['location']['lng'].toString());
   
        },
      );

      setState(() {
        // adding a new marker to map
        markers[markerId] = marker;
      });

    }).toList();
  }
}

Marker newyorkMarker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(40.712776, -74.005974),
  infoWindow: InfoWindow(title: 'Marcador vrgs', snippet: 'Description'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker newyorkMarker2 = Marker(
    markerId: MarkerId('newyork2'),
    position: LatLng(40.729640, -73.983510),
    infoWindow: InfoWindow(title: 'Marcador vrgs 2', snippet: 'Description'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueOrange,
    ));
