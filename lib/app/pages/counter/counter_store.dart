import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/models/enums/push_type_enum.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';
import 'package:tally_counter/app/core/domain/usecases/delay_provider.dart';
import 'package:tally_counter/app/core/domain/usecases/register_count_push.dart';

class CounterStore {
  static final DelayProvider<CounterRegister> _delayProvider = DelayProvider(
    callback: (counterRegister) {
      // Save on repository only if it exists
      _repository.save(counterRegister);
    },
    elementFinder: (list) {
      final first = list.first;
      final last = list.last;
      return CounterRegister(
        startTime: first.startTime,
        endTime: last.endTime,
        newValue: last.newValue,
        oldValue: first.oldValue,
      );
    },
  );

  CounterRegister _lastRegister;

  static CounterRegisterRepository get _repository =>
      Modular.get<CounterRegisterRepository>();

  CounterStore([int counter = 0])
      : _lastRegister = CounterRegister(
          startTime: DateTime(0),
          endTime: DateTime(0),
          newValue: counter,
          oldValue: counter,
        );

  static RegisterCountPush get useCase {
    return RegisterCountPush(
      repository: _repository,
      delayProvider: _delayProvider,
    );
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
  }

  void decrement() {
    if (_lastRegister.startTime.year <= 0) {
      _resetLastRegister();
    }
    _lastRegister = useCase(_lastRegister, PushType.remove);
  }

  void setNewValue(final String from) {
    final counter = int.tryParse(from) ?? value;
    var startTime = _lastRegister.endTime;
    if (startTime.year <= 0) {
      startTime = DateTime.now();
    }
    _lastRegister = CounterRegister(
      startTime: startTime,
      endTime: DateTime.now(),
      oldValue: value,
      newValue: counter,
    );

    // Save the new register
    useCase.saveRegister(_lastRegister);
  }
}
