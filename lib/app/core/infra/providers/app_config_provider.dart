import 'package:tally_counter/app/core/infra/repositories/app_config_repository_isar.dart';
import 'package:tally_counter/app/shared/utils/app_config.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

mixin AppConfigProvider {
  static AppConfig _configInstance = const AppConfig(VersionLabel());
  static bool _isInitialized = false;

  bool get isIsarInit => _isInitialized;

  Future<void> initConfig() async {
    _isInitialized = false;
    final configMap = await AppConfigRepositoryIsar().load();
    _configInstance = AppConfig.fromMap(configMap);
    _isInitialized = true;
  }

  static AppConfig get appConfig => _configInstance;
}
