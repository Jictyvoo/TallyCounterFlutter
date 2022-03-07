import 'package:flutter/material.dart';

import 'counter_store.dart';
import 'widgets/change_value_dialog.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterStore _store = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 100, minHeight: 100),
          child: TextButton(
            child: Text(
              '${_store.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
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
          ),
        ),
        const SizedBox(height: 12),
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
