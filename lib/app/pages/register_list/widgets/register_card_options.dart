import 'package:flutter/material.dart';

enum PopupCardOptions { delete, edit }

class RegisterCardOptions extends StatelessWidget {
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const RegisterCardOptions({
    Key? key,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupCardOptions>(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: PopupCardOptions.edit,
            onTap: onEdit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Edit'), Icon(Icons.edit)],
            ),
          ),
          PopupMenuItem(
            value: PopupCardOptions.delete,
            onTap: onDelete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Delete'),
                Icon(Icons.delete_forever_outlined)
              ],
            ),
          ),
        ];
      },
    );
  }
}
