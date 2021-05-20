import 'package:flutter/material.dart';
import 'package:huji_hackathon/startuphacka/demo_trip.dart';

class TripProfile extends StatefulWidget {
  DemoTrip trip;
  TripProfile(DemoTrip trip);

  @override
  _TripProfileState createState() => _TripProfileState();
}

class _TripProfileState extends State<TripProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Center(child: Text("GO BACK")),
      ),
    );
  }
}
