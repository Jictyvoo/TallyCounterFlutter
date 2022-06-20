import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';

class RegisterListStore {
  final CounterRegisterRepository _repository;

  RegisterListStore([CounterRegisterRepository? repository])
      : _repository = repository ?? Modular.get<CounterRegisterRepository>();

  Future<List<CounterRegister>> load([DateTime? fromDate]) {
    if (fromDate != null) {
      return _repository.load(fromDate);
    }
    return _repository.loadAll();
  }

  Future<List<DateTime>> loadAllDates() async {
    final results = <DateTime>[];
    return results;
  Future<bool> delete(CounterRegister register) {
    return _repository.delete(register);
  }
}
