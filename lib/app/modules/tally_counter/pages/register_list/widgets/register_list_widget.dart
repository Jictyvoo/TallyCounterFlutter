import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';

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
  final scrollController = ScrollController();

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
      content: Text(
        TallyCounterLocalizations.of(context).tallyListRegisterDeleted,
      ),
      action: SnackBarAction(
        label: TallyCounterLocalizations.of(context).undo,
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
      if (!canDelete && mounted) {
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
      thumbVisibility: true,
      controller: scrollController,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: _registerList.length,
          itemBuilder: (context, index) {
            final counterRegister = _registerList[index];
            return Dismissible(
              key: ValueKey(counterRegister),
              direction: DismissDirection.endToStart,
              dismissThresholds: const {
                DismissDirection.endToStart: 0.6,
              },
              confirmDismiss: _canDeleteDismiss(context),
              onDismissed: (direction) {
                _deleteRegister(counterRegister);
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
                            text: '${TallyCounterLocalizations.of(
                              context,
                            ).tallyListDeleteRegisterHint}\n',
                            children: [
                              TextSpan(
                                text: _formatDate(counterRegister.startTime),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${TallyCounterLocalizations.of(
                                  context,
                                ).atTime} ',
                              ),
                              TextSpan(
                                text: _formatTime(counterRegister.startTime),
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
                  counterRegister: counterRegister,
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
