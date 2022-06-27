import 'package:isar/isar.dart';

part 'app_config_collection.g.dart';

@Collection()
@Name("AppConfigs")
class AppConfigCollection {
  @Id()
  @Name("id")
  int id = Isar.autoIncrement;

  @Name("key")
  @Index(unique: true)
  String key;

  @Name("value")
  String value;

  AppConfigCollection({
    required this.key,
    required this.value,
  });

  @override
  String toString() {
    return 'AppConfigCollection{id: $id, key: $key, value: $value}';
  }
}
