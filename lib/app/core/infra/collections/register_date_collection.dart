import 'package:isar/isar.dart';

part 'register_date_collection.g.dart';

@Collection()
@Name("RegisterDates")
class RegisterDateCollection {
  @Name("id")
  Id id = Isar.autoIncrement;

  @Name("date")
  @Index(unique: true)
  DateTime date;

  static _onlyDate(DateTime date) => DateTime(date.year, date.month, date.day);

  RegisterDateCollection({DateTime? dateTimestamp})
      : date = _onlyDate(dateTimestamp ?? DateTime.now());

  @override
  String toString() {
    return 'RegisterDateCollection{id: $id, date: $date}';
  }
}
