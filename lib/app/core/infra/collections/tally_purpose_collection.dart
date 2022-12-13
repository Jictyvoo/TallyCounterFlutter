import 'package:isar/isar.dart';

part 'tally_purpose_collection.g.dart';

@Collection()
@Name("TallyPurposes")
class TallyPurposeCollection {
  @Name("id")
  Id id = Isar.autoIncrement;

  @Name("name")
  @Index(unique: true)
  String name;

  @Name("description")
  String description;

  @Name("limit")
  int? limit;

  TallyPurposeCollection({
    required this.name,
    this.description = '',
    this.limit,
  });

  @override
  String toString() {
    return 'TallyPurposeCollection{'
        'id: $id, name: $name, description: $description, limit: $limit'
        '}';
  }
}
