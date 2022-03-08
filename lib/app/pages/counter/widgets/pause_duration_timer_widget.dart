import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class PauseDurationTimerWidget extends StatefulWidget {
  final Duration elapsedPauseTime;

  const PauseDurationTimerWidget({
    Key? key,
    this.elapsedPauseTime = const Duration(),
  }) : super(key: key);

  @override
  State<PauseDurationTimerWidget> createState() =>
      _PauseDurationTimerWidgetState();
}

class _PauseDurationTimerWidgetState extends State<PauseDurationTimerWidget>
    with TickerProviderStateMixin {
  String _timeString = '';
  Duration _lastElapsedTime;
  Duration _initDuration;
  Duration _timer;
  late Ticker _ticker;

  _PauseDurationTimerWidgetState()
      : _timer = const Duration(),
        _initDuration = const Duration(),
        _lastElapsedTime = const Duration();

  @override
  void initState() {
    super.initState();
    if (_timer.inSeconds <= 0) {
      _timer = widget.elapsedPauseTime;
    }
    _initDuration = _timer;
    _ticker = createTicker(_getTime)..start();
    _timeString = _formatDuration(widget.elapsedPauseTime);
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  String _formatDuration(Duration newDuration) {
    final formatter = DateFormat.Hms();
    return formatter.format(DateTime(0).add(newDuration));
  }

  void _getTime(Duration elapsed) {
    final deltaTime = elapsed - _lastElapsedTime;
    if (deltaTime.inSeconds > 0) {
      _lastElapsedTime = elapsed;
      _timer = _initDuration + elapsed;
      _lastElapsedTime = const Duration();
      if (mounted) {
        setState(() {
          _timeString = _formatDuration(_timer);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_timeString);
  }
}
