import 'package:flutter/foundation.dart';

mixin DebuggablePrint {
  void debugPrint(Object? message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
