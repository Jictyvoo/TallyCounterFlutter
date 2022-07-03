import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/tally_counter_localizations.dart';

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
              children: [
                const Icon(Icons.list),
                const SizedBox(width: 6),
                Text(
                  TallyCounterLocalizations.of(internalContext)?.tallyShowAll ??
                      "Show All Tally's",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: PopupOptions.showToday,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 6),
                Text(
                  TallyCounterLocalizations.of(internalContext)
                          ?.tallyShowToday ??
                      "Show today Tally's",
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
