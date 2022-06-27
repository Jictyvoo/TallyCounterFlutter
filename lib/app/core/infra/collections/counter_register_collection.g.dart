// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_register_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers, inference_failure_on_function_invocation

extension GetTallyRegisterCollectionCollection on Isar {
  IsarCollection<TallyRegisterCollection> get tallyRegisterCollections =>
      getCollection();
}

const TallyRegisterCollectionSchema = CollectionSchema(
  name: 'TallyRegisters',
  schema:
      '{"name":"TallyRegisters","idName":"id","properties":[{"name":"description","type":"String"},{"name":"duration","type":"Long"},{"name":"endAt","type":"Long"},{"name":"newValue","type":"Long"},{"name":"oldValue","type":"Long"},{"name":"startAt","type":"Long"}],"indexes":[],"links":[{"name":"date","target":"RegisterDates"},{"name":"purpose","target":"TallyPurposes"}]}',
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
  indexValueTypes: {},
  linkIds: {'date': 0, 'purpose': 1},
  backlinkLinkNames: {},
  getId: _tallyRegisterCollectionGetId,
  setId: _tallyRegisterCollectionSetId,
  getLinks: _tallyRegisterCollectionGetLinks,
  attachLinks: _tallyRegisterCollectionAttachLinks,
  serializeNative: _tallyRegisterCollectionSerializeNative,
  deserializeNative: _tallyRegisterCollectionDeserializeNative,
  deserializePropNative: _tallyRegisterCollectionDeserializePropNative,
  serializeWeb: _tallyRegisterCollectionSerializeWeb,
  deserializeWeb: _tallyRegisterCollectionDeserializeWeb,
  deserializePropWeb: _tallyRegisterCollectionDeserializePropWeb,
  version: 4,
);

int? _tallyRegisterCollectionGetId(TallyRegisterCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tallyRegisterCollectionSetId(TallyRegisterCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _tallyRegisterCollectionGetLinks(
    TallyRegisterCollection object) {
  return [object.dateTimestamp, object.purpose];
}

void _tallyRegisterCollectionSerializeNative(
    IsarCollection<TallyRegisterCollection> collection,
    IsarCObject cObj,
    TallyRegisterCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  IsarUint8List? description$Bytes;
  final description$Value = object.description;
  if (description$Value != null) {
    description$Bytes = IsarBinaryWriter.utf8Encoder.convert(description$Value);
  }
  final size = staticSize + (description$Bytes?.length ?? 0);
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], description$Bytes);
  writer.writeLong(offsets[1], object.duration);
  writer.writeDateTime(offsets[2], object.endAt);
  writer.writeLong(offsets[3], object.newValue);
  writer.writeLong(offsets[4], object.oldValue);
  writer.writeDateTime(offsets[5], object.startAt);
}

TallyRegisterCollection _tallyRegisterCollectionDeserializeNative(
    IsarCollection<TallyRegisterCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TallyRegisterCollection(
    duration: reader.readLongOrNull(offsets[1]),
    newValue: reader.readLong(offsets[3]),
    oldValue: reader.readLong(offsets[4]),
  );
  object.description = reader.readStringOrNull(offsets[0]);
  object.endAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.startAt = reader.readDateTime(offsets[5]);
  _tallyRegisterCollectionAttachLinks(collection, id, object);
  return object;
}

