import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

import 'register_card.dart';

class RegisterListWidget extends StatelessWidget {
  final List<CounterRegister> registers;

  const RegisterListWidget({Key? key, required this.registers})
      : super(key: key);

  String _formatDate(final DateTime date) {
    final formatter = DateFormat.MMMMEEEEd();
    return formatter.format(date);
  }

  String _formatTime(final DateTime time) {
    final formatter = DateFormat.Hms();
    return formatter.format(time);
  }

  Future<bool?> _onDeleteSnackBar(BuildContext context) async {
    var canDelete = true;
    final snackBar = SnackBar(
      content: const Text('Register deleted!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          canDelete = false;
        },
      ),
    );
    final snackBarController = ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
    // Await the snackBar to be closed, then we know if can delete
    await snackBarController.closed;
    return canDelete;
  }

  Future<bool?> Function(DismissDirection) _canDeleteDismiss(
    BuildContext context,
  ) {
    return (DismissDirection direction) async {
      return _onDeleteSnackBar(context);
    };
  }

  VoidCallback _onDeleteCard(BuildContext context, final int index) {
    return () async {
      _onDeleteSnackBar(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: registers.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(registers[index]),
              direction: DismissDirection.endToStart,
              dismissThresholds: const {
                DismissDirection.endToStart: 0.6,
              },
              confirmDismiss: _canDeleteDismiss(context),
              background: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x00ffffff), Color(0xf3a12a2a)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Delete register from\n',
                          children: [
                            TextSpan(
                              text: _formatDate(registers[index].startTime),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: ' at '),
                            TextSpan(
                              text: _formatTime(registers[index].startTime),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.delete_forever,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              ),
              onDismissed: (direction) {},
              child: RegisterCardWidget(
                counterRegister: registers[index],
                onDeleteCallback: _onDeleteCard(context, index),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        ),
      ),
    );
  }
}
