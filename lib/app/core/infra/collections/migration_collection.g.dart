// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetMigrationCollectionCollection on Isar {
  IsarCollection<MigrationCollection> get migrationCollections =>
      getCollection();
}

const MigrationCollectionSchema = CollectionSchema(
  name: r'Migrations',
  schema:
      r'{"name":"Migrations","idName":"id","properties":[{"name":"description","type":"String"},{"name":"log","type":"StringList"},{"name":"name","type":"String"},{"name":"timestamp","type":"Long"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {r'description': 0, r'log': 1, r'name': 2, r'timestamp': 3},
  listProperties: {r'log'},
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
  for (final str in object.log) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    log$BytesList.add(bytes);
    log$BytesCount += bytes.length as int;
  }
  final name$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.name);
  final size = (staticSize +
      (description$Bytes.length) +
      log$BytesCount +
      (name$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
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
      throw IsarError('Illegal propertyIndex');
  }
}

Object _migrationCollectionSerializeWeb(
    IsarCollection<MigrationCollection> collection,
    MigrationCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'description', object.description);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'log', object.log);
  IsarNative.jsObjectSet(jsObj, r'name', object.name);
  IsarNative.jsObjectSet(
      jsObj, r'timestamp', object.ranAt.toUtc().millisecondsSinceEpoch);
  return jsObj;
}

MigrationCollection _migrationCollectionDeserializeWeb(
    IsarCollection<MigrationCollection> collection, Object jsObj) {
  final object = MigrationCollection(
    description: IsarNative.jsObjectGet(jsObj, r'description') ?? '',
    log: (IsarNative.jsObjectGet(jsObj, r'log') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    name: IsarNative.jsObjectGet(jsObj, r'name') ?? '',
    ranAt: IsarNative.jsObjectGet(jsObj, r'timestamp') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, r'timestamp') as int,
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
  );
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  return object;
}

P _migrationCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'description':
      return (IsarNative.jsObjectGet(jsObj, r'description') ?? '') as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'log':
      return ((IsarNative.jsObjectGet(jsObj, r'log') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case r'name':
      return (IsarNative.jsObjectGet(jsObj, r'name') ?? '') as P;
    case r'timestamp':
      return (IsarNative.jsObjectGet(jsObj, r'timestamp') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'timestamp') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _migrationCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, MigrationCollection object) {}

extension MigrationCollectionQueryWhereSort
    on QueryBuilder<MigrationCollection, MigrationCollection, QWhere> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MigrationCollectionQueryWhere
    on QueryBuilder<MigrationCollection, MigrationCollection, QWhereClause> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterWhereClause>
      idBetween(
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
}

extension MigrationCollectionQueryFilter on QueryBuilder<MigrationCollection,
    MigrationCollection, QFilterCondition> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionEndsWith(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'log',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      logElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'log',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterFilterCondition>
      ranAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MigrationCollectionQueryLinks on QueryBuilder<MigrationCollection,
    MigrationCollection, QFilterCondition> {}

extension MigrationCollectionQueryWhereSortBy
    on QueryBuilder<MigrationCollection, MigrationCollection, QSortBy> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByRanAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      sortByRanAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MigrationCollectionQueryWhereSortThenBy
    on QueryBuilder<MigrationCollection, MigrationCollection, QSortThenBy> {
  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByRanAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QAfterSortBy>
      thenByRanAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MigrationCollectionQueryWhereDistinct
    on QueryBuilder<MigrationCollection, MigrationCollection, QDistinct> {
  QueryBuilder<MigrationCollection, MigrationCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QDistinct>
      distinctByLog() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'log');
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MigrationCollection, MigrationCollection, QDistinct>
      distinctByRanAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension MigrationCollectionQueryProperty
    on QueryBuilder<MigrationCollection, MigrationCollection, QQueryProperty> {
  QueryBuilder<MigrationCollection, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MigrationCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MigrationCollection, List<String>, QQueryOperations>
      logProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'log');
    });
  }

  QueryBuilder<MigrationCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MigrationCollection, DateTime, QQueryOperations>
      ranAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
