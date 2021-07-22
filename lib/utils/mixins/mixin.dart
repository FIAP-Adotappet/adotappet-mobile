import 'package:flutter/material.dart';

mixin Login<T extends StatefulWidget> on State<T> {
  var leftSlide;
  var size;

  @override
  void initState() {
    super.initState();
    leftSlide = 0.0;
  }

  showHideUser() {
    this.setState(() {
      if (leftSlide == 0.0) {
        leftSlide = MediaQuery
            .of(context)
            .size
            .width * 0.6;
      } else {
        leftSlide = 0.0;
      }
    });
  }
}