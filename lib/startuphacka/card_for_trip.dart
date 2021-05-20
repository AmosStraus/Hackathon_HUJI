import 'package:flutter/material.dart';
import 'package:huji_hackathon/guy_files/dummy_users.dart';
import 'package:huji_hackathon/startuphacka/demo_trip.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:huji_hackathon/startuphacka/trip_profile.dart';

class PostCardPage extends StatelessWidget {
  const PostCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        createCardRow(DemoTrips.trips[0], DemoTrips.trips[1]),
        createCardRow(DemoTrips.trips[0], DemoTrips.trips[1]),
        createCardRow(DemoTrips.trips[0], DemoTrips.trips[1]),
      ],
    );
  }

  Padding createCardRow(trip1, trip2) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Row(
        children: [
          TripCardWidget(trip1),
          TripCardWidget(trip2),
        ],
      ),
    );
  }
}

class TripCardWidget extends StatelessWidget {
  final DemoTrip trip;
  const TripCardWidget(
    this.trip, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(trip.postTitle);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TripProfile(trip)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.15,
        height: MediaQuery.of(context).size.height / 3,
        child: Card(
          child: Column(children: [
            _Post(trip),
            _PostDetails(trip),
          ]),
        ),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  final DemoTrip trip;
  const _Post(this.trip, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _PostImage(trip),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              trip.postTitle,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(trip.hour + ' | ' + trip.date),
          ),
        ],
      ),
    );
  }
}

/// The main photo header ///
class _PostImage extends StatelessWidget {
  final DemoTrip trip;
  const _PostImage(this.trip, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 3),
      child: Image.asset(
        trip.postImage,
        fit: BoxFit.cover,
        height: 125,
        width: 190,
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}

class _PostDetails extends StatelessWidget {
  final DemoTrip trip;
  const _PostDetails(this.trip, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_UserImage(trip)],
    );
  }
}

class _UserImage extends StatelessWidget {
  final DemoTrip trip;
  const _UserImage(this.trip, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: RowSuper(
        innerDistance: -15,
        children: [
          buildImage(trip.userImage, true),
          buildImage(DummyUsers2.all_users[1].urlAvatar, false),
          buildImage(DummyUsers2.all_users[2].urlAvatar, false),
        ],
      ),
    );
  }

  Widget buildImage(img, creator) {
    return Container(
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: creator ? Colors.blue[900] : Colors.blue[400],
          width: 2.5,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(img),
      ),
    );
  }
}
