import 'package:tally_counter/app/core/domain/models/entities/timer_intersection.dart';

class CountPauseTime {
  TimeIntersection call(TimeIntersection? pauseTime) {
    if (pauseTime == null) {
      return TimeIntersection(DateTime.now(), const Duration());
    } else {
      final pauseDuration = DateTime.now().difference(pauseTime.startTime);
      return TimeIntersection(
        pauseTime.startTime,
        pauseDuration + pauseTime.duration,
      );
    }
  }
}
