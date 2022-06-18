import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/infra/collections/app_config_collection.dart';
import 'package:tally_counter/app/core/infra/providers/isar_provider.dart';

class AppConfigRepositoryIsar {
  Isar? _isarConnection;

  Isar get _conn {
    _isarConnection ??= IsarProvider.isar;
    return _isarConnection!;
  }

  AppConfigRepositoryIsar([this._isarConnection]);

  Future<Map<String, String>> load() async {
    final query = _conn.appConfigCollections.where();
    final rows = await query.findAll();

    final result = <String, String>{};
    for (final row in rows) {
      result[row.key] = row.value;
    }
    return result;
  }

  Future<bool> save(Map<String, String> config) async {
    final configList = <AppConfigCollection>[];
    for (final entry in config.entries) {
      configList.add(AppConfigCollection(
        key: entry.key,
        value: entry.value,
      ));
    }

    final result = await _conn.writeTxn(
      (isar) => isar.appConfigCollections.putAll(
        configList,
        replaceOnConflict: true,
      ),
    );
    return result.every((element) => element > 0);
  }
}
