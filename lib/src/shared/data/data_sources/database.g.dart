// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GoalTableTable extends GoalTable with TableInfo<$GoalTableTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isReadyMeta =
      const VerificationMeta('isReady');
  @override
  late final GeneratedColumn<bool> isReady = GeneratedColumn<bool>(
      'is_ready', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_ready" IN (0, 1))'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumnWithTypeConverter<Priority?, String> priority =
      GeneratedColumn<String>('priority', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Priority?>($GoalTableTable.$converterpriorityn);
  static const VerificationMeta _dateEndMeta =
      const VerificationMeta('dateEnd');
  @override
  late final GeneratedColumn<DateTime> dateEnd = GeneratedColumn<DateTime>(
      'date_end', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _subtasksMeta =
      const VerificationMeta('subtasks');
  @override
  late final GeneratedColumnWithTypeConverter<List<Subtask>, String> subtasks =
      GeneratedColumn<String>('subtasks', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<Subtask>>($GoalTableTable.$convertersubtasks);
  @override
  List<GeneratedColumn> get $columns =>
      [title, description, isReady, createdDate, priority, dateEnd, subtasks];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_table';
  @override
  VerificationContext validateIntegrity(Insertable<Goal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_ready')) {
      context.handle(_isReadyMeta,
          isReady.isAcceptableOrUnknown(data['is_ready']!, _isReadyMeta));
    } else if (isInserting) {
      context.missing(_isReadyMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    context.handle(_priorityMeta, const VerificationResult.success());
    if (data.containsKey('date_end')) {
      context.handle(_dateEndMeta,
          dateEnd.isAcceptableOrUnknown(data['date_end']!, _dateEndMeta));
    }
    context.handle(_subtasksMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {title, createdDate};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isReady: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_ready'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      dateEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_end']),
      priority: $GoalTableTable.$converterpriorityn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])),
      subtasks: $GoalTableTable.$convertersubtasks.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtasks'])!),
    );
  }

  @override
  $GoalTableTable createAlias(String alias) {
    return $GoalTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Priority, String, String> $converterpriority =
      const EnumNameConverter<Priority>(Priority.values);
  static JsonTypeConverter2<Priority?, String?, String?> $converterpriorityn =
      JsonTypeConverter2.asNullable($converterpriority);
  static JsonTypeConverter2<List<Subtask>, String, String> $convertersubtasks =
      const ListSubtaskConverter();
}

