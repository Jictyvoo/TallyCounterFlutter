import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';
import 'package:tally_counter/app/core/domain/repositories/date_register_repository.dart';

class RegisterListStore {
  final CounterRegisterRepository _repository;
  final DateRegisterRepository _dateRepository;

  RegisterListStore([CounterRegisterRepository? repository])
      : _repository = repository ?? Modular.get<CounterRegisterRepository>(),
        _dateRepository = Modular.get<DateRegisterRepository>();

  Future<List<CounterRegister>> load([DateTime? fromDate]) {
    if (fromDate != null) {
      return _repository.load(fromDate);
    }
    return _repository.loadAll();
  }

  Future<List<DateTime>> loadAllDates() {
    return _dateRepository.loadAll();
  }

  Future<bool> delete(CounterRegister register) {
    return _repository.delete(register);
  }
}
