import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:huji_hackathon/authenticate_try/signup_page.dart';
import 'package:huji_hackathon/pages/main_page.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds:
          result != null ? MainPage() : SignUpPage(title: "Hello Sign up"),
      title: new Text(
        'Welcome to Trip App!\nPlanning your next Trip',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      // add an image if you like:
      // image: Image.asset(name, fit: BoxFit.scaleDown)
      // photoSize: 100,
      loaderColor: Colors.amber,
    );
  }
}
