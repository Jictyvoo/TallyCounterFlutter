import 'package:tally_counter/app/core/domain/models/dtos/purpose_dto.dart';

abstract class PurposeRepository {
  Future<List<PurposeDTO>> listAll();

  Future<PurposeDTO> findPurpose(String name);

  Future<bool> create(PurposeDTO purpose);

  Future<bool> update(PurposeDTO purpose);

  Future<void> delete(String name);
}
