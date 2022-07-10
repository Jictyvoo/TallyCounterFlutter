import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';
import 'package:tally_counter/app/modules/tally_counter/pages/counter/purpose_store.dart';

abstract class ConfigButtons {
  static Text buildTitle(BuildContext context, {TextStyle? style}) {
    final purposeTitle = TallyCounterLocalizations.of(
      context,
    ).configPurposeTitle;
    final selectedPurpose = Modular.get<PurposeStore>().selectedPurpose.name;
    return Text('$purposeTitle: `$selectedPurpose`', style: style);
  }

  static void _unimplementedAlert(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unimplemented'),
        content: const Text('This feature is not yet implemented.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  static Widget buildChangeDelay(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.timer_outlined),
        title: Text(
          AppLocalizations.of(context)?.purposeChangeDelayDurationLabel ??
              'Change click delay duration',
        ),
        onTap: () {
          _unimplementedAlert(context);
        },
      ),
    );
  }

  static Widget buildIncrementValue(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.plus_one),
        title: Text(
          AppLocalizations.of(context)?.purposeChangeIncrementValueLabel ??
              'Change value of increment button',
        ),
        onTap: () {
          _unimplementedAlert(context);
        },
      ),
    );
  }
}
