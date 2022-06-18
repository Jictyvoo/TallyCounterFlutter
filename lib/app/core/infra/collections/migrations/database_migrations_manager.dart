import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/dtos/migration_list_dto.dart';
import 'package:tally_counter/app/core/infra/repositories/database_migration_history_repository_isar.dart';

class DatabaseMigrationsManager {
  final Isar _isarConnection;

  DatabaseMigrationsManager(this._isarConnection);

  DatabaseMigrationHistoryRepositoryIsar get repo =>
      DatabaseMigrationHistoryRepositoryIsar(_isarConnection);

  Future<MigrationListDTO> loadAppMigrations() async {
    return await repo.loadAll();
  }

  Future<bool> call(
      List<MapEntry<String, Future<bool> Function(Isar)>> migrations) async {
    final migrationList = await loadAppMigrations();
    final futures = <Future<bool>>[];

    for (final migration in migrations) {
      if (!migrationList.hasMigration(migration.key)) {
        futures.add(
          () async {
            final success = await migration.value(_isarConnection);
            if (success) {
              return repo.add(MigrationInfoDTO(
                name: migration.key,
                description: 'temp description',
                timestamp: DateTime.now().millisecondsSinceEpoch,
              ));
            }
            return false;
          }(),
        );
      }
    }

    final results = await Future.wait(futures);
    return results.every((isSuccess) => isSuccess);
  }
}
