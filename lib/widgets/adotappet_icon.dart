import 'package:flutter/material.dart';

class AdotappetIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(
        image: AssetImage('assets/images/logo.png'),
        width: 100,
        height: 100,
      ),
    );
  }

}