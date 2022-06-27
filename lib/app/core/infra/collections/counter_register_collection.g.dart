// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_register_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetTallyRegisterCollectionCollection on Isar {
  IsarCollection<TallyRegisterCollection> get tallyRegisterCollections =>
      getCollection();
}

const TallyRegisterCollectionSchema = CollectionSchema(
  name: r'TallyRegisters',
  schema:
      r'{"name":"TallyRegisters","idName":"id","properties":[{"name":"description","type":"String"},{"name":"duration","type":"Long"},{"name":"endAt","type":"Long"},{"name":"newValue","type":"Long"},{"name":"oldValue","type":"Long"},{"name":"startAt","type":"Long"}],"indexes":[],"links":[{"name":"date","target":"RegisterDates"},{"name":"purpose","target":"TallyPurposes"}]}',
  idName: r'id',
  propertyIds: {
    r'description': 0,
    r'duration': 1,
    r'endAt': 2,
    r'newValue': 3,
    r'oldValue': 4,
    r'startAt': 5
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {r'date': 0, r'purpose': 1},
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
  final size = (staticSize + (description$Bytes?.length ?? 0)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
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
      throw IsarError('Illegal propertyIndex');
  }
}

Object _tallyRegisterCollectionSerializeWeb(
    IsarCollection<TallyRegisterCollection> collection,
    TallyRegisterCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'description', object.description);
  IsarNative.jsObjectSet(jsObj, r'duration', object.duration);
  IsarNative.jsObjectSet(
      jsObj, r'endAt', object.endAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'newValue', object.newValue);
  IsarNative.jsObjectSet(jsObj, r'oldValue', object.oldValue);
  IsarNative.jsObjectSet(
      jsObj, r'startAt', object.startAt.toUtc().millisecondsSinceEpoch);
  return jsObj;
}

TallyRegisterCollection _tallyRegisterCollectionDeserializeWeb(
    IsarCollection<TallyRegisterCollection> collection, Object jsObj) {
  final object = TallyRegisterCollection(
    duration: IsarNative.jsObjectGet(jsObj, r'duration'),
    newValue: IsarNative.jsObjectGet(jsObj, r'newValue') ??
        (double.negativeInfinity as int),
    oldValue: IsarNative.jsObjectGet(jsObj, r'oldValue') ??
        (double.negativeInfinity as int),
  );
  object.description = IsarNative.jsObjectGet(jsObj, r'description');
  object.endAt = IsarNative.jsObjectGet(jsObj, r'endAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, r'endAt') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  object.startAt = IsarNative.jsObjectGet(jsObj, r'startAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, r'startAt') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  _tallyRegisterCollectionAttachLinks(
      collection,
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int),
      object);
  return object;
}

P _tallyRegisterCollectionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'description':
      return (IsarNative.jsObjectGet(jsObj, r'description')) as P;
    case r'duration':
      return (IsarNative.jsObjectGet(jsObj, r'duration')) as P;
    case r'endAt':
      return (IsarNative.jsObjectGet(jsObj, r'endAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'endAt') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'newValue':
      return (IsarNative.jsObjectGet(jsObj, r'newValue') ??
          (double.negativeInfinity as int)) as P;
    case r'oldValue':
      return (IsarNative.jsObjectGet(jsObj, r'oldValue') ??
          (double.negativeInfinity as int)) as P;
    case r'startAt':
      return (IsarNative.jsObjectGet(jsObj, r'startAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'startAt') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _tallyRegisterCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, TallyRegisterCollection object) {
  object.dateTimestamp
      .attach(col, col.isar.registerDateCollections, r'date', id);
  object.purpose.attach(col, col.isar.tallyPurposeCollections, r'purpose', id);
}

extension TallyRegisterCollectionQueryWhereSort
    on QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QWhere> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TallyRegisterCollectionQueryWhere on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QWhereClause> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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
}

extension TallyRegisterCollectionQueryFilter on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QFilterCondition> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionEqualTo(
    String? value, {
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionLessThan(
    String? value, {
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> durationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> endAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
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

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'newValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'newValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> newValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'newValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> oldValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> startAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TallyRegisterCollectionQueryLinks on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QFilterCondition> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
          QAfterFilterCondition>
      dateTimestamp(FilterQuery<RegisterDateCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(
        query.collection.isar.registerDateCollections,
        q,
        r'date',
      );
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> purpose(FilterQuery<TallyPurposeCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(
        query.collection.isar.tallyPurposeCollections,
        q,
        r'purpose',
      );
    });
  }
}

extension TallyRegisterCollectionQueryWhereSortBy
    on QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QSortBy> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByEndAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByEndAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByNewValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newValue', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByNewValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newValue', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByOldValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldValue', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByOldValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldValue', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByStartAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      sortByStartAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.desc);
    });
  }
}

extension TallyRegisterCollectionQueryWhereSortThenBy on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QSortThenBy> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByEndAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByEndAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAt', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByNewValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newValue', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByNewValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newValue', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByOldValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldValue', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByOldValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldValue', Sort.desc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByStartAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.asc);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QAfterSortBy>
      thenByStartAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAt', Sort.desc);
    });
  }
}

extension TallyRegisterCollectionQueryWhereDistinct on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QDistinct> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByEndAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endAt');
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByNewValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'newValue');
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByOldValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldValue');
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection, QDistinct>
      distinctByStartAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startAt');
    });
  }
}

extension TallyRegisterCollectionQueryProperty on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QQueryProperty> {
  QueryBuilder<TallyRegisterCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TallyRegisterCollection, int?, QQueryOperations>
      durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<TallyRegisterCollection, DateTime, QQueryOperations>
      endAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endAt');
    });
  }

  QueryBuilder<TallyRegisterCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TallyRegisterCollection, int, QQueryOperations>
      newValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'newValue');
    });
  }

  QueryBuilder<TallyRegisterCollection, int, QQueryOperations>
      oldValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldValue');
    });
  }

  QueryBuilder<TallyRegisterCollection, DateTime, QQueryOperations>
      startAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startAt');
    });
  }
}
