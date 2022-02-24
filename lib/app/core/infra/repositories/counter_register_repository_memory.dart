import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

import '../../domain/repositories/counter_register_repository.dart';

class CounterRegisterRepositoryMemory implements CounterRegisterRepository {
  final Map<DateTime, List<CounterRegister>> _storage;

  CounterRegisterRepositoryMemory() : _storage = {};

  DateTime _onlyDate(DateTime from) {
    return DateTime(from.year, from.month, from.day);
  }

  @override
  Future<List<CounterRegister>> load(DateTime fromDate) async {
    final result = _storage[_onlyDate(fromDate)];
    if (result == null) {
      return const [];
    }
    return result;
  }

  @override
  Future<List<CounterRegister>> loadAll() async {
    final registerList = <CounterRegister>[];
    for (final dayList in _storage.values) {
      registerList.addAll(dayList);
    }
    return registerList;
  }

  @override
  void save(CounterRegister newCounter) {
    final todayDate = _onlyDate(DateTime.now());
    _storage.putIfAbsent(todayDate, () => []);
    var dayList = _storage[todayDate] ?? const [];
    dayList.add(newCounter);
  }
}
