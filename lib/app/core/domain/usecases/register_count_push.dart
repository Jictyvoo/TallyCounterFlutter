import 'package:tally_counter/app/core/domain/models/entities/timer_intersection.dart';
import 'package:tally_counter/app/core/domain/models/enums/push_type_enum.dart';

import '../models/entities/counter_register.dart';
import '../repositories/counter_register_repository.dart';
import 'delay_provider.dart';

class RegisterCountPush {
  final CounterRegisterRepository? _repository;
  final DelayProvider<CounterRegister>? delayProvider;

  RegisterCountPush({
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

  CounterRegister call(
    CounterRegister previousCounter,
    PushType pushType, [
    TimeIntersection? pauseTime,
  ]) {
    var newValue = previousCounter.newValue;
    if (pushType == PushType.add) {
      newValue += 1;
    } else {
      newValue -= 1;
    }

    final nowTime = DateTime.now();
    final newCounter = pauseTime != null
        ? CounterRegister.duration(
            startTime: previousCounter.endTime,
            endTime: nowTime,
            duration: nowTime.difference(previousCounter.endTime) -
                pauseTime.duration,
            oldValue: previousCounter.newValue,
            newValue: newValue,
          )
        : CounterRegister(
            startTime: previousCounter.endTime,
            endTime: nowTime,
            oldValue: previousCounter.newValue,
            newValue: newValue,
          );
    saveRegister(newCounter);
    return newCounter;
  }
}
