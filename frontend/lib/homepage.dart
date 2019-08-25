import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/listPlaces.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

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
                onPressed: () => {},
                child: Text("¿Qué donar?",
                    style: TextStyle(fontSize: 20, color: Colors.orange)),
              ),
            ],
          )
        ],
      ),
    ));
  }

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
        markers: {newyorkMarker, newyorkMarker2},
      ),
    );
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
