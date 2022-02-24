class CounterRegister {
  final Duration duration;
  final DateTime startTime;
  final DateTime endTime;
  final int oldValue;
  final int newValue;

  CounterRegister({
    required this.startTime,
    required this.endTime,
    this.oldValue = 0,
    this.newValue = 0,
  }) : duration = endTime.difference(startTime);

  @override
  String toString() {
    return 'CounterRegister{duration: $duration, startTime: $startTime, endTime: $endTime, oldValue: $oldValue, newValue: $newValue}';
  }
}
