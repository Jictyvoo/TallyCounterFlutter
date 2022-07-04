import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/infra/providers/app_config_provider.dart';
import 'shared/utils/app_config.dart';
import 'shared/widgets/inherited/app_config_change_notifier.dart';

class TallyApp extends StatelessWidget {
  const TallyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = ValueNotifier(AppConfigProvider.appConfig);
    return ValueListenableBuilder<AppConfig>(
      valueListenable: notifier,
      builder: (context, config, child) {
        return AppConfigChangeNotifier(
          notifier: notifier,
          child: MaterialApp.router(
            title: 'Tally Counter',
            themeMode: config.theme,
            theme: ThemeData.light().copyWith(useMaterial3: true),
            darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          ),
        );
      },
    );
  }
}
