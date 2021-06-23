import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.child, this.radius = 15})
      : super(key: key);

  final Widget child;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.withOpacity(.35), Colors.white],
        ),
      ),
    );
  }
}
