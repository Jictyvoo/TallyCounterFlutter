import 'package:tally_counter/app/shared/utils/version_label.dart';

import 'collections/migrations/add_miscellaneous_purpose_migration.dart';
import 'collections/migrations/database_migrations_manager.dart';
import 'collections/migrations/organize_by_datetime_migration.dart';
import 'providers/app_config_provider.dart';
import 'providers/isar_provider.dart';

class InfraInit with IsarProvider, AppConfigProvider {
  Future<void> ensureInitialized() async {
    if (!isIsarInit) {
      await initIsar();
    }

    final allMigrations = [
      OrganizeByDatetimeMigration(),
      AddMiscellaneousPurposeMigration(),
    ];
    final freshDbVersion = allMigrations.reduce((value, element) {
      if (value.runBeforeVersion > element.runBeforeVersion) {
        return value;
      }
      return element;
    }).runBeforeVersion;

    if (!isAppConfigInit) {
      await initConfig(VersionLabel(
        major: freshDbVersion.major,
        minor: freshDbVersion.minor,
        patch: freshDbVersion.patch + 1,
      ));
    }

    final migrationsManager = DatabaseMigrationsManager(IsarProvider.isar);

    final newDbVersion = await migrationsManager(
      AppConfigProvider.appConfig.databaseVersion,
      allMigrations,
    );

    final futures = <Future<bool>>[];
    if (newDbVersion != null) {
      final updatedConfig = AppConfigProvider.appConfig.copyWith(
        databaseVersion: newDbVersion,
      );
      futures.add(AppConfigProvider.updateConfig(updatedConfig));
    }

    await Future.wait(futures);
  }
}
