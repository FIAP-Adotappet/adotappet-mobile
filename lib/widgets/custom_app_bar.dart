import 'package:adotappet/globals.dart';
import 'package:flutter/material.dart';

import 'adotappet_icon.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final bool isHome;
  final VoidCallback onAvatarClick;

  CustomAppBar(
      {Key? key,
      this.isHome = false,
      required this.onAvatarClick})
      : preferredSize = Size.fromHeight(65.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: isHome
          ? AdotappetIcon()
          : Container(
              alignment: Alignment(-0.95, 0),
              margin: const EdgeInsets.only(top: 10.0),
              child: BackButton(color: Colors.grey[600])),
      actions: [
        Container(
          margin: const EdgeInsets.only(
            right: 25,
            top: 20.0,
          ),
          child: GestureDetector(
                  onTap: onAvatarClick,
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset('assets/images/avatar_deslogado.png'),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
