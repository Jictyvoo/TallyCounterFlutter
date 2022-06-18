import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/dtos/migration_list_dto.dart';
import 'package:tally_counter/app/core/infra/repositories/database_migration_history_repository_isar.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

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

  Future<VersionLabel?> call(
    VersionLabel version,
    final List<MigrationsContract> migrations,
  ) async {
    final migrationList = await loadAppMigrations();
    final futures = <Future<bool>>[];

    // Sort migrations by version
    final sortedMigrations = migrations.toList()..sort(orderByVersion);
    var currentDBVersion = version;

    for (final migration in sortedMigrations) {
      if (!migrationList.hasMigration(migration.name) &&
          currentDBVersion <= migration.runBeforeVersion) {
        currentDBVersion = migration.runBeforeVersion;
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
    if (results.every((isSuccess) => isSuccess)) {
      return currentDBVersion;
    }
    return null;
  }
}
