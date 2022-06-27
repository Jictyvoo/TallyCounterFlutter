enum AppRoutes {
  default_('/'),
  tallyCounter('/home');

  final String route;

  const AppRoutes(this.route);
}

extension AppRoutesUtil on AppRoutes {
  String get home {
    return '$route/';
  }
}
