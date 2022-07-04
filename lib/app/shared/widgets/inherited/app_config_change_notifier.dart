import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/infra/providers/app_config_provider.dart';
import 'package:tally_counter/app/shared/utils/app_config.dart';

class AppConfigChangeNotifier
    extends InheritedNotifier<ValueNotifier<AppConfig>> {
  const AppConfigChangeNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static AppConfigChangeNotifier? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppConfigChangeNotifier>();
  }

  void refreshTheme() {
    notifier?.value = AppConfigProvider.appConfig;
  }

  void _updateConfig(AppConfig newConfig) {
    AppConfigProvider.updateConfig(newConfig).then((success) {
      if (success) {
        notifier?.value = newConfig;
      }
    });
  }

  set locale(Locale? locale) {
    final config = AppConfigProvider.appConfig.copyWith(
      locale: locale,
      useSystemLocale: locale == null,
    );
    _updateConfig(config);
  }

  ThemeMode get themeMode {
    return notifier?.value.theme ?? AppConfigProvider.appConfig.theme;
  }

  set themeMode(ThemeMode mode) {
    final config = AppConfigProvider.appConfig.copyWith(
      theme: mode,
    );
    _updateConfig(config);
  }
}
