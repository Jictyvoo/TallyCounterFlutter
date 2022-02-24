import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';

class RegisterListStore {
  final CounterRegisterRepository _repository;

  RegisterListStore(this._repository);

  Future<List<CounterRegister>> load([bool today = false]) {
    if (today) {
      return _repository.load(DateTime.now());
    }
    return _repository.loadAll();
  }
}