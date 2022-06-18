import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/dtos/migration_list_dto.dart';
import 'package:tally_counter/app/core/infra/repositories/database_migration_history_repository_isar.dart';

import 'migrations_contract.dart';

class DatabaseMigrationsManager {
  final Isar _isarConnection;

  DatabaseMigrationsManager(this._isarConnection);

  DatabaseMigrationHistoryRepositoryIsar get repo =>
      DatabaseMigrationHistoryRepositoryIsar(_isarConnection);

  Future<MigrationListDTO> loadAppMigrations() async {
    return await repo.loadAll();
  }

  static int orderByVersion(MigrationsContract a, MigrationsContract b) {
    return a.runBeforeVersion.compare(b.runBeforeVersion);
  }

  Future<bool> call(final List<MigrationsContract> migrations) async {
    final migrationList = await loadAppMigrations();
    final futures = <Future<bool>>[];

    // Sort migrations by version
    final sortedMigrations = migrations.toList()..sort(orderByVersion);

    for (final migration in sortedMigrations) {
      if (!migrationList.hasMigration(migration.name)) {
        futures.add(
          () async {
            final success = await migration(_isarConnection);
            if (success) {
              return repo.add(MigrationInfoDTO(
                name: migration.name,
                description: migration.description,
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
