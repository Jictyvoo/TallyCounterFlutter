import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/infra/providers/app_config_provider.dart';

class ThemeChangeNotifier extends InheritedNotifier<ValueNotifier<ThemeMode>> {
  const ThemeChangeNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ThemeChangeNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeChangeNotifier>();
  }

  ThemeMode get themeMode {
    return notifier?.value ?? AppConfigProvider.appConfig.theme;
  }

  set themeMode(ThemeMode mode) {
    notifier?.value = mode;
  }
}
