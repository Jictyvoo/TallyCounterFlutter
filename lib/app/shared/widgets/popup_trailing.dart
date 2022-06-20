import 'package:flutter/material.dart';

enum PopupOptions { showAll, showToday }

class PopupTrailing extends StatelessWidget {
  final void Function(PopupOptions)? onTap;

  const PopupTrailing({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupOptions>(
      onSelected: onTap,
      itemBuilder: (internalContext) {
        return [
          PopupMenuItem(
            value: PopupOptions.showAll,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.list),
                SizedBox(width: 6),
                Text("Show all registers"),
              ],
            ),
          ),
          PopupMenuItem(
            value: PopupOptions.showToday,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.calendar_today),
                SizedBox(width: 6),
                Text("Show today registers")
              ],
            ),
          ),
        ];
      },
    );
  }
}
