import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/entities/counter_register.dart';
import 'package:tally_counter/app/core/infra/collections/register_date_collection.dart';
import 'package:tally_counter/app/core/infra/collections/tally_purpose_collection.dart';

part 'counter_register_collection.g.dart';

@Collection()
@Name("TallyRegisters")
class TallyRegisterCollection {
  @Name("id")
  Id id = Isar.autoIncrement;

  @Name("date")
  final dateTimestamp = IsarLink<RegisterDateCollection>();

  @Name("purpose")
  final purpose = IsarLink<TallyPurposeCollection>();

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

  TallyRegisterCollection({
    this.oldValue = 0,
    this.newValue = 0,
    DateTime? startedAt,
    DateTime? endedAt,
    this.duration = 0,
  })  : startAt = startedAt ?? DateTime(0),
        endAt = endedAt ?? DateTime(0);

  TallyRegisterCollection.fromCounter(CounterRegister register)
      : startAt = register.startTime,
        endAt = register.endTime,
        duration = register.duration.inMicroseconds,
        oldValue = register.oldValue,
        newValue = register.newValue;
}
