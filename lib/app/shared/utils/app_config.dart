import 'package:flutter/material.dart';

import 'version_label.dart';

enum _AppConfigKey { themeMode, dbVersion, clickDelayDuration }

class AppConfig {
  static const _defaultDuration = 5;
  final ThemeMode theme;
  final VersionLabel databaseVersion;
  final Duration multiClickDuration;

  const AppConfig(
    this.databaseVersion, {
    this.multiClickDuration = const Duration(milliseconds: _defaultDuration),
    this.theme = ThemeMode.system,
  });

  Map<String, String> toJson() => {
        _AppConfigKey.dbVersion.name: databaseVersion.toString(),
        _AppConfigKey.clickDelayDuration.name:
            multiClickDuration.inMilliseconds.toString(),
        _AppConfigKey.themeMode.name: theme.name,
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

    return AppConfig(
      VersionLabel.fromString(map[_AppConfigKey.dbVersion.name] ?? 'v0.0.0'),
      multiClickDuration: Duration(
        milliseconds:
            int.tryParse(map[_AppConfigKey.clickDelayDuration.name] ?? '') ??
                _defaultDuration,
      ),
      theme: theme,
    );
  }

  AppConfig copyWith({
    ThemeMode? theme,
    VersionLabel? databaseVersion,
    Duration? multiClickDuration,
  }) {
    return AppConfig(
      databaseVersion ?? this.databaseVersion,
      theme: theme ?? this.theme,
      multiClickDuration: multiClickDuration ?? this.multiClickDuration,
    );
  }
}
