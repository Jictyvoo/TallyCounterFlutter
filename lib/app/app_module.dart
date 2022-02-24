import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/home_page.dart';

import 'core/domain/repositories/counter_register_repository.dart';
import 'core/infra/repositories/counter_register_repository_memory.dart';
import 'pages/register_list/register_list_page.dart';
import 'pages/register_list/register_list_store.dart';
import 'shared/routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<CounterRegisterRepository>(
          (i) => CounterRegisterRepositoryMemory(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.DEFAULT.route,
          child: (context, args) => const HomePage(
            title: 'Tally Counter App',
          ),
        ),
        ChildRoute(
          AppRoutes.REGISTER_LIST.route,
          child: (context, args) => RegisterListPage(
            store: RegisterListStore(),
          ),
        ),
      ];
}