import 'package:flutter_modular/flutter_modular.dart';

import 'pages/counter/counter_store.dart';
import 'pages/counter/purpose_store.dart';
import 'pages/register_list/register_list_page.dart';
import 'pages/register_list/register_list_store.dart';
import 'tally_counter_page.dart';
import 'tally_routes.dart';

class TallyCounterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<CounterStore>((i) => CounterStore()),
        Bind.factory<PurposeStore>((i) => i<CounterStore>()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const TallyPage(title: 'Tally Counter App'),
        ),
        ChildRoute(
          TallyRoutes.registerList.route,
          child: (context, args) => RegisterListPage(
            store: RegisterListStore(),
            fromDate: args.data,
          ),
        ),
      ];
}
