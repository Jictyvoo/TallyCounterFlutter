import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/domain/models/entities/register_purpose.dart';
import 'package:tally_counter/app/core/domain/models/entities/timer_intersection.dart';
import 'package:tally_counter/app/core/domain/models/enums/push_type_enum.dart';
import 'package:tally_counter/app/core/domain/repositories/counter_register_repository.dart';
import 'package:tally_counter/app/core/domain/usecases/count_pause_time.dart';
import 'package:tally_counter/app/core/domain/usecases/delay_provider.dart';
import 'package:tally_counter/app/core/domain/usecases/register_count_push.dart';

import 'purpose_store.dart';

class CounterStore with PurposeStore {
  static final DelayProvider<CounterRegister> _delayProvider = DelayProvider(
    duration: const Duration(milliseconds: 800),
    callback: (counterRegister) {
      // Save on repository only if it exists
      _repository.save(counterRegister);
    },
    elementFinder: (list) {
      final first = list.first;
      final last = list.last;

      // Calculate the total duration
      var totalDuration = const Duration();
      for (final element in list) {
        totalDuration += element.duration;
      }

      return CounterRegister.duration(
        startTime: first.startTime,
        endTime: last.endTime,
        duration: totalDuration,
        newValue: last.newValue,
        oldValue: first.oldValue,
        purpose: last.purpose,
      );
    },
  );

  static CounterRegisterRepository get _repository =>
      Modular.get<CounterRegisterRepository>();

  static CountPauseTime get _pauseCase {
    return CountPauseTime();
  }

  CounterRegister _lastRegister;
  bool _isPaused;
  TimeIntersection? _pauseTime;

  CounterStore([int counter = 0])
      : _lastRegister = CounterRegister(
          startTime: DateTime(0),
          endTime: DateTime(0),
          newValue: counter,
          oldValue: counter,
        ),
        _isPaused = true;

  RegisterCountPush get useCase {
    return RegisterCountPush(
      _lastRegister,
      _pauseTime,
      repository: _repository,
      delayProvider: _delayProvider,
    );
  }

  int get value => _lastRegister.newValue;

  bool get isPaused => _isPaused;

  Duration get pauseDuration => _pauseTime?.duration ?? const Duration();

  void _resetLastRegister({int? oldValue, int? newValue}) {
    final now = DateTime.now();
    _lastRegister = CounterRegister(
      startTime: now,
      endTime: now,
      oldValue: oldValue ?? _lastRegister.oldValue,
      newValue: newValue ?? _lastRegister.newValue,
      purpose: RegisterPurpose(
        name: selectedPurpose.name,
        description: selectedPurpose.description,
      ),
    );
  }

  void resetValue() {
    _resetLastRegister(oldValue: 0, newValue: 0);
    _isPaused = true;
    _pauseTime = null;
  }

  void _executePause() {
    if (_isPaused && _pauseTime == null) {
      return;
    }
    _pauseTime = _pauseCase(_pauseTime, _isPaused);
  }

  /// Pause the counter, so the time will be subtracted
  void pause() {
    if (_lastRegister.startTime.year <= 0) {
      _resetLastRegister();
    }
    _executePause();
    _isPaused = !_isPaused;
  }

  void _modifyRegister(PushType pushType) {
    if (_lastRegister.startTime.year <= 0) {
      _resetLastRegister();
    }
    if (_isPaused) {
      _executePause();
    }
    _lastRegister = useCase(pushType)
      ..purpose = RegisterPurpose(
        name: selectedPurpose.name,
        description: selectedPurpose.description,
      );
    _pauseTime = null;
    _isPaused = false;
  }

  void increment() {
    _modifyRegister(PushType.add);
  }

  void decrement() {
    _modifyRegister(PushType.remove);
  }

  void setNewValue(final String from) {
    if (_lastRegister.startTime.year <= 0) {
      _resetLastRegister();
    }
    final counter = int.tryParse(from) ?? value;
    _lastRegister = useCase.setValue(counter)
      ..purpose = RegisterPurpose(
        name: selectedPurpose.name,
        description: selectedPurpose.description,
      );
    _pauseTime = null;
    _isPaused = false;
  }
}
