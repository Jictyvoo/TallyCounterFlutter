import 'package:flutter/material.dart';

typedef ItemBuilder = Widget Function(BuildContext);
typedef TitleBuilder = Text Function(BuildContext, {TextStyle? style});

class SettingsViewModel {
  final TitleBuilder titleBuilder;
  final List<ItemBuilder> actionsBuilder;

  const SettingsViewModel({
    required this.titleBuilder,
    required this.actionsBuilder,
  });
}
