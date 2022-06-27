import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/infra/collections/app_config_collection.dart';
import 'package:tally_counter/app/core/infra/collections/counter_register_collection.dart';
import 'package:tally_counter/app/core/infra/collections/migration_collection.dart';
import 'package:tally_counter/app/core/infra/collections/register_date_collection.dart';
import 'package:tally_counter/app/core/infra/collections/tally_purpose_collection.dart';
import 'package:tally_counter/app/core/infra/utils/path_utils.dart';

mixin IsarProvider {
  static late final Isar _isarInstance;
  static bool _isInitialized = false;

  bool get isIsarInit => _isInitialized;

  Future<void> initIsar() async {
    final path = await PathUtils.databaseDirectory;
    _isarInstance = await Isar.open(
      [
        AppConfigCollectionSchema,
        MigrationCollectionSchema,
        RegisterDateCollectionSchema,
        TallyPurposeCollectionSchema,
        TallyRegisterCollectionSchema,
      ],
      directory: path,
    );
    _isInitialized = true;
  }

  static Isar get isar {
    return _isarInstance;
  }
}
