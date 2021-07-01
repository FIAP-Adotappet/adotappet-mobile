import 'package:flutter/material.dart';

import 'adotappet_icon.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final bool isHome;

  CustomAppBar({
    Key? key,
    this.isHome = false
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      leading: isHome ? AdotappetIcon() : BackButton(color: Colors.black),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.asset('assets/images/avatar.png'),
            ),
          ),
        ),
      ],
    );
  }
}
