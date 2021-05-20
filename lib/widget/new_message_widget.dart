import 'package:flutter/material.dart';
import 'package:huji_hackathon/databases/firebase_api.dart';

class NewMessageWidget extends StatefulWidget {
  final String idUser;

  const NewMessageWidget({Key key, this.idUser}) : super(key: key);
  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';

  void sendMessage() async {
    // remove keyboard on pressing //
    FocusScope.of(context).unfocus();
    print(widget.idUser);
    await FirebaseApi.uploadMessage(widget.idUser, message);

    _controller.clear();
    setState(() {
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: 'Type your message',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (value) => setState(() => message = value),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: message.trim().isEmpty ? null : sendMessage,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                ),
                child: Icon(Icons.send, color: Colors.white),
              ),
            )
          ],
        ));
  }
}
