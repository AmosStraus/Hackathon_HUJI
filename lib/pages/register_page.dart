import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:huji_hackathon/authenticate_try2/authentication_service.dart';
import 'package:huji_hackathon/databases/auth.dart';
import 'package:huji_hackathon/utils/constants.dart';

class Register extends StatefulWidget {
  final Function toggleFunc;
  Register({this.toggleFunc});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String name = "";
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.green[200],
            appBar: AppBar(
              backgroundColor: Colors.green[600],
              title: Text('Register to TripApp'),
              actions: [
                TextButton.icon(
                    onPressed: widget.toggleFunc,
                    icon: Icon(Icons.person_pin),
                    label: Text('Sign In'))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Center(
                          child: Text("REGISTER",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                      height: 100,
                      width: 100,
                    ),
                    // ADD PHOTO IF WANT TO
                    // Image.asset(
                    //   ("lib/assets/logo.png"),
                    //   scale: 0.1,
                    //   width: 150,
                    //   height: 150,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Email'),
                      style: TextStyle(fontSize: 20.0),
                      validator: (val) =>
                          val.isEmpty ? "Enter your Email" : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Password'),
                      style: TextStyle(fontSize: 20.0),
                      validator: (val) =>
                          val.length < 6 ? "Password too short" : null,
                      onChanged: (val) {
                        // for password
                        setState(() => password = val);
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Your name'),
                      style: TextStyle(fontSize: 20.0),
                      validator: (val) =>
                          val.isEmpty ? "Enter your name" : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await context.read<AuthenticationService>().signUp(
                                email: email,
                                password: password,
                              );
                        }
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ANON",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                      onPressed: () async {
                        // setState(() => loading = true);
                        // dynamic result = await _auth.signInAnonymously();
                        // print(result);
                        // if (result == null && this.mounted) {
                        //   setState(() {
                        //     error = "Already Registered or Invalid Email";
                        //     loading = false;
                        //   });
                        // } else {
                        //   setState(() => loading = false);
                        // }
                      },
                    ),
                    // GoogleSignInButton(
                    //   onPressed: () async {
                    //     await _auth.googleSignIn();
                    //   },
                    // ),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 20.0)),
                  ],
                ),
              ),
            ),
          );
  }
}
