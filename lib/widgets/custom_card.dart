import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required this.child, this.radius = 15, required this.nextPage})
      : super(key: key);

  final Widget child;

  final double radius;

  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
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
