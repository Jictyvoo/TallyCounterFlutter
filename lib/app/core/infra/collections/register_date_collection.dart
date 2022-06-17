import 'package:isar/isar.dart';

part 'register_date_collection.g.dart';

@Collection()
@Name("RegisterDateCollection")
class RegisterDateCollection {
  @Id()
  @Name("id")
  int id = Isar.autoIncrement;

  @Name("date")
  DateTime date;

  RegisterDateCollection({DateTime? dateTimestamp})
      : date = dateTimestamp ?? DateTime.now();
}
