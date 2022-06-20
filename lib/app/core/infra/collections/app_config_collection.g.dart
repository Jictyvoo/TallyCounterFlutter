// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers, inference_failure_on_function_invocation

extension GetAppConfigCollectionCollection on Isar {
  IsarCollection<AppConfigCollection> get appConfigCollections =>
      getCollection();
}

const AppConfigCollectionSchema = CollectionSchema(
  name: 'AppConfigs',
  schema:
      '{"name":"AppConfigs","idName":"id","properties":[{"name":"key","type":"String"},{"name":"value","type":"String"}],"indexes":[{"name":"key","unique":true,"replace":false,"properties":[{"name":"key","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'key': 0, 'value': 1},
  listProperties: {},
  indexIds: {'key': 0},
  indexValueTypes: {
    'key': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _appConfigCollectionGetId,
  setId: _appConfigCollectionSetId,
  getLinks: _appConfigCollectionGetLinks,
  attachLinks: _appConfigCollectionAttachLinks,
  serializeNative: _appConfigCollectionSerializeNative,
  deserializeNative: _appConfigCollectionDeserializeNative,
  deserializePropNative: _appConfigCollectionDeserializePropNative,
  serializeWeb: _appConfigCollectionSerializeWeb,
  deserializeWeb: _appConfigCollectionDeserializeWeb,
  deserializePropWeb: _appConfigCollectionDeserializePropWeb,
  version: 4,
);

int? _appConfigCollectionGetId(AppConfigCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _appConfigCollectionSetId(AppConfigCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _appConfigCollectionGetLinks(
    AppConfigCollection object) {
  return [];
}

void _appConfigCollectionSerializeNative(
    IsarCollection<AppConfigCollection> collection,
    IsarCObject cObj,
    AppConfigCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final key$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.key);
  final value$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.value);
  final size = staticSize + (key$Bytes.length) + (value$Bytes.length);
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], key$Bytes);
  writer.writeBytes(offsets[1], value$Bytes);
}

AppConfigCollection _appConfigCollectionDeserializeNative(
    IsarCollection<AppConfigCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = AppConfigCollection(
    key: reader.readString(offsets[0]),
    value: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _appConfigCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

Object _appConfigCollectionSerializeWeb(
    IsarCollection<AppConfigCollection> collection,
    AppConfigCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'value', object.value);
  return jsObj;
}

AppConfigCollection _appConfigCollectionDeserializeWeb(
    IsarCollection<AppConfigCollection> collection, Object jsObj) {
  final object = AppConfigCollection(
    key: IsarNative.jsObjectGet(jsObj, 'key') ?? '',
    value: IsarNative.jsObjectGet(jsObj, 'value') ?? '',
  );
  object.id =
      IsarNative.jsObjectGet(jsObj, 'id') ?? (double.negativeInfinity as int);
  return object;
}

P _appConfigCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ??
          (double.negativeInfinity as int)) as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
    case 'value':
      return (IsarNative.jsObjectGet(jsObj, 'value') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _appConfigCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, AppConfigCollection object) {}

extension AppConfigCollectionByIndex on IsarCollection<AppConfigCollection> {
  Future<AppConfigCollection?> getByKey(String key) {
    return getByIndex('key', [key]);
  }

  AppConfigCollection? getByKeySync(String key) {
    return getByIndexSync('key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex('key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync('key', [key]);
  }

  Future<List<AppConfigCollection?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex('key', values);
  }

  List<AppConfigCollection?> getAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndexSync('key', values);
  }

  Future<int> deleteAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndex('key', values);
  }

  int deleteAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('key', values);
  }
}

extension AppConfigCollectionQueryWhereSort
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QWhere> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhere> anyKey() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'key'));
  }
}

extension AppConfigCollectionQueryWhere
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QWhereClause> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhereClause>
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

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhereClause>
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

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhereClause>
      keyEqualTo(String key) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'key',
      value: [key],
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhereClause>
      keyNotEqualTo(String key) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'key',
        upper: [key],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'key',
        lower: [key],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'key',
        lower: [key],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'key',
        upper: [key],
        includeUpper: false,
      ));
    }
  }
}

extension AppConfigCollectionQueryFilter on QueryBuilder<AppConfigCollection,
    AppConfigCollection, QFilterCondition> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
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

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
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

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
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

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.startsWith(
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.endsWith(
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'key',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.equalTo(
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.greaterThan(
      include: include,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition.lessThan(
      include: include,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'value',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.startsWith(
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition.endsWith(
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.contains(
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition.matches(
      property: 'value',
      wildcard: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension AppConfigCollectionQueryLinks on QueryBuilder<AppConfigCollection,
    AppConfigCollection, QFilterCondition> {}

extension AppConfigCollectionQueryWhereSortBy
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QSortBy> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      sortByValue() {
    return addSortByInternal('value', Sort.asc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      sortByValueDesc() {
    return addSortByInternal('value', Sort.desc);
  }
}

extension AppConfigCollectionQueryWhereSortThenBy
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QSortThenBy> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      thenByValue() {
    return addSortByInternal('value', Sort.asc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      thenByValueDesc() {
    return addSortByInternal('value', Sort.desc);
  }
}

extension AppConfigCollectionQueryWhereDistinct
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QDistinct> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QDistinct>
      distinctByKey({bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QDistinct>
      distinctByValue({bool caseSensitive = true}) {
    return addDistinctByInternal('value', caseSensitive: caseSensitive);
  }
}

extension AppConfigCollectionQueryProperty
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QQueryProperty> {
  QueryBuilder<AppConfigCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<AppConfigCollection, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<AppConfigCollection, String, QQueryOperations> valueProperty() {
    return addPropertyNameInternal('value');
  }
}
