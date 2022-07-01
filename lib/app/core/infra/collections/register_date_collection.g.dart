// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_date_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetRegisterDateCollectionCollection on Isar {
  IsarCollection<RegisterDateCollection> get registerDateCollections =>
      getCollection();
}

const RegisterDateCollectionSchema = CollectionSchema(
  name: r'RegisterDates',
  schema:
      r'{"name":"RegisterDates","idName":"id","properties":[{"name":"date","type":"Long"}],"indexes":[{"name":"date","unique":true,"replace":false,"properties":[{"name":"date","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: r'id',
  propertyIds: {r'date': 0},
  listProperties: {},
  indexIds: {r'date': 0},
  indexValueTypes: {
    r'date': [
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
  version: 4,
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

List<IsarLinkBase<dynamic>> _registerDateCollectionGetLinks(
    RegisterDateCollection object) {
  return [];
}

void _registerDateCollectionSerializeNative(
    IsarCollection<RegisterDateCollection> collection,
    IsarCObject cObj,
    RegisterDateCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final size = (staticSize) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeDateTime(offsets[0], object.date);
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
      throw IsarError('Illegal propertyIndex');
  }
}

Object _registerDateCollectionSerializeWeb(
    IsarCollection<RegisterDateCollection> collection,
    RegisterDateCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, r'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  return jsObj;
}

RegisterDateCollection _registerDateCollectionDeserializeWeb(
    IsarCollection<RegisterDateCollection> collection, Object jsObj) {
  final object = RegisterDateCollection();
  object.date = IsarNative.jsObjectGet(jsObj, r'date') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, r'date') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  return object;
}

P _registerDateCollectionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'date':
      return (IsarNative.jsObjectGet(jsObj, r'date') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'date') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _registerDateCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, RegisterDateCollection object) {}

extension RegisterDateCollectionByIndex
    on IsarCollection<RegisterDateCollection> {
  Future<RegisterDateCollection?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  RegisterDateCollection? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<RegisterDateCollection?>> getAllByDate(
      List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<RegisterDateCollection?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<int> putByDate(RegisterDateCollection object) {
    return putByIndex(r'date', object);
  }

  int putByDateSync(RegisterDateCollection object, {bool saveLinks = false}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<int>> putAllByDate(List<RegisterDateCollection> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<int> putAllByDateSync(List<RegisterDateCollection> objects,
      {bool saveLinks = false}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension RegisterDateCollectionQueryWhereSort
    on QueryBuilder<RegisterDateCollection, RegisterDateCollection, QWhere> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterWhere>
      anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension RegisterDateCollectionQueryWhere on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QWhereClause> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idNotEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RegisterDateCollectionQueryFilter on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QFilterCondition> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection,
      QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RegisterDateCollectionQueryLinks on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QFilterCondition> {}

extension RegisterDateCollectionQueryWhereSortBy
    on QueryBuilder<RegisterDateCollection, RegisterDateCollection, QSortBy> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension RegisterDateCollectionQueryWhereSortThenBy on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QSortThenBy> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension RegisterDateCollectionQueryWhereDistinct
    on QueryBuilder<RegisterDateCollection, RegisterDateCollection, QDistinct> {
  QueryBuilder<RegisterDateCollection, RegisterDateCollection, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }
}

extension RegisterDateCollectionQueryProperty on QueryBuilder<
    RegisterDateCollection, RegisterDateCollection, QQueryProperty> {
  QueryBuilder<RegisterDateCollection, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<RegisterDateCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
