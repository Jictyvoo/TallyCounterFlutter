import 'package:tally_counter/app/core/domain/models/entities/timer_intersection.dart';
import 'package:tally_counter/app/core/domain/models/enums/push_type_enum.dart';

import '../models/entities/counter_register.dart';
import '../repositories/counter_register_repository.dart';
import 'delay_provider.dart';

class RegisterCountPush {
  final CounterRegisterRepository? _repository;
  final DelayProvider<CounterRegister>? delayProvider;
  final CounterRegister previousCounter;
  final TimeIntersection? pauseTime;

  RegisterCountPush(
    this.previousCounter,
    this.pauseTime, {
    CounterRegisterRepository? repository,
    this.delayProvider,
  }) : _repository = repository;

  void saveRegister(CounterRegister register) {
    if (register.newValue != register.oldValue) {
      if (delayProvider != null) {
        delayProvider!.add(register);
      } else {
        _repository?.save(register);
      }
    }
  }

  CounterRegister _newRegister({
    required DateTime startTime,
    required DateTime endTime,
    required int oldValue,
    required int newValue,
  }) {
    return pauseTime != null
        ? CounterRegister.duration(
            startTime: previousCounter.endTime,
            endTime: endTime,
            duration: endTime.difference(previousCounter.endTime) -
                pauseTime!.duration,
            oldValue: previousCounter.newValue,
            newValue: newValue,
          )
        : CounterRegister(
            startTime: previousCounter.endTime,
            endTime: endTime,
            oldValue: previousCounter.newValue,
            newValue: newValue,
          );
  }

  CounterRegister setValue(int newValue) {
    var startTime = previousCounter.endTime;
    if (startTime.year <= 0) {
      startTime = DateTime.now();
    }
    final newRegister = _newRegister(
      startTime: startTime,
      endTime: DateTime.now(),
      oldValue: previousCounter.newValue,
      newValue: newValue,
    );

    // Save the new register
    saveRegister(newRegister);
    return newRegister;
  }

  CounterRegister call(PushType pushType) {
    var newValue = previousCounter.newValue;
    if (pushType == PushType.add) {
      newValue += 1;
    } else {
      newValue -= 1;
    }

    final nowTime = DateTime.now();
    final newCounter = _newRegister(
      startTime: previousCounter.endTime,
      endTime: nowTime,
      oldValue: previousCounter.newValue,
      newValue: newValue,
    );
    saveRegister(newCounter);
    return newCounter;
  }
}
