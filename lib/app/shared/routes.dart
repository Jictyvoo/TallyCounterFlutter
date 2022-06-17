enum AppRoutes {
  DEFAULT('/'),
  HOME('/home'),
  REGISTER_LIST('/register-list');

  final String route;

  const AppRoutes(this.route);
}

extension AppRoutesUtil on AppRoutes {
  String get home {
    return '$route/';
  }
}
