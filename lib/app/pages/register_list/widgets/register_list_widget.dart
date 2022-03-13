import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

import 'register_card.dart';

class RegisterListWidget extends StatelessWidget {
  final List<CounterRegister> registers;

  const RegisterListWidget({Key? key, required this.registers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: registers.length,
          itemBuilder: (context, index) {
            return RegisterCardWidget(counterRegister: registers[index]);
          },
        ),
      ),
    );
  }
}
