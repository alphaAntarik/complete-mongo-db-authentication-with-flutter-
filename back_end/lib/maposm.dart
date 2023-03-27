import 'package:back_end/update.dart';
import 'package:flutter/material.dart';

import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapOSM extends StatefulWidget {
  final String name, email, password, address, id;

  const MapOSM(this.name, this.email, this.password, this.address, this.id);

  @override
  State<MapOSM> createState() => _MapOSMState();
}

class _MapOSMState extends State<MapOSM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: OpenStreetMapSearchAndPick(
          center: LatLong(23, 89),
          buttonColor: Colors.blue,
          buttonText: 'Set Current Location',
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => UpdateScreen(
                        widget.name,
                        widget.email,
                        widget.password,
                        pickedData.address,
                        widget.id)));
          }),
    );
  }
}
