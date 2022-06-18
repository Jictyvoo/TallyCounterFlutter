import 'collections/migrations/organize_by_datetime_migration.dart';
import 'collections/migrations/database_migrations_manager.dart';
import 'providers/isar_provider.dart';

class InfraInit with IsarProvider {
  Future<void> ensureInitialized() async {
    if (!isIsarInit) {
      await initIsar();
    }

    final migrationsManager = DatabaseMigrationsManager(IsarProvider.isar);
    final futures = <Future>[
      migrationsManager(
        [
          OrganizeByDatetimeMigration().signature(),
        ],
      ),
    ];
    await Future.wait(futures);
  }
}
