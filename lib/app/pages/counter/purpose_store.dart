import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/domain/models/dtos/purpose_dto.dart';
import 'package:tally_counter/app/core/domain/repositories/purpose_repository.dart';

mixin PurposeStore {
  var _purposeIndex = 0;
  var _allPurposes = <PurposeDTO>[];
  final _purposeRepository = Modular.get<PurposeRepository>();

  int get purposeIndex => _purposeIndex;

  set purpose(int index) {
    _purposeIndex = index;
  }

  PurposeDTO get selectedPurpose => _allPurposes[_purposeIndex];

  int get size => _allPurposes.length;

  PurposeDTO getPurposeAt(int index) {
    if (index < 0 || index >= _allPurposes.length) {
      return const PurposeDTO(name: '');
    }
    return _allPurposes[index];
  }

  Future<List<PurposeDTO>> loadPurposes() async {
    final previousPurpose = _purposeIndex < _allPurposes.length
        ? _allPurposes[_purposeIndex]
        : const PurposeDTO(name: '');

    _allPurposes = await _purposeRepository.listAll();
    if (previousPurpose.name.isNotEmpty) {
      _purposeIndex = findByName(previousPurpose.name);
    }
    return _allPurposes;
  }

  int findByName(String name) {
    for (var index = 0; index < _allPurposes.length; index++) {
      if (_allPurposes[index].name == name) {
        return index;
      }
    }
    return 0;
  }

  Future<bool> addPurpose(PurposeDTO purpose, [bool reload = false]) async {
    final result = await _purposeRepository.create(purpose);
    if (!result) {
      return false;
    }
    if (reload) {
      await loadPurposes();
    }
    _purposeIndex = findByName(purpose.name);
    return true;
  }
}
