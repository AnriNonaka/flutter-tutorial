// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_list_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String title;
  final String tag1;
  final String tag2;
  final String tag3;
  final String tag4;
  final String tag5;
  Food(
      {required this.id,
      required this.title,
      required this.tag1,
      required this.tag2,
      required this.tag3,
      required this.tag4,
      required this.tag5});
  factory Food.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Food(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      tag1: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag1'])!,
      tag2: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag2'])!,
      tag3: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag3'])!,
      tag4: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag4'])!,
      tag5: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag5'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['tag1'] = Variable<String>(tag1);
    map['tag2'] = Variable<String>(tag2);
    map['tag3'] = Variable<String>(tag3);
    map['tag4'] = Variable<String>(tag4);
    map['tag5'] = Variable<String>(tag5);
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: Value(id),
      title: Value(title),
      tag1: Value(tag1),
      tag2: Value(tag2),
      tag3: Value(tag3),
      tag4: Value(tag4),
      tag5: Value(tag5),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      tag1: serializer.fromJson<String>(json['tag1']),
      tag2: serializer.fromJson<String>(json['tag2']),
      tag3: serializer.fromJson<String>(json['tag3']),
      tag4: serializer.fromJson<String>(json['tag4']),
      tag5: serializer.fromJson<String>(json['tag5']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'tag1': serializer.toJson<String>(tag1),
      'tag2': serializer.toJson<String>(tag2),
      'tag3': serializer.toJson<String>(tag3),
      'tag4': serializer.toJson<String>(tag4),
      'tag5': serializer.toJson<String>(tag5),
    };
  }

  Food copyWith(
          {int? id,
          String? title,
          String? tag1,
          String? tag2,
          String? tag3,
          String? tag4,
          String? tag5}) =>
      Food(
        id: id ?? this.id,
        title: title ?? this.title,
        tag1: tag1 ?? this.tag1,
        tag2: tag2 ?? this.tag2,
        tag3: tag3 ?? this.tag3,
        tag4: tag4 ?? this.tag4,
        tag5: tag5 ?? this.tag5,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('tag1: $tag1, ')
          ..write('tag2: $tag2, ')
          ..write('tag3: $tag3, ')
          ..write('tag4: $tag4, ')
          ..write('tag5: $tag5')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, tag1, tag2, tag3, tag4, tag5);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.title == this.title &&
          other.tag1 == this.tag1 &&
          other.tag2 == this.tag2 &&
          other.tag3 == this.tag3 &&
          other.tag4 == this.tag4 &&
          other.tag5 == this.tag5);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> tag1;
  final Value<String> tag2;
  final Value<String> tag3;
  final Value<String> tag4;
  final Value<String> tag5;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.tag1 = const Value.absent(),
    this.tag2 = const Value.absent(),
    this.tag3 = const Value.absent(),
    this.tag4 = const Value.absent(),
    this.tag5 = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String tag1,
    required String tag2,
    required String tag3,
    required String tag4,
    required String tag5,
  })  : title = Value(title),
        tag1 = Value(tag1),
        tag2 = Value(tag2),
        tag3 = Value(tag3),
        tag4 = Value(tag4),
        tag5 = Value(tag5);
  static Insertable<Food> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? tag1,
    Expression<String>? tag2,
    Expression<String>? tag3,
    Expression<String>? tag4,
    Expression<String>? tag5,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (tag1 != null) 'tag1': tag1,
      if (tag2 != null) 'tag2': tag2,
      if (tag3 != null) 'tag3': tag3,
      if (tag4 != null) 'tag4': tag4,
      if (tag5 != null) 'tag5': tag5,
    });
  }

  FoodsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? tag1,
      Value<String>? tag2,
      Value<String>? tag3,
      Value<String>? tag4,
      Value<String>? tag5}) {
    return FoodsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      tag1: tag1 ?? this.tag1,
      tag2: tag2 ?? this.tag2,
      tag3: tag3 ?? this.tag3,
      tag4: tag4 ?? this.tag4,
      tag5: tag5 ?? this.tag5,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (tag1.present) {
      map['tag1'] = Variable<String>(tag1.value);
    }
    if (tag2.present) {
      map['tag2'] = Variable<String>(tag2.value);
    }
    if (tag3.present) {
      map['tag3'] = Variable<String>(tag3.value);
    }
    if (tag4.present) {
      map['tag4'] = Variable<String>(tag4.value);
    }
    if (tag5.present) {
      map['tag5'] = Variable<String>(tag5.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('tag1: $tag1, ')
          ..write('tag2: $tag2, ')
          ..write('tag3: $tag3, ')
          ..write('tag4: $tag4, ')
          ..write('tag5: $tag5')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _tag1Meta = const VerificationMeta('tag1');
  @override
  late final GeneratedColumn<String?> tag1 = GeneratedColumn<String?>(
      'tag1', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tag2Meta = const VerificationMeta('tag2');
  @override
  late final GeneratedColumn<String?> tag2 = GeneratedColumn<String?>(
      'tag2', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tag3Meta = const VerificationMeta('tag3');
  @override
  late final GeneratedColumn<String?> tag3 = GeneratedColumn<String?>(
      'tag3', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tag4Meta = const VerificationMeta('tag4');
  @override
  late final GeneratedColumn<String?> tag4 = GeneratedColumn<String?>(
      'tag4', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tag5Meta = const VerificationMeta('tag5');
  @override
  late final GeneratedColumn<String?> tag5 = GeneratedColumn<String?>(
      'tag5', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, tag1, tag2, tag3, tag4, tag5];
  @override
  String get aliasedName => _alias ?? 'foods';
  @override
  String get actualTableName => 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('tag1')) {
      context.handle(
          _tag1Meta, tag1.isAcceptableOrUnknown(data['tag1']!, _tag1Meta));
    } else if (isInserting) {
      context.missing(_tag1Meta);
    }
    if (data.containsKey('tag2')) {
      context.handle(
          _tag2Meta, tag2.isAcceptableOrUnknown(data['tag2']!, _tag2Meta));
    } else if (isInserting) {
      context.missing(_tag2Meta);
    }
    if (data.containsKey('tag3')) {
      context.handle(
          _tag3Meta, tag3.isAcceptableOrUnknown(data['tag3']!, _tag3Meta));
    } else if (isInserting) {
      context.missing(_tag3Meta);
    }
    if (data.containsKey('tag4')) {
      context.handle(
          _tag4Meta, tag4.isAcceptableOrUnknown(data['tag4']!, _tag4Meta));
    } else if (isInserting) {
      context.missing(_tag4Meta);
    }
    if (data.containsKey('tag5')) {
      context.handle(
          _tag5Meta, tag5.isAcceptableOrUnknown(data['tag5']!, _tag5Meta));
    } else if (isInserting) {
      context.missing(_tag5Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Food.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FoodsTable foods = $FoodsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foods];
}
