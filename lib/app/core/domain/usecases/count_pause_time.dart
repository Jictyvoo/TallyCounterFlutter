import 'package:tally_counter/app/core/domain/models/entities/timer_intersection.dart';

class CountPauseTime {
  TimeIntersection call(TimeIntersection? pauseTime, final bool isPaused) {
    final now = DateTime.now();
    if (pauseTime == null) {
      return TimeIntersection(now, const Duration());
    } else {
      // Checks if is not paused now, so prepare the environment to pause
      if (!isPaused) {
        return TimeIntersection(now, pauseTime.duration);
      }
      final pauseDuration = now.difference(pauseTime.startTime);
      return TimeIntersection(
        now,
        pauseDuration + pauseTime.duration,
      );
    }
  }
}
