import 'package:flutter/material.dart';

class UserTransform extends StatelessWidget {
  const UserTransform({Key? key, required this.leftSlide, required this.child})
      : super(key: key);

  final double leftSlide;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..translate(-leftSlide),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.grey.shade200, Colors.white]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
