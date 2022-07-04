import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

class RegisterEditPage extends StatelessWidget {
  final CounterRegister? counterRegister;

  const RegisterEditPage({Key? key, this.counterRegister}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
    );
  }
}
