import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

class RegisterCardWidget extends StatelessWidget {
  final CounterRegister counterRegister;

  const RegisterCardWidget({Key? key, required this.counterRegister})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text(counterRegister.startTime.toIso8601String()),
              Text(counterRegister.endTime.toIso8601String()),
            ],
          ),
          Text(counterRegister.duration.toString()),
        ],
      ),
    );
  }
}
