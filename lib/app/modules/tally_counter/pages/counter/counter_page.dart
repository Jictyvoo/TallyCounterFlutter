import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';

import 'counter_store.dart';
import 'dialogs/change_value_dialog.dart';
import 'widgets/pause_duration_timer_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterStore _store;

  @override
  void initState() {
    super.initState();
    _store = Modular.get<CounterStore>();
  }

  Widget _buildPauseDuration() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${TallyCounterLocalizations.of(context).counterPausedFor}: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        PauseDurationTimerWidget(
          elapsedPauseTime: _store.pauseDuration,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          TallyCounterLocalizations.of(context).counterValueLabel,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 100, minHeight: 100),
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ChangeValueDialog(
                    initialValue: _store.value,
                    changeValue: (value) {
                      setState(() {
                        _store.setNewValue(value);
                      });
                    },
                  );
                },
              );
            },
            style: TextButton.styleFrom(
              shape: const CircleBorder(
                side: BorderSide.none,
              ),
              primary: const Color(0xFFD73E7A),
            ),
            child: Text(
              '${_store.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (_store.isPaused) _buildPauseDuration(),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonBar(
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Hero(
                    tag: 'decrement_button@HERO',
                    child: Tooltip(
                      message: TallyCounterLocalizations.of(context)
                          .decrementTooltip,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _store.decrement();
                          });
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Reset',
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _store.resetValue();
                        });
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ),
                  Hero(
                    tag: 'increment_button@HERO',
                    child: Tooltip(
                      message: TallyCounterLocalizations.of(context)
                          .incrementTooltip,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _store.increment();
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
              FractionallySizedBox(
                widthFactor: 0.92,
                child: ElevatedButton(
                  child: _store.isPaused
                      ? const Icon(Icons.play_arrow)
                      : const Icon(Icons.pause),
                  onPressed: () {
                    setState(() {
                      _store.pause();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
