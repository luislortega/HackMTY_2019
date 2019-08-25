import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/backArrow.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListPlaces extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>ListPlacesState();
  }

  class ListPlacesState extends State<ListPlaces>{
    @override
    void initState() {
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Arrow(),
    );
  }

 }
