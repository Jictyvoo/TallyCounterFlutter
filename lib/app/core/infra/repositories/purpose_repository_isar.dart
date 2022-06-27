import 'package:isar/isar.dart';
import 'package:tally_counter/app/core/domain/models/dtos/purpose_dto.dart';
import 'package:tally_counter/app/core/domain/repositories/purpose_repository.dart';
import 'package:tally_counter/app/core/infra/collections/tally_purpose_collection.dart';
import 'package:tally_counter/app/core/infra/providers/isar_provider.dart';
import 'package:tally_counter/app/shared/utils/debug_print.dart';

class PurposeRepositoryIsar with DebuggablePrint implements PurposeRepository {
  Isar? _isarConnection;

  Isar get _conn {
    _isarConnection ??= IsarProvider.isar;
    return _isarConnection!;
  }

  PurposeRepositoryIsar([this._isarConnection]);

  @override
  Future<List<PurposeDTO>> listAll() async {
    final collection =
        await _conn.tallyPurposeCollections.where().sortByName().findAll();
    final resultList = <PurposeDTO>[];

    for (final item in collection) {
      resultList.add(
        PurposeDTO(
          name: item.name,
          description: item.description,
        ),
      );
    }

    return resultList;
  }

  @override
  Future<bool> create(PurposeDTO purpose) async {
    final isar = _conn;
    try {
      final id = await isar.writeTxn(
        () => isar.tallyPurposeCollections.put(
          TallyPurposeCollection(
            name: purpose.name,
            description: purpose.description,
          ),
        ),
      );
      return id > 0;
    } catch (e, stackTrace) {
      debugPrint('Error: `$e`\n$stackTrace');
      return false;
    }
  }

  @override
  Future<void> delete(String name) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PurposeDTO> findPurpose(String name) {
    // TODO: implement findPurpose
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PurposeDTO purpose) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
