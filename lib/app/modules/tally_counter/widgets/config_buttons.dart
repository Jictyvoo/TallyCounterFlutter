import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class ConfigButtons {
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
