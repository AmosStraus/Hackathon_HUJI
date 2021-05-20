import 'package:flutter/material.dart';
import 'package:huji_hackathon/authenticate_try2/authentication_service.dart';

import 'package:huji_hackathon/guy_files/user2.dart';

import 'package:huji_hackathon/widget/chat_body_widget.dart';
import 'package:huji_hackathon/databases/firebase_api.dart';

import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<List<MyUser2>>(
          stream: FirebaseApi.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return buildText('Snapshot error, try again later');
            } else {
              // snapshot from server, extracting data:
              final users = snapshot.data;
              if (users.isEmpty) {
                return buildText("No Users Found");
              } else {
                return Column(
                  children: [
                    // ChatHeaderWidget(users: users),
                    buildText(
                        "Hey ${context.read<AuthenticationService>().user.displayName} supp"),
                    ChatBodyWidget(users: users)
                  ],
                );
              }
            }
          }),
    );
  }

  Widget buildText(String text) {
    return Center(child: Text(text, style: TextStyle(fontSize: 24)));
  }
}
