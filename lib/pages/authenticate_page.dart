import 'package:flutter/material.dart';
import 'package:huji_hackathon/pages/login_page.dart';
import 'package:huji_hackathon/pages/register_page.dart';

class AuthenticatePage extends StatefulWidget {
  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn; 
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(toggleFunc: toggleView);
    } else {
      return Register(toggleFunc: toggleView);
    }
  }
}
