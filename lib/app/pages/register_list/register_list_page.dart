import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/pages/register_list/widgets/register_list_widget.dart';

import 'register_list_store.dart';

class RegisterListPage extends StatefulWidget {
  final RegisterListStore? store;

  const RegisterListPage({Key? key, this.store}) : super(key: key);

  @override
  _RegisterListPageState createState() => _RegisterListPageState();
}

class _RegisterListPageState extends State<RegisterListPage> {
  Future<List<CounterRegister>> _future = Future.value([]);

  @override
  void initState() {
    if (widget.store != null) {
      _future = widget.store!.load();
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
    );
  }
}
