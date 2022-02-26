import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

abstract class CounterRegisterRepository {
  Future<void> save(CounterRegister newCounter);

  Future<List<CounterRegister>> loadAll();

  Future<List<CounterRegister>> load(DateTime fromDate);
}
