import 'package:isar/isar.dart';
import 'package:tally_counter/app/shared/utils/version_label.dart';

import 'migrations_contract.dart';

class OrganizeByDatetimeMigration extends MigrationsContract {
  OrganizeByDatetimeMigration();

  @override
  String get description =>
      'Update all tallyRegister collections to have a link to "datetime" field. '
      'This is useful to sort the collections by datetime.';

  @override
  String get name => 'Organize by datetime';

  @override
  VersionLabel get runBeforeVersion =>
      const VersionLabel(major: 1, mid: 1, minor: 0);

  @override
  Future<bool> call(Isar isar) async {
    /*final migrationList = await isar.databaseMigrationHistory.loadAll();
    if (migrationList.hasMigration('01_organize_by_datetime_migration')) {
      return true;
    }*/
    throw UnimplementedError();
    return false;
  }
}
