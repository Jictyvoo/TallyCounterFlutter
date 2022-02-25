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
    if (delayProvider != null) {
      delayProvider!.add(register);
    } else {
      _repository?.save(register);
    }
  }

  CounterRegister call(CounterRegister previousCounter, PushType pushType) {
    var newValue = previousCounter.newValue;
    if (pushType == PushType.add) {
      newValue += 1;
    } else {
      newValue -= 1;
    }
    final newCounter = CounterRegister(
      startTime: previousCounter.endTime,
      endTime: DateTime.now(),
      oldValue: previousCounter.newValue,
      newValue: newValue,
    );

    saveRegister(newCounter);
    return newCounter;
  }
}
