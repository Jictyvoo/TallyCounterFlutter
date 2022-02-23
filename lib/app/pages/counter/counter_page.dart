import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _setValueController = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _setValueController.text = _counter.toString();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _setValueController.text = _counter.toString();
    });
  }

  void _setNewValue(final String from) {
    setState(() {
      _counter = int.tryParse(from) ?? _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 100, minHeight: 100),
          child: TextButton(
            child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Change Counter value'),
                    content: TextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: _setValueController,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _setNewValue(_setValueController.value.text);
                        },
                        child: const Text('Ok'),
                      )
                    ],
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
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 50),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ],
        ),
      ],
    );
  }
}
