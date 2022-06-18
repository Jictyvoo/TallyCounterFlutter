import 'package:isar/isar.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

abstract class MigrationsContract {
  String get name;

  String get description;

  VersionLabel get runBeforeVersion;

  Future<bool> call(Isar isar);

  MapEntry<String, Future<bool> Function(Isar)> signature() {
    return MapEntry(name, call);
  }
}
