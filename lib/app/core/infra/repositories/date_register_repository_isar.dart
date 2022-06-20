import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/repositories/date_register_repository.dart';
import 'package:tally_counter/app/core/infra/collections/register_date_collection.dart';
import 'package:tally_counter/app/core/infra/providers/isar_provider.dart';

class DateRegisterRepositoryIsar implements DateRegisterRepository {
  Isar? _isar;

  Isar get _conn {
    _isar ??= IsarProvider.isar;
    return _isar!;
  }

  @override
  Future<List<DateTime>> loadAll() async {
    final isar = _conn;
    final foundDates = await isar.writeTxn(
      () async => await isar.registerDateCollections.where().findAll(),
    );

    final results = <DateTime>[];
    for (final dateCollection in foundDates) {
      results.add(dateCollection.date);
    }
    return results;
  }
}
