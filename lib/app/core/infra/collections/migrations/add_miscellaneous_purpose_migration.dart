import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/infra/collections/counter_register_collection.dart';
import 'package:tally_counter/app/core/infra/collections/tally_purpose_collection.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

import 'migrations_contract.dart';

class AddMiscellaneousPurposeMigration extends MigrationsContract {
  AddMiscellaneousPurposeMigration() : super();

  @override
  String get description =>
      'Add the `Miscellaneous` purpose to the list of purposes, and then add it'
      ' to all tally registers that do not have a purpose.';

  @override
  String get name => '02_add_miscellaneous_purpose';

  @override
  VersionLabel get runBeforeVersion =>
      const VersionLabel(major: 1, mid: 2, minor: 0);

  @override
  Future<bool> call(Isar isar) async {
    final allRegisters = await isar.tallyRegisterCollections.where().findAll();

    // Check if the `Miscellaneous` purpose already exists.
    var miscellaneousPurpose = await isar.tallyPurposeCollections
        .where()
        .nameEqualTo('Miscellaneous')
        .findFirst();

    if (miscellaneousPurpose == null) {
      // Create the `Miscellaneous` purpose.
      final newMiscellaneousPurpose = TallyPurposeCollection(
        name: 'Miscellaneous',
        description: 'Miscellaneous purposes.',
        limit: null,
      );
      await isar.writeTxn(() async {
        await isar.tallyPurposeCollections.put(newMiscellaneousPurpose);
      });
      miscellaneousPurpose = newMiscellaneousPurpose;
    }

    var updatedRegisters = 0;
    // Add the `Miscellaneous` purpose to all registers that do not have a purpose.
    for (final register in allRegisters) {
      if (register.purpose.value == null) {
        register.purpose.value = miscellaneousPurpose;
        await isar.writeTxn(() async {
          await register.purpose.save();
        });
        log('Updated register `${register.id}`');
        updatedRegisters += 1;
      }
    }

    log('Updated "$updatedRegisters" tally registers.');

    return updatedRegisters > 0;
  }
}
