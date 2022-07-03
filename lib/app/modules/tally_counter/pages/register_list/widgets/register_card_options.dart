import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/tally_counter_localizations.dart';

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
              children: [
                Text(
                  TallyCounterLocalizations.of(context)?.tallyCardEdit ??
                      'Edit',
                ),
                const Icon(Icons.edit),
              ],
            ),
          ),
          PopupMenuItem(
            value: PopupCardOptions.delete,
            onTap: onDelete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TallyCounterLocalizations.of(context)?.tallyCardDelete ??
                      'Delete',
                ),
                const Icon(Icons.delete_forever_outlined)
              ],
            ),
          ),
        ];
      },
    );
  }
}
