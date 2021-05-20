import 'package:flutter/material.dart';
import 'package:huji_hackathon/authenticate_try2/authentication_service.dart';
import 'package:provider/provider.dart';

final textInputDecoration = InputDecoration(
  fillColor: Colors.grey[100],
  alignLabelWithHint: true,
  filled: true,
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 0),
    gapPadding: 10,
    borderRadius: BorderRadius.circular(18),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown, width: 2.5),
    gapPadding: 10,
    borderRadius: BorderRadius.circular(18),
  ),
);

class AddNewTrip extends StatefulWidget {
  AddNewTrip({Key key}) : super(key: key);

  @override
  _AddNewTripState createState() => _AddNewTripState();
}

class _AddNewTripState extends State<AddNewTrip> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Center(
                  child: Text("Add a trip",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(labelText: "Email"),
              style: TextStyle(fontSize: 20.0),
              validator: (val) => val.isEmpty ? "login with your email" : null,
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(labelText: "Password"),
              style: TextStyle(fontSize: 20.0),
              validator: (val) => val.length < 4 ? "Password too short" : null,
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
    );
  }
}
