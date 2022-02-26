import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/infra/init.dart';
import 'package:tally_counter/app/shared/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  InfraInit? _infraInit;

  @override
  void initState() {
    _infraInit = Modular.get<InfraInit>();
    super.initState();
  }

  @override
  void dispose() {
    _infraInit = null;
    super.dispose();
  }

  Future<void>? _future() {
    return _infraInit?.ensureInitialized()
      ?..then((value) {
        Modular.to.navigate(AppRoutes.HOME.route);
      });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future(),
      builder: (context, snapshot) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
