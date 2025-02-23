import 'package:drift/drift.dart';
import '../../../../shared/shared.dart';
import '../../goals.dart';

@UseRowClass(Goal)
class GoalTable extends Table {
  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  BoolColumn get isReady => boolean()();

  DateTimeColumn get createdDate => dateTime()();

  TextColumn get priority => textEnum<Priority>().nullable()();

  DateTimeColumn get dateEnd => dateTime().nullable()();

  TextColumn get subtasks => text().map(
        const ListSubtaskConverter(),
      )();

  @override
  Set<Column<Object>>? get primaryKey => {
        title,
        createdDate,
      };
}