class GoalTableCompanion extends UpdateCompanion<Goal> {
  final Value<String> title;
  final Value<String?> description;
  final Value<bool> isReady;
  final Value<DateTime> createdDate;
  final Value<Priority?> priority;
  final Value<DateTime?> dateEnd;
  final Value<List<Subtask>> subtasks;
  final Value<int> rowid;
  const GoalTableCompanion({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isReady = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.priority = const Value.absent(),
    this.dateEnd = const Value.absent(),
    this.subtasks = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalTableCompanion.insert({
    required String title,
    this.description = const Value.absent(),
    required bool isReady,
    required DateTime createdDate,
    this.priority = const Value.absent(),
    this.dateEnd = const Value.absent(),
    required List<Subtask> subtasks,
    this.rowid = const Value.absent(),
  })  : title = Value(title),
        isReady = Value(isReady),
        createdDate = Value(createdDate),
        subtasks = Value(subtasks);
  static Insertable<Goal> custom({
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? isReady,
    Expression<DateTime>? createdDate,
    Expression<String>? priority,
    Expression<DateTime>? dateEnd,
    Expression<String>? subtasks,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isReady != null) 'is_ready': isReady,
      if (createdDate != null) 'created_date': createdDate,
      if (priority != null) 'priority': priority,
      if (dateEnd != null) 'date_end': dateEnd,
      if (subtasks != null) 'subtasks': subtasks,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalTableCompanion copyWith(
      {Value<String>? title,
      Value<String?>? description,
      Value<bool>? isReady,
      Value<DateTime>? createdDate,
      Value<Priority?>? priority,
      Value<DateTime?>? dateEnd,
      Value<List<Subtask>>? subtasks,
      Value<int>? rowid}) {
    return GoalTableCompanion(
      title: title ?? this.title,
      description: description ?? this.description,
      isReady: isReady ?? this.isReady,
      createdDate: createdDate ?? this.createdDate,
      priority: priority ?? this.priority,
      dateEnd: dateEnd ?? this.dateEnd,
      subtasks: subtasks ?? this.subtasks,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isReady.present) {
      map['is_ready'] = Variable<bool>(isReady.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(
          $GoalTableTable.$converterpriorityn.toSql(priority.value));
    }
    if (dateEnd.present) {
      map['date_end'] = Variable<DateTime>(dateEnd.value);
    }
    if (subtasks.present) {
      map['subtasks'] = Variable<String>(
          $GoalTableTable.$convertersubtasks.toSql(subtasks.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalTableCompanion(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isReady: $isReady, ')
          ..write('createdDate: $createdDate, ')
          ..write('priority: $priority, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('subtasks: $subtasks, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $GoalTableTable goalTable = $GoalTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [goalTable];
}

typedef $$GoalTableTableCreateCompanionBuilder = GoalTableCompanion Function({
  required String title,
  Value<String?> description,
  required bool isReady,
  required DateTime createdDate,
  Value<Priority?> priority,
  Value<DateTime?> dateEnd,
  required List<Subtask> subtasks,
  Value<int> rowid,
});
typedef $$GoalTableTableUpdateCompanionBuilder = GoalTableCompanion Function({
  Value<String> title,
  Value<String?> description,
  Value<bool> isReady,
  Value<DateTime> createdDate,
  Value<Priority?> priority,
  Value<DateTime?> dateEnd,
  Value<List<Subtask>> subtasks,
  Value<int> rowid,
});

class $$GoalTableTableFilterComposer
    extends Composer<_$Database, $GoalTableTable> {
  $$GoalTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isReady => $composableBuilder(
      column: $table.isReady, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Priority?, Priority, String> get priority =>
      $composableBuilder(
          column: $table.priority,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get dateEnd => $composableBuilder(
      column: $table.dateEnd, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<Subtask>, List<Subtask>, String>
      get subtasks => $composableBuilder(
          column: $table.subtasks,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$GoalTableTableOrderingComposer
    extends Composer<_$Database, $GoalTableTable> {
  $$GoalTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isReady => $composableBuilder(
      column: $table.isReady, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateEnd => $composableBuilder(
      column: $table.dateEnd, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtasks => $composableBuilder(
      column: $table.subtasks, builder: (column) => ColumnOrderings(column));
}

class $$GoalTableTableAnnotationComposer
    extends Composer<_$Database, $GoalTableTable> {
  $$GoalTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isReady =>
      $composableBuilder(column: $table.isReady, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Priority?, String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get dateEnd =>
      $composableBuilder(column: $table.dateEnd, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Subtask>, String> get subtasks =>
      $composableBuilder(column: $table.subtasks, builder: (column) => column);
}

class $$GoalTableTableTableManager extends RootTableManager<
    _$Database,
    $GoalTableTable,
    Goal,
    $$GoalTableTableFilterComposer,
    $$GoalTableTableOrderingComposer,
    $$GoalTableTableAnnotationComposer,
    $$GoalTableTableCreateCompanionBuilder,
    $$GoalTableTableUpdateCompanionBuilder,
    (Goal, BaseReferences<_$Database, $GoalTableTable, Goal>),
    Goal,
    PrefetchHooks Function()> {
  $$GoalTableTableTableManager(_$Database db, $GoalTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isReady = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<Priority?> priority = const Value.absent(),
            Value<DateTime?> dateEnd = const Value.absent(),
            Value<List<Subtask>> subtasks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalTableCompanion(
            title: title,
            description: description,
            isReady: isReady,
            createdDate: createdDate,
            priority: priority,
            dateEnd: dateEnd,
            subtasks: subtasks,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String title,
            Value<String?> description = const Value.absent(),
            required bool isReady,
            required DateTime createdDate,
            Value<Priority?> priority = const Value.absent(),
            Value<DateTime?> dateEnd = const Value.absent(),
            required List<Subtask> subtasks,
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalTableCompanion.insert(
            title: title,
            description: description,
            isReady: isReady,
            createdDate: createdDate,
            priority: priority,
            dateEnd: dateEnd,
            subtasks: subtasks,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $GoalTableTable,
    Goal,
    $$GoalTableTableFilterComposer,
    $$GoalTableTableOrderingComposer,
    $$GoalTableTableAnnotationComposer,
    $$GoalTableTableCreateCompanionBuilder,
    $$GoalTableTableUpdateCompanionBuilder,
    (Goal, BaseReferences<_$Database, $GoalTableTable, Goal>),
    Goal,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$GoalTableTableTableManager get goalTable =>
      $$GoalTableTableTableManager(_db, _db.goalTable);
}
