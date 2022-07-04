import 'package:tally_counter/app/shared/routes.dart';

enum TallyRoutes {
  default_('/'),
  registerList('/register-list'),
  editRegister('/edit-register');

  final String route;

  const TallyRoutes(this.route);
}

extension TallyRoutesUtil on TallyRoutes {
  String get home {
    return '$route/';
  }

  String get absoluteRoute {
    return '${AppRoutes.tallyCounter.route}$route';
  }
}
