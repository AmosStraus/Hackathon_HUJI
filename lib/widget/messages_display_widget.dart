import 'package:flutter/material.dart';
import 'package:huji_hackathon/databases/firebase_api.dart';
import 'package:huji_hackathon/model/message.dart';
import 'package:huji_hackathon/widget/message_widget.dart';

class MessagesDisplayWidget extends StatelessWidget {
  final String idUser;
  const MessagesDisplayWidget({Key key, @required this.idUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: FirebaseApi.getMessages(idUser),
        builder: (context, snapshot) {
          final messages = snapshot.data;

          return messages?.isEmpty ?? false
              ? buildText("Say Hi..")
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  itemCount: messages?.length ?? 0,
                  itemBuilder: (context, index) {
                    // TODO: REMOVE LATER
                    final message = messages[index];
                    return MessageWidget(
                        message: message,
                        isMe: message.idUser == 'wcWF55gw1IdrAz4Bld7K');
                  });
        });
  }

  Widget buildText(String text) {
    return Center(child: Text(text, style: TextStyle(fontSize: 24)));
  }
}
