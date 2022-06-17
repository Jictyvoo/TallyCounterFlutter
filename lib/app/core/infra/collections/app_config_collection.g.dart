// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetAppConfigCollectionCollection on Isar {
  IsarCollection<AppConfigCollection> get appConfigCollections =>
      getCollection();
}

const AppConfigCollectionSchema = CollectionSchema(
  name: 'AppConfigCollection',
  schema:
      '{"name":"AppConfigCollection","idName":"id","properties":[{"name":"key","type":"String"},{"name":"value","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'key': 0, 'value': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
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
  version: 3,
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

List<IsarLinkBase> _appConfigCollectionGetLinks(AppConfigCollection object) {
  return [];
}

void _appConfigCollectionSerializeNative(
    IsarCollection<AppConfigCollection> collection,
    IsarRawObject rawObj,
    AppConfigCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.key;
  final _key = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_key.length) as int;
  final value1 = object.value;
  final _value = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_value.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _key);
  writer.writeBytes(offsets[1], _value);
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

dynamic _appConfigCollectionSerializeWeb(
    IsarCollection<AppConfigCollection> collection,
    AppConfigCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'value', object.value);
  return jsObj;
}

AppConfigCollection _appConfigCollectionDeserializeWeb(
    IsarCollection<AppConfigCollection> collection, dynamic jsObj) {
  final object = AppConfigCollection(
    key: IsarNative.jsObjectGet(jsObj, 'key') ?? '',
    value: IsarNative.jsObjectGet(jsObj, 'value') ?? '',
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _appConfigCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
    case 'value':
      return (IsarNative.jsObjectGet(jsObj, 'value') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _appConfigCollectionAttachLinks(
    IsarCollection col, int id, AppConfigCollection object) {}

extension AppConfigCollectionQueryWhereSort
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QWhere> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
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
}

extension AppConfigCollectionQueryFilter on QueryBuilder<AppConfigCollection,
    AppConfigCollection, QFilterCondition> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
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

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      idLessThan(
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
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
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'value',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension AppConfigCollectionQueryLinks on QueryBuilder<AppConfigCollection,
    AppConfigCollection, QFilterCondition> {}

extension AppConfigCollectionQueryWhereSortBy
    on QueryBuilder<AppConfigCollection, AppConfigCollection, QSortBy> {
  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AppConfigCollection, AppConfigCollection, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

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
      distinctById() {
    return addDistinctByInternal('id');
  }

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
