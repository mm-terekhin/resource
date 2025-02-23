import 'dart:convert';
import 'package:drift/drift.dart';
import '../../domain/domain.dart';


class ListSubtaskConverter extends TypeConverter<List<Subtask>, String>
    with JsonTypeConverter<List<Subtask>, String> {
  const ListSubtaskConverter();

  @override
  List<Subtask> fromSql(String fromDb) {
    final data = json.decode(fromDb) as List<dynamic>;
    return data
        .map(
          (e) => Subtask.fromJson(
        e as Map<String, dynamic>,
      ),
    )
        .toList();
  }

  @override
  String toSql(List<Subtask> value) {
    return json.encode(
      value
          .map(
            (e) => e.toJson(),
      )
          .toList(),
    );
  }
}
