// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tally_purpose_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers, inference_failure_on_function_invocation

extension GetTallyPurposeCollectionCollection on Isar {
  IsarCollection<TallyPurposeCollection> get tallyPurposeCollections =>
      getCollection();
}

const TallyPurposeCollectionSchema = CollectionSchema(
  name: 'TallyPurposes',
  schema:
      '{"name":"TallyPurposes","idName":"id","properties":[{"name":"description","type":"String"},{"name":"limit","type":"Long"},{"name":"name","type":"String"}],"indexes":[{"name":"name","unique":true,"replace":false,"properties":[{"name":"name","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'description': 0, 'limit': 1, 'name': 2},
  listProperties: {},
  indexIds: {'name': 0},
  indexValueTypes: {
    'name': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _tallyPurposeCollectionGetId,
  setId: _tallyPurposeCollectionSetId,
  getLinks: _tallyPurposeCollectionGetLinks,
  attachLinks: _tallyPurposeCollectionAttachLinks,
  serializeNative: _tallyPurposeCollectionSerializeNative,
  deserializeNative: _tallyPurposeCollectionDeserializeNative,
  deserializePropNative: _tallyPurposeCollectionDeserializePropNative,
  serializeWeb: _tallyPurposeCollectionSerializeWeb,
  deserializeWeb: _tallyPurposeCollectionDeserializeWeb,
  deserializePropWeb: _tallyPurposeCollectionDeserializePropWeb,
  version: 4,
);

int? _tallyPurposeCollectionGetId(TallyPurposeCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tallyPurposeCollectionSetId(TallyPurposeCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _tallyPurposeCollectionGetLinks(
    TallyPurposeCollection object) {
  return [];
}

void _tallyPurposeCollectionSerializeNative(
    IsarCollection<TallyPurposeCollection> collection,
    IsarCObject cObj,
    TallyPurposeCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final description$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.description);
  final name$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.name);
  final size = staticSize + (description$Bytes.length) + (name$Bytes.length);
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], description$Bytes);
  writer.writeLong(offsets[1], object.limit);
  writer.writeBytes(offsets[2], name$Bytes);
}

TallyPurposeCollection _tallyPurposeCollectionDeserializeNative(
    IsarCollection<TallyPurposeCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TallyPurposeCollection(
    description: reader.readString(offsets[0]),
    limit: reader.readLongOrNull(offsets[1]),
    name: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _tallyPurposeCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

Object _tallyPurposeCollectionSerializeWeb(
    IsarCollection<TallyPurposeCollection> collection,
    TallyPurposeCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'description', object.description);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'limit', object.limit);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

TallyPurposeCollection _tallyPurposeCollectionDeserializeWeb(
    IsarCollection<TallyPurposeCollection> collection, Object jsObj) {
  final object = TallyPurposeCollection(
    description: IsarNative.jsObjectGet(jsObj, 'description') ?? '',
    limit: IsarNative.jsObjectGet(jsObj, 'limit'),
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
  );
  object.id =
      IsarNative.jsObjectGet(jsObj, 'id') ?? (double.negativeInfinity as int);
  return object;
}

P _tallyPurposeCollectionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ??
          (double.negativeInfinity as int)) as P;
    case 'limit':
      return (IsarNative.jsObjectGet(jsObj, 'limit')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _tallyPurposeCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, TallyPurposeCollection object) {}

extension TallyPurposeCollectionByIndex
    on IsarCollection<TallyPurposeCollection> {
  Future<TallyPurposeCollection?> getByName(String name) {
    return getByIndex('name', [name]);
  }

  TallyPurposeCollection? getByNameSync(String name) {
    return getByIndexSync('name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex('name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync('name', [name]);
  }

  Future<List<TallyPurposeCollection?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex('name', values);
  }

  List<TallyPurposeCollection?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync('name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex('name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('name', values);
  }
}

extension TallyPurposeCollectionQueryWhereSort
    on QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QWhere> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterWhere>
      anyName() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'name'));
  }
}

extension TallyPurposeCollectionQueryWhere on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QWhereClause> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> nameEqualTo(String name) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'name',
      value: [name],
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> nameNotEqualTo(String name) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      ));
    }
  }
}

extension TallyPurposeCollectionQueryFilter on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QFilterCondition> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'description',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitIsNull() {
    return addFilterConditionInternal(const FilterCondition.isNull(
      property: 'limit',
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'limit',
      value: value,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'limit',
      value: value,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'limit',
      value: value,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'limit',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.startsWith(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.endsWith(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'name',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TallyPurposeCollectionQueryLinks on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QFilterCondition> {}

extension TallyPurposeCollectionQueryWhereSortBy
    on QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QSortBy> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByLimit() {
    return addSortByInternal('limit', Sort.asc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByLimitDesc() {
    return addSortByInternal('limit', Sort.desc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension TallyPurposeCollectionQueryWhereSortThenBy on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QSortThenBy> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByLimit() {
    return addSortByInternal('limit', Sort.asc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByLimitDesc() {
    return addSortByInternal('limit', Sort.desc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension TallyPurposeCollectionQueryWhereDistinct
    on QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct>
      distinctByLimit() {
    return addDistinctByInternal('limit');
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension TallyPurposeCollectionQueryProperty on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QQueryProperty> {
  QueryBuilder<TallyPurposeCollection, String, QQueryOperations>
      descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<TallyPurposeCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TallyPurposeCollection, int?, QQueryOperations> limitProperty() {
    return addPropertyNameInternal('limit');
  }

  QueryBuilder<TallyPurposeCollection, String, QQueryOperations>
      nameProperty() {
    return addPropertyNameInternal('name');
  }
}
