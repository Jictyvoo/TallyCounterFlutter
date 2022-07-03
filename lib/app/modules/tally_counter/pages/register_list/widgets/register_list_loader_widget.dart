import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/tally_counter_localizations.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

import '../register_list_store.dart';
import 'register_list_widget.dart';

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
          debugPrintStack(stackTrace: snapshot.stackTrace);
          return Center(
            child: Text(
              TallyCounterLocalizations.of(context)?.tallyListLoadingError ??
                  'Loading error',
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (result.isEmpty) {
            return Center(
              child: Text(
                TallyCounterLocalizations.of(context)?.tallyListEmpty ??
                    'There is no registers saved',
                style: const TextStyle(
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
