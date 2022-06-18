import 'collections/migrations/database_migrations_manager.dart';
import 'collections/migrations/organize_by_datetime_migration.dart';
import 'providers/app_config_provider.dart';
import 'providers/isar_provider.dart';

class InfraInit with IsarProvider, AppConfigProvider {
  Future<void> ensureInitialized() async {
    if (!isIsarInit) {
      await initIsar();
    }

    final migrationsManager = DatabaseMigrationsManager(IsarProvider.isar);
    final futures = <Future>[
      initConfig(),
      migrationsManager(
        [
          OrganizeByDatetimeMigration(),
        ],
      ),
    ];
    await Future.wait(futures);
  }
}
