import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'counter_store.dart';
import 'widgets/change_value_dialog.dart';
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
        const Text(
          'Paused for: ',
          style: TextStyle(fontWeight: FontWeight.bold),
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
        const Text(
          'Current counter is on value:',
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
        ButtonBar(
          alignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: 'decrement_button@HERO',
              child: Tooltip(
                message: 'Decrement',
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
            IconButton(
              onPressed: () {
                setState(() {
                  _store.pause();
                });
              },
              icon: _store.isPaused
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.pause),
            ),
            Hero(
              tag: 'increment_button@HERO',
              child: Tooltip(
                message: 'Increment',
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
      ],
    );
  }
}
