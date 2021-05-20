import 'package:flutter/material.dart';
import 'package:huji_hackathon/authenticate_try2/authentication_service.dart';
import 'package:huji_hackathon/pages/authenticate_page.dart';
import 'package:huji_hackathon/pages/main_page.dart';
import 'package:provider/provider.dart';

class LogoutBurgerWidget extends StatelessWidget {
  LogoutBurgerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, size: 35.0),
      color: Colors.red[100],
      onSelected: (String value) {
        switch (value) {
          case 'התנתקות':
            // Navigator.of(context).pop();
            showAlertDialog(context);
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'דף ראשי',
            child: Text(
              'דף ראשי',
              style: TextStyle(fontSize: 22),
            ),
          ),
          PopupMenuItem<String>(
            value: 'דיווח חודשי',
            child: Text(
              'דיווח חודשי',
              style: TextStyle(fontSize: 22),
            ),
          ),
          PopupMenuItem<String>(
            value: 'התנתקות',
            child: Text(
              'התנתקות',
              style: TextStyle(fontSize: 22),
            ),
          )
        ];
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("לא", style: TextStyle(fontSize: 22)),
      onPressed: () {
        Navigator.pop(context, false);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("כן", style: TextStyle(fontSize: 22)),
      onPressed: () async {
        context.read<AuthenticationService>().signOut();
        Navigator.pop(context, true);
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AuthenticatePage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("התנתקות", style: TextStyle(fontSize: 22)),
      content: Text("?האם תרצה להתנתק", style: TextStyle(fontSize: 22)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
