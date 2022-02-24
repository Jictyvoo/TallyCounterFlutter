import 'package:tally_counter/app/core/domain/models/enums/push_type_enum.dart';

import '../models/entities/counter_register.dart';
import '../repositories/counter_register_repository.dart';

class RegisterCountPush {
  final CounterRegisterRepository? _repository;

  RegisterCountPush([this._repository]);

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
      oldValue: previousCounter.oldValue,
      newValue: newValue,
    );

    // Save on repository only if it exists
    _repository?.save(newCounter);
    return newCounter;
  }
}
