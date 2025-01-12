part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({
    required this.category,
  });

  const TodoState.initial() : category = TodoCategory.tasks;

  final TodoCategory category;

  TodoState copyWith({TodoCategory? category}) => TodoState(
        category: category ?? this.category,
      );

  @override
  List<Object> get props => [
        category,
      ];
}
