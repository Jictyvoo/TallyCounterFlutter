// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers, inference_failure_on_function_invocation

extension GetMigrationCollectionCollection on Isar {
  IsarCollection<MigrationCollection> get migrationCollections =>
      getCollection();
}

const MigrationCollectionSchema = CollectionSchema(
  name: 'Migrations',
  schema:
      '{"name":"Migrations","idName":"id","properties":[{"name":"description","type":"String"},{"name":"log","type":"StringList"},{"name":"name","type":"String"},{"name":"timestamp","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'description': 0, 'log': 1, 'name': 2, 'timestamp': 3},
  listProperties: {'log'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _migrationCollectionGetId,
  setId: _migrationCollectionSetId,
  getLinks: _migrationCollectionGetLinks,
  attachLinks: _migrationCollectionAttachLinks,
  serializeNative: _migrationCollectionSerializeNative,
  deserializeNative: _migrationCollectionDeserializeNative,
  deserializePropNative: _migrationCollectionDeserializePropNative,
  serializeWeb: _migrationCollectionSerializeWeb,
  deserializeWeb: _migrationCollectionDeserializeWeb,
  deserializePropWeb: _migrationCollectionDeserializePropWeb,
  version: 4,
);

int? _migrationCollectionGetId(MigrationCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _migrationCollectionSetId(MigrationCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _migrationCollectionGetLinks(
    MigrationCollection object) {
  return [];
}

void _migrationCollectionSerializeNative(
    IsarCollection<MigrationCollection> collection,
    IsarCObject cObj,
    MigrationCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final description$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.description);
  var log$BytesCount = (object.log.length) * 8;
  final log$BytesList = <IsarUint8List>[];
  for (var str in object.log) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    log$BytesList.add(bytes);
    log$BytesCount += bytes.length;
  }
  final name$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.name);
  final size = staticSize +
      (description$Bytes.length) +
      log$BytesCount +
      (name$Bytes.length);
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], description$Bytes);
  writer.writeStringList(offsets[1], log$BytesList);
  writer.writeBytes(offsets[2], name$Bytes);
  writer.writeDateTime(offsets[3], object.ranAt);
}

MigrationCollection _migrationCollectionDeserializeNative(
    IsarCollection<MigrationCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = MigrationCollection(
    description: reader.readString(offsets[0]),
    log: reader.readStringList(offsets[1]) ?? [],
    name: reader.readString(offsets[2]),
    ranAt: reader.readDateTime(offsets[3]),
  );
  object.id = id;
  return object;
}

P _migrationCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

Object _migrationCollectionSerializeWeb(
    IsarCollection<MigrationCollection> collection,
    MigrationCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'description', object.description);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'log', object.log);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(
      jsObj, 'timestamp', object.ranAt.toUtc().millisecondsSinceEpoch);
  return jsObj;
}

MigrationCollection _migrationCollectionDeserializeWeb(
    IsarCollection<MigrationCollection> collection, Object jsObj) {
  final object = MigrationCollection(
    description: IsarNative.jsObjectGet(jsObj, 'description') ?? '',
    log: (IsarNative.jsObjectGet(jsObj, 'log') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    ranAt: IsarNative.jsObjectGet(jsObj, 'timestamp') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'timestamp') as int,
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
  );
  object.id =
      IsarNative.jsObjectGet(jsObj, 'id') ?? (double.negativeInfinity as int);
  return object;
}

P _migrationCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ??
          (double.negativeInfinity as int)) as P;
    case 'log':
      return ((IsarNative.jsObjectGet(jsObj, 'log') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'timestamp':
      return (IsarNative.jsObjectGet(jsObj, 'timestamp') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'timestamp') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _migrationCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, MigrationCollection object) {}

extension MigrationCollectionQueryWhereSort
    on QueryBuilder<MigrationCollection, MigrationCollection, QWhere> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension MigrationCollectionQueryWhere
    on QueryBuilder<MigrationCollection, MigrationCollection, QWhereClause> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idBetween(
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

extension MigrationCollectionQueryFilter on QueryBuilder<MigrationCollection,
    MigrationCollection, QFilterCondition> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.startsWith(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.endsWith(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'description',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'log',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'log',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'log',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'log',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.startsWith(
      property: 'log',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.endsWith(
      property: 'log',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'log',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'log',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.startsWith(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.endsWith(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'name',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'timestamp',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension MigrationCollectionQueryLinks on QueryBuilder<MigrationCollection,
    MigrationCollection, QFilterCondition> {}

extension MigrationCollectionQueryWhereSortBy
    on QueryBuilder<MigrationCollection, MigrationCollection, QSortBy> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByRanAt() {
    return addSortByInternal('timestamp', Sort.asc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByRanAtDesc() {
    return addSortByInternal('timestamp', Sort.desc);
  }
}

extension MigrationCollectionQueryWhereSortThenBy
    on QueryBuilder<MigrationCollection, MigrationCollection, QSortThenBy> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByRanAt() {
    return addSortByInternal('timestamp', Sort.asc);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByRanAtDesc() {
    return addSortByInternal('timestamp', Sort.desc);
  }
}

extension MigrationCollectionQueryWhereDistinct
    on QueryBuilder<MigrationCollection, MigrationCollection, QDistinct> {
  QueryBuilder<MigrationCollection, MigrationCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QDistinct>
      distinctByRanAt() {
    return addDistinctByInternal('timestamp');
  }
}

extension MigrationCollectionQueryProperty
    on QueryBuilder<MigrationCollection, MigrationCollection, QQueryProperty> {
  QueryBuilder<MigrationCollection, String, QQueryOperations>
      descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<MigrationCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<MigrationCollection, List<String>, QQueryOperations>
      logProperty() {
    return addPropertyNameInternal('log');
  }

  QueryBuilder<MigrationCollection, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<MigrationCollection, DateTime, QQueryOperations>
      ranAtProperty() {
    return addPropertyNameInternal('timestamp');
  }
}
