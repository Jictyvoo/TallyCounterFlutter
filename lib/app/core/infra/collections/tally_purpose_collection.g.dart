// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tally_purpose_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetTallyPurposeCollectionCollection on Isar {
  IsarCollection<TallyPurposeCollection> get tallyPurposeCollections =>
      getCollection();
}

const TallyPurposeCollectionSchema = CollectionSchema(
  name: r'TallyPurposes',
  schema:
      r'{"name":"TallyPurposes","idName":"id","properties":[{"name":"description","type":"String"},{"name":"limit","type":"Long"},{"name":"name","type":"String"}],"indexes":[{"name":"name","unique":true,"replace":false,"properties":[{"name":"name","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: r'id',
  propertyIds: {r'description': 0, r'limit': 1, r'name': 2},
  listProperties: {},
  indexIds: {r'name': 0},
  indexValueTypes: {
    r'name': [
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
  final size =
      (staticSize + (description$Bytes.length) + (name$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
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
      throw IsarError('Illegal propertyIndex');
  }
}

Object _tallyPurposeCollectionSerializeWeb(
    IsarCollection<TallyPurposeCollection> collection,
    TallyPurposeCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'description', object.description);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'limit', object.limit);
  IsarNative.jsObjectSet(jsObj, r'name', object.name);
  return jsObj;
}

TallyPurposeCollection _tallyPurposeCollectionDeserializeWeb(
    IsarCollection<TallyPurposeCollection> collection, Object jsObj) {
  final object = TallyPurposeCollection(
    description: IsarNative.jsObjectGet(jsObj, r'description') ?? '',
    limit: IsarNative.jsObjectGet(jsObj, r'limit'),
    name: IsarNative.jsObjectGet(jsObj, r'name') ?? '',
  );
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  return object;
}

P _tallyPurposeCollectionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'description':
      return (IsarNative.jsObjectGet(jsObj, r'description') ?? '') as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'limit':
      return (IsarNative.jsObjectGet(jsObj, r'limit')) as P;
    case r'name':
      return (IsarNative.jsObjectGet(jsObj, r'name') ?? '') as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _tallyPurposeCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, TallyPurposeCollection object) {}

extension TallyPurposeCollectionByIndex
    on IsarCollection<TallyPurposeCollection> {
  Future<TallyPurposeCollection?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  TallyPurposeCollection? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<TallyPurposeCollection?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<TallyPurposeCollection?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<int> putByName(TallyPurposeCollection object) {
    return putByIndex(r'name', object);
  }

  int putByNameSync(TallyPurposeCollection object, {bool saveLinks = false}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<int>> putAllByName(List<TallyPurposeCollection> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<int> putAllByNameSync(List<TallyPurposeCollection> objects,
      {bool saveLinks = false}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension TallyPurposeCollectionQueryWhereSort
    on QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QWhere> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterWhere>
      anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }
}

extension TallyPurposeCollectionQueryWhere on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QWhereClause> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterWhereClause> nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TallyPurposeCollectionQueryFilter on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QFilterCondition> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
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

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'limit',
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> limitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'limit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension TallyPurposeCollectionQueryLinks on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QFilterCondition> {}

extension TallyPurposeCollectionQueryWhereSortBy
    on QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QSortBy> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension TallyPurposeCollectionQueryWhereSortThenBy on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QSortThenBy> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension TallyPurposeCollectionQueryWhereDistinct
    on QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct> {
  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct>
      distinctByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'limit');
    });
  }

  QueryBuilder<TallyPurposeCollection, TallyPurposeCollection, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension TallyPurposeCollectionQueryProperty on QueryBuilder<
    TallyPurposeCollection, TallyPurposeCollection, QQueryProperty> {
  QueryBuilder<TallyPurposeCollection, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TallyPurposeCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TallyPurposeCollection, int?, QQueryOperations> limitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'limit');
    });
  }

  QueryBuilder<TallyPurposeCollection, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
