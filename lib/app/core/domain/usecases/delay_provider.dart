class DelayProvider<T> {
  final Duration duration;
  Future<void>? _delay;
  final List<T> _valuesList;
  final Function(T) onFinishCallback;
  final T Function(Iterable<T>)? elementFinder;

  DelayProvider({
    this.duration = const Duration(seconds: 1),
    required this.onFinishCallback,
    this.elementFinder,
  })  : _delay = null,
        _valuesList = [];

  T get _element {
    if (elementFinder != null) {
      return elementFinder!.call(_valuesList);
    }
    return _valuesList.last;
  }

  void _resolveDelay() {
    _delay = null;
    final element = _element;
    onFinishCallback.call(element);
    _valuesList.clear();
  }

  void add(T value) {
    if (_delay == null) {
      _delay = Future.delayed(duration);
      _delay?.whenComplete(_resolveDelay);
    }
    _valuesList.add(value);
  }
}
