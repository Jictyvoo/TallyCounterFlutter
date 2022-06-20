import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/pages/register_list/widgets/register_list_widget.dart';

import '../register_list_store.dart';

class RegisterListLoader extends StatefulWidget {
  final RegisterListStore? store;
  final DateTime? fromDate;

  const RegisterListLoader({Key? key, this.store, this.fromDate})
      : super(key: key);

  @override
  State<RegisterListLoader> createState() => _RegisterListLoaderState();
}

class _RegisterListLoaderState extends State<RegisterListLoader>
    with TickerProviderStateMixin {
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
    return FutureBuilder<List<CounterRegister>>(
      future: _future,
      builder: (context, snapshot) {
        final result = snapshot.data ?? [];
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error when loading registers'),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
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
          }
          return Center(
            child: RegisterListWidget(
              registers: result,
              onDeleteCallback: widget.store?.delete,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
