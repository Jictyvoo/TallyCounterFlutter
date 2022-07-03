import 'package:flutter/material.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';

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
                Text(TallyCounterLocalizations.of(context).tallyCardEdit),
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
                Text(TallyCounterLocalizations.of(context).tallyCardDelete),
                const Icon(Icons.delete_forever_outlined)
              ],
            ),
          ),
        ];
      },
    );
  }
}
