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
              children: const [Icon(Icons.list), Text("Show all registers")],
            ),
          ),
          PopupMenuItem(
            value: PopupOptions.showToday,
            child: Row(
              children: const [
                Icon(Icons.calendar_today),
                Text("Show today registers")
              ],
            ),
          ),
        ];
      },
    );
  }
}
