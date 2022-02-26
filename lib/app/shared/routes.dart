enum AppRoutes {
  DEFAULT,
  HOME,
  REGISTER_LIST,
}

extension AppRoutesUtil on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.DEFAULT:
        return '/';
      case AppRoutes.HOME:
        return '/home';
      case AppRoutes.REGISTER_LIST:
        return '/register-list';
    }
  }

  String get home {
    return '$route/';
  }
}
