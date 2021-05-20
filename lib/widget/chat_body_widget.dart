import 'package:flutter/material.dart';
import 'package:huji_hackathon/guy_files/user2.dart';
import 'package:huji_hackathon/pages/conversation_page.dart';
import 'package:huji_hackathon/model/user.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<MyUser2> users;
  const ChatBodyWidget({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: buildChats(),
      ),
    );
  }

  Widget buildChats() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                print(user.name);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ConversationPage(user: user)));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.urlAvatar),
              ),
              title: Text(user.name),
            ),
          );
        });
  }
}
