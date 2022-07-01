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

    // save the instances to the database to improve performance
    final isar = _conn;
    final result = await isar.writeTxn(
      () async {
        // find all existing configs and update them
        final savedConfigs = await isar.appConfigCollections.getAllByKey(
          config.keys.toList(),
        );

        final existingConfigs = <String, AppConfigCollection>{};
        for (final conf in savedConfigs) {
          if (conf != null) {
            existingConfigs[conf.key] = conf;
          }
        }

        final updatedConfigs = <AppConfigCollection>[];
        for (final key in config.keys) {
          if (existingConfigs.containsKey(key)) {
            final existingConfig = existingConfigs[key]!;
            final newValue = config[key] ?? existingConfig.value;
            if (newValue != existingConfig.value) {
              existingConfig.value = newValue;
              updatedConfigs.add(existingConfig);
            }
          } else {
            final newConfig = AppConfigCollection(
              key: key,
              value: config[key] ?? '',
            );
            updatedConfigs.add(newConfig);
          }
        }

        return await isar.appConfigCollections.putAll(updatedConfigs);
      },
    );
    return result.every((element) => element > 0);
  }
}
