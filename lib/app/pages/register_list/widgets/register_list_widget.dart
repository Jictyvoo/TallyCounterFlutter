import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

import 'register_card.dart';

class RegisterListWidget extends StatefulWidget {
  final List<CounterRegister> registers;
  final void Function(CounterRegister)? onDeleteCallback;

  const RegisterListWidget({
    Key? key,
    required this.registers,
    this.onDeleteCallback,
  }) : super(key: key);

  @override
  State<RegisterListWidget> createState() => _RegisterListWidgetState();
}

class _RegisterListWidgetState extends State<RegisterListWidget> {
  var _registerList = const <CounterRegister>[];

  @override
  void initState() {
    _registerList = widget.registers;
    super.initState();
  }

  String _formatDate(final DateTime date) {
    final formatter = DateFormat.MMMMEEEEd();
    return formatter.format(date);
  }

  String _formatTime(final DateTime time) {
    final formatter = DateFormat.Hms();
    return formatter.format(time);
  }

  Future<bool?> _onDeleteSnackBar(final BuildContext context) async {
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
    final BuildContext context,
  ) {
    return (DismissDirection direction) async {
      return _onDeleteSnackBar(context);
    };
  }

  void _deleteRegister(final CounterRegister register) {
    widget.onDeleteCallback?.call(register);
  }

  VoidCallback _onDeleteCard(final BuildContext context, final int index) {
    return () async {
      final originalList = _registerList;
      _registerList = _registerList.toList();
      setState(() {
        _registerList.removeAt(index);
      });
      final canDelete = await _onDeleteSnackBar(context) ?? false;
      if (!canDelete) {
        setState(() {
          _registerList = originalList;
        });
      } else {
        // Call delete without redraw the screen
        _deleteRegister(originalList[index]);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: _registerList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(_registerList[index]),
              direction: DismissDirection.endToStart,
              dismissThresholds: const {
                DismissDirection.endToStart: 0.6,
              },
              confirmDismiss: _canDeleteDismiss(context),
              onDismissed: (direction) {
                _deleteRegister(_registerList[index]);
              },
              background: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DecoratedBox(
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
                                text:
                                    _formatDate(_registerList[index].startTime),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: ' at '),
                              TextSpan(
                                text:
                                    _formatTime(_registerList[index].startTime),
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
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: RegisterCardWidget(
                  counterRegister: _registerList[index],
                  onDeleteCallback: _onDeleteCard(context, index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
