// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_register_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetTallyRegisterCollection on Isar {
  IsarCollection<TallyRegister> get tallyRegisters {
    return getCollection('TallyRegister');
  }
}

final TallyRegisterSchema = CollectionSchema(
  name: 'TallyRegister',
  schema:
      '{"name":"TallyRegister","idName":"id","properties":[{"name":"description","type":"String"},{"name":"duration","type":"Long"},{"name":"endAt","type":"Long"},{"name":"newValue","type":"Long"},{"name":"oldValue","type":"Long"},{"name":"startAt","type":"Long"}],"indexes":[],"links":[]}',
  nativeAdapter: const _TallyRegisterNativeAdapter(),
  webAdapter: const _TallyRegisterWebAdapter(),
  idName: 'id',
  propertyIds: {
    'description': 0,
    'duration': 1,
    'endAt': 2,
    'newValue': 3,
    'oldValue': 4,
    'startAt': 5
  },
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _TallyRegisterWebAdapter extends IsarWebTypeAdapter<TallyRegister> {
  const _TallyRegisterWebAdapter();

  @override
  Object serialize(
      IsarCollection<TallyRegister> collection, TallyRegister object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'description', object.description);
    IsarNative.jsObjectSet(jsObj, 'duration', object.duration);
    IsarNative.jsObjectSet(
        jsObj, 'endAt', object.endAt.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'newValue', object.newValue);
    IsarNative.jsObjectSet(jsObj, 'oldValue', object.oldValue);
    IsarNative.jsObjectSet(
        jsObj, 'startAt', object.startAt.toUtc().millisecondsSinceEpoch);
    return jsObj;
  }

  @override
  TallyRegister deserialize(
      IsarCollection<TallyRegister> collection, dynamic jsObj) {
    final object = TallyRegister(
      duration: IsarNative.jsObjectGet(jsObj, 'duration'),
      newValue:
          IsarNative.jsObjectGet(jsObj, 'newValue') ?? double.negativeInfinity,
      oldValue:
          IsarNative.jsObjectGet(jsObj, 'oldValue') ?? double.negativeInfinity,
    );
    object.description = IsarNative.jsObjectGet(jsObj, 'description');
    object.endAt = IsarNative.jsObjectGet(jsObj, 'endAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'endAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.startAt = IsarNative.jsObjectGet(jsObj, 'startAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'startAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'description':
        return (IsarNative.jsObjectGet(jsObj, 'description')) as P;
      case 'duration':
        return (IsarNative.jsObjectGet(jsObj, 'duration')) as P;
      case 'endAt':
        return (IsarNative.jsObjectGet(jsObj, 'endAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'endAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'newValue':
        return (IsarNative.jsObjectGet(jsObj, 'newValue') ??
            double.negativeInfinity) as P;
      case 'oldValue':
        return (IsarNative.jsObjectGet(jsObj, 'oldValue') ??
            double.negativeInfinity) as P;
      case 'startAt':
        return (IsarNative.jsObjectGet(jsObj, 'startAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'startAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, TallyRegister object) {}
}

class _TallyRegisterNativeAdapter extends IsarNativeTypeAdapter<TallyRegister> {
  const _TallyRegisterNativeAdapter();

  @override
  void serialize(
      IsarCollection<TallyRegister> collection,
      IsarRawObject rawObj,
      TallyRegister object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.description;
    IsarUint8List? _description;
    if (value0 != null) {
      _description = IsarBinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += (_description?.length ?? 0) as int;
    final value1 = object.duration;
    final _duration = value1;
    final value2 = object.endAt;
    final _endAt = value2;
    final value3 = object.newValue;
    final _newValue = value3;
    final value4 = object.oldValue;
    final _oldValue = value4;
    final value5 = object.startAt;
    final _startAt = value5;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _description);
    writer.writeLong(offsets[1], _duration);
    writer.writeDateTime(offsets[2], _endAt);
    writer.writeLong(offsets[3], _newValue);
    writer.writeLong(offsets[4], _oldValue);
    writer.writeDateTime(offsets[5], _startAt);
  }

  @override
  TallyRegister deserialize(IsarCollection<TallyRegister> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = TallyRegister(
      duration: reader.readLongOrNull(offsets[1]),
      newValue: reader.readLong(offsets[3]),
      oldValue: reader.readLong(offsets[4]),
    );
    object.description = reader.readStringOrNull(offsets[0]);
    object.endAt = reader.readDateTime(offsets[2]);
    object.id = id;
    object.startAt = reader.readDateTime(offsets[5]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readStringOrNull(offset)) as P;
      case 1:
        return (reader.readLongOrNull(offset)) as P;
      case 2:
        return (reader.readDateTime(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      case 4:
        return (reader.readLong(offset)) as P;
      case 5:
        return (reader.readDateTime(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, TallyRegister object) {}
}

extension TallyRegisterQueryWhereSort
    on QueryBuilder<TallyRegister, TallyRegister, QWhere> {
  QueryBuilder<TallyRegister, TallyRegister, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension TallyRegisterQueryWhere
    on QueryBuilder<TallyRegister, TallyRegister, QWhereClause> {
  QueryBuilder<TallyRegister, TallyRegister, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension TallyRegisterQueryFilter
    on QueryBuilder<TallyRegister, TallyRegister, QFilterCondition> {
  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'description',
      value: null,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      durationIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'duration',
      value: null,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      durationEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'duration',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      durationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'duration',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'duration',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      durationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'duration',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      endAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'endAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      endAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'endAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      endAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'endAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      endAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'endAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      newValueEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'newValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      newValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'newValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      newValueLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'newValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      newValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'newValue',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      oldValueEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'oldValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      oldValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'oldValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      oldValueLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'oldValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      oldValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'oldValue',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      startAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'startAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      startAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'startAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      startAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'startAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterFilterCondition>
      startAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'startAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension TallyRegisterQueryLinks
    on QueryBuilder<TallyRegister, TallyRegister, QFilterCondition> {}

extension TallyRegisterQueryWhereSortBy
    on QueryBuilder<TallyRegister, TallyRegister, QSortBy> {
  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      sortByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByEndAt() {
    return addSortByInternal('endAt', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByEndAtDesc() {
    return addSortByInternal('endAt', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByNewValue() {
    return addSortByInternal('newValue', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      sortByNewValueDesc() {
    return addSortByInternal('newValue', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByOldValue() {
    return addSortByInternal('oldValue', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      sortByOldValueDesc() {
    return addSortByInternal('oldValue', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByStartAt() {
    return addSortByInternal('startAt', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> sortByStartAtDesc() {
    return addSortByInternal('startAt', Sort.desc);
  }
}

extension TallyRegisterQueryWhereSortThenBy
    on QueryBuilder<TallyRegister, TallyRegister, QSortThenBy> {
  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      thenByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByEndAt() {
    return addSortByInternal('endAt', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByEndAtDesc() {
    return addSortByInternal('endAt', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByNewValue() {
    return addSortByInternal('newValue', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      thenByNewValueDesc() {
    return addSortByInternal('newValue', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByOldValue() {
    return addSortByInternal('oldValue', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy>
      thenByOldValueDesc() {
    return addSortByInternal('oldValue', Sort.desc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByStartAt() {
    return addSortByInternal('startAt', Sort.asc);
  }

  QueryBuilder<TallyRegister, TallyRegister, QAfterSortBy> thenByStartAtDesc() {
    return addSortByInternal('startAt', Sort.desc);
  }
}

extension TallyRegisterQueryWhereDistinct
    on QueryBuilder<TallyRegister, TallyRegister, QDistinct> {
  QueryBuilder<TallyRegister, TallyRegister, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<TallyRegister, TallyRegister, QDistinct> distinctByDuration() {
    return addDistinctByInternal('duration');
  }

  QueryBuilder<TallyRegister, TallyRegister, QDistinct> distinctByEndAt() {
    return addDistinctByInternal('endAt');
  }

  QueryBuilder<TallyRegister, TallyRegister, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TallyRegister, TallyRegister, QDistinct> distinctByNewValue() {
    return addDistinctByInternal('newValue');
  }

  QueryBuilder<TallyRegister, TallyRegister, QDistinct> distinctByOldValue() {
    return addDistinctByInternal('oldValue');
  }

  QueryBuilder<TallyRegister, TallyRegister, QDistinct> distinctByStartAt() {
    return addDistinctByInternal('startAt');
  }
}

extension TallyRegisterQueryProperty
    on QueryBuilder<TallyRegister, TallyRegister, QQueryProperty> {
  QueryBuilder<TallyRegister, String?, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<TallyRegister, int?, QQueryOperations> durationProperty() {
    return addPropertyNameInternal('duration');
  }

  QueryBuilder<TallyRegister, DateTime, QQueryOperations> endAtProperty() {
    return addPropertyNameInternal('endAt');
  }

  QueryBuilder<TallyRegister, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TallyRegister, int, QQueryOperations> newValueProperty() {
    return addPropertyNameInternal('newValue');
  }

  QueryBuilder<TallyRegister, int, QQueryOperations> oldValueProperty() {
    return addPropertyNameInternal('oldValue');
  }

  QueryBuilder<TallyRegister, DateTime, QQueryOperations> startAtProperty() {
    return addPropertyNameInternal('startAt');
  }
}
