import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/infra/collections/app_config_collection.dart';
import 'package:tally_counter/app/core/infra/collections/counter_register_collection.dart';
import 'package:tally_counter/app/core/infra/collections/migration_collection.dart';
import 'package:tally_counter/app/core/infra/collections/register_date_collection.dart';
import 'package:tally_counter/app/core/infra/utils/path_utils.dart';

mixin IsarProvider {
  static late final Isar _isarInstance;
  static bool _isInitialized = false;

  bool get isIsarInit => _isInitialized;

  Future<void> initIsar() async {
    final path = await PathUtils.databaseDirectory;
    _isarInstance = await Isar.open(
      schemas: [
        AppConfigCollectionSchema,
        MigrationCollectionSchema,
        RegisterDateCollectionSchema,
        TallyRegisterCollectionSchema,
      ],
      directory: path,
      inspector: kDebugMode, // if want to enable the inspector for debug
    );
    _isInitialized = true;
  }

  static Isar get isar {
    return _isarInstance;
  }
}
