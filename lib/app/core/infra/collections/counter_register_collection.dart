import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

part 'counter_register_collection.g.dart';

@Collection()
class TallyRegister {
  int id = Isar.autoIncrement;
  DateTime startAt;
  DateTime endAt;
  String? description;
  int oldValue;
  int newValue;

  TallyRegister({
    this.oldValue = 0,
    this.newValue = 0,
    DateTime? startedAt,
    DateTime? endedAt,
  })  : startAt = startedAt ?? DateTime(0),
        endAt = endedAt ?? DateTime(0);

  TallyRegister.fromCounter(CounterRegister register)
      : startAt = register.startTime,
        endAt = register.endTime,
        oldValue = register.oldValue,
        newValue = register.newValue;
}
