import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/infra/collections/counter_register_collection.dart';
import 'package:tally_counter/app/core/infra/collections/register_date_collection.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

import 'migrations_contract.dart';

class OrganizeByDatetimeMigration extends MigrationsContract {
  OrganizeByDatetimeMigration() : super();

  @override
  String get description =>
      'Update all tallyRegister collections to have a link to "datetime" field. '
      'This is useful to sort the collections by datetime.';

  @override
  String get name => '01_organize_by_datetime';

  @override
  VersionLabel get runBeforeVersion =>
      const VersionLabel(major: 1, mid: 1, minor: 0);

  String _dateStr(DateTime date) => '${date.year}-${date.month}-${date.day}';

  @override
  Future<bool> call(Isar isar) async {
    final allRegisters = await isar.tallyRegisterCollections.where().findAll();
    final allDates = await isar.registerDateCollections.where().findAll();
    final dates = <String, RegisterDateCollection>{};

    for (final dateRegister in allDates) {
      dates[_dateStr(dateRegister.date)] = dateRegister;
    }

    final updateList = <TallyRegisterCollection>[];
    for (final register in allRegisters) {
      await register.dateTimestamp.load();
      log(
        'Register ${register.id} has date ${register.dateTimestamp.value}',
      );
      if (register.dateTimestamp.value == null) {
        final dateKey = _dateStr(register.endAt);
        if (!dates.containsKey(dateKey)) {
          final newDate = RegisterDateCollection(dateTimestamp: register.endAt);

          await isar.writeTxn(
            () => isar.registerDateCollections.put(newDate),
          );
          dates[dateKey] = newDate;
        }

        register.dateTimestamp.value = dates[dateKey];
        // register.dateTimestamp.isChanged;
        updateList.add(register);
      }
    }

    if (updateList.isNotEmpty) {
      final resultIds = await isar.writeTxn(
        () async {
          final updatedIds = <int>[];
          final updateFutures = <Future<void>>[];
          for (final register in updateList) {
            updateFutures.add(register.dateTimestamp.save());
            updatedIds.add(register.id);
          }
          await Future.wait(updateFutures);
          return updatedIds;
        },
      );
      log('Updated ${resultIds.length} registers');
      return true;
    }
    return false;
  }
}
