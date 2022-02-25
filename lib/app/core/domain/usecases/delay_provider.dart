import 'dart:async';

class DelayProvider<T> {
  final Duration duration;
  final List<T> _valuesList;

  /// A callback that is called at the end of delay subscription
  final Function(T) callback;

  /// An optional function that helps to find which element will
  /// be passed to given callback
  final T Function(Iterable<T>)? elementFinder;

  /// Stream subscription that is used to defines when to run the finishCallback
  StreamSubscription<void>? _delayStream;

  DelayProvider({
    this.duration = const Duration(milliseconds: 500),
    required this.callback,
    this.elementFinder,
  })  : _delayStream = null,
        _valuesList = [];

  T get _element {
    if (elementFinder != null) {
      return elementFinder!.call(_valuesList);
    }
    return _valuesList.last;
  }

  void _resolveDelay() {
    _delayStream = null;
    final element = _element;
    callback.call(element);
    _valuesList.clear();
  }

  void add(T value) {
    if (_delayStream != null) {
      _delayStream!.cancel();
    }
    final future = Future.delayed(duration);
    _delayStream = future.asStream().listen(null, onDone: _resolveDelay);
    _valuesList.add(value);
  }
}
