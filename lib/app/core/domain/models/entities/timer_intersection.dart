class TimeIntersection {
  final DateTime startTime;
  final Duration duration;

  const TimeIntersection(this.startTime, this.duration);

  @override
  String toString() {
    return 'TimeIntersection{startTime: $startTime, duration: $duration}';
  }
}
