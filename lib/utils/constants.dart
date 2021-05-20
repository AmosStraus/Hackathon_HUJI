import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// filling the input and password  ///
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

/// The loading widget ///
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.green,
          size: 50.0,
        ),
      ),
    );
  }
}

class SimpleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitChasingDots(
      color: Colors.green,
      size: 50.0,
    ));
  }
}


