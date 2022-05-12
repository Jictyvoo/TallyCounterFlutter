import 'package:flutter/material.dart';

class RotationLogoWidget extends StatefulWidget {
  const RotationLogoWidget({Key? key}) : super(key: key);

  @override
  State<RotationLogoWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<RotationLogoWidget>
    with TickerProviderStateMixin {
  late final AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    rotationController.repeat();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: RotationTransition(
        turns: Tween(begin: 1.0, end: 0.0).animate(rotationController),
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
