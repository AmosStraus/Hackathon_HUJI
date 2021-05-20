import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huji_hackathon/guy_files/user2.dart';

class ProfileUI2 extends StatelessWidget {
  final MyUser2 user;
  ProfileUI2(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(user.urlAvatar), fit: BoxFit.cover)),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundImage: AssetImage(user.urlAvatar),
                  radius: 80.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            user.name,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${user.description}, ${user.age}',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 35.0, left: 18.0),
            child: Text(
              "סטודנט למדעי המחשב וקוגניציה, חובב אקסטרים, ובעלים של נלה המתוקה",
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Card(
          //     margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          //     elevation: 2.0,
          //     child: Padding(
          //         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          //         child: Text(
          //           "מידע נוסף",
          //           style: TextStyle(
          //               letterSpacing: 2.0, fontWeight: FontWeight.w300),
          //         ))),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Created",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "15",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Attended",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "2000",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),

          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                "Attending",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "15",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
