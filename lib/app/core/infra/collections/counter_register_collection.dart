import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';

part 'counter_register_collection.g.dart';

@Collection()
@Name("TallyRegister")
class TallyRegister {
  @Id()
  @Name("id")
  int id = Isar.autoIncrement;

  @Name("startAt")
  DateTime startAt;

  @Name("endAt")
  DateTime endAt;

  /// The total duration in microseconds
  @Name("duration")
  int? duration;

  @Name("description")
  String? description;

  @Name("oldValue")
  int oldValue;

  @Name("newValue")
  int newValue;

  TallyRegister({
    this.oldValue = 0,
    this.newValue = 0,
    DateTime? startedAt,
    DateTime? endedAt,
    this.duration = 0,
  })  : startAt = startedAt ?? DateTime(0),
        endAt = endedAt ?? DateTime(0);

  TallyRegister.fromCounter(CounterRegister register)
      : startAt = register.startTime,
        endAt = register.endTime,
        duration = register.duration.inMicroseconds,
        oldValue = register.oldValue,
        newValue = register.newValue;
}
