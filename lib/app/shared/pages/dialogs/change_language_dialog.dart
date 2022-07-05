import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tally_counter/app/shared/utils/extensions/locale_name.dart';
import 'package:tally_counter/app/shared/widgets/inherited/app_config_change_notifier.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({Key? key}) : super(key: key);

  Iterable<Locale>? locales(BuildContext context) {
    return context
        .findAncestorWidgetOfExactType<MaterialApp>()
        ?.supportedLocales;
  }

  void _changeLocale(BuildContext context, Locale? locale) {
    final notifier = AppConfigChangeNotifier.of(context);
    notifier?.locale = locale;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        AppLocalizations.of(context)?.changeLocaleLabel ?? 'Change language',
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      children: [
        for (final localeName in locales(context) ?? <Locale>[].reversed)
          ListTile(
            title: Text(localeName.nativeName),
            onTap: () {
              Navigator.pop(context);
              _changeLocale(context, localeName);
            },
          ),
        Align(
          alignment: Alignment.bottomRight,
          child: ButtonBar(
            children: [
              TextButton(
                style: TextButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)?.cancel ?? 'Cancel',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _changeLocale(context, null);
                },
                child: Text(
                  AppLocalizations.of(context)?.useSystemLocale ??
                      'Use system language',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
