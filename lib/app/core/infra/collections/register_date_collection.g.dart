// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_date_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRegisterDateCollectionCollection on Isar {
  IsarCollection<RegisterDateCollection> get registerDateCollections =>
      getCollection();
}

const RegisterDateCollectionSchema = CollectionSchema(
  name: 'RegisterDateCollection',
  schema:
      '{"name":"RegisterDateCollection","idName":"id","properties":[{"name":"date","type":"Long"}],"indexes":[{"name":"date","unique":true,"properties":[{"name":"date","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'date': 0},
  listProperties: {},
  indexIds: {'date': 0},
  indexValueTypes: {
    'date': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _registerDateCollectionGetId,
  setId: _registerDateCollectionSetId,
  getLinks: _registerDateCollectionGetLinks,
  attachLinks: _registerDateCollectionAttachLinks,
  serializeNative: _registerDateCollectionSerializeNative,
  deserializeNative: _registerDateCollectionDeserializeNative,
  deserializePropNative: _registerDateCollectionDeserializePropNative,
  serializeWeb: _registerDateCollectionSerializeWeb,
  deserializeWeb: _registerDateCollectionDeserializeWeb,
  deserializePropWeb: _registerDateCollectionDeserializePropWeb,
  version: 3,
);

int? _registerDateCollectionGetId(RegisterDateCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _registerDateCollectionSetId(RegisterDateCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase> _registerDateCollectionGetLinks(
    RegisterDateCollection object) {
  return [];
}

void _registerDateCollectionSerializeNative(
    IsarCollection<RegisterDateCollection> collection,
    IsarRawObject rawObj,
    RegisterDateCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.date;
  final _date = value0;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _date);
}

RegisterDateCollection _registerDateCollectionDeserializeNative(
    IsarCollection<RegisterDateCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RegisterDateCollection();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  return object;
}

P _registerDateCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _registerDateCollectionSerializeWeb(
    IsarCollection<RegisterDateCollection> collection,
    RegisterDateCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  return jsObj;
}

RegisterDateCollection _registerDateCollectionDeserializeWeb(
    IsarCollection<RegisterDateCollection> collection, dynamic jsObj) {
  final object = RegisterDateCollection();
  object.date = IsarNative.jsObjectGet(jsObj, 'date') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'date'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _registerDateCollectionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'date':
      return (IsarNative.jsObjectGet(jsObj, 'date') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'date'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _registerDateCollectionAttachLinks(
    IsarCollection col, int id, RegisterDateCollection object) {}

extension RegisterDateCollectionByIndex
    on IsarCollection<RegisterDateCollection> {
  Future<RegisterDateCollection?> getByDate(DateTime date) {
    return getByIndex('date', [date]);
  }

  RegisterDateCollection? getByDateSync(DateTime date) {
    return getByIndexSync('date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex('date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync('date', [date]);
  }

  Future<List<RegisterDateCollection?>> getAllByDate(
      List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex('date', values);
  }

  List<RegisterDateCollection?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync('date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex('date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('date', values);
  }
}

extension RegisterDateCollectionQueryWhereSort
    on QueryBuilder<RegisterDateCollection, RegisterDateCollection, QWhere> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterWhere>
      anyDate() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'date'));
  }
}

extension RegisterDateCollectionQueryWhere on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QWhereClause> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
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

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
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

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateEqualTo(DateTime date) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'date',
      value: [date],
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateNotEqualTo(DateTime date) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'date',
        upper: [date],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'date',
        lower: [date],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'date',
        lower: [date],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'date',
        upper: [date],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'date',
      lower: [date],
      includeLower: include,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'date',
      upper: [date],
      includeUpper: include,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'date',
      lower: [lowerDate],
      includeLower: includeLower,
      upper: [upperDate],
      includeUpper: includeUpper,
    ));
  }
}

extension RegisterDateCollectionQueryFilter on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QFilterCondition> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'date',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
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
}

extension RegisterDateCollectionQueryLinks on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QFilterCondition> {}

extension RegisterDateCollectionQueryWhereSortBy
    on QueryBuilder<RegisterDateCollection, RegisterDateCollection, QSortBy> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension RegisterDateCollectionQueryWhereSortThenBy on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QSortThenBy> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension RegisterDateCollectionQueryWhereDistinct
    on QueryBuilder<RegisterDateCollection, RegisterDateCollection, QDistinct> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QDistinct>
      distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }
}

extension RegisterDateCollectionQueryProperty on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QQueryProperty> {
  QueryBuilder<RegisterDateCollection, DateTime, QQueryOperations>
      dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<RegisterDateCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }
}
