import 'package:isar/isar.dart';

part 'migration_collection.g.dart';

@Collection()
@Name("Migrations")
class MigrationCollection {
  @Id()
  @Name("id")
  int id = Isar.autoIncrement;

  @Name("name")
  String name;

  @Name("description")
  String description;

  @Name("timestamp")
  DateTime ranAt;

  @Name("log")
  List<String> log;

  MigrationCollection({
    required this.name,
    this.description = '',
    required this.ranAt,
    this.log = const <String>[],
  });
}
