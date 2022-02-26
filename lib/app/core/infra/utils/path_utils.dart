import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

abstract class PathUtils {
  static Future<String> get databaseDirectory async {
    if (kIsWeb) {
      return '';
    }
    final dir = await path_provider.getApplicationSupportDirectory();
    return dir.path;
  }
}