P _tallyRegisterCollectionDeserializePropNative<P>(
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

Object _tallyRegisterCollectionSerializeWeb(
    IsarCollection<TallyRegisterCollection> collection,
    TallyRegisterCollection object) {
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

TallyRegisterCollection _tallyRegisterCollectionDeserializeWeb(
    IsarCollection<TallyRegisterCollection> collection, Object jsObj) {
  final object = TallyRegisterCollection(
    duration: IsarNative.jsObjectGet(jsObj, 'duration'),
    newValue: IsarNative.jsObjectGet(jsObj, 'newValue') ??
        (double.negativeInfinity as int),
    oldValue: IsarNative.jsObjectGet(jsObj, 'oldValue') ??
        (double.negativeInfinity as int),
  );
  object.description = IsarNative.jsObjectGet(jsObj, 'description');
  object.endAt = IsarNative.jsObjectGet(jsObj, 'endAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'endAt') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id =
      IsarNative.jsObjectGet(jsObj, 'id') ?? (double.negativeInfinity as int);
  object.startAt = IsarNative.jsObjectGet(jsObj, 'startAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'startAt') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  _tallyRegisterCollectionAttachLinks(
      collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? (double.negativeInfinity as int),
      object);
  return object;
}

P _tallyRegisterCollectionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description')) as P;
    case 'duration':
      return (IsarNative.jsObjectGet(jsObj, 'duration')) as P;
    case 'endAt':
      return (IsarNative.jsObjectGet(jsObj, 'endAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'endAt') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ??
          (double.negativeInfinity as int)) as P;
    case 'newValue':
      return (IsarNative.jsObjectGet(jsObj, 'newValue') ??
          (double.negativeInfinity as int)) as P;
    case 'oldValue':
      return (IsarNative.jsObjectGet(jsObj, 'oldValue') ??
          (double.negativeInfinity as int)) as P;
    case 'startAt':
      return (IsarNative.jsObjectGet(jsObj, 'startAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'startAt') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _tallyRegisterCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, TallyRegisterCollection object) {
  object.dateTimestamp
      .attach(col, col.isar.registerDateCollections, 'date', id);
  object.purpose.attach(col, col.isar.tallyPurposeCollections, 'purpose', id);
}

extension TallyRegisterCollectionQueryWhereSort
    on QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QWhere> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TallyRegisterCollectionQueryWhere on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QWhereClause> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TallyRegisterCollectionQueryFilter on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QFilterCondition> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionIsNull() {
    return addFilterConditionInternal(const FilterCondition.isNull(
      property: 'description',
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.startsWith(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.endsWith(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'description',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationIsNull() {
    return addFilterConditionInternal(const FilterCondition.isNull(
      property: 'duration',
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'duration',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'duration',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'duration',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationBetween(
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'endAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'endAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'endAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtBetween(
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'newValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'newValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'newValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueBetween(
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'oldValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'oldValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'oldValue',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueBetween(
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'startAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'startAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'startAt',
      value: value,
    ));
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtBetween(
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

extension TallyRegisterCollectionQueryLinks on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QFilterCondition> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
          QAfterFilterCondition>
      dateTimestamp(FilterQuery<RegisterDateCollection> q) {
    return linkInternal(
      isar.registerDateCollections,
      q,
      'date',
    );
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> purpose(FilterQuery<TallyPurposeCollection> q) {
    return linkInternal(
      isar.tallyPurposeCollections,
      q,
      'purpose',
    );
  }
}

extension TallyRegisterCollectionQueryWhereSortBy
    on QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QSortBy> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByEndAt() {
    return addSortByInternal('endAt', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByEndAtDesc() {
    return addSortByInternal('endAt', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByNewValue() {
    return addSortByInternal('newValue', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByNewValueDesc() {
    return addSortByInternal('newValue', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByOldValue() {
    return addSortByInternal('oldValue', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByOldValueDesc() {
    return addSortByInternal('oldValue', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByStartAt() {
    return addSortByInternal('startAt', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByStartAtDesc() {
    return addSortByInternal('startAt', Sort.desc);
  }
}

extension TallyRegisterCollectionQueryWhereSortThenBy on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QSortThenBy> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByEndAt() {
    return addSortByInternal('endAt', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByEndAtDesc() {
    return addSortByInternal('endAt', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByNewValue() {
    return addSortByInternal('newValue', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByNewValueDesc() {
    return addSortByInternal('newValue', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByOldValue() {
    return addSortByInternal('oldValue', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByOldValueDesc() {
    return addSortByInternal('oldValue', Sort.desc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByStartAt() {
    return addSortByInternal('startAt', Sort.asc);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByStartAtDesc() {
    return addSortByInternal('startAt', Sort.desc);
  }
}

extension TallyRegisterCollectionQueryWhereDistinct on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QDistinct> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByDuration() {
    return addDistinctByInternal('duration');
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByEndAt() {
    return addDistinctByInternal('endAt');
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByNewValue() {
    return addDistinctByInternal('newValue');
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByOldValue() {
    return addDistinctByInternal('oldValue');
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByStartAt() {
    return addDistinctByInternal('startAt');
  }
}

extension TallyRegisterCollectionQueryProperty on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QQueryProperty> {
  QueryBuilder<TallyRegisterCollection, String?, QQueryOperations>
      descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<TallyRegisterCollection, int?, QQueryOperations>
      durationProperty() {
    return addPropertyNameInternal('duration');
  }

  QueryBuilder<TallyRegisterCollection, DateTime, QQueryOperations>
      endAtProperty() {
    return addPropertyNameInternal('endAt');
  }

  QueryBuilder<TallyRegisterCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TallyRegisterCollection, int, QQueryOperations>
      newValueProperty() {
    return addPropertyNameInternal('newValue');
  }

  QueryBuilder<TallyRegisterCollection, int, QQueryOperations>
      oldValueProperty() {
    return addPropertyNameInternal('oldValue');
  }

  QueryBuilder<TallyRegisterCollection, DateTime, QQueryOperations>
      startAtProperty() {
    return addPropertyNameInternal('startAt');
  }
}
