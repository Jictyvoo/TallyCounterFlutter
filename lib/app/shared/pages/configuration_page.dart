import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tally_counter/app/core/infra/providers/app_config_provider.dart';
import 'package:tally_counter/app/shared/utils/global_constants.dart';
import 'package:tally_counter/app/shared/widgets/inherited/theme_change_notifier.dart';
import 'package:tally_counter/app/shared/widgets/theme_change_button.dart';

typedef ItemBuilder = Widget Function(BuildContext);

class ConfigurationPage extends StatelessWidget {
  static const defaultSettings = ["theme", "about"];
  final Map<String, List<ItemBuilder>> extraSettings;

  const ConfigurationPage({Key? key, this.extraSettings = const {}})
      : super(key: key);

  Widget _buildDefaultItems(BuildContext context, String settingName) {
    switch (settingName) {
      case "theme":
        return Card(
          child: ThemeChangeButton(
            onThemeChanged: (ThemeMode themeMode) {
              final newConfig = AppConfigProvider.appConfig.copyWith(
                theme: themeMode,
              );
              AppConfigProvider.updateConfig(newConfig).then((success) {
                if (success) {
                  ThemeChangeNotifier.of(context)?.themeMode = themeMode;
                }
              });
            },
            originThemeMode: AppConfigProvider.appConfig.theme,
          ),
        );
      case "about":
        return Card(
          child: AboutListTile(
            icon: const Icon(Icons.info),
            applicationName: 'Tally Counter',
            applicationIcon: const Icon(Icons.touch_app),
            applicationVersion:
                AppConfigProvider.appConfig.databaseVersion.toString(),
            applicationLegalese: GlobalConstants.legalese,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildExtraItems(int index, BuildContext context) {
    ItemBuilder? builder;
    final keys = extraSettings.keys;
    var cumulativeIndex = defaultSettings.length;
    var titleText = '';
    keyLoop:
    for (final key in keys) {
      if (index == cumulativeIndex) {
        titleText = key;
        break keyLoop;
      }
      for (final itemBuilder in extraSettings[key] ?? []) {
        cumulativeIndex += 1;
        if (index == cumulativeIndex) {
          builder = itemBuilder;
          break keyLoop;
        }
      }
    }

    if (titleText.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(),
          ],
        ),
      );
    }
    if (builder != null) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: builder.call(context),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < defaultSettings.length) {
      final setting = defaultSettings[index];
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: _buildDefaultItems(context, setting),
        ),
      );
    } else {
      return _buildExtraItems(index, context);
    }
  }

  int get _totalItems =>
      defaultSettings.length +
      extraSettings.length +
      extraSettings.values.fold(
        0,
        (previousValue, element) => previousValue + element.length,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.configuration ?? 'Settings',
        ),
      ),
      body: ListView.builder(
        itemCount: _totalItems,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: _itemBuilder,
      ),
    );
  }
}
