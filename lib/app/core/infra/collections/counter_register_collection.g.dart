// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_register_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTallyRegisterCollectionCollection on Isar {
  IsarCollection<TallyRegisterCollection> get tallyRegisterCollections =>
      this.collection();
}

const TallyRegisterCollectionSchema = CollectionSchema(
  name: r'TallyRegisters',
  id: 2142648236282620493,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 1,
      name: r'duration',
      type: IsarType.long,
    ),
    r'endAt': PropertySchema(
      id: 2,
      name: r'endAt',
      type: IsarType.dateTime,
    ),
    r'newValue': PropertySchema(
      id: 3,
      name: r'newValue',
      type: IsarType.long,
    ),
    r'oldValue': PropertySchema(
      id: 4,
      name: r'oldValue',
      type: IsarType.long,
    ),
    r'startAt': PropertySchema(
      id: 5,
      name: r'startAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _tallyRegisterCollectionEstimateSize,
  serialize: _tallyRegisterCollectionSerialize,
  deserialize: _tallyRegisterCollectionDeserialize,
  deserializeProp: _tallyRegisterCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'date': LinkSchema(
      id: 5903752816782614430,
      name: r'date',
      target: r'RegisterDates',
      single: true,
    ),
    r'purpose': LinkSchema(
      id: 5932005235509014403,
      name: r'purpose',
      target: r'TallyPurposes',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _tallyRegisterCollectionGetId,
  getLinks: _tallyRegisterCollectionGetLinks,
  attach: _tallyRegisterCollectionAttach,
  version: '3.1.0+1',
);

int _tallyRegisterCollectionEstimateSize(
  TallyRegisterCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tallyRegisterCollectionSerialize(
  TallyRegisterCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeLong(offsets[1], object.duration);
  writer.writeDateTime(offsets[2], object.endAt);
  writer.writeLong(offsets[3], object.newValue);
  writer.writeLong(offsets[4], object.oldValue);
  writer.writeDateTime(offsets[5], object.startAt);
}

TallyRegisterCollection _tallyRegisterCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TallyRegisterCollection(
    duration: reader.readLongOrNull(offsets[1]),
    newValue: reader.readLongOrNull(offsets[3]) ?? 0,
    oldValue: reader.readLongOrNull(offsets[4]) ?? 0,
  );
  object.description = reader.readStringOrNull(offsets[0]);
  object.endAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.startAt = reader.readDateTime(offsets[5]);
  return object;
}

P _tallyRegisterCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tallyRegisterCollectionGetId(TallyRegisterCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tallyRegisterCollectionGetLinks(
    TallyRegisterCollection object) {
  return [object.dateTimestamp, object.purpose];
}

void _tallyRegisterCollectionAttach(
    IsarCollection<dynamic> col, Id id, TallyRegisterCollection object) {
  object.id = id;
  object.dateTimestamp
      .attach(col, col.isar.collection<RegisterDateCollection>(), r'date', id);
  object.purpose.attach(
      col, col.isar.collection<TallyPurposeCollection>(), r'purpose', id);
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
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
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
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
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
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
    bool include = false,
    bool caseSensitive = true,
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
    bool include = false,
    bool caseSensitive = true,
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
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
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
      QAfterFilterCondition> durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
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
    Id value, {
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
    Id lower,
    Id upper, {
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

extension TallyRegisterCollectionQueryObject on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QFilterCondition> {}

extension TallyRegisterCollectionQueryLinks on QueryBuilder<
    TallyRegisterCollection, TallyRegisterCollection, QFilterCondition> {
  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
          QAfterFilterCondition>
      dateTimestamp(FilterQuery<RegisterDateCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'date');
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> dateTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'date', 0, true, 0, true);
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> purpose(FilterQuery<TallyPurposeCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'purpose');
    });
  }

  QueryBuilder<TallyRegisterCollection, TallyRegisterCollection,
      QAfterFilterCondition> purposeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'purpose', 0, true, 0, true);
    });
  }
}

extension TallyRegisterCollectionQuerySortBy
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

extension TallyRegisterCollectionQuerySortThenBy on QueryBuilder<
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
  QueryBuilder<TallyRegisterCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

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
