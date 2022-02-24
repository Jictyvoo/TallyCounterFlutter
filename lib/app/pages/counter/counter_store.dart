import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/models/enums/push_type_enum.dart';
import 'package:tally_counter/app/core/domain/usecases/register_count_push.dart';
import 'package:tally_counter/app/core/infra/repositories/counter_register_repository_memory.dart';

class CounterStore {
  CounterRegister _lastRegister;
  static final _repository = CounterRegisterRepositoryMemory();

  CounterStore([int counter = 0])
      : _lastRegister = CounterRegister(
          startTime: DateTime(0),
          endTime: DateTime(0),
          newValue: counter,
          oldValue: counter,
        );

  static RegisterCountPush get useCase {
    return RegisterCountPush(_repository);
  }

  int get value => _lastRegister.newValue;

  void _resetLastRegister() {
    final now = DateTime.now();
    _lastRegister = CounterRegister(
      startTime: now,
      endTime: now,
      oldValue: _lastRegister.oldValue,
      newValue: _lastRegister.newValue,
    );
  }

  void increment() {
    if (_lastRegister.startTime.year <= 0) {
      _resetLastRegister();
    }
    _lastRegister = useCase(_lastRegister, PushType.add);
    _repository.loadAll().then((value) {
      print(value);
    });
  }

  void decrement() {
    if (_lastRegister.startTime.year <= 0) {
      _resetLastRegister();
    }
    _lastRegister = useCase(_lastRegister, PushType.remove);
  }

  void setNewValue(final String from) {
    final counter = int.tryParse(from) ?? value;
    _lastRegister = CounterRegister(
      startTime: DateTime(0),
      endTime: DateTime(0),
      oldValue: value,
      newValue: counter,
    );
  }
}
