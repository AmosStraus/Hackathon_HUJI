import 'package:flutter/material.dart';
import 'package:huji_hackathon/model/user.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<MyUser> users;
  const ChatHeaderWidget({@required this.users, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              "TripApp Chat",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12),
          Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  // (OPTIONAL) The first icon for search //
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      child: CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.search),
                      ),
                    );
                  } else {
                    // put the users inside
                    final user = users[index];
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          print(user.name);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(user.urlAvatar),
                        ),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
