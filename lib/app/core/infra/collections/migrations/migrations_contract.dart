import 'package:isar/isar.dart';
import 'package:tally_counter/app/shared/utils/debug_print.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

abstract class MigrationsContract with DebuggablePrint {
  final List<String> migrationLog;

  MigrationsContract() : migrationLog = <String>[];

  String get name;

  String get description;

  VersionLabel get runBeforeVersion;

  Future<bool> call(Isar isar);

  MapEntry<String, Future<bool> Function(Isar)> signature() {
    return MapEntry(name, call);
  }

  void log(String message) {
    migrationLog.add(message);
    debugPrint(message);
  }
}
