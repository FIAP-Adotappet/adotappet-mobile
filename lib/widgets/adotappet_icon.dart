import 'package:flutter/material.dart';

class AdotappetIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, right: 20, left: 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(-0.85, 0),
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        width: 70.0,
        child: null);
  }
}
