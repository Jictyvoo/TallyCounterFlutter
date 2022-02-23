import 'package:flutter/material.dart';

enum PopupOptions {
  notRemember
}

class PopupTrailing extends StatelessWidget {
  const PopupTrailing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupOptions>(itemBuilder: (context) {
      return [
        const PopupMenuItem(
          child: Text("I don't remember"),
        ),
      ];
    });
  }
}
