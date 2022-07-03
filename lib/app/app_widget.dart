import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/tally_counter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TallyApp extends StatelessWidget {
  const TallyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tally Counter',
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(useMaterial3: true),
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
      localizationsDelegates: const [
        TallyCounterLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: TallyCounterLocalizations.supportedLocales,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
