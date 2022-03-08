import 'timer_intersection.dart';

class CounterRegister extends TimeIntersection {
  final DateTime endTime;
  final int oldValue;
  final int newValue;

  CounterRegister({
    required DateTime startTime,
    required this.endTime,
    this.oldValue = 0,
    this.newValue = 0,
  }) : super(startTime, endTime.difference(startTime));

  CounterRegister.duration({
    required DateTime startTime,
    DateTime? endTime,
    required Duration duration,
    this.oldValue = 0,
    this.newValue = 0,
  })  : endTime = endTime ?? startTime.add(duration),
        super(startTime, duration);

  @override
  String toString() {
    return 'CounterRegister{duration: $duration, startTime: $startTime, endTime: $endTime, oldValue: $oldValue, newValue: $newValue}';
  }
}
