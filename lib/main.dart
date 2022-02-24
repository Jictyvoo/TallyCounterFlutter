import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var defaultSystemLocale = '';
  if (!kIsWeb) {
    // Get the initial locale values
    defaultSystemLocale = Platform.localeName;
  } else {
    final currentSystemLocales = WidgetsBinding.instance?.window.locales;
    defaultSystemLocale = currentSystemLocales?.first.languageCode ?? 'pt_BR';
  }
  Intl.defaultLocale = defaultSystemLocale;
  runApp(ModularApp(
    module: AppModule(),
    child: const TallyApp(),
  ));
}
