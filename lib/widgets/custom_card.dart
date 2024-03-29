import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      required this.child,
      this.radius = 15,
      required this.routeName,
      required this.arguments})
      : super(key: key);

  final Widget child;

  final double radius;

  final String routeName;

  final Object? arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
      height: 106,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName, arguments: arguments);
        },
        child: Card(
          child: child,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}
