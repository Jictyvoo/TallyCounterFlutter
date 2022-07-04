import 'package:flutter/material.dart';

import 'version_label.dart';

enum _AppConfigKey { themeMode, locale, dbVersion, clickDelayDuration }

class AppConfig {
  static const _defaultDuration = 5;
  final ThemeMode theme;
  final Locale? locale;
  final VersionLabel databaseVersion;
  final Duration multiClickDuration;

  const AppConfig(
    this.databaseVersion, {
    this.multiClickDuration = const Duration(milliseconds: _defaultDuration),
    this.theme = ThemeMode.system,
    this.locale,
  });

  Map<String, String> toJson() => {
        _AppConfigKey.dbVersion.name: databaseVersion.toString(),
        _AppConfigKey.clickDelayDuration.name:
            multiClickDuration.inMilliseconds.toString(),
        _AppConfigKey.themeMode.name: theme.name,
        _AppConfigKey.locale.name: locale?.toString() ?? '',
      };

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    final themeName = map[_AppConfigKey.themeMode.name] ?? '';
    var theme = ThemeMode.system;
    for (final ThemeMode mode in ThemeMode.values) {
      if (mode.name == themeName) {
        theme = mode;
        break;
      }
    }

    final localeString = map[_AppConfigKey.locale.name] ?? '';
    Locale? parsedLocale;
    if (localeString.isNotEmpty) {
      final spliced = localeString.split('_');
      if (spliced.length == 2) {
        parsedLocale = Locale.fromSubtags(
          languageCode: spliced[0],
          countryCode: spliced[1],
        );
      } else if (spliced.length == 1) {
        parsedLocale = Locale(spliced[0]);
      }
    }

    return AppConfig(
      VersionLabel.fromString(map[_AppConfigKey.dbVersion.name] ?? 'v0.0.0'),
      multiClickDuration: Duration(
        milliseconds:
            int.tryParse(map[_AppConfigKey.clickDelayDuration.name] ?? '') ??
                _defaultDuration,
      ),
      theme: theme,
      locale: parsedLocale,
    );
  }

  AppConfig copyWith({
    ThemeMode? theme,
    Locale? locale,
    bool useSystemLocale = false,
    VersionLabel? databaseVersion,
    Duration? multiClickDuration,
  }) {
    return AppConfig(
      databaseVersion ?? this.databaseVersion,
      theme: theme ?? this.theme,
      locale: useSystemLocale ? null : locale ?? this.locale,
      multiClickDuration: multiClickDuration ?? this.multiClickDuration,
    );
  }
}
