import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/infra/init.dart';

import 'splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<InfraInit>(
          (i) => InfraInit(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
      ];
}
