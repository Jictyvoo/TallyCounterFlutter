import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/pages/register_list/widgets/register_list_widget.dart';

import 'register_list_store.dart';

class RegisterListPage extends StatefulWidget {
  final RegisterListStore? store;
  final DateTime? fromDate;

  const RegisterListPage({Key? key, this.store, this.fromDate})
      : super(key: key);

  @override
  _RegisterListPageState createState() => _RegisterListPageState();
}

class _RegisterListPageState extends State<RegisterListPage> {
  Future<List<CounterRegister>> _future = Future.value([]);

  @override
  void initState() {
    if (widget.store != null) {
      _future = widget.store!.load(widget.fromDate);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of registers')),
      body: FutureBuilder<List<CounterRegister>>(
        future: _future,
        builder: (context, snapshot) {
          final result = snapshot.data ?? [];
          if (result.isEmpty) {
            return const Center(
              child: Text(
                'There is no registers saved',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error when loading registers'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return RegisterListWidget(registers: result);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'increment_button@HERO',
        onPressed: () {
          showDialog(
            context: context,
            builder: (subContext) {
              return AlertDialog(
                title: const Text('Alert'),
                content: const Text(
                  'Method Unimplemented, check for new versions',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'),
                  )
                ],
              );
            },
          );
        },
        tooltip: 'Save register list to a csv file',
        child: const Icon(Icons.save),
      ),
    );
  }
}
