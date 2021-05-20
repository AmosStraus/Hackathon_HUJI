import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:huji_hackathon/pages/authenticate_page.dart';
import 'package:huji_hackathon/pages/main_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return AuthenticatePage();
    } else
      return MainPage();
  }
}
