import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';

import 'register_card_options.dart';

class RegisterCardWidget extends StatelessWidget {
  final CounterRegister counterRegister;
  final VoidCallback? onDeleteCallback;
  final VoidCallback? onEditCallback;

  const RegisterCardWidget({
    Key? key,
    required this.counterRegister,
    this.onDeleteCallback,
    this.onEditCallback,
  }) : super(key: key);

  String _formatDate(final DateTime dateTime) {
    final formatDate = DateFormat.yMd();
    return formatDate.format(dateTime);
  }

  String _formatTime(final DateTime dateTime) {
    final formatTime = DateFormat.Hm();
    return formatTime.format(dateTime);
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
        child: Text(
          value.toString(),
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }

  Widget _buildDateElement(final DateTime dateTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(_formatDate(dateTime)),
        Text(_formatTime(dateTime)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        TallyCounterLocalizations.of(context)
                            .tallyCardPurposeLabel,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      Text(counterRegister.purpose.name),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(Icons.calendar_today_outlined),
                    Expanded(
                      child: Column(
                        children: [
                          _buildDateElement(counterRegister.startTime),
                          _buildDateElement(counterRegister.endTime),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      TallyCounterLocalizations.of(context)
                          .tallyCardDurationLabel,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 26),
                    Text(_duration)
                  ],
                ),

                // Show old and new values
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TallyCounterLocalizations.of(context)
                          .tallyCardValuesLabel,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                        color: const Color(0xfa39802c),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: RegisterCardOptions(
                onDelete: onDeleteCallback,
                onEdit: onEditCallback,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
