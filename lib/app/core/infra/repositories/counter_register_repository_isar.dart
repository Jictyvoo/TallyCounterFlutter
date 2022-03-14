import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';
import 'package:tally_counter/app/core/infra/collections/counter_register_collection.dart';
import 'package:tally_counter/app/core/infra/providers/isar_provider.dart';

class CounterRegisterRepositoryIsar implements CounterRegisterRepository {
  Isar? _isar;

  Future<Isar> get _conn async {
    _isar ??= IsarProvider.isar;
    return _isar!;
  }

  List<CounterRegister> _parseRows(List<TallyRegister> rowsList) {
    final resultList = <CounterRegister>[];
    for (final row in rowsList) {
      if (row.duration == Isar.autoIncrement || row.duration == null) {
        resultList.add(
          CounterRegister(
            id: row.id,
            startTime: row.startAt,
            endTime: row.endAt,
            newValue: row.newValue,
            oldValue: row.oldValue,
          ),
        );
      } else {
        resultList.add(
          CounterRegister.duration(
            id: row.id,
            startTime: row.startAt,
            endTime: row.endAt,
            duration: Duration(microseconds: row.duration!),
            newValue: row.newValue,
            oldValue: row.oldValue,
          ),
        );
      }
    }
    return resultList;
  }

  @override
  Future<List<CounterRegister>> load(DateTime fromDate) async {
    final dayEnd = DateTime(
      fromDate.year,
      fromDate.month,
      fromDate.day,
      23,
      59,
    );
    final dayBegin = DateTime(
      fromDate.year,
      fromDate.month,
      fromDate.day,
      0,
      0,
    );
    final connection = await _conn;
    final query = connection.tallyRegisters
        .filter()
        .endAtBetween(dayBegin, dayEnd)
        .and()
        .startAtBetween(dayBegin, dayEnd)
        .sortByStartAt();
    return _parseRows(await query.build().findAll());
  }

  @override
  Future<List<CounterRegister>> loadAll() async {
    final connection = await _conn;
    final query = connection.tallyRegisters.where();
    return _parseRows(await query.findAll());
  }

  @override
  Future<void> save(CounterRegister newCounter) async {
    final connection = await _conn;
    connection.writeTxn((isar) async {
      isar.tallyRegisters.put(TallyRegister(
        startedAt: newCounter.startTime,
        endedAt: newCounter.endTime,
        duration: newCounter.duration.inMicroseconds,
        oldValue: newCounter.oldValue,
        newValue: newCounter.newValue,
      ));
    });
  }

  @override
  Future<bool> delete(CounterRegister register) async {
    final connection = await _conn;
    final result = await connection.writeTxn((isar) {
      return isar.tallyRegisters.delete(register.id);
    });
    return result;
  }
}
