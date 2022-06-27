import 'package:flutter_modular/flutter_modular.dart';

import 'core/domain/repositories/counter_register_repository.dart';
import 'core/domain/repositories/date_register_repository.dart';
import 'core/domain/repositories/purpose_repository.dart';
import 'core/infra/repositories/counter_register_repository_isar.dart';
import 'core/infra/repositories/date_register_repository_isar.dart';
import 'core/infra/repositories/purpose_repository_isar.dart';
import 'modules/splash/splash_module.dart';
import 'modules/tally_counter/tally_counter_module.dart';
import 'shared/routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CounterRegisterRepository>(
          (i) => CounterRegisterRepositoryIsar(),
        ),
        Bind.factory<DateRegisterRepository>(
          (i) => DateRegisterRepositoryIsar(),
        ),
        Bind.factory<PurposeRepository>((i) => PurposeRepositoryIsar()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.default_.route,
          module: SplashModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          AppRoutes.tallyCounter.route,
          module: TallyCounterModule(),
        ),
      ];
}
