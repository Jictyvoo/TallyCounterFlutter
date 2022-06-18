import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/dtos/migration_list_dto.dart';
import 'package:tally_counter/app/core/infra/collections/migration_collection.dart';
import 'package:tally_counter/app/core/infra/providers/isar_provider.dart';

class DatabaseMigrationHistoryRepositoryIsar {
  Isar? _isarConnection;

  DatabaseMigrationHistoryRepositoryIsar([this._isarConnection]);

  Isar get _conn {
    _isarConnection ??= IsarProvider.isar;
    return _isarConnection!;
  }

  Future<MigrationListDTO> loadAll() async {
    final query = _conn.migrationCollections.where();
    final rows = await query.findAll();

    final result = <MigrationInfoDTO>{};
    for (final row in rows) {
      result.add(MigrationInfoDTO(
        id: row.id,
        name: row.name,
        description: row.description,
        timestamp: row.ranAt.millisecondsSinceEpoch,
      ));
    }

    return MigrationListDTO(migrations: result);
  }

  Future<bool> add(MigrationInfoDTO migrationInfo) async {
    final result = await _conn.writeTxn(
      (isar) => isar.migrationCollections.put(
        MigrationCollection(
          name: migrationInfo.name,
          description: migrationInfo.description,
          ranAt: migrationInfo.timestamp,
        ),
      ),
    );

    return result > 0;
  }
}
