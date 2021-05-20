import 'package:flutter/material.dart';
import 'package:huji_hackathon/guy_files/user2.dart';
import 'package:huji_hackathon/model/user.dart';
import 'package:huji_hackathon/widget/messages_display_widget.dart';
import 'package:huji_hackathon/widget/new_message_widget.dart';
import 'package:huji_hackathon/widget/profile_header_widget.dart';

class ConversationPage extends StatefulWidget {
  final MyUser2 user;

  const ConversationPage({Key key, this.user}) : super(key: key);
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(
                  name: '${widget.user?.name ?? ''}, ${widget.user.age}',
                  picture: widget.user?.urlAvatar),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesDisplayWidget(idUser: widget.user.idUser),
                ),
              ),
              NewMessageWidget(idUser: widget.user?.idUser ?? "guest(bug)"),
            ],
          ),
        ));
  }
}
