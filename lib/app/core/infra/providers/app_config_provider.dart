import 'package:tally_counter/app/core/infra/repositories/app_config_repository_isar.dart';
import 'package:tally_counter/app/shared/utils/app_config.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

mixin AppConfigProvider {
  static AppConfig _configInstance = const AppConfig(VersionLabel());
  static bool _isInitialized = false;

  bool get isAppConfigInit => _isInitialized;

  static AppConfig get appConfig => _configInstance;

  static Future<void> reloadConfig() async {
    _isInitialized = false;
    final configMap = await AppConfigRepositoryIsar().load();
    _configInstance = AppConfig.fromMap(configMap);
    _isInitialized = true;
  }

  Future<void> initConfig() async {
    return reloadConfig();
  }

  static Future<bool> updateConfig(AppConfig updatedConfig) {
    _configInstance = updatedConfig;
    return AppConfigRepositoryIsar().save(updatedConfig.toJson());
  }
}
