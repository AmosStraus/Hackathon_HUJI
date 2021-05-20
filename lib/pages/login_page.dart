import 'package:flutter/material.dart';
import 'package:huji_hackathon/authenticate_try2/authentication_service.dart';
import 'package:huji_hackathon/utils/constants.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final Function toggleFunc;
  Login({this.toggleFunc});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
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
              title: Text('Login for TripApp'),
              actions: [
                TextButton.icon(
                    onPressed: widget.toggleFunc,
                    icon: Icon(Icons.person),
                    label: Text('Register'))
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
                          child: Text("SIGN IN",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                      width: 100,
                      height: 100,
                    ),
                    // IF WE WANNA ADD SOME PICUTRE HERE
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
                          textInputDecoration.copyWith(labelText: "Email"),
                      style: TextStyle(fontSize: 20.0),
                      validator: (val) =>
                          val.isEmpty ? "login with your email" : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(labelText: "Password"),
                      style: TextStyle(fontSize: 20.0),
                      validator: (val) =>
                          val.length < 4 ? "Password too short" : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      obscureText: true,
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
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await context.read<AuthenticationService>().signIn(
                                email: email.trim(),
                                password: password.trim(),
                              );
                        }
                      },
                    ),
                    // GoogleAuthButton(
                    //   onPressed: () async {
                    //   await _auth.googleSignIn();
                    //   },
                    // ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
