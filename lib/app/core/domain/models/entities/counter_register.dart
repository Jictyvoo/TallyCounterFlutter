import 'timer_intersection.dart';

class CounterRegister extends TimeIntersection {
  final int id;
  final DateTime endTime;
  final int oldValue;
  final int newValue;

  CounterRegister({
    this.id = -1,
    required DateTime startTime,
    required this.endTime,
    this.oldValue = 0,
    this.newValue = 0,
  }) : super(startTime, endTime.difference(startTime));

  CounterRegister.duration({
    this.id = -1,
    required DateTime startTime,
    DateTime? endTime,
    required Duration duration,
    this.oldValue = 0,
    this.newValue = 0,
  })  : endTime = endTime ?? startTime.add(duration),
        super(startTime, duration);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterRegister &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          startTime == other.startTime &&
          endTime == other.endTime &&
          duration == other.duration &&
          oldValue == other.oldValue &&
          newValue == other.newValue;

  @override
  int get hashCode =>
      id.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      duration.hashCode ^
      oldValue.hashCode ^
      newValue.hashCode;

  @override
  String toString() {
    return 'CounterRegister{duration: $duration, startTime: $startTime, endTime: $endTime, oldValue: $oldValue, newValue: $newValue}';
  }
}
