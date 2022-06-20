import 'collections/migrations/database_migrations_manager.dart';
import 'collections/migrations/organize_by_datetime_migration.dart';
import 'providers/app_config_provider.dart';
import 'providers/isar_provider.dart';

class InfraInit with IsarProvider, AppConfigProvider {
  Future<void> ensureInitialized() async {
    if (!isIsarInit) {
      await initIsar();
    }
    if (!isAppConfigInit) {
      await initConfig();
    }

    final migrationsManager = DatabaseMigrationsManager(IsarProvider.isar);

    final newDbVersion = await migrationsManager(
      AppConfigProvider.appConfig.databaseVersion,
      [
        OrganizeByDatetimeMigration(),
      ],
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
