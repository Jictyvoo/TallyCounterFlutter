import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

class RegisterCardWidget extends StatelessWidget {
  final CounterRegister counterRegister;

  const RegisterCardWidget({Key? key, required this.counterRegister})
      : super(key: key);

  String _formatDate(final DateTime dateTime) {
    final formatDate = DateFormat.yMd();
    final formatTime = DateFormat.Hm();
    return '${formatDate.format(dateTime)} - ${formatTime.format(dateTime)}';
  }

  String get _duration {
    final formatTime = DateFormat.Hms();
    return formatTime.format(DateTime(0).add(counterRegister.duration));
  }

  Widget _buildValueContainer(int value, {final Color? color}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(26),
        ),
      ),
      child: Center(
        child: Text(value.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.calendar_today_outlined),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(_formatDate(counterRegister.startTime)),
                    Text(_formatDate(counterRegister.endTime)),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Split Duration: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 26),
                Text(_duration)
              ],
            ),

            // Show old and new values
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Value Changes: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 26),
                Expanded(
                  child: _buildValueContainer(
                    counterRegister.oldValue,
                    color: const Color(0xff4e4ed2),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildValueContainer(
                    counterRegister.newValue,
                    color: const Color(0xfa69d455),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
