import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/infra/init.dart';
import 'package:tally_counter/app/shared/routes.dart';
import 'package:tally_counter/app/shared/widgets/footer.dart';

import 'widgets/rotation_logo.dart';

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
    _startInitJobs();
    super.initState();
  }

  @override
  void dispose() {
    _infraInit = null;
    super.dispose();
  }

  void _startInitJobs() {
    Future.wait([
      _infraInit?.ensureInitialized() ?? Future.value(),
      Future.delayed(const Duration(seconds: 1)),
    ]).then((value) {
      Modular.to.navigate(AppRoutes.HOME.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 110,
          minHeight: 110,
        ),
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
              RotationLogoWidget(),
              LinearProgressIndicator(),
              Expanded(
                flex: 2,
                child: SizedBox.shrink(),
              ),
              WowlsFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
