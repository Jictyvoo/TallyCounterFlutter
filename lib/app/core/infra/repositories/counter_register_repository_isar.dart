import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';
import 'package:tally_counter/app/core/infra/collections/counter_register_collection.dart';

import '../utils/path_utils.dart';

class CounterRegisterRepositoryIsar implements CounterRegisterRepository {
  Isar? _isar;

  Future<Isar> get _conn async {
    if (_isar == null) {
      final path = await PathUtils.databaseDirectory;
      _isar = await Isar.open(
        schemas: [TallyRegisterSchema],
        directory: path,
        inspector: kDebugMode, // if want to enable the inspector for debug
      );
    }
    return _isar!;
  }

  @override
  Future<List<CounterRegister>> load(DateTime fromDate) {
    return loadAll();
  }

  @override
  Future<List<CounterRegister>> loadAll() async {
    final resultList = <CounterRegister>[];
    final connection = await _conn;
    for (final row in await connection.tallyRegisters.buildQuery().findAll()) {
      resultList.add(
        CounterRegister(
          startTime: row.startAt,
          endTime: row.endAt,
          newValue: row.newValue,
          oldValue: row.oldValue,
        ),
      );
    }
    return resultList;
  }

  @override
  Future<void> save(CounterRegister newCounter) async {
    final connection = await _conn;
    connection.writeTxn((isar) async {
      isar.tallyRegisters.put(TallyRegister(
        startedAt: newCounter.startTime,
        endedAt: newCounter.endTime,
        oldValue: newCounter.oldValue,
        newValue: newCounter.newValue,
      ));
    });
  }
}
