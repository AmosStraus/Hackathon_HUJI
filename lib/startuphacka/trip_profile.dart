import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:huji_hackathon/startuphacka/demo_trip.dart';

class TripProfile extends StatefulWidget {
  String creatorImg;
  DemoTrip trip;
  TripProfile(this.creatorImg, this.trip);

  @override
  _TripProfileState createState() => _TripProfileState();
}

class _TripProfileState extends State<TripProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Image.asset(
                  widget.trip.postImage,
                  width: MediaQuery.of(context).size.width / 2.1,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  widget.trip.routeImage,
                  width: MediaQuery.of(context).size.width / 2.1,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.trip.postTitle,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                '${widget.trip.postSummary}. אורך ומרחק  ',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                '${widget.trip.userName} :יוצר',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                '${widget.trip.date} | ${widget.trip.hour}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                'מקום מפגש: "${widget.trip.postTitle}" בוויז',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.trip.currPeople.length + 1,
                  itemBuilder: (context, index) {
                    // (OPTIONAL) The first icon for search //
                    if (index == widget.trip.currPeople.length) {
                      return Container(
                        margin: EdgeInsets.only(right: 12),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(widget.creatorImg),
                        ),
                      );
                    } else {
                      final user = widget.trip.currPeople[index];
                      return Container(
                        margin: EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            print(user.name);
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(user.urlAvatar),
                          ),
                        ),
                      );
                    }
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(child: Text("GO BACK")),
            ),
          ],
        ),
      ),
    );
  }
}
